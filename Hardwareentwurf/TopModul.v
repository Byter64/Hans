`include "../Prozessor/0_CPU.v"
`include "../Prozessor/1_RAM.v"
//`include "../Grafikkarte/Verilog/Bildpuffer.v"
`include "../SDKarte/SDKartenLeser.v"
//`include "../Grafikkarte/Verilog/HDMI_clock.v"
//`include "../Grafikkarte/Verilog/HDMI_test_DDR.v"
//`include "../Grafikkarte/Verilog/TMDS_encoder.v"
`ifdef SYNTHESIS
`include "../ecp5pll/hdl/sv/ecp5pll.sv"
`endif
module Top
(
    input clk_25mhz,
    
    output[7:0] led,
    output[3:0] gpdi_dp,
    output sd_cmd,      //mosi
    output sd_clk,
    
    inout [3:0] sd_d    //miso //cs
);

 // Input/Output fuer FPGA
 //SDkarte
 assign sd_d[0] = SDmiso;
 assign sd_d[1] = 1'b1;
 assign sd_d[2] = 1'b1;
 assign sd_d[3] = SDcs;
 assign sd_cmd = SDmosi;

//LEDs
reg[7:0] ledReg = 7'b0;
assign led = ledReg;

//Reset
reg Reset;
reg[10:0] resetTimer = 0;

//Clock Assignment
wire Clock;
//If in Synthesis
`ifdef SYNTHESIS
assign Clock = clocks[3];
wire [3:0] clocks;
ecp5pll
#(
      .in_hz(25000000),
    .out0_hz(40000000),                 .out0_tol_hz(0),
    .out1_hz(50000000), .out1_deg( 90), .out1_tol_hz(0),
    .out2_hz(60000000), .out2_deg(180), .out2_tol_hz(0),
    .out3_hz( 4000000), .out3_deg(300), .out3_tol_hz(0)
)
ecp5pll_inst
(
    .clk_i(clk_25mhz),
    .clk_o(clocks)
);
`else //if in simulation
assign Clock = clk_25mhz;
`endif 

 //Inputs CPU
 wire[31:0] CPUDatenRein;
 wire[31:0] CPUInstruktion;
 wire CPUInstruktionGeladen;
 wire CPUDatenGeladen;
 wire CPUDatenGespeichert;
 wire CPUReset;

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
    .Clock(Clock),
    .Reset(CPUReset),

    .InstruktionAdresse(CPUInstruktionAdresse),
    .DatenRaus(CPUDatenRaus),
    .DatenAdresse(CPUDatenAdresse),
    .LeseDaten(CPULeseDaten),
    .SchreibeDaten(CPUSchreibeDaten),
    .LeseInstruktion(CPULeseInstruktion)
 );

//Inputs RAM
wire RAMClock;
wire RAMLesenAn;
wire RAMSchreibenAn;
wire [31:0] RAMDatenRein;
wire [31:0] RAMAdresse;

//Outputs RAM
wire [31:0] RAMDatenRaus;
wire RAMDatenBereit;
wire RAMDatenGeschrieben;

//Instanzierung
RAM #(
    .WORDSIZE(32),
    .WORDS(256) //2**16
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

//Inputs SDKarte
wire [31:0] SDAdresse;
wire SDLesen;
wire SDmiso;
//Outputs SDKarte
wire [31:0] SDDaten;
wire SDFertig;
wire SDBusy;
wire SDcs;
wire SDmosi;
wire[4:0] SDDebug;
wire[2:0] SDZustand;

