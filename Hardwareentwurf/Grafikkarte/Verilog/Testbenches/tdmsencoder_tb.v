// Code generated by Icestudio 0.10
// Sat, 18 Mar 2023 19:02:50 GMT

// Testbench template
`include "../hdmivideo.v"
`include "../tmds_encoder.v"
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 10 ns / 1 ns
`define assert(signal, value) \
        if (signal !== value) begin \
            $display("ASSERTION FAILED in %m: signal != value"); \
            $finish; \
        end

module main_tb
;
 
 // Simulation time: 100ns (10 * 10ns)
 // Parameter für die Testbench
  // Signale Bildpuffer

  reg pixclk;
  reg [7:0] pixelData;
  
  wire[9:0] x;
  wire[9:0] y;

  wire[2:0] TMDS_rgb_p, TMDS_rgb_n;
  wire TMDS_clock_p, TMDS_clock_n;

  hdmivideo HDMIVideo (
    .pixclk(pixclk),
    .pixelData(pixelData),
    .x(x),
    .y(y),
    .TMDS_rgb_p(TMDS_rgb_p),
    .TMDS_rgb_n(TMDS_rgb_n),
    .TMDS_clock_p(TMDS_clock_p),
    .TMDS_clock_n(TMDS_clock_n)
  );

initial begin
    pixclk = 0;
    pixelData = 0;
end

always begin
   #25 pixclk = ~pixclk; 
end
    integer i;
    initial begin
        $dumpvars(0, main_tb);
        $display("Start of simulation");

        #50
        for(i = 0; i< 255; i = i+1) begin
        #50 pixelData <= i;
        end
        #100
        $display("End of simulation");
        $finish;
    end
 
endmodule

///// MODULE ZUM TESTEN
module ODDRX1F(
    input D0,
    input D1,
    input SCLK,
    input RST,
    output reg Q 
);

always @(posedge SCLK) begin
    if (RST == 1) begin
        Q <= 0;
    end
    else begin
        Q <= D0;
    end
end
always @(negedge SCLK) begin
    if (RST == 1) begin
        Q <= 0;
    end
    else begin
        Q <= D1;
    end
end

endmodule 

module HDMI_clock(
  input clk,
  output half_hdmi_clk
);

 reg clktest;
 
 initial begin
 clktest = 0;
 end
 
 always begin
   #5 clktest = ~clktest; 
 end

 assign half_hdmi_clk = clktest;

endmodule