// Testbench template
`include "../divu_int.v"
`default_nettype none
`timescale 10 ns / 1 ns

module main_tb;

reg clk = 1'b0;              // clock
reg rst = 1'b0;              // reset
reg start = 1'b0;            // start calculation
reg[31:0] a = 1'b0;    // dividend (numerator)
reg[31:0] b = 1'b0;    // divisor (denominator)
wire busy;             // calculation in progress
wire done;             // calculation is complete (high for one tick)
wire valid;            // result is valid
wire dbz;              // divide by zero
wire [31:0] val;  // result value: quotient
wire [31:0] rem;   // result: remainder

divu_int#(32, 5) Dividierer (  // width of numbers in bits
    .clk(clk),              // clock
    .rst(rst),              // reset
    .start(start),            // start calculation
    .busy(busy),             // calculation in progress
    .done(done),             // calculation is complete (high for one tick)
    .valid(valid),            // result is valid
    .dbz(dbz),              // divide by zero
    .a(a),    // dividend (numerator)
    .b(b),    // divisor (denominator)
    .val(val),  // result value: quotient
    .rem(rem)   // result: remainder
    );

always @(*) begin
    #1 clk = ~clk;
end

initial begin
    $dumpvars(0, main_tb);

    rst = 1'b1;
    #20 rst = 1'b0;

    a = 32'd100000000;
    b = 32'd3;
    start = 1'b1;
    #400;
    $display("%d\n", val);

    a = 32'd166;
    b = 32'd0;
    start = 1'b1;
    
    #400;
    $display("%d\n", val);
    $finish;
end

endmodule