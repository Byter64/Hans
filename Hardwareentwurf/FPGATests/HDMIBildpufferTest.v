`include "../Prozessor/Verilog/HDMI_test_DDR.v"
`include "../Prozessor/Verilog/TMDS_encoder.v"
`include "../Prozessor/Verilog/HDMI_clock.v"
`include "../Prozessor/Verilog/Bildpuffer.v"

module Top
(
    input clk_25mhz,
    output[3:0] gpdi_dp//,
    //output[3:0] gpdi_dn
    
);

wire [7:0] x;
wire [7:0] y;
 // Input/Output

HDMI_test_DDR HDMIVideo
(
    .pclk(clk_25mhz),
    .pixelData(pixelData),
    .x(x),
    .y(y),
    .gpdi_dp(gpdi_dp)
);

reg reset = 1;
reg [7:0] color = 8'b0;
reg write = 1;

reg [7:0] x_data = 8'b0, y_data = 8'b0;

wire[7:0] pixelData;


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

reg[3:0] counter = 3'b111;

always @(posedge clk_25mhz) begin
    if(counter > 0) begin
        counter <= counter - 1;
    end
    else begin
        reset = 0;
    end
end

always @(posedge clk_25mhz) begin

    if(x_data == 160)
    x_data <= 0;
    else
    x_data <= x_data + 1;
    if(y_data == 120)
    y_data <= 0;
    else
    y_data <= y_data + 1;
 
    color <= {x_data[3:1],y_data[7:5],x_data[0],y_data[0]};


end

endmodule
