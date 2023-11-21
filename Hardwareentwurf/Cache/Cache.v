module Cache #(
    parameter CACHESIZEBITS = 13,
    parameter BLOCKSIZEBITS = 2
) (
    input ProzessorSchreiben,
    input ProzessorLesen,
    input [31:0] ProzessorAdresse,
    input [31:0] ProzessorSchreibDaten,

    input [31:0] RAMLesDaten,

    input RAMDatenGeschrieben,
    input RAMDatenGelesen,

    input Clock,
    input Reset,

    output [31:0] ProzessorLesDaten,

    output ProzessorDatenGeschrieben,
    output ProzessorDatenGelesen,

    output RAMSchreiben,
    output RAMLesen,
    output [31:0] RAMAdresse,
    output [31:0] RAMSchreibDaten
);

localparam BLOCKNUMBITS = CACHESIZEBITS - BLOCKSIZEBITS;
localparam TAGSIZEBITS = 32 - CACHESIZEBITS;\

localparam IDLE = 6'b000001;
localparam WRITE_START = 6'b000010;
localparam WRITE = 6'b000100
localparam READ_START = 6'b001000;
localparam READ = 6'b010000;
localparam RETURN = 6'b100000;

reg [31 : 0] memory [2**CACHESIZEBITS-1 : 0];
reg [TAGSIZEBITS-1 : 0] tags [2**BLOCKNUMBITS-1 : 0]; //adressed with the index, holds the tag
reg valid [2**BLOCKNUMBITS-1 : 0];
reg modified [2**BLOCKNUMBITS-1 : 0];

reg [5 : 0] current_state;
reg [5 : 0] next_state;
reg [BLOCKSIZEBITS-1 : 0] current_ram_offset;
wire [BLOCKSIZEBITS-1 : 0] next_ram_offset;

wire [TAGSIZEBITS-1 : 0] tag;
wire [BLOCKNUMBITS-1 : 0] index;
wire [BLOCKSIZEBITS-1 : 0] offset;

assign tag = ProzessorAdresse[31 : CACHESIZEBITS];
assign index = ProzessorAdresse[CACHESIZEBITS-1 : BLOCKSIZEBITS];
assign offset = ProzessorAdresse[BLOCKSIZEBITS-1 : 0];

assign ProzessorLesDaten = memory[{index, offset}];
assign ProzessorDatenGelesen = current_state[5] && ProzessorLesen;
assign ProzessorDatenGeschrieben = current_state[5] && ProzessorSchreiben;

assign RAMSchreiben = current_state[2];
assign RAMLesen = current_state[4];
assign RAMAdresse = current_state[2] ? {tags[index], index, current_ram_offset} :
                    current_state[4] ? {tag, index, current_ram_offset} : 0;
assign RAMSchreibDaten = current_state[2] ? memory[{index, current_ram_offset}] : 0;

assign next_ram_offset = ((current_state[2] && RAMDatenGeschrieben) || (current_state[4] && RAMDatenGelesen)) ? current_ram_offset + 1 : current_ram_offset;


always @* begin
    case (current_state)
    IDLE:
        if (ProzessorLesen || ProzessorSchreiben)
            if (~valid[index])
                next_state = READ;
            else if (tag ~= tags[index])
                if (modified[index])
                    next_state = WRITE;
                else
                    next_state = READ;
            else
                next_state = RETURN;
        else
            next_state = IDLE;
    WRITE_START:
        next_state = WRITE;
    WRITE:
        if (RAMDatenGeschrieben)
            if (next_ram_offset == 0)
                next_state = READ;
            else
                next_state = WRITE_START;
        else
            next_state = WRITE;
    READ_START:
        next_state = READ;
    READ:
        if (RAMDatenGelesen)
            if (next_ram_offset == 0)
                next_state = RETURN;
            else
                next_state = READ_START;
        else
            next_state = READ;
    RETURN:
        next_state = IDLE;
    endcase
end


always @(posedge Clock) begin
    if (Reset) begin
        valid <= 0;

        current_state <= IDLE;
        current_ram_offset <= 0;
    end else begin
        if (current_state[4] && RAMDatenGelesen) begin
            memory[{index, current_ram_offset}] = RAMLesDaten;
            if (next_ram_offset == 0) begin
                tags[index] = tag;
                valid[index] = 1;
                modified[index] = 0;
            end
        end

        if (current_state[5] && ProzessorSchreiben) begin
            memory[{index, offset}] = ProzessorSchreibDaten;
            modified[index] = 1;
        end

        current_state <= next_state;
        current_ram_offset <= next_ram_offset;
    end
end

endmodule