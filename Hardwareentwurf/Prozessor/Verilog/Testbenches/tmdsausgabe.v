// Code generated by Icestudio 0.10
// Sat, 18 Mar 2023 19:02:50 GMT

// Testbench template
`include "../Bildpuffer.v"
`include "../TMDS_encoder.v"
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

  reg clk;
  reg clk10;

  reg rst;
  reg [15:0] x;
  reg [15:0] y;
  reg [7:0] color;
  reg write;

  wire [15:0] bildX;
  wire [15:0] bildY;
  wire [7:0] pixelData;

    //Signale 	TMD
  wire [2:0] TMDSp;
  wire [2:0] TMDSn;

    

 // Module instance
  Bildpuffer bildpuffer (
    .clk(clk), //von außen
    .rst(rst), //von außen
    .x(x),  //von benutzer
    .y(y),  //von benutzer
    .color(color), //von benutzer
    .write(write), //von benutzer
    .x_data(bildX), //von TMDS .
    .y_data(bildY), //von TMDS .
    .pixelData(pixelData) //an TMDS .
  );

  HDMI_Schnittstelle HDMI_Schnittstelle (
    .pixclk(clk), //von außen
    .TMDSp(TMDSp), //nach außen
    .TMDSn(TMDSn), //nach außen
    .clk_TMDS(clk10), //von außen
    .pixelDaten(pixelData), //von Bildpuffer .
    .pixelX(bildX), //an Bildpuffer .
    .pixelY(bildY)  //an Bildpuffer .
  );

  integer i;

initial begin
    clk = 1'b0;
    clk10= 1'b0;
end

always begin
   #1000 clk = ~clk; 
end
always begin
  #100 clk10 = ~clk10;
end
    initial begin
        $dumpvars(0, main_tb);
        rst = 1;
        write = 1;
        #1700
        rst = 0;
        #200
        $display("Start of simulation");
        
        for(i = 0; i<2000;i++) 
        begin
            #2000
            x <=i%800;
            y <=i%525;
            color <= i%128;
        end

        #100
        $display("End of simulation");
        $finish;
    end
 
endmodule
