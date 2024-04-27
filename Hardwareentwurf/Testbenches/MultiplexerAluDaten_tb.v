// Code generated by Icestudio 0.10
// Sat, 18 Mar 2023 19:01:30 GMT

// Testbench template
`include "../Prozessor/MultiplexerAluDaten.v"
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 10 ns / 1 ns
`define assert(signal, value) \
        if (signal !== value) begin \
            $display("Falscher Wert in %d und %d: ", signal, value); \
            $finish;
        end

module main_tb
;
 
 // Simulation time: 100ns (10 * 10ns)
localparam Halfcycle = 5;
localparam Cycle = 2 * Halfcycle;
 
 // Input/Output
 reg [31:0] RegisterDaten2;
 reg [31:0] Immediate;
 reg ImmediateAktiv;
 wire [31:0] Daten2;
 
 
 // Module instance
 MultiplexerAluDaten multiplexerAluDaten (
  .RegisterDaten2(RegisterDaten2),
  .Immediate(Immediate),
  .ImmediateAktiv(ImmediateAktiv),
  .Daten2(Daten2)
 );
 

    initial begin
        $dumpvars(0, main_tb);
        RegisterDaten2 = 32'b00010010000000110000010000001100;
        Immediate = 32'b00011001001100001110010110;
        ImmediateAktiv = 0;
        $display("Start of simulation");
        #(Cycle)
        `assert(Daten2 == RegisterDaten2,1);

        #(Cycle)
        RegisterDaten2 = 32'b00010010000000110000010000001100;
        Immediate = 32'b11111110011001001100001110010110;
        ImmediateAktiv = 1;
        #(Cycle) 
        `assert(Daten2 == 32'b11111110011001001100001110010110,1);
        #(Cycle)
        Immediate = 32'b11111110000000001100001110010110;
        #(Cycle)
        `assert(Daten2 == 32'b11111110000000001100001110010110,1);
        #(Cycle)
        Immediate = 32'b00000000001100001110010110;
        #(Cycle)
        `assert(Daten2 == 32'b00000000000000001100001110010110,1);

        $display("End of simulation");
        $finish;
    end
 
endmodule
