module MultiplexerAluDaten2 (
    input [25:0] AktuellerPC,
    input [31:0] QuellDaten1,
    input RelativerSprungBefehl,
    output [31:0] Daten2
);

 assign Daten2 = (RelativerSprungBefehl==1'b1)? {6'b0,AktuellerPC}:
                    QuellDaten1;

endmodule