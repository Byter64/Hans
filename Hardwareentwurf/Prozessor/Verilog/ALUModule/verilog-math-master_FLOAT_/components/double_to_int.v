//This file was automatically generated by the python 'pipeliner' script
//This module has a latency of 2 clocks
module dq (clk, q, d);
  input  clk;
  input  [width-1:0] d;
  output [width-1:0] q;
  parameter width=8;
  parameter depth=2;
  integer i;
  reg [width-1:0] delay_line [depth-1:0];
  always @(posedge clk) begin
    delay_line[0] <= d;
    for(i=1; i<depth; i=i+1) begin
      delay_line[i] <= delay_line[i-1];
    end
  end
  assign q = delay_line[depth-1];
endmodule

module double_to_int(clk, double_to_int_a, double_to_int_z);
  input clk;
  input [63:0] double_to_int_a;
  output [63:0] double_to_int_z;
  wire [63:0] s_0;
  wire [63:0] s_1;
  wire [63:0] s_2;
  wire [63:0] s_3;
  wire [63:0] s_4;
  wire [63:0] s_5;
  wire [52:0] s_6;
  wire [0:0] s_7;
  wire [0:0] s_8;
  wire [0:0] s_9;
  wire [0:0] s_10;
  wire [10:0] s_11;
  wire [10:0] s_12;
  wire [63:0] s_13;
  wire [9:0] s_14;
  wire [10:0] s_15;
  wire [51:0] s_16;
  wire [10:0] s_17;
  wire [10:0] s_18;
  wire [10:0] s_19;
  wire [10:0] s_20;
  wire [10:0] s_21;
  wire [10:0] s_22;
  wire [0:0] s_23;
  wire [63:0] s_24;
  wire [0:0] s_25;
  wire [0:0] s_26;

  assign s_0 = s_25?s_1:s_24;
  dq #(64, 1) dq_s_1 (clk, s_1, s_2);
  assign s_2 = -s_3;
  dq #(64, 1) dq_s_3 (clk, s_3, s_4);
  assign s_4 = s_5 >> s_18;
  assign s_5 = {s_6,s_17};
  assign s_6 = {s_7,s_16};
  assign s_7 = s_10?s_8:s_9;
  assign s_8 = 1'd0;
  assign s_9 = 1'd1;
  assign s_10 = s_11 == s_15;
  assign s_11 = s_12 - s_14;
  assign s_12 = s_13[62:52];
  assign s_13 = double_to_int_a;
  assign s_14 = 10'd1023;
  assign s_15 = -11'd1023;
  assign s_16 = s_13[51:0];
  assign s_17 = 11'd0;
  assign s_18 = s_19 - s_23;
  assign s_19 = s_20 - s_21;
  assign s_20 = 11'd64;
  assign s_21 = s_10?s_22:s_11;
  assign s_22 = -11'd1022;
  assign s_23 = 1'd1;
  dq #(64, 1) dq_s_24 (clk, s_24, s_3);
  dq #(1, 2) dq_s_25 (clk, s_25, s_26);
  assign s_26 = s_13[63];
  assign double_to_int_z = s_0;
endmodule