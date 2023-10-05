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
 wire[7:0] led;
 
 // Module instance
 Top main (
  .clk_25mhz(clk_25mhz),
  .led(led)
 );

 always begin
    #1 clk_25mhz = ~clk_25mhz;
 end
 integer idx = 0;
 initial begin
  $dumpvars(0, main_tb);
    for (idx = 0; idx < 256; idx = idx + 1) $dumpvars(0, main.InstruktionRAM.Daten[idx]);
    for (idx = 0; idx < 256; idx = idx + 1) $dumpvars(0, main.DatenRAM.Daten[idx]);
    for (idx = 0; idx < 64;  idx = idx + 1) $dumpvars(0, main.CPU.Register.registers[idx]);

    clk_25mhz = 0;
    main.InstruktionRAM.Daten[0] = 32'b10000000001000000000000000000001;
    main.InstruktionRAM.Daten[1] = 32'b10111111111000000000000000000011;
    main.InstruktionRAM.Daten[2] = 32'b10111111111000000000000000000010;
    main.InstruktionRAM.Daten[3] = 32'b10111111111000000000000000000001;
    main.InstruktionRAM.Daten[4] = 32'b01000011111111111111111111111110;
    main.InstruktionRAM.Daten[5] = 32'b10100000001000010000000000000001;
    main.InstruktionRAM.Daten[6] = 32'b10110100000111110000000000000000;

  #5000
  $display("End of simulation");
  $finish;
 end
 
endmodule
