`include "../Prozessor/0_CPU.v"
`include "../Prozessor/1_RAM.v"
`include "../SDKarte/SDKartenLeser.v"

`ifdef SYNTHESIS
`include "../Grafikkarte/Verilog/Bildpuffer.v"
`include "../Grafikkarte/Verilog/HDMI_clock.v"
`include "../Grafikkarte/Verilog/HDMI_test_DDR.v"
`include "../Grafikkarte/Verilog/TMDS_encoder.v"
`include "../ecp5pll/hdl/sv/ecp5pll.sv"
`endif
module Top
(
    input clk_25mhz,
    //LED
    output[7:0] led,
    //HDMI
    output[3:0] gpdi_dp,
    //SDCard
    output sd_cmd,      //mosi
    output sd_clk,
    inout [3:0] sd_d,    //miso //cs
    //Buttons
    input[6:0] btn

);

 reg [7:0] ledReg;
 reg[6:0] Buttons = 7'b0;

//Speicher die Aktuelle Instruktion
 reg[5:0] aktuelleInstruktion = 6'b0;
always @(posedge CPUClock) begin
    if(CPUInstruktionGeladen) begin
        aktuelleInstruktion <= CPUInstruktion[31:26];
    end
end
//SonderBefehle
 localparam SchreibeLEDS1        = 8'd1;
 localparam SchreibeLEDS2        = 8'd2;
 localparam SchreibeLEDS3        = 8'd3;
 localparam SchreibeLEDS4        = 8'd4;
 localparam SchreibeBP1          = 8'd5;
 localparam SchreibeBP2          = 8'd6;
 localparam SchreibeBPWechsel    = 8'd7;
 localparam LadeKnoepfe          = 8'd8;

 wire[7:0] SonderBefehl;
 assign SonderBefehl = CPUDatenAdresse[31:24];
//Input Zuweisungen CPU
 //Lesen
 assign RAMLesenAn           = (zustand < RAMLADENBEENDEN) ? 1
                             : (CPULeseInstruktion || CPULeseDaten);
 assign CPUDatenGeladen      = SonderBefehl > 0 ? 1 : RAMDatenBereit;
 assign CPUDatenRein         = (aktuelleInstruktion == 6'b111000 && SonderBefehl == LadeKnoepfe && CPULeseDaten)?{26'b0,Buttons[6:1]}:RAMDatenRaus;

 //Schreiben
 assign RAMSchreibenAn       = (zustand < RAMLADENBEENDEN) ? loaderSchreibeDaten
                             : SonderBefehl > 0 ? 0 : CPUSchreibeDaten;
 assign CPUDatenGespeichert      = SonderBefehl > 0 ? 1 : RAMDatenGeschrieben;
//SONDERBEFEHL LOGIK/////////////////////////////////////////////
//Schreibe LEDS
always @(posedge CPUClock) begin
    if(CPUSchreibeDaten) begin
        case(SonderBefehl)
        SchreibeLEDS1: ledReg <= CPUDatenRaus[7:0];
        SchreibeLEDS2: ledReg <= CPUDatenRaus[15:8];
        SchreibeLEDS3: ledReg <= CPUDatenRaus[23:16];
        SchreibeLEDS4: ledReg <= CPUDatenRaus[31:24];
        endcase
    end
end 
//Wechsel Bildpuffer
always @(posedge CPUClock) begin
    if(CPUSchreibeDaten) begin
        if(loaderReset) begin
            aktuellerBildpuffer <= 0;
        end else if(SonderBefehl == SchreibeBPWechsel) begin
            aktuellerBildpuffer <= !aktuellerBildpuffer;
        end
    end
end 
//SpeicherBildpuffer
always @(posedge CPUClock) begin
    if(BildpufferSchreibeBefehl1 || BildpufferSchreibeBefehl2) begin
        BildpufferSchreibeBefehl1 <= 0;
        BildpufferSchreibeBefehl2 <= 0;
    end else begin
        if(CPUSchreibeDaten) begin
            if(SonderBefehl == SchreibeBP1) begin
                BildpufferSchreibeBefehl1 <= 1;
            end
            if(SonderBefehl == SchreibeBP2) begin
                BildpufferSchreibeBefehl2 <= 1;
            end
        end
    end
end
//Speicher Daten für Bildpuffer
always @(posedge CPUClock) begin
    if(CPUSchreibeDaten) begin
        BildpufferDatenSpeicher <= CPUDatenRaus[7:0];
        BildpufferAdresseXSpeicher <= CPUDatenAdresse[7:0];
        BildpufferAdresseYSpeicher <= CPUDatenAdresse[15:8];
    end
