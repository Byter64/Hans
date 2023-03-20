// Code generated by Icestudio 0.10
// Sat, 18 Mar 2023 19:02:29 GMT

// Testbench template
`include "Programmzähler.v"
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
 reg Schreibsignal;
 reg [25:0] NeuerPC_;
 reg clock;
 reg reset;
 wire [25:0] AktuellerPC_;
 wire [25:0] ErhöhterPC_;
 
 // Module instance
 main MAIN (
  .vb9f6e8(Schreibsignal),
  .v64b2fc(NeuerPC_),
  .v469cec(AktuellerPC_),
  .ve305d5(ErhöhterPC_)
 );
 
 always #1000 clock = ~clock;

 initial begin
  $dumpvars(0, main_tb);
 
  // TODO: initialize the registers here
  // e.g. value = 1;
  // e.g. #2 value = 0;
  Schreibsignal = 0; NeuerPC_ = 0;
  clock = 0;
  
  #900
  Schreibsignal = 1; NeuerPC_ = 14;
  #200
  assert(AktuellerPC_, 14);
  assert(ErhoehterPC_, 15);

  #800
  Schreibsignal = 0; NeuerPC_ = 4359;
  #200
  assert(AktuellerPC_, 15);
  assert(ErhoehterPC_, 16);

  #800
  Schreibsignal = 1; NeuerPC_ = 67108862;
  #200
  assert(AktuellerPC_, 67108862);
  assert(ErhoehterPC_, 67108863);

  #(DURATION) $display("End of simulation");
  $finish;
 end
 
endmodule
