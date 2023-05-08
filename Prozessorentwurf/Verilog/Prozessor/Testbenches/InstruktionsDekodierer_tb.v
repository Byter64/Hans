// Code generated by Icestudio 0.10
// Sat, 18 Mar 2023 19:01:17 GMT

// Testbench template
`include "InstruktionsDekodierer.v"
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 10 ns / 1 ns
`define assert(signal, value) \
        if (signal !== value) begin \
            $display("ASSERTION FAILED in %m: signal != value"); \
            $finish; \
        end
module main_tb
;
 
 // Simulation time: 100ns (10 * 10ns)
 parameter DURATION = 10;
 
// Input/Output
 reg [31:0] Instruktion;
 reg DekodierSignal;
 reg Reset;
 wire [5:0] QuellReg1;
 wire [5:0] QuellReg2;
 wire [5:0] ZielReg1;
 wire [25:0] IDaten;
 wire KleinerImmediateAktiv;
 wire GroßerImmediateAktiv;
 wire [5:0] FunktionsCode;
 wire JALBefehl;
 wire RelativerSprung;
 wire FloatBefehl;
 wire LoadBefehl;
 wire StoreBefehl;
 wire UnbedingterSprungBefehl;
 wire BedingterSprung;
 wire AbsoluterSprung;

