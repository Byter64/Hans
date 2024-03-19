`include "../Prozessor/0_CPU.v"
`include "../Prozessor/1_RAM.v"
`include "../Loader/Loader.v"
`include "../Grafikkarte/Verilog/Bildpuffer.v"
`include "../SDKarte/SDKartenLeser.v"
`include "../Grafikkarte/Verilog/HDMI_clock.v"
`include "../Grafikkarte/Verilog/HDMI_test_DDR.v"
`include "../Grafikkarte/Verilog/TMDS_encoder.v"
`ifndef IVERILOG
`include "../ecp5pll/hdl/sv/ecp5pll.sv"
`endif 

module Top
(
    input clk_25mhz,
    output[7:0] led,
    output sd_cmd,      //mosi
    inout [3:0] sd_d,    //miso //cs
    output sd_clk,
    output[3:0] gpdi_dp
);
 wire ONE = 1'b1;
 wire ZERO = 1'b0;
 // Input/Output OUT
 //SDKARTE
 assign sd_d[0] = SDcs;
 assign sd_d[1] = ONE;
 assign sd_d[2] = ONE;
 assign sd_d[3] = SDmiso;
 assign sd_cmd = SDmosi;
 //GPDI
 assign gpdi_dp = HDMIgpdi_dp;
 //LED
 assign led = BildpufferX;
 //CLOCKS
 wire Clock;
 wire [3:0] clocks;
 assign Clock = clocks[3];

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
    .out3_hz( 5000000), .out3_deg(300), .out3_tol_hz(0)
)
ecp5pll_inst
(
    .clk_i(clk_25mhz),
    .clk_o(clocks)
);
`endif

    //Inputs CPU
    wire [31:0] CPUDatenRein;
    wire [31:0] CPUInstruktion;
    //Outputs CPU
    wire [31:0] CPUInstruktionAdresse;
    wire [31:0] CPUDatenRaus;
    wire [31:0] CPUDatenAdresse;
    wire CPULeseDaten;
    wire CPUSchreibeDaten;
    wire CPULeseInstruktion;

 // Module instance
 CPU cpu (
    .DatenRein(CPUDatenRein),
    .Instruktion(CPUInstruktion),
    .InstruktionGeladen(1'b1),
    .DatenGeladen(1'b1),
    .DatenGespeichert(1'b1),
    .Clock(Clock),
    .Reset(GlobalReset||LoaderReset),

    .InstruktionAdresse(CPUInstruktionAdresse),
    .DatenRaus(CPUDatenRaus),
    .DatenAdresse(CPUDatenAdresse),
    .LeseDaten(CPULeseDaten),
    .SchreibeDaten(CPUSchreibeDaten),
    .LeseInstruktion(CPULeseInstruktion)
 );
    //Inputs RAM
    wire RAMSchreibenAn;
    wire [31:0] RAMDatenInput;
    wire [15:0] RAMAdresse;
    //Outputs RAM
    wire [31:0] RAMDatenOutput;
    //Instanziierung 
RAM #(
    .WORDSIZE(32),
    .WORDS(2**11) //2**16
) ram (
    .SchreibenAn(RAMSchreibenAn),
    .DatenRein(RAMDatenInput),
    .Adresse(RAMAdresse),
    .Clock(Clock),

    .DatenRaus(RAMDatenOutput)
);
    //Inputs Loader
    wire [4095:0] LoaderDaten;
    wire LoaderFertig;
    wire LoaderBusy;
    
    //Outputs Loader
    wire [31:0] LoaderSDAdresse;
    wire LoaderLesen;
    wire [31:0] LoaderRAMAdresse;
    wire [31:0] LoaderDatenRaus;
    wire LoaderSchreiben;
    wire LoaderSchreibenFertig;

    //Instanziierung
Loader dataloader(
    .Clock(Clock),
    .Reset(GlobalReset),
    .SDAdresse(LoaderSDAdresse),
    .Lesen(LoaderLesen),
    .Daten(LoaderDaten),
    .Fertig(LoaderFertig),
    .Busy(LoaderBusy),

    .RAMAdresse(LoaderRAMAdresse),
    .DatenRaus(LoaderDatenRaus),
    .Schreiben(LoaderSchreiben),
    .SchreibenFertig(LoaderSchreibenFertig)
);
    //Inputs SDKarte
    wire [31:0] SDAdresse;
    wire SDLesen;
    wire SDmiso;
    //Outputs SDKarte
    wire [4095:0] SDDaten;
    wire SDFertig;
    wire SDBusy;
    wire SDcs;
    wire SDmosi;
    //Instanziierung
SDKarte sdkarte(
    .Clock(Clock),
    .Reset(GlobalReset),

    .Adresse(SDAdresse),
    .Lesen(SDLesen),
    .Daten(SDDaten),
    .Fertig(SDFertig),
    .Busy(SDBusy),
    .cs(SDcs),
    .mosi(SDmosi),
    .miso(SDmiso),
    .sclk(sd_clk)
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
    //Instanziierung
Bildpuffer bildpuffer (
    .clk(Clock),
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
    //Instanziierung
HDMI_test_DDR hdmi_test_ddr(
    .clk(Clock),
    .pixelData(HDMIPixelData),
    .x(HDMIX),
    .y(HDMIY),
    .gpdi_dp(HDMIgpdi_dp)
    );

wire LoaderReset;

//INPUT LOGIC
//CPU
    assign CPUDatenRein = RAMDatenOutput;
    assign CPUInstruktion = RAMDatenOutput;
//RAM
    assign RAMSchreibenAn = CPUSchreibeDaten;
    assign RAMDatenInput = CPUDatenRaus;
    assign RAMAdresse = CPULeseInstruktion ? CPUInstruktionAdresse[15:0] : CPUDatenAdresse[15:0];
//Loader
    assign LoaderDaten = SDDaten;
    assign LoaderFertig = SDFertig;
    assign LoaderBusy = SDBusy;
//SDKarte
    assign SDAdresse = LoaderSDAdresse;
    assign SDLesen = LoaderLesen;
//Bildpuffer
    assign BildpufferX = CPUDatenAdresse[23:16];
    assign BildpufferY = CPUDatenAdresse[31:24];
    assign BildpufferColor = CPUDatenRaus[7:0];
    assign BildpufferWrite = (CPUDatenAdresse[15:0] == 16'b0) ? CPUSchreibeDaten : 0; 
    assign BildpufferXData = HDMIX;
    assign BildpufferYData = HDMIY;
//HDMI
    assign HDMIPixelData = BildpufferPixelData;
//REST
    assign LoaderReset = ~LoaderSchreibenFertig;
//

reg GlobalReset = 0;
integer resetTimer = 10;
always @(posedge Clock) begin
    if(resetTimer > 0)begin
        GlobalReset <= 1;
        resetTimer <= resetTimer - 1;
    end
    else if(resetTimer == 0)
        GlobalReset <= 0;
end


endmodule
