module Programmzahler (
    input [25:0] NeuerPC,
    input SchreibSignal,
    input TaktSignal,
    input Reset,

    output [25:0] AktuellerPC,
    output [25:0] erhohterPC
);

reg[25:0] programmzahler;


assign AktuellerPC = programmzahler;
assign erhohterPC = programmzahler + 1'b1;

always @(posedge Reset) begin
    programmzahler <= 25'b0;
end

always @(posedge TaktSignal && !SchreibSignal) begin
    programmzahler <= programmzahler + 1'b1;
end

always @(posedge SchreibSignal) begin
    programmzahler <= NeuerPC;
end


endmodule