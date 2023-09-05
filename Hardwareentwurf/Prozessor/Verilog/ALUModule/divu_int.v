// Project F Library - Division: Unsigned Integer with Remainder
// (C)2023 Will Green, Open source hardware released under the MIT License
// Learn more at https://projectf.io/verilog-lib/

module divu_int #(parameter WIDTH = 5 , parameter CEILINGLOG2WIDTH = 3) ( // width of numbers in bits
    input wire clk,              // clock
    input wire rst,              // reset
    input wire start,            // start calculation
    output reg    busy,             // calculation in progress
    output reg     done,             // calculation is complete (high for one tick)
    output reg    valid,            // result is valid
    output reg    dbz,              // divide by zero
    input wire [WIDTH-1:0] a,    // dividend (numerator)
    input wire [WIDTH-1:0] b,    // divisor (denominator)
    output reg    [WIDTH-1:0] val,  // result value: quotient
    output reg    [WIDTH-1:0] rem   // result: remainder
    );

    reg [WIDTH-1:0] b1;             // copy of divisor
    reg [WIDTH-1:0] quo, quo_next;  // intermediate quotient
    reg [WIDTH:0] acc, acc_next;    // accumulator (1 bit wider)
    reg [CEILINGLOG2WIDTH-1:0] i;      // iteration counter

    // division algorithm iteration
    always @(*) begin
        if (acc >= {1'b0, b1}) begin
            acc_next = acc - b1;
            {acc_next, quo_next} = {acc_next[WIDTH-1:0], quo, 1'b1};
        end else begin
            {acc_next, quo_next} = {acc, quo} << 1;
        end
    end

    // calculation control
    always @(posedge clk) begin
        done <= 1'b0;
        if (start) begin
            valid <= 1'b0;
            i <= 1'b0;
            if (b == 1'b0) begin  // catch divide by zero
                busy <= 1'b0;
                done <= 1'b1;
                dbz <= 1'b1;
            end else begin
                busy <= 1'b1;
                dbz <= 1'b0;
                b1 <= b;
                {acc, quo} <= {{WIDTH{1'b0}}, a, 1'b0};  // initialize calculation
            end
        end else if (busy) begin
            if (i == WIDTH-1) begin  // we're done
                busy <= 1'b0;
                done <= 1'b1;
                valid <= 1'b1;
                val <= quo_next;
                rem <= acc_next[WIDTH:1];  // undo final shift
            end else begin  // next iteration
                i <= i + 1;
                acc <= acc_next;
                quo <= quo_next;
            end
        end
        if (rst) begin
            busy <= 1'b0;
            done <= 1'b0;
            valid <= 1'b0;
            dbz <= 1'b0;
            val <= 1'b0;
            rem <= 1'b0;
        end
    end
endmodule
