
module Loader (
    input Clock, // Clock 
    input Reset,

    // SDKarte
    output reg [31:0] SDAdresse, //SektorenAdresse -Erste 12 Bits werden Ignoriert
    output reg Lesen, // 1: Read operation
    input [4095:0] Daten, // Data output
    input Fertig, // 1: Data is ready to be read
    input Busy, // gibt an ob gerade beschäftigt

    // ZU RAM

    output reg [31:0] RAMAdresse, //Adresse
    output [31:0] DatenRaus, //DatenRein
    output reg Schreiben, //Schreiben an

    //Global
    output reg SchreibenFertig // gibt an wann es alles fertig geschrieben hat 
);



    // Zustandsdefinitionen für den SD-Controller
    localparam READING = 2'd0;
    localparam WAITING = 2'd1;
    localparam WRITING = 2'd2;
    localparam DONE = 2'd3;

    reg [31:0] Counter = 32'b0;
    reg [31:0] SektorAdresse = 32'b0;
    reg [31:0] AnzahlBefehle = 32'b0;
    reg [4095:0] TempData = 4096'b0;
    reg[6:0] WortCounter = 7'b0;
    // Zustands- und Zählerregistervariablen für den SD-Controller
    reg [2:0] state = READING;

    // Zustandsautomat für den SD-Controller
    always @(posedge Clock or posedge Reset) begin
        if (Reset) begin
            state <= READING;
            Counter <= 32'b0;
            SektorAdresse <= 32'b0;
            Schreiben <= 0;
            SchreibenFertig <= 0;
            AnzahlBefehle <= 32'b0;
            TempData = 4096'b0;
            WortCounter = 7'b0;
        end else begin
            case (state)
                READING: begin
                    Lesen <= 1;
                    SDAdresse <= SektorAdresse;
                    if(Busy) begin
                        state <= WAITING;
                    end
                end
                WAITING: begin
                    Lesen <= 0;
                    if(Fertig) 
                        state <= WRITING;
                        TempData <= Daten;
                end
                WRITING: begin
                    if(Counter == 0)begin
                        AnzahlBefehle <= TempData[31:0];
                        Counter <= Counter + 1;
                    end 
                    else if(WortCounter == 7'b1111111) begin
                        WortCounter <= 0;
                        Schreiben <= 0;
                        state <= READING;
                        SektorAdresse <= SektorAdresse + 1;    
                    end
                    begin
                        if(Counter > AnzahlBefehle) begin
                            state <= DONE;
                        end
                        else begin
                            WortCounter <= WortCounter + 1;
                            TempData <= TempData >> 32;
                            Schreiben <= 1;
                            RAMAdresse <= Counter - 1;
                            Counter <= Counter + 1;
                        end
                    end
                end
                DONE: begin
                        SchreibenFertig <= 1;
                        Schreiben <= 0;
                        Lesen <= 0;
                end
                default: state <= DONE;
            endcase
        end
    end

    assign DatenRaus = TempData[31:0];

endmodule
