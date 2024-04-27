`include "../SDKarte/SDKartenLeser.v"

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
    reg [31:0] Adresse = 31'b0;
    reg Lesen = 1'b0;
    wire [31:0] Daten;
    wire Fertig;
    wire  Busy;
    wire [4:0] debug;
    reg reset = 0;

    SDKarte sdkart(
        .Clock(clk_25mhz),
        .Reset(reset),
        .Adresse(Adresse),
        .Lesen(Lesen),
        .Daten(Daten),
        .Fertig(Fertig),
        .Busy(Busy),
        .cs(sd_d[3]),
        .mosi(sd_cmd),
        .miso(sd_d[0]),
        .sclk(sd_clk),
        .debug(debug),
    );

reg [24:0] counter = 1;
reg [24:0] resetcounter = ~0;

always @(posedge clk_25mhz) begin
    if(resetcounter != 0) begin
        resetcounter = resetcounter -1;
        reset = 1;
    end
    else
        reset = 0;
end

always @(posedge clk_25mhz) begin
    if(reset) begin
        Adresse = ~0;
        counter = 0;
    end
    else if(~Busy && counter == 23'b0) begin
        Adresse <= Adresse + 1;
        counter <= +1;
        Lesen <= 1;
    end
    else if(~Busy) begin
        Lesen <= 0;
        counter <= counter +1;
    end
end

assign led[3:0] = Daten[27:24];
assign led[7:4] = Adresse[3:0];

endmodule
