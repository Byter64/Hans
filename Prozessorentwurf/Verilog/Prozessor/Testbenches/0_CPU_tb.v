// Testbench template
`include "../0_CPU.v"
`include "1_RAM.v"
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
   #10 Clock = ~Clock; 
end
 

initial begin
    Reset = 1;
    InstruktionInitialisierung = 1;
    $dumpvars(0, main_tb);
    for (integer idx = 0; idx < 256; idx = idx + 1) $dumpvars(0, InstruktionRAM.Daten[idx]);
    for (integer idx2 = 0; idx2 < 64; idx2 = idx2 + 1) $dumpvars(0, CPU.Register.registers[idx2]);

    #9
    //Schreibe Programm auf 
    BeschreibeInstruktionRAM = 1;
    InstruktionAdresse = 32'd0;
    InstruktionRAMEingang = 32'b10000000010000000000000000001111; //Addi R2, R0, 15 #Eingabe
    #20
    InstruktionAdresse = 32'd1;
    InstruktionRAMEingang = 32'b00000000001000000000000000000000; //Add R1, R0, R0
    #20
    InstruktionAdresse = 32'd2;
    InstruktionRAMEingang = 32'b00000000001000010001000000000000; //Add R1, R1, R2
    #20
    InstruktionAdresse = 32'd3;
    InstruktionRAMEingang = 32'b10000100010000100000000000000001; //Subi R2, R2, 1
    #20
    InstruktionAdresse = 32'd4;
    InstruktionRAMEingang = 32'b00000000011000100000000000010000; //Ce R3, R2, R0
    #20
    InstruktionAdresse = 32'd5;
    InstruktionRAMEingang = 32'b10111000000000111111111111111100; //Bez R3, -4
    #20
    InstruktionAdresse = 32'd6;
    InstruktionRAMEingang = 32'b01000000000000000000000000000001; //jmp -1
    #20
    BeschreibeInstruktionRAM = 0;
    InstruktionInitialisierung = 0;


    //Alles zurücksetzen
    Reset = 1;
    #30
    Reset = 0;

    #10000
    for (integer idx = 0; idx < 10; idx = idx + 1) $display("%b", InstruktionRAM.Daten[idx]);
    #4000 $display("End of simulation");
    $finish;
end
 
endmodule
