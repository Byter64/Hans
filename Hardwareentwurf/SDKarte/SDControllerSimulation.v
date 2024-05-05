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
    daten[0] <= 8'h00;
    daten[1] <= 8'h00;
    daten[2] <= 8'h00;
    daten[3] <= 8'h0F;

    daten[4] <= 8'h80;
    daten[5] <= 8'h40;
    daten[6] <= 8'h00;
    daten[7] <= 8'h0F;

    daten[8] <= 8'h00;
    daten[9] <= 8'h20;
    daten[10] <= 8'h00;
    daten[11] <= 8'h00;

    daten[12] <= 8'h83;
    daten[13] <= 8'hE0;
    daten[14] <= 8'h00;
    daten[15] <= 8'h01;
    
    daten[16] <= 8'h9B;
    daten[17] <= 8'hFF;
    daten[18] <= 8'h00;
    daten[19] <= 8'h1F;

    daten[20] <= 8'h00;
    daten[21] <= 8'h21;
    daten[22] <= 8'h10;
    daten[23] <= 8'h00;

    daten[24] <= 8'h84;
    daten[25] <= 8'h42;
    daten[26] <= 8'h00;
    daten[27] <= 8'h01;

    daten[28] <= 8'h00;
    daten[29] <= 8'h62;
    daten[30] <= 8'h00;
    daten[31] <= 8'h08;
    
    daten[32] <= 8'hE8;
    daten[33] <= 8'h3F;
    daten[34] <= 8'h00;
    daten[35] <= 8'h00;

    daten[36] <= 8'hF4;
    daten[37] <= 8'h03;
    daten[38] <= 8'hFF;
    daten[39] <= 8'hFB;
    
    daten[40] <= 8'h43;
    daten[41] <= 8'hFF;
    daten[42] <= 8'hFF;
    daten[43] <= 8'hFF;
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