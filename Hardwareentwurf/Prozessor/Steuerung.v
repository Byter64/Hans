module Steuerung (
    input BefehlGeladen,
    input LoadBefehl,
    input StoreBefehl,
    input JALBefehl,
    input UnbedingterSprungBefehl,
    input BedingterSprungBefehl,
    input Bedingung,
    input ALUFertig,
    input DatenGeladen,
    input DatenGespeichert,
    input Reset,
    input Clock,

    output LoadBefehlSignal,
    output DekodierSignal,
    output ALUStartSignal,
    output RegisterSchreibSignal,
    output LoadDatenSignal,
    output StoreDatenSignal,
    output PCSignal,
    output PCSprungSignal,
    output [2:0] status
);

    assign status = current_state;
    localparam FETCH = 3'b000;
    localparam DECODE = 3'b001;
    localparam ALU1 = 3'b010;
    localparam ALU = 3'b011;
    localparam WRITEBACK_JUMP = 3'b100;
    localparam WRITEBACK_STORE = 3'b101;
    localparam WRITEBACK_LOAD = 3'b110;
    localparam WRITEBACK_DEFAULT = 3'b111;

    reg [2:0] current_state;
    reg [2:0] next_state;

    //combinational portion
    
    always @(*) begin
        case(current_state)
            FETCH: begin
                if (BefehlGeladen)
                    next_state <= DECODE;
                else
                    next_state <= FETCH;
            end
            DECODE:
                next_state <= ALU1;
            ALU1: begin
                if (ALUFertig) begin
                    if (UnbedingterSprungBefehl || BedingterSprungBefehl)
                        next_state <= WRITEBACK_JUMP;
                    else if (StoreBefehl)
                        next_state <= WRITEBACK_STORE;
                    else if (LoadBefehl)
                        next_state <= WRITEBACK_LOAD;
                    else
                        next_state <= WRITEBACK_DEFAULT;
                end
                else
                    next_state <= ALU;
            end
            ALU: begin
                if (ALUFertig) begin
                    if (UnbedingterSprungBefehl || BedingterSprungBefehl)
                        next_state <= WRITEBACK_JUMP;
                    else if (StoreBefehl)
                        next_state <= WRITEBACK_STORE;
                    else if (LoadBefehl)
                        next_state <= WRITEBACK_LOAD;
                    else
                        next_state <= WRITEBACK_DEFAULT;
                end
                else
                    next_state <= ALU;
            end
            WRITEBACK_JUMP:
                next_state <= FETCH;
            WRITEBACK_STORE: begin
                if (DatenGespeichert)
                    next_state <= FETCH;
                else
                    next_state <= WRITEBACK_STORE;
            end
            WRITEBACK_LOAD: begin
                if (DatenGeladen)
                    next_state <= WRITEBACK_DEFAULT;
                else
                    next_state <= WRITEBACK_LOAD;
            end
            WRITEBACK_DEFAULT:
                next_state <= FETCH;
            default:
                next_state <= FETCH;
        endcase
    end
    
    assign LoadBefehlSignal = current_state == FETCH;
    assign DekodierSignal = current_state == DECODE;
    assign ALUStartSignal = current_state == ALU1;
    assign RegisterSchreibSignal = ((current_state == ALU || current_state == ALU1) && JALBefehl) || current_state == WRITEBACK_DEFAULT;
    assign PCSignal = current_state > ALU;
    assign StoreDatenSignal = current_state == WRITEBACK_STORE;
    assign LoadDatenSignal = current_state == WRITEBACK_LOAD;

    assign PCSprungSignal = UnbedingterSprungBefehl || (BedingterSprungBefehl && Bedingung);

    //sequential portion

    always @(posedge Clock) begin
        if (Reset)
            current_state <= FETCH;
        else
            current_state <= next_state;
    end

endmodule