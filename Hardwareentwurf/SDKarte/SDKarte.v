`include "../SDKarte/sd_controller.v"

module SDKarte (
    input Clock, // Clock 
    input Reset,

    // Interface
    input [31:0] Adresse, //SektorenAdresse -Erste 12 Bits werden Ignoriert
    input Lesen, // 1: Read operation
    output reg [4095:0] Daten, // Data output MSB Bit ganz links => 1. 32 Bit Wort [31:0]
    output reg Fertig, // 1: Data is ready to be read
    output wire Busy, // gibt an ob gerade beschäftigt


    //SD_controller
    output cs, // Connect to SD_DAT[3].
    output mosi, // Connect to SD_CMD.
    input miso, // Connect to SD_DAT[0].
    output sclk // Connect to SD_SCK.
                // For SPI mode, SD_DAT[2] and SD_DAT[1] should be held HIGH. 
                // SD_RESET should be held LOW.
);

    // SD CARD INPUTS/OUTPUTS
    reg rd = 0; // Read signal for SD card
    wire [7:0] dout; // data output for read operation
    wire byte_available; // byte can be read
    wire [4:0] status; // status
    wire ready;

    wire ignore;

    // Verbindung zum SD-Controller
    sd_controller sd1 (
        .cs(cs),
        .mosi(mosi),
        .miso(miso),
        .sclk(sclk),
        .rd(rd),
        .dout(dout),
        .byte_available(byte_available),
        .wr(1'b0),
        .din(8'b0),
        .ready_for_next_byte(ignore),
        .reset(Reset),
        .ready(ready),
        .address(SektorAdresse),
        .clk(Clock),
        .status(status)
    );

    // Zustandsdefinitionen für den SD-Controller
    localparam IDLE = 2'd0;
    localparam READING = 2'd2;

    wire [31:0] SektorAdresse;
    assign SektorAdresse = {Adresse [31:12],12'b0}; // Nur bei SD-Controller genutzt <<12
    assign Busy = ~ready;
    // Zustands- und Zählerregistervariablen für den SD-Controller
    reg [2:0] state = IDLE;
    always @(posedge byte_available) begin
        case(state)
            IDLE: begin
                
            end
            READING: begin
                Daten <= {Daten[4087:0],dout};
            end
        endcase
    end
    always @(posedge Busy) begin
            Fertig <= 0;
            rd <= 0;
    end
    // Zustandsautomat für den SD-Controller
    always @(posedge Clock or posedge Reset) begin
        if (Reset) begin
            state <= IDLE;
            Daten <= 0;
            Fertig <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (Lesen && ~ready) begin
                        state <= READING;
                        rd <= 1;
                    end
                end
                READING: begin
                    if (ready) begin
                        state <= IDLE;
                        Fertig <= 1;
                    end
                end
                default: state <= IDLE;
            endcase
        end
    end

endmodule
