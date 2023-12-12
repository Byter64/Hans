module MultiplexerAluDaten2 (
    input [25:0] AktuellerPC,
    input [31:0] QuellDaten1,
    input RelativerSprungBefehl,
    output [31:0] Daten1
);

 assign Daten1 = (RelativerSprungBefehl==1'b1)? {6'b0,AktuellerPC}:
                    QuellDaten1;

endmodule