SDKarte sdkarte(
    .Clock(Clock),
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

//Inputs Bildpuffer
wire [7:0] BildpufferX;
wire [7:0] BildpufferY;
wire [7:0] BildpufferColor;
wire BildpufferWrite;
wire [7:0] BildpufferXData;
wire [7:0] BildpufferYData;
//Outputs Bildpuffer
wire [7:0] BildpufferPixelData;

/*Bildpuffer bildpuffer (
    .clk(Clock),
    .x(BildpufferX),
    .y(BildpufferY),
    .color(BildpufferColor),
    .write(BildpufferWrite),
    .x_data(BildpufferXData),
    .y_data(BildpufferYData),
    .pixelData(BildpufferPixelData)
);*/

//Inputs HDMI
wire [7:0] HDMIPixelData;
//Outputs HDMI
wire [7:0] HDMIX;
wire [7:0] HDMIY;
wire [3:0] HDMIgpdi_dp;
/*
HDMI_test_DDR hdmi_test_ddr(
    .clk(clk_25mhz), //Braucht 25 MHz um zu funktionieren
    .pixelData(HDMIPixelData),
    .x(HDMIX),
    .y(HDMIY),
    .gpdi_dp(gpdi_dp)
);*/

//Loader (hat nicht für eigenes Modul gereicht)
wire [31:0] loaderDaten;
wire [31:0] loaderRAMAdresse;
reg loaderLesen = 0;
reg [31:0] loaderAdresse = 0;
reg [31:0] loaderDatenMenge = 0; //Wie viele Bytes müssen in den RAM geladen werden?
reg loaderSchreibeDaten = 0;
reg [3:0] zustand = RESET;
reg loaderWarte = 1;
reg [10:0] counter = 0;

//Input Zuweisungen CPU
assign CPUDatenRein = RAMDatenRaus;
assign CPUInstruktion = RAMDatenRaus;
assign CPUInstruktionGeladen = RAMDatenBereit;
assign CPUDatenGeladen = RAMDatenBereit;
assign CPUDatenGespeichert = RAMDatenGeschrieben;
assign CPUReset = Reset || zustand != LAEUFT;

//Inputs Zuweisung RAM
assign RAMClock = Clock;
assign RAMLesenAn = zustand != LAEUFT ? 0 : CPULeseInstruktion || CPULeseDaten;
assign RAMSchreibenAn = zustand != LAEUFT ? loaderSchreibeDaten : ((CPUDatenAdresse[31] == 0) ? CPUSchreibeDaten : 0);
assign RAMDatenRein = zustand != LAEUFT ? loaderDaten : CPUDatenRaus;
assign RAMAdresse = zustand != LAEUFT ? loaderRAMAdresse : (CPULeseInstruktion ? CPUInstruktionAdresse : CPUDatenAdresse);

//Inputs Zuweisung SDKarte
assign SDAdresse = loaderAdresse;
assign SDLesen = loaderLesen;
//Inputs Zuweisung Loader
assign loaderDaten = SDDaten;
assign loaderRAMAdresse = loaderAdresse - 1;
//Inputs Zuweisung Bildpuffer
assign BildpufferX = CPUDatenAdresse[23:16];
assign BildpufferY = CPUDatenAdresse[31:24];
assign BildpufferColor = CPUDatenRaus[7:0];
assign BildpufferWrite = (CPUDatenAdresse[31] == 1) ? CPUSchreibeDaten : 0; 
assign BildpufferXData = HDMIX;
assign BildpufferYData = HDMIY;
//Inputs Zuweisung HDMI
assign HDMIPixelData = BildpufferPixelData;

always @(posedge Clock) begin
    if(resetTimer < 256)begin
        Reset <= 1;
        resetTimer <= resetTimer + 1;
    end
    else begin
        Reset <= 0;
    end
end

localparam RESET = 4'd0;
localparam GROESSELADEN = 4'd1;
localparam AUFGROESSEWARTEN = 4'd2;
localparam RAMLADEN = 4'd3;
localparam RAMLADENBEENDEN = 4'd4;
localparam DEBUG = 4'd6;
localparam LAEUFT = 4'd8;

reg [20:0] debugTimer = 0;
reg [1:0] byteNummer = 0;

always @(posedge Clock) begin
    if(Reset) begin    
        ledReg <= 0;
        loaderAdresse <= 0;
        loaderLesen <= 0;
        counter <= 1;
        zustand <= RESET;
    end
    else begin
        ledReg[7:4] <= zustand;
        case (zustand)
            RESET: begin
                zustand <= GROESSELADEN;
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
                    ledReg[3:0] <= SDDaten;
                    loaderDatenMenge <= SDDaten;
                    zustand <= RAMLADEN;
    
                    //Beginne, das erste Datenbyte von der SDKarte zu laden
                    loaderAdresse <= loaderAdresse + 1;
                    loaderLesen <= 1;
                end
                else if(~SDBusy) begin
                    counter <= counter + 1;
                    loaderLesen <= 0;
                end
            end 
            RAMLADEN: begin
                //ledReg <= loaderDaten[7:0];
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
                        zustand <= DEBUG;
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
                zustand <= LAEUFT;
                //ledReg <= 0;
            end
            LAEUFT: begin
            end
            default: zustand <= RESET; 
            DEBUG: begin    
                loaderSchreibeDaten <= 0;
                loaderLesen <= 0;
                debugTimer <= debugTimer + 1;
                if(debugTimer == 0) begin
                    byteNummer <= byteNummer - 1;
                    if(byteNummer == 3)
                        loaderAdresse <= loaderAdresse + 1;
                end
    
                /*case (byteNummer) 
                    3: ledReg <= RAMDatenRaus[31:24];
                    2: ledReg <= RAMDatenRaus[23:16];
                    1: ledReg <= RAMDatenRaus[15:8];
                    0: ledReg <= RAMDatenRaus[7:0];
                endcase*/
            end
        endcase
    end
end

endmodule
