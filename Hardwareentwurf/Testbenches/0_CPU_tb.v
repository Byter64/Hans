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

wire[31:0] w_InstruktionAdresse;
wire[31:0] InstruktionRAMAdresseJetztAberWirklich;
reg InstruktionInitialisierung = 1;
assign InstruktionRAMAdresseJetztAberWirklich = w_InstruktionAdresse;

//InstruktionRAM fuellen
reg[31:0] InstruktionRAMEingang;
reg BeschreibeInstruktionRAM;

 // Module instance
 CPU CPU (
    .DatenRein(DatenRein),
    .Instruktion(Instruktion),
    .InstruktionGeladen(InstruktionGeladen),
    .DatenGeladen(DatenGeladen),
    .DatenGespeichert(DatenGespeichert),
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
    .Adresse(InstruktionRAMAdresseJetztAberWirklich),
    .Clock(Clock),

    .DatenRaus(Instruktion),
    .DatenBereit(InstruktionGeladen),
    .DatenGeschrieben(Zero)
);

RAM #(
    .WORDSIZE(32),
    .WORDS(256)
) DatenRAM (
    .LesenAn(LeseDaten),
    .SchreibenAn(SchreibeDaten),
    .DatenRein(DatenRaus),
    .Adresse(DatenAdresse),
    .Clock(Clock),

    .DatenRaus(DatenRein),
    .DatenBereit(DatenGeladen),
    .DatenGeschrieben(DatenGespeichert)
);


initial begin
    Clock = 1'b0;
end

always begin
   #(Halfcycle) Clock = ~Clock; 
end
 localparam Halfcycle = 5;
 localparam Cycle = 2* Halfcycle;

initial begin
    Reset = 1;
    $dumpvars(0, main_tb);
    BeschreibeInstruktionRAM = 0;
    InstruktionInitialisierung = 0;
    #(Halfcycle)

    //Alles zurücksetzen
    Reset = 1;
    #(Halfcycle)
    Reset = 0;
    //Programm in program.txt gespeichert

    #10000
    for (integer idx = 0; idx < 10; idx = idx + 1) $display("%b", DatenRAM.Daten[idx]);
    #4000 $display("End of simulation");
    $finish;
end
 
endmodule
