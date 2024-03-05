
`include "../SDKarte/SDKarte.v"
`include "../SDKarte/sd_controller.v"
module Top
(
    input clk_25mhz,
    output sd_cmd,      //mosi
    inout [3:0] sd_dat,    //miso //cs
    output sd_sclk,
    output [7:0] led
    
);

    wire heldHigh = 1'b1;
    assign sd_dat[1] = heldHigh;
    assign sd_dat[2] = heldHigh;

    reg [31:0] Adresse = 32'b00001010010001011011011011001101;
    reg Lesen = 1'b0;

    wire [31:0] Daten;
    wire Fertig;
    wire  Busy;

    SDKarte sdkart(
        .Clock(clk_25mhz),
        .Reset(1'b0),
        .Adresse(Adresse),
        .Lesen(Lesen),
        .Daten(Daten),
        .Fertig(Fertig),
        .Busy(Busy),
        .cs(sd_dat[3]),
        .mosi(sd_cmd),
        .miso(sd_dat[0]),
        .sclk(sd_sclk)
    );

    reg [22:0] counter;

always @(posedge clk_25mhz) begin
    if(~Busy && counter == 23'b0) begin
        Adresse <= Adresse + Adresse;
        Lesen <= 1'b1;
        counter <= 23'b1;
    end
    else begin
        if(Busy) begin
        Lesen <= 1'b0;
        end
        counter <= counter -1;
    end
end

assign led = Daten[7:0];



endmodule
