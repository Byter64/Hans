`include "../Prozessor/0_CPU.v"
`include "../Prozessor/1_RAM.v"
`ifdef SYNTHESIS
`include "../ecp5pll/hdl/sv/ecp5pll.sv"
`endif
module Top
(
    input clk_25mhz,
    output[7:0] led
);

 // Input/Output for FPGA
reg Reset;
reg[7:0] ledReg = 7'b0;
assign led = ledReg;

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
wire RAMLesenAn;
wire RAMSchreibenAn;
wire[31:0] RAMDatenRein;
wire[7:0] RAMAdresse; //auf 31 erhöhen dann

//Outputs RAM
wire[31:0] RAMDatenRaus;
wire RAMDatenBereit;
wire RAMDatenGeschrieben;

//Instanzierung
RAM #(
    .WORDSIZE(32),
    .WORDS(256)
) InstruktionRAM (
    .LesenAn(RAMLesenAn),
    .SchreibenAn(RAMSchreibenAn),
    .DatenRein(RAMDatenRein),
    .Adresse(RAMAdresse),
    .Clock(Clock),

    .DatenRaus(RAMDatenRaus),
    .DatenBereit(RAMDatenBereit),
    .DatenGeschrieben(RAMDatenGeschrieben)
);

//Inputs DRAM
wire DRAMLesenAn;
wire DRAMSchreibenAn;
wire[31:0] DRAMDatenRein;
wire[7:0] DRAMAdresse; //auf 31 erhöhen dann

//Outputs DRAM
wire[31:0] DRAMDatenRaus;
wire DRAMDatenBereit;
wire DRAMDatenGeschrieben;

//Instanzierung
RAM #(
    .WORDSIZE(32),
    .WORDS(256)
) DatenRAM (
    .LesenAn(DRAMLesenAn),
    .SchreibenAn(DRAMSchreibenAn),
    .DatenRein(DRAMDatenRein),
    .Adresse(DRAMAdresse),
    .Clock(Clock),

    .DatenRaus(DRAMDatenRaus),
    .DatenBereit(DRAMDatenBereit),
    .DatenGeschrieben(DRAMDatenGeschrieben)
);

//Input Zuweisungen CPU
assign CPUDatenRein = DRAMDatenRaus;
assign CPUInstruktion = RAMDatenRaus;
assign CPUInstruktionGeladen = RAMDatenBereit;
assign CPUDatenGeladen = DRAMDatenBereit;
assign CPUDatenGespeichert = DRAMDatenGeschrieben;

//Inputs Zuweisung InstruktionsRAM
assign RAMLesenAn = CPULeseInstruktion;
assign RAMSchreibenAn = 0;
assign RAMDatenRein = 32'b0;
assign RAMAdresse = CPUInstruktionAdresse[7:0];

//Inputs Zuweisung DatenRAM
assign DRAMLesenAn = CPULeseDaten;
assign DRAMSchreibenAn = CPUSchreibeDaten;
assign DRAMDatenRein = CPUDatenRaus;
assign DRAMAdresse = CPUDatenAdresse[7:0];

reg[10:0] resetTimer = 10'b100;
always @(posedge Clock) begin
    if(resetTimer > 1)begin
        Reset <= 1;
        resetTimer <= resetTimer - 1;
    end
    else if(resetTimer == 1)begin
        Reset <= 0;
        resetTimer <= resetTimer - 1;
    end
end

always @(posedge Clock) begin
    if(CPUDatenAdresse[31] == 1 && CPUSchreibeDaten == 1) begin
        ledReg <= CPUDatenRaus[7:0];
    end
end

endmodule
