module Cache #(
    parameter CACHESIZEBITS = 15,
    parameter BLOCKSIZEBITS = 5
    parameter NBITS = 0
) (
    input [31:0] ProzessorAdresse,
    input ProzessorSchreiben,
    input [31:0] ProzessorSchreibDaten,
    input [31:0] RAMLesDaten,
    output reg [31:0] ProzessorLesDaten,
    output reg [31:0] RAMAdresse,
    output reg RAMSchreiben,
    output reg [31:0] RAMSchreibDaten
);

localparam BLOCKNUMBITS = CACHESIZEBITS - BLOCKSIZEBITS;
localparam SETNUMBITS = BLOCKNUMBITS - NBITS;
endmodule