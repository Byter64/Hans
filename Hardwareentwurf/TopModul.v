`include "../Prozessor/0_CPU.v"
`include "../Cache/Cache.v"
`include "../Prozessor/Testbenches/1_RAM.v"
`ifndef IVERILOG
`include "../ecp5pll/hdl/sv/ecp5pll.sv"
`endif 

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

wire LeseInstruktionRAM;
wire BeschreibeInstruktionRAMRAM;
wire [31:0] InstruktionRAMEingangRAM;
wire [31:0] InstruktionRAMAdresseJetztAberWirklichRAM;
wire [31:0] InstruktionRAMNichtModul;
wire InstruktionGeladenRAM;

wire RAMLeseDatenRAM;
wire RAMSchreibeDatenRAM;
wire [31:0] DatenRausRAM;
wire [31:0] DatenAdresseRAM;
wire [31:0] DatenReinRAM;
wire DatenGeladenRAM;
wire DatenGespeichertRAM;

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

Cache #(
    .CACHESIZEBITS(15),
    .BLOCKSIZEBITS(2)
) InstruktionCache (
    .ProzessorSchreiben(BeschreibeInstruktionRAM),
    .ProzessorLesen(LeseInstruktion),
    .ProzessorAdresse(InstruktionRAMAdresseJetztAberWirklich),
    .ProzessorSchreibDaten(InstruktionRAMEingang),
    .RAMLesDaten(InstruktionRAMNichtModul),
    .RAMDatenGeschrieben(Zero),
    .RAMDatenGelesen(InstruktionGeladenRAM),
    .Clock(Clock),
    .Reset(Reset),

    .ProzessorLesDaten(Instruktion),
    .ProzessorDatenGeschrieben(Zero),
    .ProzessorDatenGelesen(InstruktionGeladen),
    .RAMSchreiben(BeschreibeInstruktionRAMRAM),
    .RAMLesen(LeseInstruktionRAM),
    .RAMAdresse(InstruktionRAMAdresseJetztAberWirklichRAM),
    .RAMSchreibDaten(InstruktionRAMEingangRAM)
);

RAM #(
    .WORDSIZE(32),
    .WORDS(256)
) InstruktionRAM (
    .LesenAn(LeseInstruktionRAM),
    .SchreibenAn(BeschreibeInstruktionRAMRAM),
    .DatenRein(InstruktionRAMEingangRAM),
    .Adresse(InstruktionRAMAdresseJetztAberWirklichRAM[7:0]),
    .Clock(Clock),

    .DatenRaus(InstruktionRAMNichtModul),
    .DatenBereit(InstruktionGeladenRAM),
    .DatenGeschrieben(Zero)
);

Cache #(
    .CACHESIZEBITS(14),
    .BLOCKSIZEBITS(2)
) DatenCache (
    .ProzessorSchreiben(RAMSchreibeDaten),
    .ProzessorLesen(RAMLeseDaten),
    .ProzessorAdresse(DatenAdresse),
    .ProzessorSchreibDaten(DatenRaus),
    .RAMLesDaten(DatenReinRAM),
    .RAMDatenGeschrieben(DatenGespeichertRAM),
    .RAMDatenGelesen(DatenGeladenRAM),
    .Clock(Clock),
    .Reset(Reset),

    .ProzessorLesDaten(DatenRein),
    .ProzessorDatenGeschrieben(DatenGespeichert),
    .ProzessorDatenGelesen(DatenGeladen),
    .RAMSchreiben(RAMSchreibeDatenRAM),
    .RAMLesen(RAMLeseDatenRAM),
    .RAMAdresse(DatenAdresseRAM),
    .RAMSchreibDaten(DatenRausRAM)
);

RAM #(
    .WORDSIZE(32),
    .WORDS(32768)
) DatenRAM (
    .LesenAn(RAMLeseDatenRAM),
    .SchreibenAn(RAMSchreibeDatenRAM),
    .DatenRein(DatenRausRAM),
    .Adresse(DatenAdresseRAM[14:0]),
    .Clock(Clock),

    .DatenRaus(DatenReinRAM),
    .DatenBereit(DatenGeladenRAM),
    .DatenGeschrieben(DatenGespeichertRAM)
);

integer resetTimer = 10;
always @(posedge Clock) begin
    if(resetTimer > 0)begin
        Reset = 1;
        resetTimer = resetTimer - 1;
    end
    else if(resetTimer == 0)
        Reset = 0;
end

always @(posedge Clock) begin
    if(DatenAdresse[31] == 1 && SchreibeDaten == 1) begin
        ledReg = DatenRaus[24:17];
    end
end

endmodule
