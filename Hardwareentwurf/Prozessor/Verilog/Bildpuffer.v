module Bildpuffer (
  input clk,
  input rst,
  input [15:0] x,
  input [15:0] y,
  input [7:0] color,
  input write,
  input [15:0] x_data,
  input [15:0] y_data,
  output [7:0] pixelData
);

  integer i = 0;
  integer j = 0;

  reg [7:0] framebuffer [799:0][524:0];

  always @(posedge clk) begin
    if(rst) begin
      for (i = 0; i < 799; i = i + 1) begin
        for (j = 0; j < 524; j = j + 1) begin
          framebuffer[i][j] <= 8'b0;
        end
      end
    end    
    else if (write) begin
      if(x<800&&y<525) begin
         framebuffer[x][y] <= color;
      end
    end
  end

  assign pixelData = (x_data<800&&y_data<525)?framebuffer[x_data][y_data]:8'b0;


endmodule