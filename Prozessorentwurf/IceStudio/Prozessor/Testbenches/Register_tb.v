// Code generated by Icestudio 0.10
// Sat, 18 Mar 2023 19:02:50 GMT

// Testbench template
`include "Register.v"
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
 reg [5:0] QuellReg1;
 reg [5:0] QuellReg2;
 reg [5:0] ZielReg;
 reg Schreibsignal;
 reg [31:0] ZielDaten;
 wire [31:0] QuellDaten1;
 wire [31:0] QuellDaten2;
 
 // Module instance
 main MAIN (
  .vaa5d49(QuellReg1),
  .v102134(QuellReg2),
  .v14eae6(ZielReg),
  .v4434b8(Schreibsignal),
  .v7d1d02(ZielDaten),
  .vc46106(QuellDaten1),
  .vfab6dd(QuellDaten2)
 );
 
 initial begin
  $dumpvars(0, main_tb);
 
  // TODO: initialize the registers here
  // e.g. value = 1;
  // e.g. #2 value = 0;
  QuellReg1 = 0;
  QuellReg2 = 0;
  ZielReg = 0;
  Schreibsignal = 0;
  ZielDaten = 0;
 
  #(DURATION) $display("End of simulation");
  $finish;
 end
 
endmodule
