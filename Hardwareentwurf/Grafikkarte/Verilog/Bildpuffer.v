module Bildpuffer (
  input clk_in,  //clk von Prozessor oder GPU
  input clk_out, //clk von HDMI_transmitter 25MHZ

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

  reg [BITSPERPIXEL-1:0] ram[WIDTH*HEIGHT-1:0];

  assign pixelData = (x_data < WIDTH && y_data < HEIGHT)? ram[y_data*WIDTH+x_data] : 8'b0;

  always @(posedge clk_in) begin
    if (write&&y<HEIGHT&&x<WIDTH) begin
      ram[y*WIDTH+x] <= color;
    end
  end

  

endmodule
