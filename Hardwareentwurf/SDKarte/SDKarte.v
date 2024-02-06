module SDKarteWithSDController (
    input Clock, // Clock 
    input Reset,

    // Interface
    input [31:0] Adresse, // The address from which to read
    input Lesen, // 1: Read operation
    output [31:0] Daten, // Data output
    output Fertig, // 1: Data is ready to be read
    output Busy, // gibt an ob gerade beschäftigt

    output reg cs, // Connect to SD_DAT[3].
    output mosi, // Connect to SD_CMD.
    input miso, // Connect to SD_DAT[0].
    output sclk // Connect to SD_SCK.
                // For SPI mode, SD_DAT[2] and SD_DAT[1] should be held HIGH. 
                // SD_RESET should be held LOW.
);

    // SD CARD INPUTS/OUTPUTS
    reg rd = 0;
    wire [7:0] dout; // data output for read operation
    wire byte_available; // byte can be read
    wire [4:0] status; // status
    wire ready;

    // Verbindung zum SD-Controller
    sd_controller sd1 (
        .cs(cs),
        .mosi(mosi),
        .miso(miso),
        .sclk(sclk),
        .rd(rd),
        .dout(dout),
        .byte_available(byte_available),
        .wr(0),
        .din(8'b0),
        .ready_for_next_byte(0),
        .reset(Reset),
        .ready(ready),
        .address(Adresse),
        .clk(Clock),
        .status(status)
    );

    // Zustandsdefinitionen für den SD-Controller
    parameter IDLE = 2'd0;
    parameter BUSY_STATE = 2'd1;
    parameter OUTPUT_READY = 2'd2;
    
    // Zustands- und Zählerregistervariablen für den SD-Controller
    reg [1:0] state = IDLE;
    reg [1:0] byte_count = 0;

    // Zustandsautomat für den SD-Controller
    always @(posedge Clock or posedge Reset) begin
        if (Reset) begin
            state <= IDLE;
            byte_count <= 0;
            Daten <= 0;
            Fertig <= 0;
            Busy <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (Lesen && ready) begin
                        rd <= 1;
                        state <= BUSY_STATE;
                        Busy <= 1;
                    end
                end
                BUSY_STATE: begin
                    if (byte_available) begin
                        if(byte_count == 0)
                            rd <= 0;
                            Daten[7:0] <= dout;
                        if(byte_count == 1)
                            Daten[15:8] <= dout;
                        if(byte_count == 2)
                            Daten[23:16] <= dout;
                        byte_count <= byte_count + 1;
                        if (byte_count == 3) begin
                            state <= OUTPUT_READY;
                        end
                    end
                end
                OUTPUT_READY: begin
                    Daten[31:24] = dout;
                    byte_count <= 0;
                    Fertig <= 1;
                    Busy <= 0;
                    state <= IDLE;
                end
                default: state <= IDLE;
            endcase
        end
    end

endmodule
