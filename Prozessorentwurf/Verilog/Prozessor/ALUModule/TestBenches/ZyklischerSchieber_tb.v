// Testbench template
`include "../ZyklischerSchieber.v"
`default_nettype none
`timescale 10 ns / 1 ns

module main_tb;
    reg[31:0] Zahl;
    reg[4:0] Stellen;
    wire[31:0] Ergebnis;
    reg SchiebRechts;

ZyklischerSchieber#(32, 5) Schieber (
    .Zahl(Zahl),
    .Stellen(Stellen),
    .Ergebnis(Ergebnis),
    .SchiebRechts(SchiebRechts)
);

initial begin
    $dumpvars(0, main_tb);
    Zahl = 32'b101101;
    Stellen = 32'b0;
    SchiebRechts = 1'b1;
    for(integer i = 0; i < 64; i = i + 1) begin
        #10
        if(Ergebnis != 32'b0)
        // begin
        //     $display("Beim Schieben ist was schiefgelaufen \n Zahl: %d \n Stellen: %d \n Ergebnis: %d \n Erwartet: %d \n", Zahl, Stellen, Ergebnis, 32'd0);
        // end
        Stellen = i;
    end

    SchiebRechts = 1'b0;
    for(integer i = 0; i < 64; i = i + 1) begin
        #10
        // if(Ergebnis != 32'b0)
        // begin
        //     $display("Beim Schieben ist was schiefgelaufen \n Zahl: %d \n Stellen: %d \n Ergebnis: %d \n Erwartet: %d \n", Zahl, Stellen, Ergebnis, 32'd0);
        // end
        Stellen = i;
    end
end

endmodule