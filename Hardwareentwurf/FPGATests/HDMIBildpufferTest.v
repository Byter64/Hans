`include "../Grafikkarte/Verilog/HDMI_test_DDR.v"
`include "../Grafikkarte/Verilog/TMDS_encoder.v"
`include "../Grafikkarte/Verilog/HDMI_clock.v"
`include "../Grafikkarte/Verilog/Bildpuffer.v" ///home/timo/Hans/Hardwareentwurf/Grafikkarte/Verilog


module Top
(
    input clk_25mhz,
    output[3:0] gpdi_dp//,
    //output[3:0] gpdi_dn
    
);

wire [7:0] x;
wire [7:0] y;
reg [7:0] pixelData;

reg [7:0] ram [160*120-1:0];
 // Input/Output

HDMI_test_DDR HDMIVideo
(
    .pclk(clk_25mhz),
    .pixelData(pixelData),
    .x(x),
    .y(y),
    .gpdi_dp(gpdi_dp)
);

initial begin
    $readmemb("picture.mem", ram);
end

always @(posedge clk_25mhz) begin
    pixelData = ram[y*160+x];
end

/*
reg reset = 1;
reg [7:0] color = 8'b0;
reg write = 1;

reg [7:0] x_data = 8'b0, y_data = 8'b0;



Bildpuffer Bpuffer
(
    .clk(clk_25mhz),
    .rst(reset),
    .x(x),
    .y(y),
    .color(color),
    .write(write),
    .x_data(x_data),
    .y_data(y_data),
    .pixelData(pixelData)
);
*/



endmodule