//Instruktion
reg[31] NUL =   32b'00000000000000000000000000000000;
reg[31] ADD =   32b'000000 10101 00100 10101 00000 00 0000;
reg[31] MUL =   32b'000000 01010 11011 01010 00000 00 0010;
reg[31] DIV =   32b'000000 11000 11000 11000 00000 00 0011;
reg[31] SQRT =  32b'000000 00111 00111 00000 00000 00 0101;
reg[31] SL =    32b'000000 01101 10010 00000 00000 00 0111;
reg[31] CNE =   32b'000000 01100 10011 10010 00000 01 0001;
reg[31] CL =    32b'000000 01011 10110 11010 00000 01 0100;
reg[31] AND =   32b'000000 10100 11111 11110 00000 01 1001;
reg[31] ADDS =  32b'000000 00010 01011 10000 00000 10 0000;
reg[31] MULS =  32b'000000 01100 10101 01011 00000 10 0010;
reg[31] DIVS =  32b'000000 10011 01010 10101 00000 10 0011;
reg[31] SQRTS = 32b'000000 11000 10101 00000 00000 10 0101;
reg[31] ADDI =  32b'100000 01110 10001 0000000000000001;
reg[31] MODI =  32b'100100 10100 11100 0000000000000010;
reg[31] SLCI =  32b'101000 00100 00111 0000000000000100;
reg[31] STORE = 32b'101100 11001 01011 0000000000000000;
reg[31] JREG =  32b'101101 00000 11100 0000000000000000;
reg[31] BEZ =   32b'101110 00000 11010 0000000000000000;
reg[31] JAL =   32b'101111 11000 00000 0000000000000001;
reg[31] LOAD =  32b'101010 11100 00111 0000000000000000;
reg[31] LOADS = 32b'101011 00011 11000 0000000000000000;
reg[31] JMP =   32b'010000 00000000000000000000000010;

 // Module instance
 main MAIN (
  .vd56645(Instruktion),
  .v1d4fda(QuellReg1),
  .vcc5aff(QuellReg2),
  .v9859e3(ZielReg1),
  .vd59e62(IDaten),
  .v37f516(IAktiv),
  .v4cfcbf(FunktionsCode),
  .v9452f7(FloatBefehl),
  .veae0d5(LoadBefehl),
  .v733f38(StoreBefehl),
  .ve7b995(RelSprungBefehl),
  .vcf476d(UnbedingterSprungBefehl),
  .vc2ff47(BedingterSprung)
 );
 
 initial begin
  $dumpvars(0, main_tb);
 
  // TODO: initialize the registers here
  // e.g. value = 1;
  // e.g. #2 value = 0;
    #1000;
    DekodierSignal = 1;
    Instruktion = NUL;
    Reset = 1;
    #2000;
    $display("Reset");  
    assertSignal(QuellReg1,000000,QuellReg2,000000,ZielReg1,000000,IDaten,00000000000000000000000000,KleinerImmediateAktiv,0,GroßerImmediateAktiv,0,FunktionsCode,000000,JALBefehl,0,RelativerSprung,0,FloatBefehl,0,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);

    Instruktion = NUL;
    Reset = 0;
    #2000;
    $display("NUL");  
    assertSignal(QuellReg1,000000,QuellReg2,000000,ZielReg1,000000,IDaten,00000000000000000000000000,KleinerImmediateAktiv,0,GroßerImmediateAktiv,0,FunktionsCode,000000,JALBefehl,0,RelativerSprung,0,FloatBefehl,0,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);

    Instruktion = ADD;
    #2000;
    $display("ADD");  
    assertSignal(QuellReg1,000100,QuellReg2,010101,ZielReg1,010101,IDaten,00000000000000000000000000,KleinerImmediateAktiv,0,GroßerImmediateAktiv,0,FunktionsCode,000000,JALBefehl,0,RelativerSprung,0,FloatBefehl,0,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);

    Instruktion = MUL;
    #2000;
    $display("MUL");  
    assertSignal(QuellReg1,011011,QuellReg2,001010,ZielReg1,001010,IDaten,00000000000000000000000000,KleinerImmediateAktiv,0,GroßerImmediateAktiv,0,FunktionsCode,000010,JALBefehl,0,RelativerSprung,0,FloatBefehl,0,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);

    DekodierSignal = 0;
    Instruktion = ADD;
    #2000;
    $display("ADD DekSignal = 0");
    assertSignal(QuellReg1,011011,QuellReg2,001010,ZielReg1,001010,IDaten,00000000000000000000000000,KleinerImmediateAktiv,0,GroßerImmediateAktiv,0,FunktionsCode,000010,JALBefehl,0,RelativerSprung,0,FloatBefehl,0,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);
    Instruktion = MUL;
    #2000;
    $display("MUL DekSignal = 0");  
    assertSignal(QuellReg1,011011,QuellReg2,001010,ZielReg1,001010,IDaten,00000000000000000000000000,KleinerImmediateAktiv,0,GroßerImmediateAktiv,0,FunktionsCode,000010,JALBefehl,0,RelativerSprung,0,FloatBefehl,0,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);


    DekodierSignal = 1;
    Instruktion = DIV;
    #2000;
    $display("DIV DekSignal = 1");  
    assertSignal(QuellReg1,011000,QuellReg2,011000,ZielReg1,011000,IDaten,00000000000000000000000000,KleinerImmediateAktiv,0,GroßerImmediateAktiv,0,FunktionsCode,000011,JALBefehl,0,RelativerSprung,0,FloatBefehl,0,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);
    
    Instruktion = SQRT;
    #2000;
    $display("SQRT");  
    assertSignal(QuellReg1,000111,QuellReg2,000000,ZielReg1,000111,IDaten,00000000000000000000000000,KleinerImmediateAktiv,0,GroßerImmediateAktiv,0,FunktionsCode,000101,JALBefehl,0,RelativerSprung,0,FloatBefehl,0,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);

    Instruktion = SL;
    #2000;
    $display("SL");  
    assertSignal(QuellReg1,010010,QuellReg2,000000,ZielReg1,001101,IDaten,00000000000000000000000000,KleinerImmediateAktiv,0,GroßerImmediateAktiv,0,FunktionsCode,000111,JALBefehl,0,RelativerSprung,0,FloatBefehl,0,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);

    Instruktion = CNE;
    #2000;
    $display("CNE");  
    assertSignal(QuellReg1,010011,QuellReg2,010010,ZielReg1,001100,IDaten,00000000000000000000000000,KleinerImmediateAktiv,0,GroßerImmediateAktiv,0,FunktionsCode,010001,JALBefehl,0,RelativerSprung,0,FloatBefehl,0,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);

    Instruktion = CL;
    #2000;
    $display("CL");  
    assertSignal(QuellReg1,010110,QuellReg2,011010,ZielReg1,001011,IDaten,00000000000000000000000000,KleinerImmediateAktiv,0,GroßerImmediateAktiv,0,FunktionsCode,010100,JALBefehl,0,RelativerSprung,0,FloatBefehl,0,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);

    Instruktion = AND;
    #2000;
    $display("AND");  
    assertSignal(QuellReg1,011111,QuellReg2,011110,ZielReg1,010100,IDaten,00000000000000000000000000,KleinerImmediateAktiv,0,GroßerImmediateAktiv,0,FunktionsCode,011001,JALBefehl,0,RelativerSprung,0,FloatBefehl,0,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);

    Instruktion = ADDS;
    #2000;
    $display("ADD.S");  
    assertSignal(QuellReg1,101011,QuellReg2,110000,ZielReg1,100010,IDaten,00000000000000000000000000,KleinerImmediateAktiv,0,GroßerImmediateAktiv,0,FunktionsCode,100000,JALBefehl,0,RelativerSprung,0,FloatBefehl,1,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);

    Instruktion = MULS;
    #2000;
    $display("MUL.S");  
    assertSignal(QuellReg1,110101,QuellReg2,101011,ZielReg1,101100,IDaten,00000000000000000000000000,KleinerImmediateAktiv,0,GroßerImmediateAktiv,0,FunktionsCode,100010,JALBefehl,0,RelativerSprung,0,FloatBefehl,1,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);

    Instruktion = DIVS;
    #2000;
    $display("DIV.S");  
    assertSignal(QuellReg1,101010,QuellReg2,110101,ZielReg1,110011,IDaten,00000000000000000000000000,KleinerImmediateAktiv,0,GroßerImmediateAktiv,0,FunktionsCode,100011,JALBefehl,0,RelativerSprung,0,FloatBefehl,1,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);

    Instruktion = SQRTS;
    #2000;
    $display("SQRT.S");  
    assertSignal(QuellReg1,110101,QuellReg2,000000,ZielReg1,111000,IDaten,00000000000000000000000000,KleinerImmediateAktiv,0,GroßerImmediateAktiv,0,FunktionsCode,100101,JALBefehl,0,RelativerSprung,0,FloatBefehl,1,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);

    Instruktion = ADDI;
    #2000;
    $display("ADDI");  
    assertSignal(QuellReg1,010001,QuellReg2,000000,ZielReg1,001110,IDaten,00000000000000000000000001,KleinerImmediateAktiv,1,GroßerImmediateAktiv,0,FunktionsCode,000000,JALBefehl,0,RelativerSprung,0,FloatBefehl,0,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);

    Instruktion = MODI;
    #2000;
    $display("MODI");  
    assertSignal(QuellReg1,011100,QuellReg2,000000,ZielReg1,010100,IDaten,00000000000000000000000010,KleinerImmediateAktiv,1,GroßerImmediateAktiv,0,FunktionsCode,000100,JALBefehl,0,RelativerSprung,0,FloatBefehl,0,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);

    Instruktion = SLCI;
    #2000;
    $display("SLCI");  
    assertSignal(QuellReg1,000111,QuellReg2,000000,ZielReg1,000100,IDaten,00000000000000000000000100,KleinerImmediateAktiv,1,GroßerImmediateAktiv,0,FunktionsCode,001000,JALBefehl,0,RelativerSprung,0,FloatBefehl,0,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);

    Instruktion = STORE;
    #2000;
    $display("STORE");  
    assertSignal(QuellReg1,001011,QuellReg2,011001,ZielReg1,000000,IDaten,00000000000000000000000000,KleinerImmediateAktiv,1,GroßerImmediateAktiv,0,FunktionsCode,000000,JALBefehl,0,RelativerSprung,0,FloatBefehl,0,LoadBefehl,0,StoreBefehl,1,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);

    Instruktion = JREG;
    #2000;
    $display("JREG");  
    assertSignal(QuellReg1,011100,QuellReg2,000000,ZielReg1,000000,IDaten,00000000000000000000000000,KleinerImmediateAktiv,1,GroßerImmediateAktiv,0,FunktionsCode,000000,JALBefehl,0,RelativerSprung,0,FloatBefehl,0,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,1,BedingterSprung,0,AbsoluterSprung,1);

    Instruktion = BEZ;
    #2000;
    $display("BEZ");  
    assertSignal(QuellReg1,011010,QuellReg2,000000,ZielReg1,000000,IDaten,00000000000000000000000000,KleinerImmediateAktiv,1,GroßerImmediateAktiv,0,FunktionsCode,000000,JALBefehl,0,RelativerSprung,1,FloatBefehl,0,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,1,AbsoluterSprung,0);

    Instruktion = JAL;
    #2000;
    $display("JAL");  
    assertSignal(QuellReg1,000000,QuellReg2,000000,ZielReg1,011000,IDaten,00000000000000000000000001,KleinerImmediateAktiv,1,GroßerImmediateAktiv,0,FunktionsCode,000000,JALBefehl,1,RelativerSprung,1,FloatBefehl,0,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,1,BedingterSprung,0,AbsoluterSprung,0);

    Instruktion = JMP;
    #2000;
    $display("JMP");  
    assertSignal(QuellReg1,000000,QuellReg2,000000,ZielReg1,000000,IDaten,00000000000000000000000010,KleinerImmediateAktiv,0,GroßerImmediateAktiv,1,FunktionsCode,000000,JALBefehl,0,RelativerSprung,1,FloatBefehl,0,LoadBefehl,0,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);
    
    Instruktion = LOAD;
    #2000:
    $display("LOAD");  
    assertSignal(QuellReg1,000111,QuellReg2,000000,ZielReg1,011100,IDaten,00000000000000000000000000,KleinerImmediateAktiv,1,GroßerImmediateAktiv,0,FunktionsCode,000000,JALBefehl,0,RelativerSprung,0,FloatBefehl,0,LoadBefehl,1,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);

    Instruktion = LOADS;
    #2000:
    $display("LOAD.S");  
    assertSignal(QuellReg1,011000,QuellReg2,000000,ZielReg1,100011,IDaten,00000000000000000000000000,KleinerImmediateAktiv,1,GroßerImmediateAktiv,0,FunktionsCode,000000,JALBefehl,0,RelativerSprung,0,FloatBefehl,1,LoadBefehl,1,StoreBefehl,0,UnbedingterSprungBefehl,0,BedingterSprung,0,AbsoluterSprung,0);
   

    #(DURATION) $display("End of simulation");
  $finish;
 end
 
