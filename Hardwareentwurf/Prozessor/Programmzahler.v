module Programmzahler (
    input [25:0] NeuerPC,
    input SchreibSignal,
    input TaktSignal,
    input Reset,

    output reg [25:0] AktuellerPC
);

reg[25:0] programmzahler;

always @(posedge TaktSignal or posedge Reset) begin
    if(Reset)
        AktuellerPC <= 26'b0;
    else begin
        if(SchreibSignal)
            AktuellerPC <= NeuerPC + 1'b1;
        else
            AktuellerPC <= AktuellerPC + 1'b1;
    end
end

endmodule