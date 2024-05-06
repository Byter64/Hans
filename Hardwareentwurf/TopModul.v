`include "../Prozessor/0_CPU.v"
`include "../Prozessor/1_RAM.v"
`include "../SDKarte/SDKartenLeser.v"
`include "../Grafikkarte/Verilog/Bildpuffer.v"
`include "../Grafikkarte/Verilog/HDMI_clock.v"
`include "../Grafikkarte/Verilog/HDMI_test_DDR.v"
`include "../Grafikkarte/Verilog/TMDS_encoder.v"
`ifdef SYNTHESIS
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
 //Konstanten
 localparam ONE = 1'b1;
 localparam ZERO = 1'b0;

 // Input/Output for FPGA
assign led = ledReg;

 //SDKARTE
 assign sd_d[0] = SDmiso;
 assign sd_d[1] = ONE;
 assign sd_d[2] = ONE;
 assign sd_d[3] = SDcs;
 assign sd_cmd = SDmosi;

//HDMI
assign gpdi_dp = HDMIgpdi_dp;

//If in Synthesis
`ifdef SYNTHESIS
wire [3:0] clocks;
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
wire[3:0] clocks;
assign clocks[0] = clk_25mhz;
assign clocks[1] = clk_25mhz;
assign clocks[2] = clk_25mhz;
assign clocks[3] = clk_25mhz;
`endif 

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

//Loader (hat nicht für eigenes Modul gereicht)
wire [31:0] loaderDaten;
wire [31:0] loaderRAMAdresse;
reg loaderLesen = 0;
reg [31:0] loaderAdresse = 0;
reg [31:0] loaderDatenMenge = 0; //Wie viele Bytes müssen in den RAM geladen werden?
reg loaderSchreibeDaten = 0;
reg [3:0] zustand = RESET;
reg loaderWarte = 1;

reg [7:0] ledReg;

/////////////////BILDPUFFER UND CO //////////////////////////////

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

/////////////////////////////////////////////////////////////////
//Knöpfe 
reg [20:0] KnopfdruckTimer0 = 21'b0;
reg [20:0] KnopfdruckTimer1 = 21'b0;
reg [20:0] KnopfdruckTimer2 = 21'b0;
reg [20:0] KnopfdruckTimer3 = 21'b0;
reg [20:0] KnopfdruckTimer4 = 21'b0;
reg [20:0] KnopfdruckTimer5 = 21'b0;
reg [20:0] KnopfdruckTimer6 = 21'b0;
reg[6:0] Buttons = 7'b0;

always @(posedge CPUClock) begin
    if(KnopfdruckTimer0 == 0 && (Buttons[0]!=btn[0])) begin
        Buttons[0] = ~Buttons[0];
        KnopfdruckTimer0 = 1;
    end
    else if(KnopfdruckTimer0!=0)begin
        KnopfdruckTimer0 <= KnopfdruckTimer0 + 1;
    end
    if(KnopfdruckTimer1 == 0 && (Buttons[1]!=btn[1])) begin
        Buttons[1] = ~Buttons[1];
        KnopfdruckTimer1 = 1;
    end
    else if(KnopfdruckTimer1!=0)begin
        KnopfdruckTimer1 <= KnopfdruckTimer1 + 1;
    end
    if(KnopfdruckTimer2 == 0 && (Buttons[2]!=btn[2])) begin
        Buttons[2] = ~Buttons[2];
        KnopfdruckTimer2 = 1;
    end
    else if(KnopfdruckTimer2!=0)begin
        KnopfdruckTimer2 <= KnopfdruckTimer2 + 1;
    end
    if(KnopfdruckTimer3 == 0 && (Buttons[3]!=btn[3])) begin
        Buttons[3] = ~Buttons[3];
        KnopfdruckTimer3 = 1;
    end
    else if(KnopfdruckTimer3!=0)begin
        KnopfdruckTimer3 <= KnopfdruckTimer3 + 1;
    end
    if(KnopfdruckTimer4 == 0 && (Buttons[4]!=btn[4])) begin
        Buttons[4] = ~Buttons[4];
        KnopfdruckTimer4 = 1;
    end
    else if(KnopfdruckTimer4!=0)begin
        KnopfdruckTimer4 <= KnopfdruckTimer4 + 1;
    end
    if(KnopfdruckTimer5 == 0 && (Buttons[5]!=btn[5])) begin
        Buttons[5] = ~Buttons[5];
        KnopfdruckTimer5 = 1;
    end
    else if(KnopfdruckTimer5!=0)begin
        KnopfdruckTimer5 <= KnopfdruckTimer5 + 1;
    end
    if(KnopfdruckTimer6 == 0 && (Buttons[6]!=btn[6])) begin
        Buttons[6] = ~Buttons[6];
        KnopfdruckTimer6 = 1;
    end
    else if(KnopfdruckTimer6!=0)begin
        KnopfdruckTimer6 <= KnopfdruckTimer6 + 1;
    end
end



