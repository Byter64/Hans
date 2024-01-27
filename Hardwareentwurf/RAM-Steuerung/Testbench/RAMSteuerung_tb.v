`include "Cache.v"
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 10 ns / 1 ns

module main_tb
;
parameter CLOCKSTEP = 5;
parameter TIMESTEP = CLOCKSTEP * 2;

// Addresse von den Daten
reg [22:0] BCAdresse;
reg [22:0] DCAdresse;
reg [22:0] VCAdresse;

// Daten
reg [31:0] BCDaten;
reg [31:0] DCDaten;
reg [31:0] VCDaten;

// Ob ein Lese Signal anliegt
reg BCLesen;
reg DCLesen;
reg VCLesen;

// Ob ein Schreib Signal anliegt
reg BCSchreiben;
reg DCSchreiben;
reg VCSchreiben;

// Daten fertig geladen 
wire BCFertig;
wire DCFertig;
wire VCFertig;

// Gibt die Geladenen Daten Weiter
wire [31:0] DatenAusgabe;

// Ein und Ausgabe an SDRAM Controller
wire [21:0] SchreibAdresse;
wire [15:0] SchreibDaten;
wire Schreiben;
wire [21:0] LeseAdresse;
reg [15:0] LeseDaten;
wire Lesen;
reg LesenGeladen;
reg busy;

reg Clock;
reg Reset;

// Module instance
RAMSteuerung strg (
    .Clock(Clock),
    .Reset(Reset),
    .BCAdresse(BCAdresse),
    .DCAdresse(DCAdresse),
    .VCAdresse(VCAdresse),
    .BCDaten(BCDaten),
    .VCDaten(VCDaten),
    .DCDaten(DCDaten),
    .BCLesen(BCLesen),
    .DCLesen(DCLesen),
    .VCLesen(VCLesen),
    .BCSchreiben(BCSchreiben),
    .DCSchreiben(DCSchreiben),
    .VCSchreiben(VCSchreiben),
    .BCFertig(BCFertig),
    .DCFertig(DCFertig),
    .VCFertig(VCFertig),
    .DatenAusgabe(DatenAusgabe),
    .SchreibAdresse(SchreibAdresse),
    .SchreibDaten(SchreibDaten),
    .Schreiben(Schreiben),
    .LeseAdresse(LeseAdresse),
    .LeseDaten(LeseDaten),
    .Lesen(Lesen),
    .LesenGeladen(LesenGeladen),
    .busy(busy)
);

always begin
    #(CLOCKSTEP)
    Clock = ~Clock;
end

initial begin
    $dumpvars(0, main_tb);




    #(TIMESTEP) $display("End of simulation");
    $finish;
end

task assert;
    input assertValue;
    input shouldValue;
    input [7:0] line;
    begin
        if (assertValue != shouldValue) begin
            $display("line %d: Value = %b, should be %b", line, assertValue, shouldValue);
            $finish;
        end
    end
endtask

task assert_32bit;
    input [31:0] assertValue;
    input [31:0] shouldValue;
    input [7:0] line;
    begin
        if (assertValue != shouldValue) begin
            $display("line %d: Value = %b, should be %b", line, assertValue, shouldValue);
            $finish;
        end
    end
endtask

endmodule