`include "../SDSDKarte/SDKartenLeser.v"

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 10 ns / 1 ns

module sd_tb ();


reg Clock = 0;
reg Reset = 0;
reg [31:0] Adresse = 0
reg Lesen = 0;

wire [31:0] Daten;
wire Fertig;
wire Busy;
wire [4:0] debug; //egal
wire sclk; //egal
wire cs; //egal
wire mosi; //egal

always begin
    #1 Clock = ~Clock; 
end

SDKarte SDKarte(
    .Clock(Clock),
    .Reset(Reset),
    .Adresse(Adresse), 
    .Lesen(Lesen), 
    .Daten(Daten), 
    .Fertig(Fertig), 
    .Busy(Busy), 
    .debug(debug), 

    .miso(0),
    .sclk(sclk), 
    .cs(cs), 
    .mosi(mosi) 
)

initial begin
    Reset = 1;
    #10
    Reset = 0;
    #2

    Adresse = 0;
    Lesen = 1;
    #2
    Lesen = 0;

    #1024
    Adresse = 7;
    Lesen = 1;
    #2
    Lesen = 0;
    #1024
    Adresse = -1;

end

endmodule