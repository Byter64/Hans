module Programmzahler (
    input [25:0] NeuerPC,
    input SchreibSignal,
    input TaktSignal,
    input Reset,

    output [25:0] AktuellerPC
);

reg[25:0] programmzahler;


assign AktuellerPC = programmzahler;

always @(posedge Reset) begin
    programmzahler <= 25'b0;
end

always @(posedge TaktSignal) begin
    if(SchreibSignal)
        programmzahler <= NeuerPC + 1'b1;
    else
        programmzahler <= programmzahler + 1'b1;
end

endmodule