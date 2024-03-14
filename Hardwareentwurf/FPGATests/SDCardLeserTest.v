
`include "../SDKarte/SDKarte.v"

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
    reg [19:0] Adresse = 19'b0000000000000000000000000;
    reg Lesen = 1'b1;
    wire [31:0] VollAdresse = {Adresse,12'b0};
    wire [4095:0] Daten;
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

    reg [22:0] counter = -1;

always @(posedge clk_25mhz) begin
    if(~Busy && counter == 23'b0) begin
        Adresse <= Adresse + 1;
        counter <= -1;
    end
    else begin
        counter <= counter -1;
    end
end

assign led[7] = Busy;
assign led[6] = Lesen;
assign led[5:2] = 0;
assign led[1:0] = sdkart.state;

endmodule
