`include "../Prozessor/0_CPU.v"
`include "../Prozessor/1_RAM.v"
//`include "../Grafikkarte/Verilog/Bildpuffer.v"
//`include "../SDKarte/SDKartenLeser.v"
//`include "../Grafikkarte/Verilog/HDMI_clock.v"
//`include "../Grafikkarte/Verilog/HDMI_test_DDR.v"
//`include "../Grafikkarte/Verilog/TMDS_encoder.v"
`ifndef IVERILOG
`include "../ecp5pll/hdl/sv/ecp5pll.sv"
`endif 

module Top
(
    input clk_25mhz,
    
    output[7:0] led
    //output[3:0] gpdi_dp,
    //output sd_cmd,      //mosi
    //output sd_clk,
    
    //inout [3:0] sd_d    //miso //cs
);

 //Konstanten
 wire ONE = 1'b1;
 wire ZERO = 1'b0;

 // Input/Output
 //SDKARTE
 //assign sd_d[0] = SDmiso;
 //assign sd_d[1] = ONE;
 //assign sd_d[2] = ONE;
 //assign sd_d[3] = SDcs;
 //assign sd_cmd = SDmosi;
 //LED
 assign led[7:0] = ledReg[7:0];

 //CLOCKS
 wire HauptClock;
 wire [3:0] clocks;
 assign HauptClock = clocks[3];


//Clock
`ifdef  IVERILOG
reg[3:0] __SimulationsClocks;

assign clocks = __SimulationsClocks;

initial begin
    __SimulationsClocks = 4'b0;
end

always begin //Tatsächliche Taktrate: 41,66666667 MHz
   #12 __SimulationsClocks[0] = ~__SimulationsClocks[0]; 
end

always begin //Tatsächliche Taktrate: 50 MHz
   #10 __SimulationsClocks[1] = ~__SimulationsClocks[1]; 
end


always begin //Tatsächliche Taktrate: 62,5 MHz MHz
   #10 __SimulationsClocks[2] = ~__SimulationsClocks[2]; 
end


always begin //Tatsächliche Taktrate: 5 MHz
   #10 __SimulationsClocks[3] = ~__SimulationsClocks[3]; 
end

`else
ecp5pll
#(
      .in_hz(25000000),
    .out0_hz(40000000),                 .out0_tol_hz(0),
    .out1_hz(50000000), .out1_deg( 90), .out1_tol_hz(0),
    .out2_hz(60000000), .out2_deg(180), .out2_tol_hz(0),
    .out3_hz( 1000000), .out3_deg(300), .out3_tol_hz(0)
)
ecp5pll_inst
(
    .clk_i(clk_25mhz),
    .clk_o(clocks)
);
`endif

//CPU
//Inputs
wire [31:0] CPUDatenRein;
wire [31:0] CPUInstruktion;
//Outputs
wire [31:0] CPUInstruktionAdresse;
wire [31:0] CPUDatenRaus;
wire [31:0] CPUDatenAdresse;
wire CPULeseDaten;
wire CPUSchreibeDaten;
wire CPULeseInstruktion;

//RAM
//Inputs
wire RAMClock;
wire RAMSchreibenAn;
wire [31:0] RAMDatenInput;
wire [15:0] RAMAdresse;
//Outputs
wire [31:0] RAMDatenOutput;

/*
//SDKarte
//Inputs
wire [31:0] SDAdresse;
wire SDLesen;
wire SDmiso;
//Outputs
wire [31:0] SDDaten;
wire SDFertig;
wire SDBusy;
wire SDcs;
wire SDmosi;
wire[4:0] SDDebug;
wire[2:0] SDZustand;

//Bildpuffer
//Inputs
wire [7:0] BildpufferX;
wire [7:0] BildpufferY;
wire [7:0] BildpufferColor;
wire BildpufferWrite;
wire [7:0] BildpufferXData;
wire [7:0] BildpufferYData;
//Outputs
wire [7:0] BildpufferPixelData;

//HDMI
//Inputs
wire [7:0] HDMIPixelData;
//Outputs
wire [7:0] HDMIX;
wire [7:0] HDMIY;
wire [3:0] HDMIgpdi_dp;

//Loader (hat nicht für eigenes Modul gereicht)
wire [31:0] loaderDaten;
wire [31:0] loaderRAMAdresse;
reg loaderLesen = 0;
reg [31:0] loaderAdresse = 0;
reg [31:0] loaderDatenMenge = 0; //Wie viele Bytes müssen in den RAM geladen werden?
reg loaderSchreibeDaten = 0;
reg [3:0] zustand = RESET;
reg loaderWarte = 1;
*/
reg [7:0] ledReg = 8'b0;

