module Cache #(
    parameter CACHESIZEBITS = 15,
    parameter BLOCKSIZEBITS = 5
    parameter NBITS = 0
) (
    input ProzessorSchreiben,
    input ProzessorLesen,
    input [31:0] ProzessorAdresse,
    input [31:0] ProzessorSchreibDaten,

    input [31:0] RAMLesDaten,

    input RAMDatenGelesen,
    input RAMDatenGeladen,

    output reg [31:0] ProzessorLesDaten,

    output wire ProzessorDatenGelesen,
    output wire ProzessorDatenGeladen,

    output wire RAMSchreiben,
    output wire RAMLesen,
    output reg [31:0] RAMAdresse,
    output reg [31:0] RAMSchreibDaten
);

localparam BLOCKNUMBITS = CACHESIZEBITS - BLOCKSIZEBITS;
localparam SETNUMBITS = BLOCKNUMBITS - NBITS;

reg [31:0] data [2**CACHESIZEBITS-1 : 0];
reg [31-BLOCKSIZEBITS-SETNUMBITS : 0] tags [2**BLOCKNUMBITS-1 : 0];

wire [BLOCKSIZEBITS-1 : 0] block;
wire [SETNUMBITS-1 : 0] set;
wire [31-BLOCKSIZEBITS-SETNUMBITS : 0] tag;

assign block = ProzessorAdresse[BLOCKSIZEBITS-1 : 0];
assign set = ProzessorAdresse[BLOCKSIZEBITS+SETNUMBITS-1 : BLOCKSIZEBITS];
assign tag = ProzessorAdresse[31 : BLOCKSIZEBITS+SETNUMBITS];

always @* begin
    if (ProzessorLesen) begin
        index = 0
        while (index < 2**(BLOCKNUMBITS - SETNUMBITS)) begin
            if (tags[{index, set}] == tag)
                ProzessorLesDaten = data[{index, set, block}];
        end
    end
end


endmodule