end
//Welcher Bildpuffer beschrieben werden soll
`ifdef SYNTHESIS
    //Auswahl Bildpuffer
    assign HDMIPixelData     = (aktuellerBildpuffer == 0) ? BildpufferPixelData: BildpufferPixelData2;
`endif

        //AB HIER KEINE WICHTIGE LOGIK MEHR
////////////////////////////////////////////////////////////////////////////////////////
always @(posedge RAMClock) begin
    case (zustand)
        LAEUFT: begin
            if(!btn[0])begin
                globalerReset <= 1;
                loaderReset <= 1;
                zustand <= RESET;
            end
        end 

        RESET: begin
            globalerReset <= 1;
            loaderReset <= 1;

            loaderAdresse <= 0;
            loaderLesen <= 0;
            counter <= 1;
            debugTimer <= 1;

            resetTimer <= resetTimer - 1;

            if(resetTimer == 0 && btn[0]) begin
                globalerReset <= 0;
                zustand <= GROESSELADEN;
            end
        end
        GROESSELADEN: begin
            //Sobald SDKartenleser initialisiert, lese das erste Byte
            if(~SDBusy && counter == 0) begin
                counter <= counter + 1;
                loaderLesen <= 1;
                zustand <= AUFGROESSEWARTEN;
            end
            else if(~SDBusy) begin
                counter <= counter + 1;
                loaderLesen <= 0;
            end
        end
        AUFGROESSEWARTEN: begin
            //Wenn das erste Byte (= die Datenmenge) da ist, beginne, die Daten zu laden
            if(~SDBusy && counter == 0) begin
                counter <= counter + 1;
                loaderDatenMenge <= SDDaten + 1;
                zustand <= RAMLADEN;

                //Beginne, das erste Datenbyte von der SDKarte zu laden
                loaderAdresse <= 0;
                loaderLesen <= 1;
            end
            else if(~SDBusy) begin
                counter <= counter + 1;
                loaderLesen <= 0;
            end
        end 
        RAMLADEN: begin
            //Speicher die Datenbytes in den RAM
            if(~SDBusy && counter == 0) begin
                counter <= counter + 1;
                loaderLesen <= 1;
                loaderSchreibeDaten <= 1;

                loaderAdresse <= loaderAdresse + 1;
                loaderDatenMenge <= loaderDatenMenge - 1;

                //Wenn DatenMenge == 0, muss nichts mehr von der SDKarte gelesen werden
                //Nur noch das letzte Byte muss in den RAM geladen werden
                if(loaderDatenMenge == 0) begin
                    zustand <= RAMLADENBEENDEN;
                end
            end
            else if(~SDBusy) begin
                counter <= counter + 1;
                loaderLesen <= 0;
                loaderSchreibeDaten <= 0;
            end
        end 
        RAMLADENBEENDEN: begin
            loaderSchreibeDaten <= 0;
            loaderLesen <= 0;
            loaderReset <= 0;
            loaderAdresse <= 1;
            byteNummer <= 6;
            debugTimer <= 1;
            zustand = LAEUFT;
        end
    endcase
end
///////////////KNOEPFE/////////////////////////////////////////////////// 
reg [19:0] KnopfdruckTimer[0:7];
integer KnopfZahl;
initial begin
    for(KnopfZahl = 0; KnopfZahl < 7; KnopfZahl = KnopfZahl + 1) begin
        KnopfdruckTimer[KnopfZahl] <= 0;
    end
end
always @(posedge clk_25mhz) begin
    for(KnopfZahl = 0; KnopfZahl < 7; KnopfZahl = KnopfZahl + 1) begin
        if(KnopfdruckTimer[KnopfZahl] == 0 && (btn[KnopfZahl])) begin
            Buttons[KnopfZahl] <= 1;
            KnopfdruckTimer[KnopfZahl] <= 1;
        end
        else if(KnopfdruckTimer[KnopfZahl]!=0) begin
            KnopfdruckTimer[KnopfZahl] <= KnopfdruckTimer[KnopfZahl] + 1;
        end else begin
            Buttons[KnopfZahl] <= 0;
        end
    end
