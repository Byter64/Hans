module Bildpuffer (
  input clk,
  input rst,

  input [7:0] x,
  input [7:0] y,
  input [BITSPERPIXEL-1:0] color,
  input write,

  input [7:0] x_data,
  input [7:0] y_data,

  output [BITSPERPIXEL-1:0] pixelData
);


  localparam WIDTH = 160;
  localparam HEIGHT = 120;
  localparam BITSPERPIXEL = 8;

  integer i = 0;
  integer j = 0;

  reg [7:0] framebuffer [WIDTH*HEIGHT-1:0];

  always @(posedge clk) begin
    if(rst) begin
      framebuffer[0] <= 8'b0;
    end    
    else if (write) begin
      if(x<WIDTH&&y<HEIGHT) begin
         framebuffer[y*HEIGHT+x] <= color;
      end
    end
  end

  assign pixelData = (x_data<WIDTH&&y_data<HEIGHT)?framebuffer[y_data*HEIGHT+x_data]:8'b0;


endmodule