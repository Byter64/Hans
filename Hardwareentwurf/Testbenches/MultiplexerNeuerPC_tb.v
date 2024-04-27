// Code generated by Icestudio 0.10
// Mon, 20 Mar 2023 15:06:52 GMT

// Testbench template
`include "../Prozessor/MultiplexerNeuerPC.v"
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
localparam Halfcycle = 5;
localparam Cycle = 2 * Halfcycle;
 
 // Input/Output
 reg [31:0] RelativerPC;
 reg [31:0] AbsoluterPC;
 reg IstAbsolut;
 wire [25:0] NeuerPC;
 
 // Module instance
 MultiplexerNeuerPC multiplexerNeuerPC (
  .RelativerPC(RelativerPC),
  .AbsoluterPC(AbsoluterPC),
  .IstAbsolut(IstAbsolut),
  .NeuerPC(NeuerPC)
 );
 
 initial begin
  $dumpvars(0, main_tb);
  RelativerPC = 32'b00100000111100110010000011110010;
  AbsoluterPC = 32'b00100001100100100110001101110010;
  IstAbsolut = 0;
  $display("Start of simulation");
  #(Cycle) 
  `assert(NeuerPC == RelativerPC[25:0],1);
  #(Cycle)
  IstAbsolut = 1;

  #(Cycle)
  `assert(NeuerPC == AbsoluterPC[25:0],1);
  $display("End of simulation");
  $finish;
 end
 
endmodule