end
///////////STANDARD ASSIGNMENT////////////////////////////
 // Clock assigments
 assign CPUClock                 = clocks[3];
 assign RAMClock                 = CPUClock;
 assign SDClock                  = CPUClock;
 `ifdef SYNTHESIS
    assign HDMIClock             = clocks[2];
    assign BPClock               = CPUClock;
 `endif
 // Input/Output for FPGA
 assign led = (zustand != LAEUFT) ? 8'b10101010 : ledReg;

 //SDKARTE
 assign sd_d[0] = SDmiso;
 assign sd_d[1] = 1'b1;
 assign sd_d[2] = 1'b1;
 assign sd_d[3] = SDcs;
 assign sd_cmd = SDmosi;
 //Instruktion von RAM Laden
 assign CPUInstruktion           = RAMDatenRaus;
 assign CPUInstruktionGeladen    = RAMDatenBereit && CPULeseInstruktion;
 //Inputs Zuweisung InstruktionsRAM
 assign RAMDatenRein             = (zustand < RAMLADENBEENDEN) ? loaderDaten : CPUDatenRaus;
 assign RAMAdresse               = (zustand < RAMLADENBEENDEN) ? loaderRAMAdresse
                                    : CPULeseInstruktion ? CPUInstruktionAdresse 
                                    : CPUDatenAdresse;
 //Inputs Zuweisung SDKarte
 assign SDAdresse            = loaderAdresse;
 assign SDLesen              = loaderLesen;

//Inputs Zuweisung Loader
 assign loaderDaten          = SDDaten;
 assign loaderRAMAdresse     = loaderAdresse - 2;
///////////LOADER/////////////////////////////////////////////////////////
 localparam RESET = 4'd0;
 localparam GROESSELADEN = 4'd1;
 localparam AUFGROESSEWARTEN = 4'd2;
 localparam RAMLADEN = 4'd3;
 localparam RAMLADENBEENDEN = 4'd5;
 localparam DEBUG = 4'd4;
 localparam LAEUFT = 4'd8;
//Loader Sachen (hat nicht für eigenes Modul gereicht)
 wire [31:0] loaderDaten;
 wire [31:0] loaderRAMAdresse;
 reg loaderLesen = 0;
 reg [31:0] loaderAdresse = 0;
 reg [31:0] loaderDatenMenge = 0; //Wie viele Bytes müssen in den RAM geladen werden?
 reg loaderSchreibeDaten = 0;
 reg [3:0] zustand = RESET;
 reg loaderWarte = 1;

 reg [9:0] resetTimer = ~0;
 reg globalerReset = 0;
 reg loaderReset = 0;
 reg [15:0] debugRAMAdresse = 0;
 reg [22:0] debugTimer = 1;
 reg [2:0] byteNummer = 0;
 reg [4:0] counter = 1; //Weil der sd_controller die Daten nicht mehr richtig lädt, wenn die Anfragen zu schnell kommen, existiert dieser Zähler
 reg[31:0] CPUDatenRausReg;

//////////////////////////////////////////////////////////////////////////////
//Instanziierungen

 //Inputs CPU
 wire[31:0] CPUDatenRein;
 wire[31:0] CPUInstruktion;
 wire CPUInstruktionGeladen;
 wire CPUDatenGeladen;
 wire CPUDatenGespeichert;
 wire CPUClock;
 //Outputs CPU
 wire[31:0] CPUInstruktionAdresse;
 wire[31:0] CPUDatenRaus;
 wire[31:0] CPUDatenAdresse;
 wire CPULeseDaten;
 wire CPUSchreibeDaten;
 wire CPULeseInstruktion;

 //CPU Instanzierung
 CPU CPU (
    .DatenRein(CPUDatenRein),
    .Instruktion(CPUInstruktion),
    .InstruktionGeladen(CPUInstruktionGeladen),
    .DatenGeladen(CPUDatenGeladen),
    .DatenGespeichert(CPUDatenGespeichert),
    .Clock(CPUClock),
    .Reset(loaderReset || globalerReset),

    .InstruktionAdresse(CPUInstruktionAdresse),
    .DatenRaus(CPUDatenRaus),
    .DatenAdresse(CPUDatenAdresse),
    .LeseDaten(CPULeseDaten),
    .SchreibeDaten(CPUSchreibeDaten),
    .LeseInstruktion(CPULeseInstruktion)
 );

//Inputs RAM
wire RAMLesenAn;
wire RAMSchreibenAn;
wire[31:0] RAMDatenRein;
wire[31:0] RAMAdresse; //auf 31 erhöhen dann
wire RAMClock;
//Outputs RAM
wire[31:0] RAMDatenRaus;
wire RAMDatenBereit;
wire RAMDatenGeschrieben;

//Instanzierung
RAM #(
    .WORDSIZE(32),
    .WORDS(2**15)
) ram (
    .LesenAn(RAMLesenAn),
    .SchreibenAn(RAMSchreibenAn),
    .DatenRein(RAMDatenRein),
    .Adresse(RAMAdresse),
    .Clock(RAMClock),

    .DatenRaus(RAMDatenRaus),
    .DatenBereit(RAMDatenBereit),
    .DatenGeschrieben(RAMDatenGeschrieben)
);

