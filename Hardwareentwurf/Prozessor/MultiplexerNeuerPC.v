module MultiplexerNeuerPC (
    input [31:0] RelativerPC,
    input [31:0] AbsoluterPC,
    input IstAbsolut,
    output [25:0] NeuerPC
);

 assign NeuerPC = (IstAbsolut)?AbsoluterPC[25:0]:
                               RelativerPC[25:0];

endmodule