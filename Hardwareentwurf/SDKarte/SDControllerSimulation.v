module sd_controller (
    output reg cs, // egal
    output mosi, // egal
    input miso, // egal
    output sclk, //egal
    output [4:0] status, // egal
    input wr,   // egal
    input [7:0] din, // egal
    output reg ready_for_next_byte, // egal

    input rd,   // Read-enable. When [ready] is HIGH, asseting [rd] will 
                // begin a 512-byte READ operation at [address]. 
                // [byte_available] will transition HIGH as a new byte has been
                // read from the SD card. The byte is presented on [dout].
    output reg [7:0] dout, // Data output for READ operation. [0-7]
    output reg byte_available, // A new byte has been presented on [dout].

    input reset, // Resets controller on assertion. (HIGH == Reset)
    output ready, // HIGH if the SD card is ready for a read or write operation.
    input [31:0] address,   // Memory address for read/write operation. This MUST 
                            // be a multiple of 512 bytes, due to SD sectoring.
    input clk  // 25 MHz clock.
);

localparam IDLE = 2'b0;
localparam LESEN = 2'b1;
localparam BEENDEN = 2'b10;

reg [7:0] daten[4096:0];
reg [8:0] byteAdresse;
wire [22:0] sekAdresse;
reg [2:0] zustand = IDLE;

assign ready = ~reset && zustand == IDLE;
assign sekAdresse = address[31:9];

initial begin
    daten[0] <= 8'd10;
    daten[1] <= 8'd250;
    daten[2] <= 8'd0;
    daten[3] <= 8'd33;
    daten[4] <= 8'd2;
    daten[5] <= 8'd148;
    daten[6] <= 8'd227;
    daten[7] <= 8'd1;
end

always @(posedge clk) begin
    if(reset) begin
        dout <= 0;
        byte_available <= 0;
        byteAdresse <= 0;
    end
    else begin
        case (zustand)
            IDLE: begin
                byteAdresse <= 0;
                if(ready && rd)
                    zustand <= LESEN; 
            end
            LESEN: begin
                if(byte_available == 1) byte_available <= 0;
                else begin
                    byte_available <= 1;
                    byteAdresse <= byteAdresse + 1;
                    dout <= daten[{sekAdresse, byteAdresse}];

                    if(byteAdresse == 511)begin
                        zustand <= BEENDEN;
                    end
                end
            end
            BEENDEN: begin
                zustand <= IDLE;
                byte_available <= 0;
                dout <= 0;
            end
        endcase
    end
end

endmodule