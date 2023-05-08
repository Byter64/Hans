// Code generated by Icestudio 0.10
// Sat, 18 Mar 2023 19:01:30 GMT

// Testbench template
`include "MultiplexerAluDaten.v"
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 10 ns / 1 ns
`define assert(signal, value, message) \
        if (signal !== value) begin \
            $display("Falscher Wert in %m: ", message); \
        end

module main_tb
;
 
 // Simulation time: 100ns (10 * 10ns)
 parameter DURATION = 10;
 
 // Input/Output
 reg [31:0] RegisterDaten2;
 reg [25:0] Immediate;
 reg KleinerImmediateAktiv;
 reg GrosserImmediateAktiv;
 wire [31:0] Daten2;
 
 
 // Module instance
 main MAIN (
  .ve2ec93(RegisterDaten2),
  .v3b6447(RegisterDaten2),
  .v9bf9a1(KleinerImmediate),
  .vb90512(GroßerImmediate),
  .vac4d0b(RegisterDaten2),
  .ve4871c(Daten2)
 );
 

    initial begin
        $dumpvars(0, main_tb);
        RegisterDaten2 = 32'b00010010000000110000010000001100;
        Immediate = 26'b00011001001100001110010110;
        KleinerImmediateAktiv = 0;
        GrosserImmediateAktiv = 0;
        #100
        if(Daten2 != RegisterDaten2)
            $display("Wert in Daten2 ist ungleich RegisterDaten2: \n Daten2: %d \n RegisterDaten2: %d", Daten2, RegisterDaten2);

        #100
        RegisterDaten2 = 32'b00010010000000110000010000001100;
        Immediate = 26'b00011001001100001110010110;
        KleinerImmediateAktiv = 0;
        GrosserImmediateAktiv = 1;
        #100 
        if(Daten2 != 32'b00000000011001001100001110010110)
            $display("Wert in Daten2 ist ungleich Immediate[25:0]: \n Immediate: %d \n RegisterDaten2: %d", Immediate, RegisterDaten2);

        #100
        RegisterDaten2 = 32'b00010010000000110000010000001100;
        Immediate = 26'b00011001001100001110010110;
        KleinerImmediateAktiv = 1;
        GrosserImmediateAktiv = 0;
        #100
        if(Daten2 != 32'b00000000000000001100001110010110)
            $display("Wert in Daten2 ist ungleich Immediate[15:0]: \n Immediate: %d \n RegisterDaten2: %d", Immediate, RegisterDaten2);

        $display("End of simulation");
        $finish;
    end
 
endmodule