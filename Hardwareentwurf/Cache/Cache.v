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
endmodule