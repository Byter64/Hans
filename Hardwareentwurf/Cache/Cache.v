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
localparam TAGSIZEBITS = 32 - CACHESIZEBITS;

localparam IDLE = 4'b0001;
localparam WRITE = 4'b0010;
localparam READ = 4'b0100;
localparam RETURN = 4'b1000;

reg [31 : 0] memory [2**CACHESIZEBITS-1 : 0];
reg [TAGSIZEBITS-1 : 0] tags [2**BLOCKNUMBITS-1 : 0]; //adressed with the index, holds the tag
reg [2**BLOCKNUMBITS-1 : 0] valid;
reg [2**BLOCKNUMBITS-1 : 0] modified;

reg [3 : 0] current_state;
reg [3 : 0] next_state;
reg [BLOCKSIZEBITS-1 : 0] current_ram_offset;
wire [BLOCKSIZEBITS-1 : 0] next_ram_offset;

wire [TAGSIZEBITS-1 : 0] tag;
wire [BLOCKNUMBITS-1 : 0] index;
wire [BLOCKSIZEBITS-1 : 0] offset;

assign tag = ProzessorAdresse[31 : CACHESIZEBITS];
assign index = ProzessorAdresse[CACHESIZEBITS-1 : BLOCKSIZEBITS];
assign offset = ProzessorAdresse[BLOCKSIZEBITS-1 : 0];

assign ProzessorLesDaten = memory[{index, offset}];
assign ProzessorDatenGelesen = current_state[3] && ProzessorLesen;
assign ProzessorDatenGeschrieben = current_state[3] && ProzessorSchreiben;

assign RAMSchreiben = current_state[1];
assign RAMLesen = current_state[2];
assign RAMAdresse = current_state[1] ? {tags[index], index, current_ram_offset} :
                    current_state[2] ? {tag, index, current_ram_offset} : 0;
assign RAMSchreibDaten = current_state[1] ? memory[{index, current_ram_offset}] : 0;

assign next_ram_offset = ((current_state[1] && RAMDatenGeschrieben) || (current_state[2] && RAMDatenGelesen)) ? current_ram_offset + 1 : current_ram_offset;


always @* begin
    case (current_state)
    IDLE:
        if (ProzessorLesen || ProzessorSchreiben)
            if (~valid[index])
                next_state = READ;
            else if (tag != tags[index])
                if (modified[index])
                    next_state = WRITE;
                else
                    next_state = READ;
            else
                next_state = RETURN;
        else
            next_state = IDLE;
    WRITE:
        if (RAMDatenGeschrieben && next_ram_offset == 0)
                next_state = READ;
        else
            next_state = WRITE;
    READ:
        if (RAMDatenGelesen && next_ram_offset == 0)
                next_state = RETURN;
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
        if (current_state[2] && RAMDatenGelesen) begin
            memory[{index, current_ram_offset}] = RAMLesDaten;
            if (next_ram_offset == 0) begin
                tags[index] = tag;
                valid[index] = 1;
                modified[index] = 0;
            end
        end

        if (next_state[3] && ProzessorSchreiben) begin
            memory[{index, offset}] = ProzessorSchreibDaten;
            modified[index] = 1;
        end

        current_state <= next_state;
        current_ram_offset <= next_ram_offset;
    end
end

endmodule