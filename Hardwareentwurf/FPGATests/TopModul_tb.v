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
  .btn(btn)

 );
reg[6:0] btn = 6'b0;
 always begin
    #1 clk_25mhz = ~clk_25mhz;
 end
 integer idx = 0;
 integer counter = 0;
 initial begin
  $dumpvars(0, main_tb);
    for (idx = 0; idx < 256; idx = idx + 1) $dumpvars(0, main.ram.Daten[idx]);
    //for (idx = 0; idx < 256; idx = idx + 1) $dumpvars(0, main.DatenRAM.Daten[idx]);
    for (idx = 0; idx < 64;  idx = idx + 1) $dumpvars(0, main.CPU.Register.registers[idx][31:0]);
    clk_25mhz = 0;

  btn[0]=1;
  #30000
  btn[6:0] = 7'b0101101;
  for(counter = 0;counter <2**6;counter = counter + 1) begin
    #10btn[6:1]=counter;
  end
  btn[6:1]=0;
  #30000
  btn[0] = 0;
  #2000
  btn[0] = 1;
  #3000
  $display("End of simulation");
  $finish;
 end
 
endmodule
