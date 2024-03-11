
`include "../SDKarte/SDKarte.v"
`include "../SDKarte/sd_controller.v"
module Top
(
    input clk_25mhz,
    output sd_cmd,      //mosi
    inout [3:0] sd_d,    //miso //cs
    output sd_clk,
    output [7:0] led
    
);

    wire heldHigh = 1'b1;
    assign sd_d[1] = heldHigh;
    assign sd_d[2] = heldHigh;

    reg [25:0] Adresse = 25'b0000000000000000000000000;
    reg Lesen = 1'b0;
    wire [31:0] VollAdresse = {Adresse,6'b0};
    wire [31:0] Daten;
    wire Fertig;
    wire  Busy;

    SDKarte sdkart(
        .Clock(clk_25mhz),
        .Reset(1'b0),
        .Adresse(VollAdresse),
        .Lesen(Lesen),
        .Daten(Daten),
        .Fertig(Fertig),
        .Busy(Busy),
        .cs(sd_d[3]),
        .mosi(sd_cmd),
        .miso(sd_d[0]),
        .sclk(sd_clk)
    );

    reg [22:0] counter;

always @(posedge clk_25mhz) begin
    if(~Busy && counter == 23'b0) begin
        Adresse <= Adresse + 1;
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
