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
    if(TaktSignal)begin
        if(SchreibSignal) begin
            AktuellerPC <= NeuerPC + 1'b1;
        end else begin
            AktuellerPC <= AktuellerPC + 1'b1;
        end
    end
    if(Reset) begin
        AktuellerPC <= 25'b0;
    end 
end

endmodule