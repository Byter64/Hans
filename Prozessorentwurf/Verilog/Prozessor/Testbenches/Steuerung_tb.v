// Code generated by Icestudio 0.10
// Sat, 18 Mar 2023 19:03:03 GMT

// Testbench template
`include "Steuerung.v"
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
 parameter DECODETIME = 20;
 parameter REGISTERWRITETIME = 10;
 parameter ALUTIME = 20;
 parameter PCWRITETIME = 5;
 
 // Input/Output
 reg [5:0] Funktionscode;
 reg LoadBefehl;
 reg StoreBefehl;
 reg JALBefehl;
 reg UnbedingterSprungBefehl;
 reg BedingterSprungBefehl;
 reg Bedingung;
 reg BefehlGeladen;
 reg DatenGeladen;
 reg DatenGespeichert;
 reg Reset;
 reg Clock;
 wire RegisterSchreibSignal;
 wire ALUSignal;
 wire LoadBefehlSignal;
 wire LoadDatenSignal;
 wire StoreDatenSignal;
 wire PCSprungSignal;
 wire PCSignal;
 wire DekodierSignal;

 
 // Module instance
 main MAIN (
  .v54902b(FloatBefehl),
  .v333e4c(LoadBefehl),
  .v394d0e(StoreBefehl),
  .v708034(UnbedingterSprungBefehl),
  .v2d8bc3(BedingterSprungBefehl),
  .vdf76b1(Bedingung),
  .vc6aa74(RegisterSchreibSignal),
  .vd25d6a(LoadBefehlSignal),
  .vb561af(LoadDatenSignal),
  .vc9a715(StoreDatenSignal),
  .v7af967(PCSprungSignal)
 );
 
 initial begin
  $dumpvars(0, main_tb);
 
  // TODO: initialize the registers here
  // e.g. value = 1;
  // e.g. #2 value = 0;
  
  //Steuerung wird initialisiert und setzt intern Zustand 00
  //Steuerung schickt LoadBefehlSignal
  #1 //Wir simulieren einen geladenen Befehl nach 10 Zeiteinheiten
  assert(LoadBefehlSignal, 1);
  #9
  BefehlGeladen = 1;
  #1
  assert(LoadBefehlSignal, 0);
  assert(DekodierSignal, 1);
  BefehlGeladen = 0;
  
  Funktionscode = 6'b000000;
  LoadBefehl = 0;
  StoreBefehl = 0;
  JALBefehl = 1;
  //Bedingungstestung
  UnbedingterSprungBefehl = 0;
  BedingterSprungBefehl = 0;
  Bedingung = 0;
  #1 assert(PCSprungSignal, 0);
  BedingterSprungBefehl = 1;
  #1 assert(PCSprungSignal, 0);
  Bedingung = 1;
  #1 assert(PCSprungSignal, 1);
  BedingterSprungBefehl = 0;
  Bedingung = 0;
  UnbedingterSprungBefehl = 1;
  #1 assert(PCSprungSignal, 1);
  #(DECODETIME-4)

  assert(DekodierSignal, 0);
  assert(ALUSignal, 1); //ALU rechnet
  assert(RegisterSchreibSignal, 1); //JALBefehl schreibt jetzt
  #(ALUTIME)
  assert(ALUSignal, 0);
  assert(RegisterSchreibSignal, 0);
  
  assert(PCSignal, 1);
  #(PCWRITETIME)
  assert(PCSignal, 0);
  assert(RegisterSchreibSignal, 0);

  //Hier startet Test LoadBefehl
  assert(LoadBefehlSignal, 1);
  #9
  BefehlGeladen = 1;
  #1
  assert(LoadBefehlSignal, 0);
  assert(DekodierSignal, 1);
  BefehlGeladen = 0;
  
  Funktionscode = 6'b000001;
  LoadBefehl = 1;
  StoreBefehl = 0;
  JALBefehl = 0;
  UnbedingterSprungBefehl = 0;
  BedingterSprungBefehl = 0;
  Bedingung = 0;
  #(DECODETIME)
  assert(DekodierSignal, 0);

  assert(ALUSignal, 1);
  assert(RegisterSchreibSignal, 0);
  #(ALUTIME)
  assert(ALUSignal, 0);
  assert(RegisterSchreibSignal, 0);
  assert(PCSignal, 1);

  assert(LoadDatenSignal, 1);
  #9
  DatenGeladen = 1;
  #1
  assert(RegisterSchreibSignal, 1);
  DatenGeladen = 0;
  #(REGISTERWRITETIME)
  assert(PCSignal, 0);
  assert(LoadDatenSignal, 0);
  assert(RegisterSchreibSignal, 0);

  //Hier startet Test StoreBefehl
  assert(LoadBefehlSignal, 1);
  #9
  BefehlGeladen = 1;
  #1
  assert(LoadBefehlSignal, 0);
  assert(DekodierSignal, 1);
  BefehlGeladen = 0;
  
  Funktionscode = 6'b000001;
  LoadBefehl = 0;
  StoreBefehl = 1;
  JALBefehl = 0;
  UnbedingterSprungBefehl = 0;
  BedingterSprungBefehl = 0;
  Bedingung = 0;
  #(DECODETIME)
  assert(DekodierSignal, 0);

  assert(ALUSignal, 1);
  assert(RegisterSchreibSignal, 0);
  #(ALUTIME)
  assert(ALUSignal, 0);
  assert(PCSignal, 1);

  assert(StoreDatenSignal, 1);
  #9
  DatenGespeichert = 1;
  #1
  assert(PCSignal, 0);
  assert(StoreDatenSignal, 0);
  assert(RegisterSchreibSignal, 0);

  //Hier startet Test Standard
  assert(LoadBefehlSignal, 1);
  DatenGespeichert = 0;
  #9
  BefehlGeladen = 1;
  #1
  assert(LoadBefehlSignal, 0);
  assert(DekodierSignal, 1);
  BefehlGeladen = 0;
  
  Funktionscode = 6'b000010;
  LoadBefehl = 0;
  StoreBefehl = 0;
  JALBefehl = 0;
  UnbedingterSprungBefehl = 0;
  BedingterSprungBefehl = 0;
  Bedingung = 0;
  #(DECODETIME)

  assert(DekodierSignal, 0);
  assert(ALUSignal, 1);
  assert(RegisterSchreibSignal, 0);
  #(ALUTIME)

  assert(ALUSignal, 0);
  assert(RegisterSchreibSignal, 1);
  assert(PCSignal, 1);
  #(REGISTERWRITETIME)

  assert(PCSignal, 0);
  assert(RegisterSchreibSignal, 0);
  assert(LoadBefehlSignal, 1);

  #(DURATION) $display("End of simulation");
  $finish;
 end
 
endmodule
