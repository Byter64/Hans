// Testbench template
`include "../TopModul.v"
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 10 ns / 1 ns

module main_tb
;
 
 // Simulation time: 100ns (10 * 10ns)
 parameter DURATION = 10;
 
 // Input/Output
 reg clk_25mhz;
 wire[7:0] led;

 // Module instance
 Top main (
  .clk_25mhz(clk_25mhz),
  .led(led),
  .btn(7'b0)

 );

 always begin
    #1 clk_25mhz = ~clk_25mhz;
 end
 integer idx = 0;
 initial begin
  $dumpvars(0, main_tb);
    for (idx = 0; idx < 256; idx = idx + 1) $dumpvars(0, main.ram.Daten[idx]);
    //for (idx = 0; idx < 256; idx = idx + 1) $dumpvars(0, main.DatenRAM.Daten[idx]);
    for (idx = 0; idx < 64;  idx = idx + 1) $dumpvars(0, main.CPU.Register.registers[idx][31:0]);
    clk_25mhz = 0;


  #50000
  $display("End of simulation");
  $finish;
 end
 
endmodule
