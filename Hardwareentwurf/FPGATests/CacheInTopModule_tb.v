// Testbench template
`timescale 1 ns / 1 ps
`include "../TopModul.v"
`default_nettype none

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
    for (idx = 0; idx < 256; idx = idx + 1) $dumpvars(0, main.InstruktionCache.memory[idx]);
    for (idx = 0; idx < 256; idx = idx + 1) $dumpvars(0, main.DatenCache.memory[idx]);
    for (idx = 0; idx < 64;  idx = idx + 1) $dumpvars(0, main.CPU.Register.registers[idx]);

    clk_25mhz = 0;

  main.InstruktionRAM.Daten[0] = 32'h80200001;
  main.InstruktionRAM.Daten[1] = 32'hE8200000;
  main.InstruktionRAM.Daten[2] = 32'h80400002;
  main.InstruktionRAM.Daten[3] = 32'hE8400001;
  main.InstruktionRAM.Daten[4] = 32'h80600003;
  main.InstruktionRAM.Daten[5] = 32'hE8600002;
  main.InstruktionRAM.Daten[6] = 32'h80800004;
  main.InstruktionRAM.Daten[7] = 32'hE8800003;
  main.InstruktionRAM.Daten[8] = 32'h80200005;
  main.InstruktionRAM.Daten[9] = 32'hE8204000;
  main.InstruktionRAM.Daten[10] = 32'h80400006;
  main.InstruktionRAM.Daten[11] = 32'hE8404001;
  main.InstruktionRAM.Daten[12] = 32'h80600007;
  main.InstruktionRAM.Daten[13] = 32'hE8604002;
  main.InstruktionRAM.Daten[14] = 32'h80800008;
  main.InstruktionRAM.Daten[15] = 32'hE8804003;
  main.InstruktionRAM.Daten[16] = 32'hE0200000;
  main.InstruktionRAM.Daten[17] = 32'hE8200010;
  main.InstruktionRAM.Daten[18] = 32'hE0400001;
  main.InstruktionRAM.Daten[19] = 32'hE8400011;
  main.InstruktionRAM.Daten[20] = 32'hE0600002;
  main.InstruktionRAM.Daten[21] = 32'hE8600012;
  main.InstruktionRAM.Daten[22] = 32'hE0800003;
  main.InstruktionRAM.Daten[23] = 32'hE8800013;
  main.InstruktionRAM.Daten[24] = 32'hE0204000;
  main.InstruktionRAM.Daten[25] = 32'hE0404001;
  main.InstruktionRAM.Daten[26] = 32'hE0604002;
  main.InstruktionRAM.Daten[27] = 32'hE0804003;

  #10000
  $display("End of simulation");
  $finish;
 end
 
endmodule
