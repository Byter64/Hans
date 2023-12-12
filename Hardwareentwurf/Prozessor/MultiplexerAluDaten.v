module MultiplexerAluDaten (
    input [31:0] RegisterDaten2,
    input [31:0] Immediate,
    input ImmediateAktiv,
    output [31:0] Daten2
);

 assign Daten2 = (ImmediateAktiv==1'b1)? Immediate:
                    RegisterDaten2;

endmodule