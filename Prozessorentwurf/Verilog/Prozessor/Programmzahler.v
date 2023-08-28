module Programmzahler (
    input [25:0] NeuerPC,
    input SchreibSignal,
    input TaktSignal,
    input Reset,

    output reg [25:0] AktuellerPC
);

reg[25:0] programmzahler;


always @(posedge Reset) begin
    AktuellerPC <= 25'b0;
end

always @(posedge TaktSignal) begin
    if(SchreibSignal)
        AktuellerPC <= NeuerPC + 1'b1;
    else
        AktuellerPC <= AktuellerPC + 1'b1;
end

endmodule