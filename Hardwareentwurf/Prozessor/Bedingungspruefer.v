module Bedingungspruefer (
    input[31:0] Eingang,
    input GleichNullPruefen,
    output Ergebnis
);

assign Ergebnis = GleichNullPruefen ? Eingang == 32'b0:
                                      Eingang != 32'b0;
endmodule