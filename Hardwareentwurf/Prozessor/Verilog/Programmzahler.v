module Programmzahler (
    input [25:0] NeuerPC,
    input SchreibSignal,
    input TaktSignal,
    input Reset,
    input Clock,

    output reg [25:0] AktuellerPC
);

reg[25:0] programmzahler;

always @(posedge Clock) begin
    if(Reset)
        AktuellerPC <= 25'b0;
    else if(TaktSignal)begin
        if(SchreibSignal)
            AktuellerPC <= NeuerPC + 1'b1;
        else
            AktuellerPC <= AktuellerPC + 1'b1;
    end
end

endmodule