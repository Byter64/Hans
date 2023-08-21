module MultiplexerZielDaten (
    input [31:0] ALUErgebnis,
    input [25:0] AktuellerPC,
    input [31:0] LoadErgebnis,
    input JALBefehl,
    input LoadBefehl,
    output [31:0] ZielDaten
);

 assign ZielDaten = (JALBefehl==1'b1)? {6'b0,AktuellerPC}:
                    ((LoadBefehl==1'b1)? LoadErgebnis:
                    ALUErgebnis);

endmodule