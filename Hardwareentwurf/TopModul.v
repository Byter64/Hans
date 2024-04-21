`include "Prozessor/Verilog/0_CPU.v"
`include "Prozessor/Verilog/Testbenches/1_RAM.v"
`include "ecp5pll/hdl/sv/ecp5pll.sv"

module Top
(
    input clk_25mhz,
    output[7:0] led
);

 // Input/Output
reg[31:0] InstruktionAdresse;
reg Reset;
reg[7:0] ledReg = 7'b0;
wire Clock;
assign Clock = clocks[3];
assign led = ledReg;
wire [3:0] clocks;

wire[31:0] Instruktion;
wire[31:0] DatenRaus;
wire[31:0] DatenAdresse;
wire[31:0] DatenRein;
wire DatenGeladen;
wire DatenGespeichert;
wire InstruktionGeladen;
wire LeseDaten;
wire SchreibeDaten;
wire LeseInstruktion;
wire Zero;

wire RAMLeseDaten;
wire RAMSchreibeDaten;
wire[31:0] RAMDatenRaus;
wire CPUDatenGeladen;
wire CPUDatenGespeichert;

assign RAMLeseDaten =       DatenAdresse[31] == 0 ? LeseDaten : 0;
assign RAMSchreibeDaten =   DatenAdresse[31] == 0 ? SchreibeDaten : 0;
assign RAMDatenRaus =       DatenAdresse[31] == 0 ? DatenRein : {24'b0, ledReg};
assign CPUDatenGeladen =    DatenAdresse[31] == 0 ? DatenGeladen : 1;
assign CPUDatenGespeichert =DatenAdresse[31] == 0 ? DatenGespeichert : 1;

wire[31:0] w_InstruktionAdresse;
wire[31:0] InstruktionRAMAdresseJetztAberWirklich;
reg InstruktionInitialisierung = 0;
assign InstruktionRAMAdresseJetztAberWirklich = InstruktionInitialisierung == 1 ? InstruktionAdresse : w_InstruktionAdresse;

//InstruktionRAM fuellen
reg[31:0] InstruktionRAMEingang = 0;
reg BeschreibeInstruktionRAM = 0;
  
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

 // Module instance
 CPU CPU (
    .DatenRein(RAMDatenRaus),
    .Instruktion(Instruktion),
    .InstruktionGeladen(InstruktionGeladen),
    .DatenGeladen(CPUDatenGeladen),
    .DatenGespeichert(CPUDatenGespeichert),
    .Clock(Clock),
    .Reset(Reset),

    .InstruktionAdresse(w_InstruktionAdresse),
    .DatenRaus(DatenRaus),
    .DatenAdresse(DatenAdresse),
    .LeseDaten(LeseDaten),
    .SchreibeDaten(SchreibeDaten),
    .LeseInstruktion(LeseInstruktion)
 );

RAM #(
    .WORDSIZE(32),
    .WORDS(256)
) InstruktionRAM (
    .LesenAn(LeseInstruktion),
    .SchreibenAn(BeschreibeInstruktionRAM),
    .DatenRein(InstruktionRAMEingang),
    .Adresse(InstruktionRAMAdresseJetztAberWirklich[7:0]),
    .Clock(Clock),

    .DatenRaus(Instruktion),
    .DatenBereit(InstruktionGeladen),
    .DatenGeschrieben(Zero)
);

RAM #(
    .WORDSIZE(32),
    .WORDS(256)
) DatenRAM (
    .LesenAn(RAMLeseDaten),
    .SchreibenAn(RAMSchreibeDaten),
    .DatenRein(DatenRaus),
    .Adresse(DatenAdresse[7:0]),
    .Clock(Clock),

    .DatenRaus(DatenRein),
    .DatenBereit(DatenGeladen),
    .DatenGeschrieben(DatenGespeichert)
);

integer resetTimer = 10;
always @(posedge Clock) begin
    if(resetTimer > 0)begin
        Reset <= 1;
        resetTimer <= resetTimer - 1;
    end
    else if(resetTimer == 0)
        Reset <= 0;
end

always @(posedge Clock) begin
    if(DatenAdresse[31] == 1 && SchreibeDaten == 1) begin
        ledReg <= DatenRaus[24:17];
    end
end

endmodule
