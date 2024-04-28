`include "../Prozessor/0_CPU.v"
`include "../Prozessor/1_RAM.v"
//`include "../Grafikkarte/Verilog/Bildpuffer.v"
//`include "../SDKarte/SDKartenLeser.v"
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
    .Reset(Reset),

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
    .Clock(Clock),

    .DatenRaus(RAMDatenRaus),
    .DatenBereit(RAMDatenBereit),
    .DatenGeschrieben(RAMDatenGeschrieben)
);

//Input Zuweisungen CPU
assign CPUDatenRein = RAMDatenRaus;
assign CPUInstruktion = RAMDatenRaus;
assign CPUInstruktionGeladen = RAMDatenBereit;
assign CPUDatenGeladen = RAMDatenBereit;
assign CPUDatenGespeichert = RAMDatenGeschrieben;

//Inputs Zuweisung RAM
assign RAMLesenAn = CPULeseInstruktion || CPULeseDaten;
assign RAMSchreibenAn = CPUSchreibeDaten;
assign RAMDatenRein = CPUDatenRaus;
assign RAMAdresse = CPULeseInstruktion ? CPUInstruktionAdresse : CPUDatenAdresse;

always @(posedge Clock) begin
    if(resetTimer < 256)begin
        Reset <= 1;
        resetTimer <= resetTimer + 1;
    end
    else begin
        Reset <= 0;
    end
end

always @(posedge Clock) begin
    if(CPUDatenAdresse[31] == 1 && CPUSchreibeDaten == 1) begin
        ledReg <= CPUDatenRaus[7:0];
    end
end

endmodule
