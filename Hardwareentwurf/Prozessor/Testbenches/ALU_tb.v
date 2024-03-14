// Code generated by Icestudio 0.10
// Sat, 18 Mar 2023 19:01:05 GMT

// Testbench template
`include "../Prozessor/ALU.v"
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 10 ns / 1 ns


module main_tb
;
//Int Arithmetik
localparam Add = 6'b000000;
localparam Sub = 6'b000001;
localparam Mul = 6'b000010;
localparam Sqrt =6'b000011;
localparam Div = 6'b000100;
localparam Mod = 6'b000101;
localparam Sla = 6'b000110;
localparam Sra = 6'b000111;
localparam Ce =  6'b001000;
localparam Cne = 6'b001001;
localparam Cg =  6'b001010;
localparam Cl =  6'b001011;
localparam Cgu = 6'b001100;
localparam Clu = 6'b001101;
localparam IToF =6'b001110;
localparam UIToF=6'b001111;

//Logik
localparam Not = 6'b010000;
localparam And = 6'b010001;
localparam Or =  6'b010010;
localparam Xor = 6'b010011;
localparam Xnor =6'b010100;
localparam Sll = 6'b010110;
localparam Srl = 6'b010111;

//Float Arithmetik
localparam Adds = 6'b100000;
localparam Subs = 6'b100001;
localparam Muls = 6'b100010;
localparam Sqrts =6'b100011;
localparam Divs = 6'b100100;
localparam Ces =  6'b101000;
localparam Cnes = 6'b101001;
localparam Cgs =  6'b101010;
localparam Cls =  6'b101011;
localparam FToI = 6'b101110;
localparam FToUI =6'b101111;

 // Simulation time: 100ns (10 * 10ns)
 parameter DURATION = 10;
 
 // Input/Output
reg[31:0] Daten1;
reg[31:0] Daten2;
reg[5:0] FunktionsCode;
reg StartSignal;
wire HatFertigGerechnet;
reg Reset;
reg Clock;
wire[31:0] Ergebnis;
 
 // Module instance
 ALU Alu (
    .Daten1(Daten1),
    .Daten2(Daten2),
    .FunktionsCode(FunktionsCode),
    .StartSignal(StartSignal),
    .HatFertigGerechnet(HatFertigGerechnet),
    .Reset(Reset),
    .Clock(Clock),
    .Ergebnis(Ergebnis)
 );

initial begin
    Clock = 1'b0;
    StartSignal = 0;
end

always begin
   #100 Clock = ~Clock; 
end

initial begin
    $dumpvars(0, main_tb);
    FunktionsCode <= 0;
    Daten1 <= 0;
    Daten2 <= 0;
    StartSignal <= 0;
    //Alles zurücksetzen
    Reset = 1;
    #150
    Reset = 0;

    //Add-Befehl testen
    Daten1 = 32'b01010101010101010101010101010101;
    Daten2 = 32'b00101010111010111010101010101010;
    FunktionsCode = Add;
    StartSignal = 1;
    #200
    if(Ergebnis != 32'b10000000010000001111111111111111)
        $display("Addieren funktioniert nicht: \n Summand1: %d \n Summand2: %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b10000000010000001111111111111111);
    
    //Sub-Befehl testen
    Daten1 = 32'b01010101010101010101010101010101;
    Daten2 = 32'b00101010111010111010101010101010;
    FunktionsCode = Sub;
    StartSignal = 0;
    StartSignal = 1;
    #200
    if(Ergebnis != 32'b00101010011010011010101010101011)
        $display("Subtrahieren funktioniert nicht: \n Minuend:    %d \n Subtrahent: %d \n Ergebnis:   %d \n Erwartet:   %d\n", Daten1, Daten2, Ergebnis, 32'b00101010011010011010101010101011);

    //Mul-Befehl testen
    Daten1 = 32'b00000000000000010101010101010101;
    Daten2 = 32'b00000000000000000010101010101010;
    FunktionsCode = Mul;
    StartSignal = 0;
    StartSignal = 1;
    #200
    if(Ergebnis != 32'b00111000111000101001110001110010)
        $display("Multiplizieren funktioniert nicht: \n Faktor1:  %d \n Faktor2:  %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b00111000111000101001110001110010);
    
    //Div-Befehl testen
    Daten1 = 32'b11000000000110010101010101010101;
    Daten2 = 32'b00000000000000000010101010101010;
    FunktionsCode = Div;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #2000
    
    if(Ergebnis != $signed(-32'sd98158))
        $display("Dividieren funktioniert nicht: \n Divisor:  %d \n Dividend: %d \n Ergebnis: %d \n Erwartet: %d\n", $signed(Daten1), $signed(Daten2), $signed(Ergebnis), $signed(-32'sd98158));
    #200
    //Mod-Befehl testen
    Daten1 = 32'd512;
    Daten2 = 32'd2;
    FunktionsCode = Mod;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1800

    if(Ergebnis != 32'd0)
        $display("Modulo funktioniert nicht: \n Divisor:  %d \n Dividend: %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'd0);
    #200

    //Sqrt-Befehl testen
    Daten1 = 32'b01000000000110010101010101010101;
    FunktionsCode = Sqrt;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #3200
    if(Ergebnis != 32'b00000000000000001000000000011001)
        $display("Quadratwurzel funktioniert nicht: \n Radikand: %d Ergebnis: %d \n Erwartet: %d\n", Daten1, Ergebnis, 32'b00000000000000001101110111000010);
    
    //Sla-Befehl testen
    Daten1 = 32'b11111111100110010101010101010101;
    Daten2 = 32'b00000000000000000000000000000111;
    FunktionsCode = Sla;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b11001100101010101010101010000000)
        $display("Links schieben arithmetisch funktioniert nicht: \n Zahl:    %b \n Stellen:  %b \n Ergebnis: %b \n Erwartet: %b\n", Daten1, Daten2, Ergebnis, 32'b11001100101010101010101010000000);
    
    //Sra-Befehl testen
    Daten1 = 32'b11001000000110010101010101010101;
    Daten2 = 32'b00000000000000000000000000000111;
    FunktionsCode = Sra;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b11111111100100000011001010101010)
        $display("Rechts schieben arithmetisch funktioniert nicht: \n Zahl:     %b \n Stellen:  %d \n Ergebnis: %b \n Erwartet: %b\n", Daten1, Daten2, Ergebnis, 32'b11111111100100000011001010101010);
    
    //Ce-Befehl testen
    Daten1 = 32'b11001000000110010101010101010101;
    Daten2 = 32'b00000000000000000000000000000111;
    FunktionsCode = Ce;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000000)
        $display("Gleichheit funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000000);
    
    Daten1 = 32'b11001000000110010101010101010101;
    Daten2 = 32'b11001000000110010101010101010101;
    FunktionsCode = Ce;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000001)
        $display("Gleichheit funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000001);
    

    //Cne-Befehl testen
    Daten1 = 32'b11001000000110010101010101010101;
    Daten2 = 32'b00000000000000000000000000000111;
    FunktionsCode = Cne;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000001)
        $display("Ungleichheit funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000001);
    
    Daten1 = 32'b11001000000110010101010101010101;
    Daten2 = 32'b11001000000110010101010101010101;
    FunktionsCode = Cne;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000000)
        $display("Ungleichheit funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000000);
    

    //Cg-Befehl testen
    Daten1 = 32'b01001000000110010101010101010101;
    Daten2 = 32'b00000000000000000000000000000111;
    FunktionsCode = Cg;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000001)
        $display("Größer funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000001);
    
    Daten1 = 32'b00000000000000000000000000000111;
    Daten2 = 32'b01001000000110010101010101010101;
    FunktionsCode = Cg;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000000)
        $display("Größer funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000000);
    

    Daten1 = 32'b11001000000110010101010101010101;
    Daten2 = 32'b11001000000110010101010101010101;
    FunktionsCode = Cg;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000000)
        $display("Größer funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000000);
    

    //Cl-Befehl testen
    Daten1 = 32'b01001000000110010101010101010101;
    Daten2 = 32'b00000000000000000000000000000111;
    FunktionsCode = Cl;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000000)
        $display("Kleiner funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000000);
    
    Daten1 = 32'b00000000000000000000000000000111;
    Daten2 = 32'b01001000000110010101010101010101;
    FunktionsCode = Cl;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000001)
        $display("Kleiner funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000001);

    Daten1 = 32'b11001000000110010101010101010101;
    Daten2 = 32'b11001000000110010101010101010101;
    FunktionsCode = Cl;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000000)
        $display("Kleiner funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000000);
    

    //Cgu-Befehl testen
    Daten1 = 32'b11001000000110010101010101010101;
    Daten2 = 32'b00000000000000000000000000000111;
    FunktionsCode = Cgu;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000001)
        $display("Größer unsigned funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000001);
    
    Daten1 = 32'b00000000000000000000000000000111;
    Daten2 = 32'b11001000000110010101010101010101;
    FunktionsCode = Cgu;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000000)
        $display("Größer unsigned funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000000);
    

    Daten1 = 32'b11001000000110010101010101010101;
    Daten2 = 32'b11001000000110010101010101010101;
    FunktionsCode = Cgu;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000000)
        $display("Größer unsigned funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000000);
    

    //Clu-Befehl testen
    Daten1 = 32'b11001000000110010101010101010101;
    Daten2 = 32'b00000000000000000000000000000111;
    FunktionsCode = Clu;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000000)
        $display("Kleiner unsigned funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000000);
    
    Daten1 = 32'b00000000000000000000000000000111;
    Daten2 = 32'b11001000000110010101010101010101;
    FunktionsCode = Clu;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000001)
        $display("Kleiner unsigned funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000001);

    Daten1 = 32'b11001000000110010101010101010101;
    Daten2 = 32'b11001000000110010101010101010101;
    FunktionsCode = Clu;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000000)
        $display("Kleiner unsigned funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000000);
    

    //IToF testen
    Daten1 = 32'b11001000000110010101010101010101; //-937,863,851
    FunktionsCode = IToF;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    //Erwartet: -937863872
    if(Ergebnis != 32'b11001110010111111001101010101011)
        $display("Int zu Float funktioniert nicht: \n Zahl1:   %d \n \n Ergebnis: %f \n Erwartet: %f\n", Daten1, Ergebnis, 32'b11001110010111111001101010101011);
    

    //UIToF testen
    Daten1 = 32'b11001000000110010101010101010101; //3,357,103,445
    FunktionsCode = UIToF;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    //Erwartet: 3357103360
    if(Ergebnis != 32'b01001111010010000001100101010101)
        $display("Unsigned int zu Float funktioniert nicht: \n Zahl1:   %d \n Ergebnis: %f \n Erwartet: %f\n", Daten1, Ergebnis, 32'b01001111010010000001100101010101);
    
    
    //Not-Befehl testen
    Daten1 = 32'b01001000000110010101010101010101;
    FunktionsCode = Not;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b10110111111001101010101010101010)
        $display("Not funktioniert nicht: \n Zahl1:   %b \n Zahl2:   %b \n Ergebnis: %b \n Erwartet: %b\n", Daten1, Daten2, Ergebnis, 32'b10110111111001101010101010101010);
    
    Daten1 = 32'b11111100000000000000000000000111;
    FunktionsCode = Not;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000011111111111111111111111000)
        $display("Not funktioniert nicht: \n Zahl1:   %b \n Zahl2:   %b \n Ergebnis: %b \n Erwartet: %b\n", Daten1, Daten2, Ergebnis, 32'b00000111111111111111111111111000);
    

    //And-Befehl testen
    Daten1 = 32'b01001000011110010101010101010101;
    Daten2 = 32'b01101010100110010101010101010101;
    FunktionsCode = And;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b01001000000110010101010101010101)
        $display("And funktioniert nicht: \n Zahl1:   %b \n Zahl2:   %b \n Ergebnis: %b \n Erwartet: %b\n", Daten1, Daten2, Ergebnis, 32'b01001000000110010101010101010101);
    
    Daten1 = 32'b01101010100110010101010101010101;
    FunktionsCode = And;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b01101010100110010101010101010101)
        $display("And funktioniert nicht: \n Zahl1:   %b \n Zahl2:   %b \n Ergebnis: %b \n Erwartet: %b\n", Daten1, Daten2, Ergebnis, 32'b01101010100110010101010101010101);
    

    //Or-Befehl testen
    Daten1 = 32'b01001000011110010101010101010101;
    Daten2 = 32'b01101010100110010101010101010101;
    FunktionsCode = Or;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b01101010111110010101010101010101)
        $display("Or funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b01101010111110010101010101010101);
    
    Daten1 = 32'b11111111111111111111111111111111;
    FunktionsCode = Or;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b11111111111111111111111111111111)
        $display("Or funktioniert nicht: \n Zahl1:   %b \n Zahl2:   %b \n Ergebnis: %b \n Erwartet: %b\n", Daten1, Daten2, Ergebnis, 32'b11111111111111111111111111111111);
    

    //Xor-Befehl testen
    Daten1 = 32'b01001000011110010101010101010101;
    Daten2 = 32'b01101010100110010101010101010101;
    FunktionsCode = Xor;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00100010111000000000000000000000)
        $display("Xor funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b00100010111000000000000000000000);
    
    Daten1 = 32'b00000000000000000000000000000000;
    FunktionsCode = Xor;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b01101010100110010101010101010101)
        $display("Xor funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b01101010100110010101010101010101);
    

    //Xnor-Befehl testen
    Daten1 = 32'b01001000011110010101010101010101;
    Daten2 = 32'b01101010100110010101010101010101;
    FunktionsCode = Xnor;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b11011101000111111111111111111111)
        $display("Xnor funktioniert nicht: \n Zahl1:   %b \n Zahl2:   %b \n Ergebnis: %b \n Erwartet: %b\n", Daten1, Daten2, Ergebnis, 32'b11011101000111111111111111111111);
    
    Daten1 = 32'b00000000000000000000000000000000;
    FunktionsCode = Xnor;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b10010101011001101010101010101010)
        $display("Xnor funktioniert nicht: \n Zahl1:   %d \n Zahl2:   %d \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Daten2, Ergebnis, 32'b10010101011001101010101010101010);
    
    //Sll-Befehl testen
    Daten1 = 32'b11001000000110010101010101010101;
    Daten2 = 32'b00000000000000000000000000000111;
    FunktionsCode = Sll;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00001100101010101010101010000000)
        $display("Links schieben logisch funktioniert nicht: \n Zahl:    %b \n Stellen:  %b \n Ergebnis: %b \n Erwartet: %b\n", Daten1, Daten2, Ergebnis, 32'b00001100101010101010101010000000);
    
    //Srl-Befehl testen
    Daten1 = 32'b11001000000110010101010101010101;
    Daten2 = 32'b00000000000000000000000000000111;
    FunktionsCode = Srl;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000001100100000011001010101010)
        $display("Rechts schieben logisch funktioniert nicht: \n Zahl:    %b \n Stellen:  %b \n Ergebnis: %b \n Erwartet: %b\n", Daten1, Daten2, Ergebnis, 32'b00000001100100000011001010101010);
    

    //Internetseite zur Generierung der Bitstrings: https://www.h-schmidt.net/FloatConverter/IEEE754.html
    //Add.s-Befehl testen
    Daten1 = 32'b01000010001101011000000100000110;      // 45,376
    Daten2 = 32'b01000010110011000000000000000000;      //102,000
    FunktionsCode = Adds;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b01000011000100110110000001000010)//147,376
        $display("Floats addieren funktioniert nicht: \n Summand1: %b \n Summand2: %b \n Ergebnis: %b \n Erwartet: %b\n", Daten1, Daten2, Ergebnis, 32'b01000011000100110110000001000010);
    
    //Sub.s-Befehl testen
    Daten1 = 32'b01000010001101011000000100000110;       // 45,376
    Daten2 = 32'b01000010110011000000000000000000;       //102,000
    FunktionsCode = Subs;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b11000010011000100111111011111010)//-56,624 11000010011000100111111011111010
        $display("Floats subtrahieren funktioniert nicht: \n Minuend:    %b \n Subtrahent: %b \n Ergebnis:   %b \n Erwartet:   %b\n", Daten1, Daten2, Ergebnis, 32'b11000010011000100111111011111010);

    //Mul.s-Befehl testen
    Daten1 = 32'b01000010001101011000000100000110;       // 45,376
    Daten2 = 32'b01000010110011000000000000000000;       //102,000
    FunktionsCode = Muls;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b01000101100100001010001011010001)//4628,352
        $display("Floats multiplizieren funktioniert nicht: \n Faktor1:  %f \n Faktor2:  %f \n Ergebnis: %f \n Erwartet: %f\n", Daten1, Daten2, Ergebnis, 32'b01000101100100001010001011010001);    
    
    //Sqrt.s-Befehl testen
    Daten1 = 32'b01000000000110010101010101010101;        //2,39583325386   
    FunktionsCode = Sqrts;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1800
    if(Ergebnis != 32'b00111111110001100001111111100010)  //1,5478479427450230002776786742845
        $display("Float Quadratwurzel funktioniert nicht: \n Radikand: %f Ergebnis: %f \n Erwartet: %f\n", Daten1, Daten2, Ergebnis, 32'b00111111110001100001111111100010);
    
    //Div.s-Befehl testen
    Daten1 = 32'b01000010001101011000000100000110;      // 45,376
    Daten2 = 32'b01000010110011000000000000000000;      //102,000
    FunktionsCode = Divs;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #7200
    if(Ergebnis != 32'b00111110111000111100010100001101)  //0.4448627531528472900390625
        $display("Floats dividieren funktioniert nicht: \n Divisor:  %b \n Dividend: %b \n Ergebnis: %b \n Erwartet: %b\n", Daten1, Daten2, Ergebnis, 32'b00111110111000111100010100001101);

    //Ce.s-Befehl testen
    Daten1 = 32'b11001000000110010101010101010101;
    Daten2 = 32'b00000000000000000000000000000111;
    FunktionsCode = Ces;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000000)
        $display("Float Gleichheit funktioniert nicht: \n Zahl1:   %f \n Zahl2:   %f \n Ergebnis: %f \n Erwartet: %f\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000000);
    
    Daten1 = 32'b11001000000110010101010101010101;
    Daten2 = 32'b11001000000110010101010101010101;
    FunktionsCode = Ces;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000001)
        $display("Float Gleichheit funktioniert nicht: \n Zahl1:   %f \n Zahl2:   %f \n Ergebnis: %f \n Erwartet: %f\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000001);
    
    //Cne.s-Befehl testen
    Daten1 = 32'b11001000000110010101010101010101;
    Daten2 = 32'b00000000000000000000000000000111;
    FunktionsCode = Cnes;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000001)
        $display("Float Ungleichheit funktioniert nicht: \n Zahl1:   %f \n Zahl2:   %f \n Ergebnis: %f \n Erwartet: %f\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000001);
    
    Daten1 = 32'b11001000000110010101010101010101;
    Daten2 = 32'b11001000000110010101010101010101;
    FunktionsCode = Cnes;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000000)
        $display("Float Ungleichheit funktioniert nicht: \n Zahl1:   %f \n Zahl2:   %f \n Ergebnis: %f \n Erwartet: %f\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000000);
    

    //Cg.s-Befehl testen
    Daten1 = 32'b01000110100000101011110011100110; //16734.44921875
    Daten2 = 32'b11000001101110000000000000000000; //-23
    FunktionsCode = Cgs;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000001)
        $display("Float Größer funktioniert nicht: \n Zahl1:   %f \n Zahl2:   %f \n Ergebnis: %f \n Erwartet: %f\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000001);
    
    Daten1 = 32'b11000001101110000000000000000000; //-23
    Daten2 = 32'b01000110100000101011110011100110; //16734.44921875
    FunktionsCode = Cgs;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000000)
        $display("Float Größer funktioniert nicht: \n Zahl1:   %f \n Zahl2:   %f \n Ergebnis: %f \n Erwartet: %f\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000000);
    

    Daten1 = 32'b01000110100000101011110011100110; //16734.44921875
    Daten2 = 32'b01000110100000101011110011100110; //16734.44921875
    FunktionsCode = Cgs;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000000)
        $display("Float Größer funktioniert nicht: \n Zahl1:   %f \n Zahl2:   %f \n Ergebnis: %f \n Erwartet: %f\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000000);
    

    //Cl.s-Befehl testen
    Daten1 = 32'b01000110100000101011110011100110; //16734.44921875
    Daten2 = 32'b11000001101110000000000000000000; //-23
    FunktionsCode = Cls;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000000)
        $display("Float Kleiner funktioniert nicht: \n Zahl1:   %f \n Zahl2:   %f \n Ergebnis: %f \n Erwartet: %f\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000000);
    
    Daten1 = 32'b11000001101110000000000000000000; //-23
    Daten2 = 32'b01000110100000101011110011100110; //16734.44921875
    FunktionsCode = Cls;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000001)
        $display("Float Kleiner funktioniert nicht: \n Zahl1:   %f \n Zahl2:   %f \n Ergebnis: %f \n Erwartet: %f\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000001);

    Daten1 = 32'b01000110100000101011110011100110; //16734.44921875
    Daten2 = 32'b01000110100000101011110011100110; //16734.44921875
    FunktionsCode = Cls;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    if(Ergebnis != 32'b00000000000000000000000000000000)
        $display("Float Kleiner funktioniert nicht: \n Zahl1:   %f \n Zahl2:   %f \n Ergebnis: %f \n Erwartet: %f\n", Daten1, Daten2, Ergebnis, 32'b00000000000000000000000000000000);
    

    //FToI-Befehl testen
    Daten1 = 32'b11000110100000101011110011100110; //-16734.44921875
    FunktionsCode = FToI;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    //Erwartet: -16734
    if(Ergebnis != 32'b11111111111111111011111010100010)
        $display("Float zu Int funktioniert nicht: \n Zahl1:   %f \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Ergebnis, $signed(32'b11111111111111111011111010100010));
    

    //FToI-Befehl testen
    Daten1 = 32'b11000110100000101011110011100110; //16734.44921875
    FunktionsCode = FToUI;
    StartSignal = 1;
    #200
    StartSignal = 0;
    #1600
    //Erwartet: 16734
    if(Ergebnis != 32'b00000000000000000100000101011110)
        $display("Float zu Unsigned Int funktioniert nicht: \n Zahl1:   %f \n \n Ergebnis: %d \n Erwartet: %d\n", Daten1, Ergebnis, 32'b00000000000000000100000101011110);


    #200 $display("End of simulation");
    $finish;
end
 
endmodule