CPU cpu (
    .Clock(HauptClock),
    .Reset(globalerReset || loaderReset),
    .DatenRein(CPUDatenRein),
    .Instruktion(CPUInstruktion),
    .InstruktionGeladen(1'b1),
    .DatenGeladen(1'b1),
    .DatenGespeichert(1'b1),

    .InstruktionAdresse(CPUInstruktionAdresse),
    .DatenRaus(CPUDatenRaus),
    .DatenAdresse(CPUDatenAdresse),
    .LeseDaten(CPULeseDaten),
    .SchreibeDaten(CPUSchreibeDaten),
    .LeseInstruktion(CPULeseInstruktion)
);

/*SDKarte sdkarte(
    .Clock(clk_25mhz),
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
);*/

/*
Bildpuffer bildpuffer (
    .clk(HauptClock),
    .x(BildpufferX),
    .y(BildpufferY),
    .color(BildpufferColor),
    .write(BildpufferWrite),
    .x_data(BildpufferXData),
    .y_data(BildpufferYData),
    .pixelData(BildpufferPixelData)
);

HDMI_test_DDR hdmi_test_ddr(
    .clk(clk_25mhz), //Braucht 25 MHz um zu funktionieren
    .pixelData(HDMIPixelData),
    .x(HDMIX),
    .y(HDMIY),
    .gpdi_dp(gpdi_dp)
);
*/
RAM #(
    .WORDSIZE(32),
    .WORDS(2**10) //2**16
) ram (
    .SchreibenAn(RAMSchreibenAn),
    .DatenRein(RAMDatenInput),
    .Adresse(RAMAdresse),
    .Clock(RAMClock),

    .DatenRaus(RAMDatenOutput)
);

//INPUT LOGIK
//CPU
    assign CPUDatenRein = RAMDatenOutput;
    assign CPUInstruktion = RAMDatenOutput;
//RAM
    assign RAMClock = HauptClock;
    assign RAMSchreibenAn = (CPUDatenAdresse[31] == 0) ? CPUSchreibeDaten : 0;
    assign RAMDatenInput = CPUDatenRaus;
    assign RAMAdresse = (CPULeseInstruktion ? CPUInstruktionAdresse[15:0] : CPUDatenAdresse[15:0]);
//SDKarte 
    /*assign SDAdresse = loaderAdresse;
    assign SDLesen = loaderLesen;
//Loader
    assign loaderDaten = SDDaten;
    assign loaderRAMAdresse = loaderAdresse - 1;
//Bildpuffer
    assign BildpufferX = CPUDatenAdresse[23:16];
    assign BildpufferY = CPUDatenAdresse[31:24];
    assign BildpufferColor = CPUDatenRaus[7:0];
    assign BildpufferWrite = (CPUDatenAdresse[31] == 1) ? CPUSchreibeDaten : 0; 
    assign BildpufferXData = HDMIX;
    assign BildpufferYData = HDMIY;
//HDMI
    assign HDMIPixelData = BildpufferPixelData; */


localparam RESET = 4'd0;
localparam GROESSELADEN = 4'd1;
localparam AUFGROESSEWARTEN = 4'd2;
localparam RAMLADEN = 4'd3;
localparam RAMLADENBEENDEN = 4'd4;
localparam DEBUG = 4'd6;
localparam LAEUFT = 4'd8;

reg [5:0] resetTimer = 0;
reg globalerReset = 0;
reg loaderReset = 0;
//reg [15:0] debugRAMAdresse = 0;
//reg [25:0] debugTimer = 1;
//reg [1:0] byteNummer = 0;
//reg [4:0] counter = 1; //Weil der sd_controller die Daten nicht mehr richtig lädt, wenn die Anfragen zu schnell kommen, existiert dieser Zähler

always @(posedge clk_25mhz) begin
    if(resetTimer < 20) begin
        globalerReset <= 1;
        resetTimer <= resetTimer + 1;
    end
    else
        globalerReset <= 0;
end

always @(posedge clk_25mhz) begin
    if(globalerReset) begin
        ledReg <= 0;
    end
    else begin 
        if(CPUSchreibeDaten && CPUDatenAdresse == 0)
            ledReg[7:2] <= CPUDatenRaus[5:0];
        
        ledReg[1:0] <= CPUInstruktionAdresse[1:0];
    end
end


endmodule
