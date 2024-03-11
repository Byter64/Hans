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
    output PCSprungSignal
);
    localparam FETCH = 9'b000000001;
    localparam DECODE_1 = 9'b000000010;
    localparam DECODE_2 = 9'b000000100;
    localparam ALU = 9'b000010000;
    localparam WRITEBACK_JUMP = 9'b000100000;
    localparam WRITEBACK_STORE = 9'b001000000;
    localparam WRITEBACK_LOAD = 9'b010000000;
    localparam WRITEBACK_DEFAULT = 9'b100000000;

    reg [8:0] current_state;
    reg [8:0] next_state;

    //combinational portion
    
    always @(*) begin
        case(current_state)
            FETCH: begin
                if (BefehlGeladen)
                    next_state <= DECODE_1;
                else
                    next_state <= FETCH;
            end
            DECODE_1:
                next_state <= DECODE_2;
            DECODE_2:
                next_state <= ALU;
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
    
    assign LoadBefehlSignal = current_state[0];
    assign DekodierSignal = current_state[1] || current_state[2];
    assign ALUStartSignal = current_state[4];
    assign RegisterSchreibSignal = (current_state[4] && JALBefehl) || current_state[8];
    assign PCSignal = current_state[8:5] != 0;
    assign StoreDatenSignal = current_state[6];
    assign LoadDatenSignal = current_state[7];

    assign PCSprungSignal = UnbedingterSprungBefehl || (BedingterSprungBefehl && Bedingung);

    //sequential portion

    always @(posedge Clock) begin
        if (Reset)
            current_state <= FETCH;
        else
            current_state <= next_state;
    end

endmodule