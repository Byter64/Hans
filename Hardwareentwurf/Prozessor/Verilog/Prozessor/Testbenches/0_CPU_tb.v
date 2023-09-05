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
    for (integer idx = 0; idx < 256; idx = idx + 1) $dumpvars(0, DatenRAM.Daten[idx]);
    for (integer idx2 = 0; idx2 < 64; idx2 = idx2 + 1) $dumpvars(0, CPU.Register.registers[idx2]);

    #9
    //Schreibe Programm auf 
    BeschreibeInstruktionRAM = 1;
    InstruktionAdresse = 32'd0;
    InstruktionRAMEingang = 32'b10000000001000000000000000000001;
    #20
    InstruktionAdresse = 32'd1;
    InstruktionRAMEingang = 32'b10111111111000000000000000000011;
    #20
    InstruktionAdresse = 32'd2;
    InstruktionRAMEingang = 32'b10111111111000000000000000000010;
    #20
    InstruktionAdresse = 32'd3;
    InstruktionRAMEingang = 32'b10111111111000000000000000000001;
    #20
    InstruktionAdresse = 32'd4;
    InstruktionRAMEingang = 32'b01000011111111111111111111111110;
    #20
    InstruktionAdresse = 32'd5;
    InstruktionRAMEingang = 32'b10100000001000010000000000000001;
    #20
    InstruktionAdresse = 32'd6;
    InstruktionRAMEingang = 32'b10110100000111110000000000000000;
    #20
    // InstruktionAdresse = 32'd7;
    // InstruktionRAMEingang = 32'b10111111111000000000000000000001;
    // #20
    // InstruktionAdresse = 32'd8;
    // InstruktionRAMEingang = 32'b01000011111111111111111111111110;
    // #20
    // InstruktionAdresse = 32'd9;
    // InstruktionRAMEingang = 32'b10100000001000010000000000000001;
    // #20
    // InstruktionAdresse = 32'd10;
    // InstruktionRAMEingang = 32'b10110100000111110000000000000000;
    // #20
    // InstruktionAdresse = 32'd11;
    // InstruktionRAMEingang = 32'b00000001100010110101000000000000;
    // #20
    // InstruktionAdresse = 32'd12;
    // InstruktionRAMEingang = 32'b00000001101011000101100000000000;
    // #20
    // InstruktionAdresse = 32'd13;
    // InstruktionRAMEingang = 32'b00000001110011010110000000000000;
    // #20
    // InstruktionAdresse = 32'd14;
    // InstruktionRAMEingang = 32'b00000001111011100110100000000000;
    // #20
    // InstruktionAdresse = 32'd15;
    // InstruktionRAMEingang = 32'b00000010000011110111000000000000;
    // #20
    // InstruktionAdresse = 32'd16;
    // InstruktionRAMEingang = 32'b00000010001100000111100000000000;
    // #20
    // InstruktionAdresse = 32'd17;
    // InstruktionRAMEingang = 32'b00000010010100011000000000000000;
    // #20
    // InstruktionAdresse = 32'd18;
    // InstruktionRAMEingang = 32'b00000010011100101000100000000000;
    // #20
    // InstruktionAdresse = 32'd19;
    // InstruktionRAMEingang = 32'b00000010100100111001000000000000;
    // #20
    // InstruktionAdresse = 32'd20;
    // InstruktionRAMEingang = 32'b00000010101101001001100000000000;
    // #20
    // InstruktionAdresse = 32'd21;
    // InstruktionRAMEingang = 32'b00000010110101011010000000000000;
    // #20
    // InstruktionAdresse = 32'd22;
    // InstruktionRAMEingang = 32'b00000010111101101010100000000000;
    // #20
    // InstruktionAdresse = 32'd23;
    // InstruktionRAMEingang = 32'b00000011000101111011000000000000;
    // #20
    // InstruktionAdresse = 32'd24;
    // InstruktionRAMEingang = 32'b00000011001110001011100000000000;
    // #20
    // InstruktionAdresse = 32'd25;
    // InstruktionRAMEingang = 32'b00000011010110011100000000000000;
    // #20
    // InstruktionAdresse = 32'd26;
    // InstruktionRAMEingang = 32'b00000011011110101100100000000000;
    // #20
    // InstruktionAdresse = 32'd27;
    // InstruktionRAMEingang = 32'b00000011100110111101000000000000;
    // #20
    // InstruktionAdresse = 32'd28;
    // InstruktionRAMEingang = 32'b00000011101111001101100000000000;
    // #20
    // InstruktionAdresse = 32'd29;
    // InstruktionRAMEingang = 32'b00000011110111011110000000000000;
    // #20
    // InstruktionAdresse = 32'd30;
    // InstruktionRAMEingang = 32'b00000011111111101110100000000000;
    // #20
    // InstruktionAdresse = 32'd31;
    // InstruktionRAMEingang = 32'b00000011111111111110000000000001;
    // #20
    // InstruktionAdresse = 32'd32;
    // InstruktionRAMEingang = 32'b00000011111111111101100000000001;
    // #20
    // InstruktionAdresse = 32'd33;
    // InstruktionRAMEingang = 32'b00000011111111111110100000000001;
    // #20
    // InstruktionAdresse = 32'd34;
    // InstruktionRAMEingang = 32'b00000011111111111110000000000001;
    // #20
    // InstruktionAdresse = 32'd35;
    // InstruktionRAMEingang = 32'b00000011111111111111000000000001;
    // #20
    // InstruktionAdresse = 32'd36;
    // InstruktionRAMEingang = 32'b01000011111111111111111111111111;
    // #20
    BeschreibeInstruktionRAM = 0;
    InstruktionInitialisierung = 0;


    //Alles zurücksetzen
    Reset = 1;
    #30
    Reset = 0;

    #10000
    for (integer idx = 0; idx < 10; idx = idx + 1) $display("%b", DatenRAM.Daten[idx]);
    #4000 $display("End of simulation");
    $finish;
end
 
endmodule