//Input Zuweisungen CPU
assign CPUDatenRein = (CPUInstruktion[31:26] == 111000 && CPUDatenAdresse[30] == 1) ? {25'b0,Buttons} : RAMDatenRaus;
assign CPUInstruktion = RAMDatenRaus;
assign CPUInstruktionGeladen = RAMDatenBereit;
assign CPUDatenGeladen = RAMDatenBereit;
assign CPUDatenGespeichert =  CPUDatenAdresse[31] == 1 ? 1 :RAMDatenGeschrieben;
assign CPUClock = clocks[3];
//Inputs Zuweisung InstruktionsRAM
assign RAMLesenAn       = (zustand < RAMLADENBEENDEN) ? 1 : (CPULeseInstruktion || CPULeseDaten);
assign RAMSchreibenAn   = (zustand < RAMLADENBEENDEN) ? loaderSchreibeDaten
                            : CPUDatenAdresse[31] == 1 ? 0 : CPUSchreibeDaten;
assign RAMDatenRein     = (zustand < RAMLADENBEENDEN) ? loaderDaten : CPUDatenRaus;
assign RAMAdresse       = (zustand < RAMLADENBEENDEN) ? loaderRAMAdresse
                            : CPULeseInstruktion ? CPUInstruktionAdresse 
                            : CPUDatenAdresse;
assign RAMClock = CPUClock;

//Inputs Zuweisung SDKarte
    assign SDAdresse = loaderAdresse;
    assign SDLesen = loaderLesen;
    assign SDClock = CPUClock;

//Inputs Zuweisung Loader
    assign loaderDaten = SDDaten;
    assign loaderRAMAdresse = loaderAdresse - 2;

//Inputs Zuweisung Bildpuffer
    assign BPClock = CPUClock;
    assign BildpufferX = CPUDatenAdresse[15:8];
    assign BildpufferY = CPUDatenAdresse[7:0];
    assign BildpufferColor = CPUDatenRaus[7:0];
    assign BildpufferWrite = (CPUDatenAdresse[31] == 1) ? CPUSchreibeDaten : 0; 
    assign BildpufferXData = HDMIX;
    assign BildpufferYData = HDMIY;

//Inputs Zuweisung HDMI
    assign HDMIPixelData = BildpufferPixelData;
    assign HDMIClock = clocks[2];

localparam RESET = 4'd0;
localparam GROESSELADEN = 4'd1;
localparam AUFGROESSEWARTEN = 4'd2;
localparam RAMLADEN = 4'd3;
localparam RAMLADENBEENDEN = 4'd5;
localparam DEBUG = 4'd4;
localparam LAEUFT = 4'd8;

reg [9:0] resetTimer = ~0;
reg globalerReset = 0;
reg loaderReset = 0;
reg [15:0] debugRAMAdresse = 0;
reg [20:0] debugTimer = 1;
reg [2:0] byteNummer = 0;
reg [4:0] counter = 1; //Weil der sd_controller die Daten nicht mehr richtig lädt, wenn die Anfragen zu schnell kommen, existiert dieser Zähler
reg[31:0] CPUDatenRausReg;
always @(posedge RAMClock) begin
    case (zustand)
        RESET: begin
            ledReg <= 8'b00100100;
            globalerReset <= 1;
            loaderReset <= 1;

            loaderAdresse <= 0;
            loaderLesen <= 0;
            counter <= 1;
            debugTimer <= 1;

            resetTimer <= resetTimer - 1;

            if(resetTimer == 0) begin
                globalerReset <= 0;
                zustand <= GROESSELADEN;
            end
        end
        GROESSELADEN: begin
            ledReg <= 8'b01001001;
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
            ledReg <= 8'b01101101;
            //Wenn das erste Byte (= die Datenmenge) da ist, beginne, die Daten zu laden
            if(~SDBusy && counter == 0) begin
                counter <= counter + 1;
                loaderDatenMenge <= SDDaten;
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
            ledReg <= 8'b10010010;
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
            ledReg <= 8'b00000000;
            loaderSchreibeDaten <= 0;
            loaderLesen <= 0;
            loaderAdresse <= 1;
            byteNummer <= 6;
            debugTimer <= 1;
            zustand = LAEUFT;
        end
        DEBUG: begin
            loaderReset <= 1;
            globalerReset <= 0;

            loaderSchreibeDaten <= 0;
            loaderLesen <= 0;
            if(btn[3] && debugTimer == 1) begin
                byteNummer <= byteNummer - 1;
                if(byteNummer == 7) begin
                    loaderAdresse <= loaderAdresse + 1;
                end
                debugTimer <= 2;
            end
            if(btn[4] && debugTimer == 1) begin
                byteNummer <= byteNummer + 1;
                if(byteNummer == 7) begin
                    loaderAdresse <= loaderAdresse - 1;
                end
                debugTimer <= 2;
            end
            if(debugTimer != 1) begin
                debugTimer <= debugTimer + 1;
            end
            case (byteNummer) 
                3: ledReg <= RAMDatenRaus[31:24];
                2: ledReg <= RAMDatenRaus[23:16];
                1: ledReg <= RAMDatenRaus[15:8];
                0: ledReg <= RAMDatenRaus[7:0];
                default: ledReg <= {2'b10,loaderRAMAdresse[5:0]};
            endcase
                if(btn[5])begin
                    zustand <= LAEUFT;
                end
        end
        LAEUFT: begin
            loaderReset <= 0;
            if(CPUDatenAdresse[31] == 1 && CPUSchreibeDaten) begin
                ledReg <= CPUDatenRaus[7:0];
            end
                if(btn[0])begin
                    zustand <= DEBUG;
                end
        end 
    endcase
end

endmodule