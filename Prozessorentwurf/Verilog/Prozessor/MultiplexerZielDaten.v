module MultiplexerZielDaten (
    input [31:0] ALUErgebnis,
    input [25:0] ErhohterPC,
    input [31:0] LoadErgebnis,
    input JALBefehl,
    input LoadBefehl,
    output [31:0] ZielDaten
);

 assign ZielDaten = (JALBefehl==1'b1)? {6'b0,ErhohterPC}:
                    ((LoadBefehl==1'b1)? LoadErgebnis:
                    ALUErgebnis);

endmodule