`ifdef IVERILOG
    `include "../SDKarte/SDControllerSimulation.v"
`else
    `include "../SDKarte/sd_controller.v"
`endif

module SDKarte (
    input Clock,
    input Reset,

    input [31:0] Adresse, //Für 32-Bit Bytes
    input Lesen, // 1: Read operation
    output reg [31:0] Daten, // Data output MSB Bit ganz links => 1. 32 Bit Wort [31:0]
    output reg Fertig, // 1: Data is ready to be read
    output reg Busy, // gibt an ob gerade beschäftigt
    output [4:0] debug, //Vom SD-Card Controller


    //SD_controller
    input miso, // Connect to SD_DAT[0].
    output sclk, // Connect to SD_SCK.
    output cs, // Connect to SD_DAT[3].
    output mosi, // Connect to SD_CMD.
                // For SPI mode, SD_DAT[2] and SD_DAT[1] should be held HIGH. 
                // SD_RESET should be held LOW.
);

    // Zustandsdefinitionen für den SD-Controller
    localparam INITIALISIEREN = 3'd0;
    localparam IDLE = 3'd1;
    localparam BYTE1 = 3'd2;
    localparam BYTE2 = 3'd3;
    localparam BYTE3 = 3'd4;
    localparam BYTE4 = 3'd5;
    localparam SEKTORFERTIGLESEN = 3'd6;

    // SD CARD INPUTS/OUTPUTS
    reg rd = 0; // Read signal for SD card
    wire [7:0] dout; // data output for read operation
    wire byte_available; // byte can be read
    wire ready;
    wire [31:0] sektorAdresse;
    wire egal;
    
    reg [3:0] state = IDLE;
    reg [8:0] byteZaehler = 0;

    assign sektorAdresse = {Adresse[29:6], 8'b0}; //Adresse wird von 8-Bit auf 32-Bit Bytes konvertiert, für Sektoradresse werden die ersten 9 Bits ignoriert
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
        .ready_for_next_byte(egal),
        .reset(Reset),
        .ready(ready),
        .address(sektorAdresse),
        .clk(Clock),
        .status(debug)
    );

    always @(posedge Clock or posedge Reset) begin
        if(Reset)
            byteZaehler <= 0;
        else begin
            if((state != IDLE) && byte_available)
                byteZaehler <= byteZaehler + 1;
            else if (state == IDLE) begin
                byteZaehler <= 0;
            end
        end

    end

    // Zustandsautomat für den SD-Controller
    always @(posedge Clock) begin
        if (Reset) begin
            Daten <= 0;
            Fertig <= 0;
            state <= INITIALISIEREN;
            rd <= 0;
            Busy <= 1;
        end else begin
            case (state)
                INITIALISIEREN:begin
                    Busy <= 1;
                    if(ready) begin
                        state = IDLE;
                    end
                end
                IDLE: begin
                    Busy <= 0;
                    if (Lesen && ready) begin
                        state <= BYTE1;
                        Busy <= 1;
                        rd <= 1;
                    end
                end
                BYTE1: begin
                    Busy <= 1;
                    if (byteZaehler == (Adresse[6:0] << 2) && byte_available) begin
                        Daten[31:24] <= dout;
                        state <= BYTE2;
                    end
                end
                BYTE2: begin
                    Busy <= 1;
                    if (byte_available) begin
                        Daten[23:16] <= dout;
                        state <= BYTE3;
                    end
                end
                BYTE3: begin
                    Busy <= 1;
                    if (byte_available) begin
                        Daten[15:8] <= dout;
                        state <= BYTE4;
                    end
                end
                BYTE4: begin
                    Busy <= 1;
                    if (byte_available) begin
                        Daten[7:0] <= dout;
                        rd <= 0;
                        Fertig <= 1;
                        state <= SEKTORFERTIGLESEN;
                    end
                end
                SEKTORFERTIGLESEN: begin
                    if(byteZaehler == 9'd0) begin
                        Busy <= 0;
                        state <= IDLE;
                        rd <= 0;
                        Fertig <= 0;
                    end
                end
                default: state <= IDLE;
            endcase
        end
    end

endmodule
