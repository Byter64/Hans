module Bildpuffer (
  input clk,
  input rst,
  input [15:0] x,
  input [15:0] y,
  input [7:0] color,
  input write,
  output wire [7:0] pixel
);

  parameter HEIGHT = 1024;
  parameter WIDTH = 768;
  parameter BITS_PER_PIXEL = 8;

  reg [BITS_PER_PIXEL-1:0] framebuffer [HEIGHT-1:0][WIDTH-1:0];

  always @(posedge clk) begin
    if (rst) begin
      for (integer i = 0; i < HEIGHT; i++) begin
        for (integer j = 0; j < WIDTH; j++) begin
          framebuffer[i][j] = 8'b0;
        end
      end
    end else begin
      if(write) begin
        framebuffer[y][x] = color;
      end
    end
  end

  assign pixel = framebuffer[y][x];


endmodule