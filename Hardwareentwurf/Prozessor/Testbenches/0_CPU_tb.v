// Testbench template
`include "../Prozessor/0_CPU.v"
`include "../Prozessor/1_RAM.v"
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 10 ns / 1 ns


module main_tb
;

 // Input/Output
reg[31:0] InstruktionAdresse;
reg Clock;
reg Reset;

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
wire Zero = 0;

wire[31:0] w_InstruktionAdresse;
wire[31:0] InstruktionRAMAdresseJetztAberWirklich;
reg InstruktionInitialisierung = 1;
assign InstruktionRAMAdresseJetztAberWirklich = InstruktionInitialisierung == 1 ? InstruktionAdresse : w_InstruktionAdresse;

//InstruktionRAM fuellen
reg[31:0] InstruktionRAMEingang;
reg BeschreibeInstruktionRAM;

 // Module instance
 CPU CPU (
    .DatenRein(DatenRein),
    .Instruktion(Instruktion),
    .InstruktionGeladen(1'b1),
    .DatenGeladen(1'b1),
    .DatenGespeichert(1'b1),
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
    .SchreibenAn(BeschreibeInstruktionRAM),
    .DatenRein(InstruktionRAMEingang),
    .Adresse(InstruktionRAMAdresseJetztAberWirklich),
    .Clock(Clock),

    .DatenRaus(Instruktion)
);

RAM #(
    .WORDSIZE(32),
    .WORDS(256)
) DatenRAM (
    .SchreibenAn(SchreibeDaten),
    .DatenRein(DatenRaus),
    .Adresse(DatenAdresse),
    .Clock(Clock),

    .DatenRaus(DatenRein)
);


initial begin
    Clock = 1'b0;
end

always begin
   #1 Clock = ~Clock; 
end
 

initial begin
    Reset = 1;
    $dumpvars(0, main_tb);
    for (integer idx = 0; idx < 256; idx = idx + 1) $dumpvars(0, DatenRAM.Daten[idx]);
    for (integer idx2 = 0; idx2 < 64; idx2 = idx2 + 1) $dumpvars(0, CPU.Register.registers[idx2]);
    for (integer idx3 = 0; idx3 < 256; idx3 = idx3 + 1) $dumpvars(0, InstruktionRAM.Daten[idx3]);
    #9
    BeschreibeInstruktionRAM = 1;
    //Schreibe Programm auf 
    $readmemh("program.txt",InstruktionRAM.Daten,0,28);
    #10
    BeschreibeInstruktionRAM = 0;
    InstruktionInitialisierung = 0;
    //Alles zurücksetzen
    Reset = 1;
    #50
    Reset = 0;

    #10000
    for (integer idx = 0; idx < 10; idx = idx + 1) $display("%b", DatenRAM.Daten[idx]);
    #4000 $display("End of simulation");
    $finish;
end
 
endmodule
