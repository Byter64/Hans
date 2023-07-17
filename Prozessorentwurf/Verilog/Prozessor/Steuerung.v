module Steuerung #(
    parameter DECODETIME = 4,
    parameter REGISTERWRITETIME = 2, //sollte die Register Schreib Zeit größer als die Alu Zeit sein, dann Blick in Dokumentation werfen
    parameter ALUTIME = 3,
    parameter PCWRITETIME = 1
) (
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
reg [3:0] tick;

always @(posedge Reset) begin
    ResetSignal = 1;
    tick = 4'b0001;
    tick = tick << 2;
end

always @(posedge Clock) begin
    if (ResetSignal == 1) begin
        if (tick[0] != 1)
            tick <= tick >> 1;
        else begin
            ResetSignal <= 0;

            RegisterSchreibSignal <= 0;
            ALUStartSignal <= 0;
            ALUSchreibSignal <= 0;
            LoadDatenSignal <= 0;
            StoreDatenSignal <= 0;
            PCSignal <= 0;
            DekodierSignal <= 0;

            state <= FETCH;
            LoadBefehlSignal <= 1;
        end
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
                    tick <= tick << DECODETIME-1;
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
                    //TODO Funktionscode Lookup Table
                    tick <= tick << ALUTIME-1;
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
                    tick <= tick << PCWRITETIME-1;
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
                    tick <= tick << REGISTERWRITETIME-1;
                end
                PCSignal <= 1;
            
            end
            WRITEBACK_JUMP: begin

                if (tick[0] != 1)
                    tick <= tick >> 1;
                else begin
                    //Writeback beenden
                    PCSignal <= 0;
                    //Fetch starten
                    state <= FETCH;
                    LoadBefehlSignal <= 1;
                end

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
                    tick <= tick << REGISTERWRITETIME-1;
                end

            end
            WRITEBACK_DEFAULT: begin

                if (tick[0] != 1)
                    tick <= tick >> 1;
                else begin
                    //Register Schreiben und Writeback beenden
                    PCSignal <= 0;
                    RegisterSchreibSignal <= 0;
                    //Fetch starten
                    state <= FETCH;
                    LoadBefehlSignal <= 1;
                end

            end
        endcase
    end
end

assign PCSprungSignal = UnbedingterSprungBefehl || (BedingterSprungBefehl && Bedingung);

//always @(UnbedingterSprungBefehl, BedingterSprungBefehl, Bedingung) begin
//    if(UnbedingterSprungBefehl == 1 or (BedingterSprungBefehl == 1 and Bedingung == 1))
//        PCSprungSignal <= 1;
//    else
//        PCSprungSignal <= 0;
//end

endmodule