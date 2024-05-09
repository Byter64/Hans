// Code generated by Icestudio 0.10
// Sat, 18 Mar 2023 19:03:03 GMT

// Testbench template
`include "../Prozessor/Steuerung.v"
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 10 ns / 1 ns

module main_tb
;
 
 // Simulation time: 100ns (10 * 10ns)
 parameter Halfcycle = 5;
 parameter Cycle = Halfcycle * 2;
 parameter DECODETIME = 2;
 parameter REGISTERWRITETIME = 1;
 parameter PCWRITETIME = 1;

 // Input/Output
   reg BefehlGeladen = 0;
   reg LoadBefehl = 0;
   reg StoreBefehl = 0;
   reg JALBefehl = 0;
   reg UnbedingterSprungBefehl = 0; //
   reg BedingterSprungBefehl = 0; //
   reg Bedingung = 0; //
   reg ALUFertig = 0;
   reg DatenGeladen = 0;
   reg DatenGespeichert = 0;
   reg Reset;
   reg Clock;

   wire LoadBefehlSignal;
   wire DekodierSignal;
   wire ALUStartSignal;
   wire RegisterSchreibSignal;
   wire LoadDatenSignal;
   wire StoreDatenSignal;
   wire PCSignal;
   wire PCSprungSignal;

 
 // Module instance
 Steuerung strg (
   .BefehlGeladen(BefehlGeladen),
   .LoadBefehl(LoadBefehl),
   .StoreBefehl(StoreBefehl),
   .JALBefehl(JALBefehl),
   .UnbedingterSprungBefehl(UnbedingterSprungBefehl), //
   .BedingterSprungBefehl(BedingterSprungBefehl), //
   .Bedingung(Bedingung), //
   .ALUFertig(ALUFertig),
   .DatenGeladen(DatenGeladen),
   .DatenGespeichert(DatenGespeichert),
   .Reset(Reset),
   .Clock(Clock),

   .LoadBefehlSignal(LoadBefehlSignal),
   .DekodierSignal(DekodierSignal),
   .ALUStartSignal(ALUStartSignal),
   .RegisterSchreibSignal(RegisterSchreibSignal),
   .LoadDatenSignal(LoadDatenSignal),
   .StoreDatenSignal(StoreDatenSignal),
   .PCSignal(PCSignal),
   .PCSprungSignal(PCSprungSignal)
 );
 
 always begin
    #(Halfcycle)
    Clock = ~Clock;
 end

 initial begin
  $dumpvars(0, main_tb);
 
  // TODO: initialize the registers here
  // e.g. value = 1;
  // e.g. #2 value = 0;
  
  //Steuerung wird initialisiert
  Clock = 1;
  #1
  Reset = 1;
  #(Cycle)
  #(Cycle)
  Reset <= 0;
  BefehlGeladen <= 1;
  //Testfall 1: Fetch Zyklus
  assert(LoadBefehlSignal, 1, `__LINE__);
  assert(DekodierSignal, 0, `__LINE__);
  assert(ALUStartSignal, 0, `__LINE__);
  assert(RegisterSchreibSignal, 0, `__LINE__);
  assert(LoadDatenSignal, 0, `__LINE__);
  assert(StoreDatenSignal, 0, `__LINE__);
  assert(PCSignal, 0, `__LINE__);
  assert(PCSprungSignal, 0, `__LINE__);

  // Testfall 2: Decode-Zyklus
  #(Cycle)
  BefehlGeladen <= 0;
  assert(LoadBefehlSignal, 0, `__LINE__);
  assert(DekodierSignal, 1, `__LINE__);
  assert(ALUStartSignal, 0, `__LINE__);
  assert(RegisterSchreibSignal, 0, `__LINE__);
  assert(LoadDatenSignal, 0, `__LINE__);
  assert(StoreDatenSignal, 0, `__LINE__);
  assert(PCSignal, 0, `__LINE__);
  assert(PCSprungSignal, 0, `__LINE__);

  // Testfall 3: ALU-Zyklus
  #(Cycle)
  assert(LoadBefehlSignal, 0, `__LINE__);
  assert(DekodierSignal, 0, `__LINE__);
  assert(ALUStartSignal, 1, `__LINE__);
  assert(RegisterSchreibSignal, 0, `__LINE__);
  assert(LoadDatenSignal, 0, `__LINE__);
  assert(StoreDatenSignal, 0, `__LINE__);
  assert(PCSignal, 0, `__LINE__);
  assert(PCSprungSignal, 0, `__LINE__);

    // Testfall 4: ALU-Zyklus Test 2
  #(Cycle)
  assert(LoadBefehlSignal, 0, `__LINE__);
  assert(DekodierSignal, 0, `__LINE__);
  assert(ALUStartSignal, 0, `__LINE__);
  assert(RegisterSchreibSignal, 0, `__LINE__);
  assert(LoadDatenSignal, 0, `__LINE__);
  assert(StoreDatenSignal, 0, `__LINE__);
  assert(PCSignal, 0, `__LINE__);
  assert(PCSprungSignal, 0, `__LINE__);
  ALUFertig <= 1;
    // Testfall 5: WRITEBACK
  #(Cycle)
  ALUFertig <= 0;
  assert(LoadBefehlSignal, 0, `__LINE__);
  assert(DekodierSignal, 0, `__LINE__);
  assert(ALUStartSignal, 0, `__LINE__);
  assert(RegisterSchreibSignal, 1, `__LINE__);
  assert(LoadDatenSignal, 0, `__LINE__);
  assert(StoreDatenSignal, 0, `__LINE__);
  assert(PCSignal, 1, `__LINE__);
  assert(PCSprungSignal, 0, `__LINE__);
  
    // Testfall 1: FETCH
  #(Cycle)
  BefehlGeladen <=  1;
  //DECODE
  #(Cycle)
  BefehlGeladen <= 0;
  ALUFertig <= 1;
  //ALU
  #(Cycle)

  BedingterSprungBefehl <= 1;
  Bedingung <= 1;
  //Writeback Jump
  #(Cycle)
  assert(LoadBefehlSignal, 0, `__LINE__);
  assert(DekodierSignal, 0, `__LINE__);
  assert(ALUStartSignal, 0, `__LINE__);
  assert(RegisterSchreibSignal, 0, `__LINE__);
  assert(LoadDatenSignal, 0, `__LINE__);
  assert(StoreDatenSignal, 0, `__LINE__);
  assert(PCSignal, 1, `__LINE__);
  assert(PCSprungSignal, 1, `__LINE__);
  ALUFertig <= 0;
  BedingterSprungBefehl <= 0;

  // Testfall 2: FETCH
  #(Cycle)
  BefehlGeladen <=  1;
  //DECODE
  #(Cycle)
  ALUFertig <= 1;
  BefehlGeladen <= 0;
  //ALU
  #(Cycle)
  ALUFertig <= 1;
  UnbedingterSprungBefehl <= 1;
  //Writeback Jump
  #(Cycle)
  assert(LoadBefehlSignal, 0, `__LINE__);
  assert(DekodierSignal, 0, `__LINE__);
  assert(ALUStartSignal, 0, `__LINE__);
  assert(RegisterSchreibSignal, 0, `__LINE__);
  assert(LoadDatenSignal, 0, `__LINE__);
  assert(StoreDatenSignal, 0, `__LINE__);
  assert(PCSignal, 1, `__LINE__);
  assert(PCSprungSignal, 1, `__LINE__);
  ALUFertig <= 0;
  UnbedingterSprungBefehl <= 0;

    // Testfall 3: FETCH
  #(Cycle)
  BefehlGeladen <=  1;
  //DECODE
  #(Cycle)
  ALUFertig <= 1;
  BefehlGeladen <= 0;
  //ALU
  #(Cycle)
  ALUFertig <= 1;
  StoreBefehl <= 1;
  //Writeback Store
  #(Cycle)
  assert(LoadBefehlSignal, 0, `__LINE__);
  assert(DekodierSignal, 0, `__LINE__);
  assert(ALUStartSignal, 0, `__LINE__);
  assert(RegisterSchreibSignal, 0, `__LINE__);
  assert(LoadDatenSignal, 0, `__LINE__);
  assert(StoreDatenSignal, 1, `__LINE__);
  assert(PCSignal, 1, `__LINE__);
  assert(PCSprungSignal, 0, `__LINE__);
  DatenGespeichert <= 1;
  ALUFertig <= 0;
  StoreBefehl <= 0;

    // Testfall 4: FETCH
  #(Cycle)
  DatenGespeichert <= 0;
  BefehlGeladen <=  1;
  //DECODE
  #(Cycle)
  ALUFertig <= 1;
  BefehlGeladen <= 0;
  //ALU
  #(Cycle)
  ALUFertig <= 1;
  LoadBefehl <= 1;
  //Writeback Load
  #(Cycle)
  assert(LoadBefehlSignal, 0, `__LINE__);
  assert(DekodierSignal, 0, `__LINE__);
  assert(ALUStartSignal, 0, `__LINE__);
  assert(RegisterSchreibSignal, 0, `__LINE__);
  assert(LoadDatenSignal, 1, `__LINE__);
  assert(StoreDatenSignal, 0, `__LINE__);
  assert(PCSignal, 1, `__LINE__);
  assert(PCSprungSignal, 0, `__LINE__);
  ALUFertig <= 0;
  LoadBefehl <= 0;
  DatenGeladen <= 1;



  #(Cycle) $display("End of simulation");
  $finish;
 end
 
 task assert;
    input assertValue;
    input shouldValue;
    input [7:0] line;
    begin
      if (assertValue != shouldValue) begin
        $display("line %d: Value = %b, should be %b", line, assertValue, shouldValue);
        $finish;
      end
    end
 endtask

endmodule