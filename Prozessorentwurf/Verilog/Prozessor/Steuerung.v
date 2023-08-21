module Steuerung (
    input [5:0] Funktionscode,
    input LoadBefehl,
    input StoreBefehl,
    input JALBefehl,
    input UnbedingterSprungBefehl,
    input BedingterSprungBefehl,
    input Bedingung,
    input BefehlGeladen,
    input DatenGeladen,
    input DatenGespeichert,
    input Reset,
    input Clock,

    output reg RegisterSchreibSignal,
    output reg ALUStartSignal,
    output reg ALUSchreibSignal,
    output reg LoadBefehlSignal,
    output reg LoadDatenSignal,
    output reg StoreDatenSignal,
    output PCSprungSignal,
    output reg PCSignal,
    output reg DekodierSignal,
    output reg ResetSignal
);

localparam FETCH = 3'b000;
localparam DECODE = 3'b001;
localparam ALU_1 = 3'b010;
localparam ALU_2 = 3'b011;
localparam WRITEBACK_JUMP = 3'b100;
localparam WRITEBACK_STORE = 3'b101;
localparam WRITEBACK_LOAD = 3'b110;
localparam WRITEBACK_DEFAULT = 3'b111;

reg [2:0] state;
reg [31:0] tick;

always @(posedge Clock) begin
    if (Reset == 1) begin
            RegisterSchreibSignal <= 0;
            ALUStartSignal <= 0;
            ALUSchreibSignal <= 0;
            LoadDatenSignal <= 0;
            StoreDatenSignal <= 0;
            PCSignal <= 0;
            DekodierSignal <= 0;

            state <= FETCH;
            tick = 32'b00000000000000000000000000000001;
            LoadBefehlSignal <= 1;
        end
    else begin
        case (state)
            FETCH: begin

                if (BefehlGeladen == 1) begin
                    //Fetch beenden
                    LoadBefehlSignal <= 0;
                    //Decode starten
                    state <= DECODE;
                    DekodierSignal <= 1;
                    tick <= tick << 2 - 1; //DECODETIME = 2
                end

            end
            DECODE: begin

                if (tick[0] != 1)
                    tick <= tick >> 1;
                else begin
                    //Decode beenden
                    DekodierSignal <= 0;
                    //ALU Berechnung starten
                    state <= ALU_1;
                    ALUStartSignal <= 1;
                    if(JALBefehl)
                        RegisterSchreibSignal <= 1;
                    
                    //Setzt die Dauer der Aluberechnung anhand des Funktionscodes
                    //Für Befehl Div.s 32
                    if(Funktionscode == 6'b100100)
                        tick <= tick << 32-1;
                    //Für Befehl Sqrt 16
                    else if(Funktionscode == 6'b000011)
                        tick <= tick << 16-1;
                    //Für Befehl Sqrt.s 10
                    else if(Funktionscode == 6'b100011)
                        tick <= tick << 10-1;
                    //Für Befehle Mod, Mul.s 9
                    else if(Funktionscode == 6'b000101 || Funktionscode == 6'b100010)
                        tick <= tick << 9-1;
                    //Für Befehle Div, Add.s, Sub.s 7
                    else if(Funktionscode == 6'b000100 || Funktionscode == 6'b100000 || Funktionscode == 6'b100001)
                        tick <= tick << 7-1;
                    //Für alle anderen Befehle 1
                    //keine Zuweisung nötig
                end

            end
            ALU_1: begin

                if (tick[0] != 1)
                    tick <= tick >> 1;
                else begin
                    //ALU Berechnung beenden
                    ALUStartSignal <= 0;
                    //ALU Schreiben starten
                    state <= ALU_2;
                    ALUSchreibSignal <= 1;
                end

            end
            ALU_2: begin

                //ALU Schreiben beenden
                ALUSchreibSignal <= 0;
                //falls RegisterSchreibSignal 1 war
                RegisterSchreibSignal <= 0;
                
                if(UnbedingterSprungBefehl || BedingterSprungBefehl) begin
                    //Writeback starten
                    state <= WRITEBACK_JUMP;
                end
                else if(StoreBefehl == 1) begin
                    //Speichern und Writeback starten
                    state <= WRITEBACK_STORE;
                    StoreDatenSignal <= 1;
                end
                else if(LoadBefehl == 1) begin
                    //Laden und Writeback starten
                    state <= WRITEBACK_LOAD;
                    LoadDatenSignal <= 1;
                end
                else begin
                    //Register Schreiben und Writeback starten
                    state <= WRITEBACK_DEFAULT;
                    RegisterSchreibSignal <= 1;
                end
                PCSignal <= 1;
            
            end
            WRITEBACK_JUMP: begin

                PCSignal <= 0;
                //Fetch starten
                state <= FETCH;
                LoadBefehlSignal <= 1;

            end
            WRITEBACK_STORE: begin
            
                if(DatenGespeichert == 1) begin
                    //Speichern und Writeback beenden
                    PCSignal <= 0;
                    StoreDatenSignal <= 0;
                    //Fetch starten
                    state <= FETCH;
                    LoadBefehlSignal <= 1;
                end

            end
            WRITEBACK_LOAD: begin
            
                if(DatenGeladen == 1) begin
                    //Laden beenden
                    LoadDatenSignal <= 0;
                    //Register Schreiben starten
                    state <= WRITEBACK_DEFAULT;
                    RegisterSchreibSignal <= 1;
                end

            end
            WRITEBACK_DEFAULT: begin

                //Register Schreiben und Writeback beenden
                PCSignal <= 0;
                RegisterSchreibSignal <= 0;
                //Fetch starten
                state <= FETCH;
                LoadBefehlSignal <= 1;

            end
        endcase
    end
end

assign PCSprungSignal = UnbedingterSprungBefehl || (BedingterSprungBefehl && Bedingung);

endmodule