//SDKarte
//Inputs
wire [31:0] SDAdresse;
wire SDLesen;
wire SDmiso;
wire SDClock;
//Outputs
wire [31:0] SDDaten;
wire SDFertig;
wire SDBusy;
wire SDcs;
wire SDmosi;
wire[4:0] SDDebug;
wire[2:0] SDZustand;

//Instanzierung

SDKarte sdkarte(
    .Clock(SDClock),
    .Reset(globalerReset),
    .Adresse(SDAdresse),
    .Lesen(SDLesen),
    .Daten(SDDaten),
    .Fertig(SDFertig),
    .Busy(SDBusy),
    .cs(SDcs),
    .mosi(SDmosi),
    .miso(SDmiso),
    .sclk(sd_clk),
    .debug(SDDebug),
    .zustand(SDZustand)
);
//Clocks
wire [3:0] clocks;
`ifdef SYNTHESIS
    //HDMI
    assign gpdi_dp = HDMIgpdi_dp;

    ecp5pll
    #(
        .in_hz(25000000),
        .out0_hz(40000000),                 .out0_tol_hz(0),
        .out1_hz(50000000), .out1_deg( 90), .out1_tol_hz(0),
        .out2_hz(25000000), .out2_deg(180), .out2_tol_hz(0),
        .out3_hz(20000000), .out3_deg(300), .out3_tol_hz(0)
    )
    ecp5pll_inst
    (
        .clk_i(clk_25mhz),
        .clk_o(clocks)
    );
`else //if in simulation
    assign clocks[0] = clk_25mhz;
    assign clocks[1] = clk_25mhz;
    assign clocks[2] = clk_25mhz;
    assign clocks[3] = clk_25mhz;
`endif 
/////////////////BILDPUFFER UND CO //////////////////////////////
 //Logik Topmodul
 reg aktuellerBildpuffer                   = 0;
 reg[7:0] BildpufferDatenSpeicher          = 8'b0;
 reg[7:0] BildpufferAdresseXSpeicher       = 8'b0;
 reg[7:0] BildpufferAdresseYSpeicher       = 8'b0;
 reg BildpufferSchreibeBefehl1             = 0;
 reg BildpufferSchreibeBefehl2             = 0;
`ifdef SYNTHESIS
    //Logik Topmodul
    assign BildpufferX                     = BildpufferAdresseXSpeicher;
    assign BildpufferY                     = BildpufferAdresseYSpeicher;
    assign BildpufferColor                 = BildpufferDatenSpeicher;
    assign BildpufferXData                 = HDMIX;
    assign BildpufferYData                 = HDMIY;
    assign BildpufferWrite                 = BildpufferSchreibeBefehl1; 
    assign BildpufferWrite2                = BildpufferSchreibeBefehl2; 
    //Inputs Bildpuffer
    wire BPClock;
    wire [7:0] BildpufferX;
    wire [7:0] BildpufferY;
    wire [7:0] BildpufferColor;
    wire BildpufferWrite;
    wire [7:0] BildpufferXData;
    wire [7:0] BildpufferYData;
    //Outputs Bildpuffer
    wire HDMIClock;
    wire [7:0] BildpufferPixelData;

    Bildpuffer bildpuffer (
        .clk(BPClock),
        .x(BildpufferX),
        .y(BildpufferY),
        .color(BildpufferColor),
        .write(BildpufferWrite),
        .x_data(BildpufferXData),
        .y_data(BildpufferYData),
        .pixelData(BildpufferPixelData)
    );

    //Inputs Bildpuffer2
    wire BildpufferWrite2;
    //Outputs Bildpuffer2
    wire [7:0] BildpufferPixelData2;

    Bildpuffer bildpuffer2 (
        .clk(BPClock),
        .x(BildpufferX),
        .y(BildpufferY),
        .color(BildpufferColor),
        .write(BildpufferWrite2),
        .x_data(BildpufferXData),
        .y_data(BildpufferYData),
        .pixelData(BildpufferPixelData2)
    );

    //Inputs HDMI
    wire [7:0] HDMIPixelData;
    //Outputs HDMI
    wire [7:0] HDMIX;
    wire [7:0] HDMIY;
    wire [3:0] HDMIgpdi_dp;

    HDMI_test_DDR hdmi_test_ddr(
        .clk(HDMIClock), //Braucht 25 MHz um zu funktionieren
        .pixelData(HDMIPixelData),
        .x(HDMIX),
        .y(HDMIY),
        .gpdi_dp(gpdi_dp)
    );
`endif 

endmodule