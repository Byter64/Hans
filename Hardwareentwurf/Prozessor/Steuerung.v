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

    localparam FETCH = 4'b000;

    localparam DECODE = 4'b001;

    localparam ALU1 = 4'b010;
    localparam ALU = 4'b011;

    localparam WRITEBACK_JUMP = 4'b100;
    localparam WRITEBACK_STORE = 4'b101;
    localparam WRITEBACK_LOAD = 4'b110;
    localparam WRITEBACK_DEFAULT = 4'b111;
    
    localparam WRITEBACK_STORE2 = 4'b1000;
    localparam WRITEBACK_LOAD2 = 4'b1001;

    reg [3:0] current_state;
    reg [3:0] next_state;

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
                    next_state <= WRITEBACK_STORE2;
            end
            WRITEBACK_STORE2: begin
                if (DatenGespeichert)
                    next_state <= FETCH;
                else
                    next_state <= WRITEBACK_STORE2;
            end
            WRITEBACK_LOAD: begin
                if (DatenGeladen)
                    next_state <= FETCH;
                else
                    next_state <= WRITEBACK_LOAD2;
            end
            WRITEBACK_LOAD2: begin
                if (DatenGeladen)
                    next_state <= FETCH;
                else
                    next_state <= WRITEBACK_LOAD2;
            end
            WRITEBACK_DEFAULT:
                next_state <= FETCH;
            default:
                next_state <= FETCH;
        endcase
    end
    
    assign LoadBefehlSignal         = current_state == FETCH;
    assign DekodierSignal           = current_state == DECODE;
    assign ALUStartSignal           = current_state == ALU1;
    assign RegisterSchreibSignal    = (current_state == ALU1 && JALBefehl) || current_state == WRITEBACK_DEFAULT;
    assign PCSignal                 = current_state > ALU && current_state < WRITEBACK_STORE2; //In einen Writeback Zuständen //Darf nur 1 Takt oben sein
    assign StoreDatenSignal         = current_state == WRITEBACK_STORE || current_state == WRITEBACK_STORE2;
    assign LoadDatenSignal          = current_state == WRITEBACK_LOAD  || current_state == WRITEBACK_LOAD2;
    assign PCSprungSignal           = UnbedingterSprungBefehl || (BedingterSprungBefehl && Bedingung);

    //sequential portion

    always @(posedge Clock) begin
        current_state <= next_state;
        if (Reset) begin
            current_state <= FETCH;
        end
    end

endmodule