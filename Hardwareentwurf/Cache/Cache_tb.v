`include "Cache.v"
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 10 ns / 1 ns

module main_tb
;
parameter CLOCKSTEP = 5;
parameter TIMESTEP = CLOCKSTEP * 2;

reg ProzessorSchreiben;
reg ProzessorLesen;
reg [31:0] ProzessorAdresse;
reg [31:0] ProzessorSchreibDaten;
reg [31:0] RAMLesDaten;
reg RAMDatenGeschrieben;
reg RAMDatenGelesen;
reg Clock;
reg Reset;

wire [31:0] ProzessorLesDaten;
wire ProzessorDatenGeschrieben;
wire ProzessorDatenGelesen;
wire RAMSchreiben;
wire RAMLesen;
wire [31:0] RAMAdresse;
wire [31:0] RAMSchreibDaten;

Cache cache (
    .ProzessorSchreiben(ProzessorSchreiben),
    .ProzessorLesen(ProzessorLesen),
    .ProzessorAdresse(ProzessorAdresse),
    .ProzessorSchreibDaten(ProzessorSchreibDaten),
    .RAMLesDaten(RAMLesDaten),
    .RAMDatenGeschrieben(RAMDatenGeschrieben),
    .RAMDatenGelesen(RAMDatenGelesen),
    .Clock(Clock),
    .Reset(Reset),

    .ProzessorLesDaten(ProzessorLesDaten),
    .ProzessorDatenGeschrieben(ProzessorDatenGeschrieben),
    .ProzessorDatenGelesen(ProzessorDatenGelesen),
    .RAMSchreiben(RAMSchreiben),
    .RAMLesen(RAMLesen),
    .RAMAdresse(RAMAdresse),
    .RAMSchreibDaten(RAMSchreibDaten)
);

always begin
    #(CLOCKSTEP)
    Clock = ~Clock;
end

initial begin
    $dumpvars(0, main_tb);

    ProzessorSchreiben = 0;
    ProzessorLesen = 0;
    ProzessorAdresse = 0;
    ProzessorSchreibDaten = 0;
    RAMLesDaten = 0;
    RAMDatenGeschrieben = 0;
    RAMDatenGelesen = 0;

    Clock = 1;
    #1
    Reset = 1;
    #(TIMESTEP)
    Reset = 0;
    
    #(TIMESTEP)
    ProzessorAdresse = 32'b00000000000000000000000000000011;
    ProzessorLesen = 1;

    //read from ram to empty cache block
    #(TIMESTEP)
    assert(RAMLesen, 1, `__LINE__);
    assert_32bit(RAMAdresse, 32'b00000000000000000000000000000000, `__LINE__);
    #(TIMESTEP)
    RAMLesDaten = 32'b00000000000000000000000000000001;
    RAMDatenGelesen = 1;

    #(TIMESTEP)
    RAMLesDaten = 0;
    RAMDatenGelesen = 0;
    assert(RAMLesen, 1, `__LINE__);
    assert_32bit(RAMAdresse, 32'b00000000000000000000000000000001, `__LINE__);
    #(TIMESTEP)
    RAMLesDaten = 32'b00000000000000000000000000000010;
    RAMDatenGelesen = 1;

    #(TIMESTEP)
    RAMLesDaten = 0;
    RAMDatenGelesen = 0;
    assert(RAMLesen, 1, `__LINE__);
    assert_32bit(RAMAdresse, 32'b00000000000000000000000000000010, `__LINE__);
    #(TIMESTEP)
    RAMLesDaten = 32'b00000000000000000000000000000100;
    RAMDatenGelesen = 1;

    #(TIMESTEP)
    RAMLesDaten = 0;
    RAMDatenGelesen = 0;
    assert(RAMLesen, 1, `__LINE__);
    assert_32bit(RAMAdresse, 32'b00000000000000000000000000000011, `__LINE__);
    #(TIMESTEP)
    RAMLesDaten = 32'b00000000000000000000000000001000;
    RAMDatenGelesen = 1;

    //return
    #(TIMESTEP)
    RAMLesDaten = 0;
    RAMDatenGelesen = 0;
    assert(RAMLesen, 0, `__LINE__);
    assert(ProzessorDatenGelesen, 1, `__LINE__);
    assert_32bit(ProzessorLesDaten, 32'b00000000000000000000000000001000, `__LINE__);
    ProzessorLesen = 0;

    //idle
    #(TIMESTEP)
    assert(ProzessorDatenGelesen, 0, `__LINE__);
    ProzessorAdresse = 32'b00000000000000000000000000000001;
    ProzessorLesen = 1;

    //return
    #(TIMESTEP)
    assert(ProzessorDatenGelesen, 1, `__LINE__);
    assert_32bit(ProzessorLesDaten, 32'b00000000000000000000000000000010, `__LINE__);
    ProzessorLesen = 0;

    //idle
    #(TIMESTEP)
    assert(ProzessorDatenGelesen, 0, `__LINE__);
    ProzessorAdresse = 32'b01000000000000000000000000000001;
    ProzessorSchreibDaten = 32'b00000000000000000000000000001010;
    ProzessorSchreiben = 1;

    //read from ram to full cache block
    #(TIMESTEP)
    assert(RAMLesen, 1, `__LINE__);
    assert_32bit(RAMAdresse, 32'b01000000000000000000000000000000, `__LINE__);
    #(TIMESTEP)
    RAMLesDaten = 32'b00000000000000000000000000000011;
    RAMDatenGelesen = 1;

    #(TIMESTEP)
    RAMLesDaten = 0;
    RAMDatenGelesen = 0;
    assert(RAMLesen, 1, `__LINE__);
    assert_32bit(RAMAdresse, 32'b01000000000000000000000000000001, `__LINE__);
    #(TIMESTEP)
    RAMLesDaten = 32'b00000000000000000000000000000101;
    RAMDatenGelesen = 1;

    #(TIMESTEP)
    RAMLesDaten = 0;
    RAMDatenGelesen = 0;
    assert(RAMLesen, 1, `__LINE__);
    assert_32bit(RAMAdresse, 32'b01000000000000000000000000000010, `__LINE__);
    #(TIMESTEP)
    RAMLesDaten = 32'b00000000000000000000000000000111;
    RAMDatenGelesen = 1;

    #(TIMESTEP)
    RAMLesDaten = 0;
    RAMDatenGelesen = 0;
    assert(RAMLesen, 1, `__LINE__);
    assert_32bit(RAMAdresse, 32'b01000000000000000000000000000011, `__LINE__);
    #(TIMESTEP)
    RAMLesDaten = 32'b00000000000000000000000000001001;
    RAMDatenGelesen = 1;

    //return
    #(TIMESTEP)
    RAMLesDaten = 0;
    RAMDatenGelesen = 0;
    assert(RAMLesen, 0, `__LINE__);
    assert(ProzessorDatenGeschrieben, 1, `__LINE__);
    ProzessorSchreiben = 0;

    //idle
    #(TIMESTEP)
    assert(ProzessorDatenGeschrieben, 0, `__LINE__);
    ProzessorAdresse = 32'b01000000000000000000000000000001;
    ProzessorLesen = 1;

    //return
    #(TIMESTEP)
    assert(ProzessorDatenGelesen, 1, `__LINE__);
    assert_32bit(ProzessorLesDaten, 32'b00000000000000000000000000001010, `__LINE__);
    ProzessorLesen = 0;

    //idle
    #(TIMESTEP)
    assert(ProzessorDatenGelesen, 0, `__LINE__);
    ProzessorAdresse = 32'b00000000000000000000000000000010;
    ProzessorLesen = 1;

    //read from cache block to ram
    #(TIMESTEP)
    assert(RAMSchreiben, 1, `__LINE__);
    assert_32bit(RAMAdresse, 32'b01000000000000000000000000000000, `__LINE__);
    assert_32bit(RAMSchreibDaten, 32'b00000000000000000000000000000011, `__LINE__);
    #(TIMESTEP)
    RAMDatenGeschrieben = 1;

    #(TIMESTEP)
    RAMDatenGeschrieben = 0;
    assert(RAMSchreiben, 1, `__LINE__);
    assert_32bit(RAMAdresse, 32'b01000000000000000000000000000001, `__LINE__);
    assert_32bit(RAMSchreibDaten, 32'b00000000000000000000000000001010, `__LINE__);
    #(TIMESTEP)
    RAMDatenGeschrieben = 1;

    #(TIMESTEP)
    RAMDatenGeschrieben = 0;
    assert(RAMSchreiben, 1, `__LINE__);
    assert_32bit(RAMAdresse, 32'b01000000000000000000000000000010, `__LINE__);
    assert_32bit(RAMSchreibDaten, 32'b00000000000000000000000000000111, `__LINE__);
    #(TIMESTEP)
    RAMDatenGeschrieben = 1;

    #(TIMESTEP)
    RAMDatenGeschrieben = 0;
    assert(RAMSchreiben, 1, `__LINE__);
    assert_32bit(RAMAdresse, 32'b01000000000000000000000000000011, `__LINE__);
    assert_32bit(RAMSchreibDaten, 32'b00000000000000000000000000001001, `__LINE__);
    #(TIMESTEP)
    RAMDatenGeschrieben = 1;

    #(TIMESTEP)
    RAMDatenGeschrieben = 0;
    assert(RAMSchreiben, 0, `__LINE__);
    //read from ram to empty cache block
    assert(RAMLesen, 1, `__LINE__);
    assert_32bit(RAMAdresse, 32'b00000000000000000000000000000000, `__LINE__);
    #(TIMESTEP)
    RAMLesDaten = 32'b00000000000000000000000000000001;
    RAMDatenGelesen = 1;

    #(TIMESTEP)
    RAMLesDaten = 0;
    RAMDatenGelesen = 0;
    assert(RAMLesen, 1, `__LINE__);
    assert_32bit(RAMAdresse, 32'b00000000000000000000000000000001, `__LINE__);
    #(TIMESTEP)
    RAMLesDaten = 32'b00000000000000000000000000000010;
    RAMDatenGelesen = 1;

    #(TIMESTEP)
    RAMLesDaten = 0;
    RAMDatenGelesen = 0;
    assert(RAMLesen, 1, `__LINE__);
    assert_32bit(RAMAdresse, 32'b00000000000000000000000000000010, `__LINE__);
    #(TIMESTEP)
    RAMLesDaten = 32'b00000000000000000000000000000100;
    RAMDatenGelesen = 1;

    #(TIMESTEP)
    RAMLesDaten = 0;
    RAMDatenGelesen = 0;
    assert(RAMLesen, 1, `__LINE__);
    assert_32bit(RAMAdresse, 32'b00000000000000000000000000000011, `__LINE__);
    #(TIMESTEP)
    RAMLesDaten = 32'b00000000000000000000000000001000;
    RAMDatenGelesen = 1;

    //return
    #(TIMESTEP)
    RAMLesDaten = 0;
    RAMDatenGelesen = 0;
    assert(RAMLesen, 0, `__LINE__);
    assert(ProzessorDatenGelesen, 1, `__LINE__);
    assert_32bit(ProzessorLesDaten, 32'b00000000000000000000000000000100, `__LINE__);
    ProzessorLesen = 0;

    //idle
    #(TIMESTEP)
    assert(ProzessorDatenGelesen, 0, `__LINE__);


    #(TIMESTEP) $display("End of simulation");
    $finish;
end

task assert;
    input assertValue;
    input shouldValue;
    input [7:0] line;
    begin
        if (assertValue != shouldValue) begin
            $display("line %d: Value = %b, should be %b", line, assertValue, shouldValue);
            $finish;
        end
    end
endtask

task assert_32bit;
    input [31:0] assertValue;
    input [31:0] shouldValue;
    input [7:0] line;
    begin
        if (assertValue != shouldValue) begin
            $display("line %d: Value = %b, should be %b", line, assertValue, shouldValue);
            $finish;
        end
    end
endtask

endmodule