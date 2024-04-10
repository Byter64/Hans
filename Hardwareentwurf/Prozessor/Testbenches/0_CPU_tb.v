// Testbench template
`include "../Prozessor/0_CPU.v"
`include "../Prozessor/1_RAM.v"
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 10 ns / 1 ns


module main_tb
;

 // Input/Output
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

wire[31:0] InstruktionAdresse;
wire[31:0] RAMAdresse;
wire[31:0] RAMDatenRaus;
assign RAMAdresse = LeseInstruktion ? InstruktionAdresse[31:0] : DatenAdresse[31:0];

 // Module instance
 CPU CPU (
    .Clock(Clock),
    .Reset(Reset),
    .DatenRein(RAMDatenRaus),
    .Instruktion(RAMDatenRaus),
    .InstruktionGeladen(1'b1),
    .DatenGeladen(1'b1),
    .DatenGespeichert(1'b1),

    .InstruktionAdresse(InstruktionAdresse),
    .DatenRaus(DatenRaus),
    .DatenAdresse(DatenAdresse),
    .LeseDaten(LeseDaten),
    .SchreibeDaten(SchreibeDaten),
    .LeseInstruktion(LeseInstruktion)
 );

RAM #(
    .WORDSIZE(32),
    .WORDS(256)
) RAM (
    .SchreibenAn(SchreibeDaten),
    .DatenRein(DatenRaus),
    .Adresse(RAMAdresse),
    .Clock(Clock),

    .DatenRaus(RAMDatenRaus)
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
    for (integer idx = 0; idx < 256; idx = idx + 1) $dumpvars(0, RAM.Daten[idx]);
    for (integer idx2 = 0; idx2 < 64; idx2 = idx2 + 1) $dumpvars(0, CPU.Register.registers[idx2]);

    //Schreibe Programm auf 
    $readmemh("program.txt", RAM.Daten,0,28);

    #50
    Reset = 0;

    #10000
    for (integer idx = 0; idx < 10; idx = idx + 1) $display("%b", RAM.Daten[idx]);
    #4000 $display("End of simulation");
    $finish;
end
 
endmodule
