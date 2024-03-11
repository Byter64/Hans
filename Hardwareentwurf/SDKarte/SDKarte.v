
module SDKarte (
    input Clock, // Clock 
    input Reset,

    // Interface
    input [31:0] Adresse, // The address from which to read [31:12]: Sektor Adresse [11:6]: Daten Adresse [5:0]: unused 
    input Lesen, // 1: Read operation
    output reg [31:0] Daten, // Data output
    output reg Fertig, // 1: Data is ready to be read
    output wire Busy, // gibt an ob gerade beschäftigt

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
    localparam COUNTING = 2'd1;
    localparam READING = 2'd2;
    localparam OUTPUT_READY = 2'd3;

    wire [6:0] DatenAdresse;
    assign DatenAdresse = Adresse [11:6];
    wire [31:0] SektorAdresse;
    assign SektorAdresse = {Adresse [31:12],12'b0}; // Nur bei SD-Controller genutzt <<12
    assign Busy = ~ready;
    // Zustands- und Zählerregistervariablen für den SD-Controller
    reg [2:0] state = IDLE;
    reg [1:0] byte_count = 0;
    reg [6:0] DatenCounter = 0; 

    // Zustandsautomat für den SD-Controller
    always @(posedge Clock or posedge Reset) begin
        if (Reset) begin
            state <= IDLE;
            byte_count <= 0;
            Daten <= 0;
            Fertig <= 0;
            DatenCounter <= 0;
        end else begin
            case (state)
                IDLE: begin
                    Fertig <= 0;
                    if (Lesen && ready) begin
                        DatenCounter <= DatenAdresse;
                        if(DatenAdresse == 7'b0) begin
                            state <= READING;
                        end
                        else begin
                            state <= COUNTING;
                        end
                        rd <= 1;
                    end
                end
                COUNTING: begin
                    rd <= 0;
                    if(byte_available) begin
                        if(DatenCounter != 0)begin
                            if(byte_count == 2'b11) begin
                                byte_count <= 2'b00;
                                DatenCounter <= DatenCounter - 1;
                            end
                            else begin
                                byte_count <= byte_count + 1;
                            end
                        end
                        else begin
                            state <= READING;
                            byte_count <= 2'b00;
                        end
                    end
                end
                READING: begin
                    rd <= 0;
                    if (byte_available) begin
                        if(byte_count == 2'b00) begin
                            Daten[7:0] <= dout;
                            byte_count <= byte_count + 1;
                        end
                        else if (byte_count == 2'b01) begin
                            Daten[15:8] <= dout;
                            byte_count <= byte_count + 1;
                        end
                        else if (byte_count == 2'b10) begin
                            Daten[23:16] <= dout;
                            byte_count <= byte_count + 1;
                            state <= OUTPUT_READY;
                        end
                        else begin
                            state <= OUTPUT_READY;
                            Daten <= 32'b1;
                        end
                    end
                end
                OUTPUT_READY: begin
                    Daten[31:24] = dout;
                    byte_count <= 0;
                    Fertig <= 1;
                    state <= IDLE;
                end
                default: state <= IDLE;
            endcase
        end
    end

endmodule
