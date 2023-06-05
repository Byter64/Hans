module Steuerung #(
    parameter DECODETIME = 4,
    parameter REGISTERWRITETIME = 2, //sollte die Register Schreib Zeit größer als die Alu Zeit sein, dann Blick in Dokumentation werfen
    parameter ALUTIME = 4,
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

    output RegisterSchreibSignal,
    output ALUSignal,
    output LoadBefehlSignal,
    output LoadDatenSignal,
    output StoreDatenSignal,
    output PCSprungSignal,
    output PCSignal,
    output DekodierSignal
);

localparam FETCH = 2'b00;
localparam DECODE = 2'b01;
localparam ALU = 2'b10;
localparam WRITEBACK = 2'b11;

reg [1:0] state;
reg [4:0] tick;

always @(posedge Reset) begin
    state <= FETCH;
    tick <= 5'b00001;
end

always @(posedge Clock) begin
    case (state)
        FETCH: begin

            if(LoadBefehlSignal == 0)
                LoadBefehlSignal <= 1;
            else if(BefehlGeladen == 1) begin
                LoadBefehlSignal <= 0;
                state <= DECODE;
            end

        end
        DECODE: begin

            if(DekodierSignal == 0) begin 
                DekodierSignal <= 1;
                tick << DECODETIME;
            end
            else begin
                tick >> 1;
                if(tick[0] == 1) begin
                    DekodierSignal <= 0;
                    state <= ALU;
                end
            end

        end
        ALU: begin

            if(ALUSignal == 0) begin
                ALUSignal <= 1;
                if(JALBefehl)
                    RegisterSchreibSignal <= 1;
                tick << ALUTIME;
            end
            else begin
                tick >> 1;
                if(tick[0] == 1) begin
                    ALUSignal <= 0;
                    if(JALBefehl)
                        RegisterSchreibSignal <= 0;
                    state <= WRITEBACK;
                end
            end
        
        end
        WRITEBACK: begin

            if(PCSignal == 0) begin
                PCSignal <= 1;
                if(UnbedingterSprungBefehl == 1 or BedingterSprungBefehl == 1)
                    tick << PCWRITETIME;
                else if(StoreBefehl == 1)
                    StoreDatenSignal <= 1;
                else if(LoadBefehl == 1)
                    LoadDatenSignal <= 1;
                else begin
                    RegisterSchreibSignal <= 1;
                    tick << REGISTERWRITETIME;
                end
            end
            else begin
                if(UnbedingterSprungBefehl == 1 or BedingterSprungBefehl == 1) begin
                    tick >> 1;
                    if(tick[0] == 1) begin
                        PCSignal <= 0;
                        state <= FETCH;
                    end
                end
                else if(StoreBefehl == 1) begin
                    if(DatenGespeichert == 1) begin
                        PCSignal <= 0;
                        StoreDatenSignal <= 0;
                        state <= FETCH;
                    end
                end
                else if(LoadBefehl == 1) begin
                    if(DatenGeladen == 1) begin
                        if(RegisterSchreibSignal == 0) begin
                            RegisterSchreibSignal <= 1;
                            tick << REGISTERWRITETIME;
                        end
                        else begin
                            tick >> 1;
                            if(tick[0] == 1) begin
                                PCSignal <= 0;
                                LoadDatenSignal <= 0;
                                RegisterSchreibSignal <= 0;
                                state <= FETCH;
                            end
                        end
                    end
                end
                else begin
                    tick >> 1;
                    if(tick[0] == 1) begin
                        PCSignal <= 0;
                        RegisterSchreibSignal <= 0;
                        state <= FETCH;
                    end
                end
            end

        end
        default: begin
            state <= FETCH;
            tick <= 5'b00001;
        end
    endcase
end

always @(UnbedingterSprungBefehl, BedingterSprungBefehl, Bedingung) begin
    if(UnbedingterSprungBefehl == 1 or (BedingterSprungBefehl == 1 and Bedingung == 1))
        PCSprungSignal <= 1;
    else
        PCSprungSignal <= 0;
end

endmodule