function assertSignal;
  input  assertQuellReg1;
  input  shouldQuellReg1;
  input  [5:0] assertQuellReg2;
  input  [5:0] shouldQuellReg2;
  input  [5:0] assertZielReg1;
  input  [5:0] shouldZielReg1;
  input  [25:0] assertIDaten;
  input  [25:0] shouldIDaten;
  input  assertKleinerImmediateAktiv;
  input  shouldKleinerImmediateAktiv;
  input  assertGroßerImmediateAktiv;
  input  shouldGroßerImmediateAktiv;
  input  [5:0] assertFunktionsCode;
  input  [5:0] shouldFunktionsCode;
  input  assertJALBefehl;
  input  shouldJALBefehl;
  input  assertRelativerSprung;
  input  shouldRelativerSprung;
  input  assertFloatBefehl;
  input  shouldFloatBefehl;
  input  assertLoadBefehl;
  input  shouldLoadBefehl;
  input  assertStoreBefehl;
  input  shouldStoreBefehl;
  input  assertUnbedingterSprungBefehl;
  input  shouldUnbedingterSprungBefehl;
  input  assertBedingterSprung;
  input  shouldBedingterSprung;
  input  assertAbsoluterSprung;
  input  shouldAbsoluterSprung;
    begin

    if(assertQuellReg1 != shouldQuellReg1){
      $display("QuellReg1 = 0x%0h, should be 0x%0h!",QuellReg1,shouldQuellReg1);
    }
    if(assertQuellReg2 != shouldQuellReg2){
      $display("QuellReg2 = 0x%0h, should be 0x%0h!",QuellReg2,shouldQuellReg2);
    }
    if(assertZielReg1 != shouldZielReg1){
      $display("ZielReg1 = 0x%0h, should be 0x%0h!",ZielReg1,shouldZielReg1);
    }
    if(assertIDaten != shouldIDaten){
      $display("IDaten = 0x%0h, should be 0x%0h!",IDaten,shouldIDaten);
    }
    if(assertKleinerImmediateAktiv != shouldKleinerImmediateAktiv){
      $display("KleinerImmediateAktiv = 0x%0h, should be 0x%0h!",KleinerImmediateAktiv,shouldKleinerImmediateAktiv);
    }
    if(assertGroßerImmediateAktiv != shouldGroßerImmediateAktiv){
      $display("GroßerImmediateAktiv = 0x%0h, should be 0x%0h!",GroßerImmediateAktiv,shouldGroßerImmediateAktiv);
    }
    if(assertFunktionsCode != shouldFunktionsCode){
      $display("FunktionsCode = 0x%0h, should be 0x%0h!",FunktionsCode,shouldFunktionsCode);
    }
    if(assertJALBefehl != shouldJALBefehl){
      $display("JALBefehl = 0x%0h, should be 0x%0h!",JALBefehl,shouldJALBefehl);
    }
    if(assertRelativerSprung != shouldRelativerSprung){
      $display("RelativerSprung = 0x%0h, should be 0x%0h!",RelativerSprung,shouldRelativerSprung);
    }
    if(assertFloatBefehl != shouldFloatBefehl){
      $display("FloatBefehl = 0x%0h, should be 0x%0h!",FloatBefehl,shouldFloatBefehl);
    }
    if(assertLoadBefehl != shouldLoadBefehl){
      $display("LoadBefehl = 0x%0h, should be 0x%0h!",LoadBefehl,shouldLoadBefehl);
    }
    if(assertStoreBefehl != shouldStoreBefehl){
      $display("QueStoreBefehlllReg1 = 0x%0h, should be 0x%0h!",StoreBefehl,shouldStoreBefehl);
    }
    if(assertUnbedingterSprungBefehl != shouldBedingterSprung){
      $display("UnbedingterSprungBefehl = 0x%0h, should be 0x%0h!",UnbedingterSprungBefehl,shouldBedingterSprung);
    }
    if(assertAbsoluterSprung != shouldAbsoluterSprung){
      $display("AbsoluterSprung = 0x%0h, should be 0x%0h!",AbsoluterSprung,shouldAbsoluterSprung);
    }  

    end
endfunction

endmodule
