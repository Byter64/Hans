// Testbench template
`include "TopModul.v"
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 10 ns / 1 ns

module main_tb
;
 
 // Simulation time: 100ns (10 * 10ns)
 parameter DURATION = 10;
 
 // Input/Output
 reg clk_25mhz;
 reg[7:0] led;
 
 // Module instance
 Top main (
  .clk_25mhz(clk_25mhz),
  .Ergebnis(led)
 );

 always begin
    #1 clk_25mhz = ~clk_25mhz;
 end
 
 initial begin
  $dumpvars(0, main_tb);

    clk_25mhz = 0;

  #100000
  $display("End of simulation");
  $finish;
 end
 
endmodule
