module NullPruefer (
    input[31:0] Eingang,
    output Ergebnis
);

assign Ergebnis = Eingang == 32'b00000000000000000000000000000000;
endmodule