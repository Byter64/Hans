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
    main.InstruktionRAM.Daten[0] = 32'b10000000010000000000000000001111; //Addi R2, R0, 15
    main.InstruktionRAM.Daten[1] = 32'b00000000001000000000000000000000; //Add R1, R0, R0
    main.InstruktionRAM.Daten[2] = 32'b10000011111000000000000000000001; //Addi R31, R0, #1
    main.InstruktionRAM.Daten[3] = 32'b10011011111111110000000000011111; //Sli R31, R31, #31

    main.InstruktionRAM.Daten[4] = 32'b00000000001000010001000000000000; //Add R1, R1, R2
    main.InstruktionRAM.Daten[5] = 32'b10000100010000100000000000000001; //Subi R2, R2, 1
    main.InstruktionRAM.Daten[6] = 32'b00000000011000100000000000010000; //Ce R3, R2, R0
    main.InstruktionRAM.Daten[7] = 32'b10110000001111110000000000000000; //Store R1, R31, #0
    main.InstruktionRAM.Daten[8] = 32'b10111000000000111111111111111011; //Bez R3, -5

    main.InstruktionRAM.Daten[9] = 32'b01000011111111111111111111111111; //jmp -1

  #5000
  $display("End of simulation");
  $finish;
 end
 
endmodule
