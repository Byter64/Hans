`include "Verilog/0_CPU.v"
`include "Verilog/Testbenches/1_RAM.v"

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
assign Clock = clk_25mhz;
assign led = ledReg;

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

initial begin
    InstruktionRAM.Daten[0] = 32'b10000000010000000000000000001111; //Addi R2, R0, 15
    InstruktionRAM.Daten[1] = 32'b00000000001000000000000000000000; //Add R1, R0, R0
    InstruktionRAM.Daten[2] = 32'b10000011111000000000000000000001; //Addi R31, R0, #1
    InstruktionRAM.Daten[3] = 32'b10011011111111110000000000011111; //Sli R31, R31, #31

    InstruktionRAM.Daten[4] = 32'b00000000001000010001000000000000; //Add R1, R1, R2
    InstruktionRAM.Daten[5] = 32'b10000100010000100000000000000001; //Subi R2, R2, 1
    InstruktionRAM.Daten[6] = 32'b00000000011000100000000000010000; //Ce R3, R2, R0
    InstruktionRAM.Daten[7] = 32'b10110000001111110000000000000000; //Store R1, R31, #0
    InstruktionRAM.Daten[8] = 32'b10111000000000111111111111111011; //Bez R3, -5

    InstruktionRAM.Daten[9] = 32'b01000011111111111111111111111111; //jmp -1
end

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
        ledReg = DatenRaus[7:0] | DatenRaus[15:8] | DatenRaus[23:16] | DatenRaus[31:24];
    end
end

endmodule
