module BedingungsPruefer (
    input[31:0] Eingang,
    input Bedingung,
    output Ergebnis
);

assign Ergebnis = Bedingung ? (Eingang == 32'b0):(Eingang != 32'b0);

endmodule