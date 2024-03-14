`include "../SDKarte/sd_controller.v"

module SDKarte (
    input Clock,
    input Reset,

    input [31:0] Adresse, //Für 32-Bit Bytes
    input Lesen, // 1: Read operation
    output reg [31:0] Daten, // Data output MSB Bit ganz links => 1. 32 Bit Wort [31:0]
    output reg Fertig, // 1: Data is ready to be read
    output Busy, // gibt an ob gerade beschäftigt


    //SD_controller
    output cs, // Connect to SD_DAT[3].
    output mosi, // Connect to SD_CMD.
    input miso, // Connect to SD_DAT[0].
    output sclk // Connect to SD_SCK.
                // For SPI mode, SD_DAT[2] and SD_DAT[1] should be held HIGH. 
                // SD_RESET should be held LOW.
);

    // Zustandsdefinitionen für den SD-Controller
    localparam IDLE = 3'd0;
    localparam WARTEAUFBYTES = 3'd1;
    localparam BYTE1 = 3'd2;
    localparam BYTE2 = 3'd3;
    localparam BYTE3 = 3'd4;
    localparam BYTE4 = 3'd5;

    // SD CARD INPUTS/OUTPUTS
    reg rd = 0; // Read signal for SD card
    wire [7:0] dout; // data output for read operation
    wire byte_available; // byte can be read
    wire [4:0] status; // status
    wire ready;
    wire [31:0] sektorAdresse;
    
    reg [3:0] state = IDLE;
    reg [8:0] byteZaehler = 0;

    assign sektorAdresse = {Adresse[29:6], 8'b0}; //Adresse wird von 8-Bit auf 32-Bit Bytes konvertiert, für Sektoradresse werden die ersten 9 Bits ignoriert
    assign Busy = ~ready;

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
        .ready_for_next_byte(0),
        .reset(Reset),
        .ready(ready),
        .address(sektorAdresse),
        .clk(Clock),
        .status(status)
    );

    always @(posedge Busy) begin
            Fertig <= 0;
            rd <= 0;
    end

    always @(posedge Clock or posedge Reset) begin
        if(Reset)
            byteZaehler <= 0;
        else begin
            if((state != IDLE || byteZaehler != 0) && byte_available)
                byteZaehler <= byteZaehler + 1;
            else if(state == IDLE)
                byteZaehler <= 0;
        end

    end

    // Zustandsautomat für den SD-Controller
    always @(posedge Clock or posedge Reset) begin
        if (Reset) begin
            Daten <= 0;
            Fertig <= 0;
            state <= IDLE;
            rd <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (Lesen && ready) begin
                        state <= WARTEAUFBYTES;
                        rd <= 1;
                    end
                end
                BYTE1: begin
                    if (byteZaehler == (Adresse[6:0] << 2) && byte_available) begin
                        Daten[31:24] <= dout;
                        state <= BYTE2;
                    end
                end
                BYTE2: begin
                    if (byte_available) begin
                        Daten[23:16] <= dout;
                        state <= BYTE3;
                    end
                end
                BYTE3: begin
                    if (byte_available) begin
                        Daten[15:8] <= dout;
                        state <= BYTE4;
                    end
                end
                BYTE4: begin
                    if (byte_available) begin
                        Daten[7:0] <= dout;
                        rd <= 0;
                        Fertig <= 1;
                        state <= IDLE;
                    end
                end
                default: state <= IDLE;
            endcase
        end
    end

endmodule
