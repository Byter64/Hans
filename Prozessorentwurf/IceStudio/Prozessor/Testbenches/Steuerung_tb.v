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
 
 // Input/Output
 reg FloatBefehl;
 reg LoadBefehl;
 reg StoreBefehl;
 reg UnbedingterSprungBefehl;
 reg BedingterSprungBefehl;
 reg Bedingung;
 wire RegiterSchreibBefehl;
 wire LoadBefehlSignal;
 wire LoadDatenSignal;
 wire StoreDatenSignal;
 wire PCSchreibSignal;
 
 // Module instance
 main MAIN (
  .v54902b(FloatBefehl),
  .v333e4c(LoadBefehl),
  .v394d0e(StoreBefehl),
  .v708034(UnbedingterSprungBefehl),
  .v2d8bc3(BedingterSprungBefehl),
  .vdf76b1(Bedingung),
  .vc6aa74(RegiterSchreibBefehl),
  .vd25d6a(LoadBefehlSignal),
  .vb561af(LoadDatenSignal),
  .vc9a715(StoreDatenSignal),
  .v7af967(PCSchreibSignal)
 );
 
 initial begin
  $dumpvars(0, main_tb);
 
  // TODO: initialize the registers here
  // e.g. value = 1;
  // e.g. #2 value = 0;
  FloatBefehl = 0;
  LoadBefehl = 0;
  StoreBefehl = 0;
  UnbedingterSprungBefehl = 0;
  BedingterSprungBefehl = 0;
  Bedingung = 0;
 
  #(DURATION) $display("End of simulation");
  $finish;
 end
 
endmodule
