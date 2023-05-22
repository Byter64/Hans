module Steuerung (
    input [5:0] Funktionscode,
    input LoadBefehl,
    input StoreBefehl,
    input JALBefehl,
    input UnbedingterSprungBefehl,
    input BedingterSprungBefehl,
    input Bedingung,
    input BefehlGeladen,
    input DatenGeladen,
    input DatenGespeichert,
    input Reset,
    input Clock,

    output RegisterSchreibSignal,
    output ALUSignal,
    output LoadBefehlSignal,
    output LoadDatenSignal,
    output StoreDatenSignal,
    output PCSprungSignal,
    output PCSignal,
    output DekodierSignal
);

parameter DURATION = 10;
parameter DECODETIME = 20;
parameter REGISTERWRITETIME = 10;
parameter ALUTIME = 20;
parameter PCWRITETIME = 5;

reg fetch;
reg decode;
reg alu;
reg writeback;

always @(posedge Reset) begin
    fetch <= 1;
    decode <= 0;
    alu <= 0;
    writeback <= 0;
end

always @(posedge fetch) begin
    LoadBefehlSignal <= 1;
end

always @(posedge BefehlGeladen) begin
    if(fetch == 1) begin
        LoadBefehlSignal <= 0;
        fetch <= 0;
        decode <= 1;
    end
end

always @(posedge decode) begin
    DekodierSignal <= 1;
    #(DECODETIME)
    DekodierSignal <= 0;
    decode <= 0;
    alu <= 1;
end

always @(UnbedingterSprungBefehl, BedingterSprungBefehl, Bedingung) begin
    if(UnbedingterSprungBefehl or (BedingterSprungBefehl and Bedingung))
        PCSprungSignal <= 1;
    else
        PCSprungSignal <= 0;
end

endmodule