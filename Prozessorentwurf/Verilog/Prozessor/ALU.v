`include "ALUModule/Goldschmidt_Integer_Divider_Parallel-main/source/Goldschmidt_Integer_Divider_Parallel.v"
`include "ALUModule/intsqrt.v"
module ALU (
    input[31:0] Daten1,
    input[31:0] Daten2,
    input[5:0] Funktionscode,
    input StartSignal,
    input Schreibsignal,
    input Reset,
    input Clock,
    output[31:0] Ergebnis
);

reg[31:0] EinfacheRechnungErgebnis;
reg[31:0] DivisionErgebnis; //Div and Mod
reg[31:0] WurzelErgebnis;
reg[31:0] ZyklischerSchieberErgebnis;
reg[31:0] SubtraktionErgebnis;
reg[31:0] SubtraktionErgebnis;
reg[31:0] SubtraktionErgebnis;
reg QuadratFertig;

ZyklischerSchieber#(32, 5) Schieber (
    .Zahl(Daten1),
    .Stellen(Daten2[4:0]),
    .Ergebnis(ZyklischerSchieberErgebnis),
    .SchiebRechts(Funktionscode[0])
);

Goldschmidt_Integer_Divider_Parallel #(
    .P_GDIV_FACTORS_MSB(31), 
    .P_GDIV_FRAC_LENGTH(32),
    .P_GDIV_ROUND_LVL(3)
) DivisionsModule (
    // Component's clocks and resets
    .i_clk(Clock), // clock
    .i_rst(Reset), // reset
    // Wishbone(Pipeline) Slave Interface
    .i_wb4s_cyc(i_wb4s_cyc),     // WB stb, valid strobe
    .i_wb4s_stb({Funktionscode[0], 0}),     // WB stb, valid strobe
    .i_wb4s_data(i_wb4s_data),   // WB data 0
    .i_wb4s_tgc({Daten1, Daten2}),     // WB data tag, 0=add 1=substract
    .o_wb4s_stall(o_wb4s_stall), // WB stall, not ready
    .o_wb4s_ack(o_wb4s_ack),     // WB write enable
    .o_wb4s_data(o_wb4s_data)    // WB data, result
);

Intsqrt QuadratModul(
    .Clock(Clock),
    .Reset(Reset),
    .Num_in(Daten1),
    .Done(QuadratFertig),
    .Sq_root(WurzelErgebnis)
);

always @(StartSignal) begin
        if (Funktionscode[5] == 0) begin //Wenn Arithmetik- oder Logikbefehl
        case (Funktionscode[4:0])
        //Integerarithmetik
        //Add
        5'b00000    : EinfacheRechnungErgebnis <= $signed(Daten1) + $signed(Daten2);
        //Sub
        5'b00001    : EinfacheRechnungErgebnis <= $signed(Daten1) - $signed(Daten2);
        //Mul
        5'b00010    : EinfacheRechnungErgebnis <= $signed(Daten1) * $signed(Daten2);
        //SQRT wird automatisch zugewiesen
        
        //Div wird automatisch zugewiesen
        
        //Mod wird automatisch zugewiesen

        //Schiebearithmetik
        //Links Schieben
        5'b00110    : EinfacheRechnungErgebnis <= Daten1 << $signed(Daten2);
        //Rechts Schieben
        5'b00111    : EinfacheRechnungErgebnis <= Daten1 >> $signed(Daten2);
        //Zyklisches links Schieben wird automatisch zugewiesen

        //Zyklisches rechts Schieben wird automatisch zugewiesen


        //Vergleiche
        //Gleichheit
        5'b10000    : EinfacheRechnungErgebnis <= Daten1 == Daten2;
        //Ungleichheit
        5'b10001    : EinfacheRechnungErgebnis <= Daten1 != Daten2;
        //Größer
        5'b10010    : EinfacheRechnungErgebnis <= Daten1 > Daten2;
        //Größergleich
        5'b10011    : EinfacheRechnungErgebnis <= Daten1 >= Daten2;
        //Kleiner
        5'b10100    : EinfacheRechnungErgebnis <= Daten1 < Daten2;
        //Kleinergleich
        5'b10101    : EinfacheRechnungErgebnis <= Daten1 <= Daten2;

        //Bitoperatoren
        //Verneinung
        5'b11000    : EinfacheRechnungErgebnis <= ~Daten1;
        //Und
        5'b11001    : EinfacheRechnungErgebnis <= Daten1 & Daten2;
        //Oder
        5'b11010    : EinfacheRechnungErgebnis <= Daten1 | Daten2;
        //Ungleich
        5'b11011    : EinfacheRechnungErgebnis <= Daten1 ^ Daten2;
        //Gleich
        5'b11100    : EinfacheRechnungErgebnis <= Daten1 ~^ Daten2;

            default: Ergebnis <= 32'b0;
        endcase
    end else begin                  //Wenn Floatbefehl
        
    end
end

  always @(posedge Schreibsignal) begin
    if (Funktionscode[5] == 0) begin //Wenn Arithmetik- oder Logikbefehl
        case (Funktionscode[4:0])
        //Integerarithmetik
        //Add
        5'b00000    : Ergebnis = EinfacheRechnungErgebnis;
        //Sub
        5'b00001    : Ergebnis = EinfacheRechnungErgebnis;
        //Mul
        5'b00010    : Ergebnis = EinfacheRechnungErgebnis;
        //SQRT
        5'b00011    : Ergebnis = WurzelErgebnis;
        //Div
        5'b00100    : Ergebnis = DivisionErgebnis;
        //Div
        5'b00101    : Ergebnis = DivisionErgebnis;

        //Schiebearithmetik
        //Links Schieben
        5'b00110    : Ergebnis = EinfacheRechnungErgebnis;
        //Rechts Schieben
        5'b00111    : Ergebnis = EinfacheRechnungErgebnis;
        //Zyklisches links Schieben
        5'b01000    : Ergebnis <= ZyklischerSchieberErgebnis;
        //Zyklisches rechts Schieben
        5'b01001    : Ergebnis <= ZyklischerSchieberErgebnis;

        //Vergleiche
        //Gleichheit
        5'b10000    : Ergebnis = EinfacheRechnungErgebnis;
        //Ungleichheit
        5'b10001    : Ergebnis = EinfacheRechnungErgebnis;
        //Größer
        5'b10010    : Ergebnis = EinfacheRechnungErgebnis;
        //Größergleich
        5'b10011    : Ergebnis = EinfacheRechnungErgebnis;
        //Kleiner
        5'b10100    : Ergebnis = EinfacheRechnungErgebnis;
        //Kleinergleich
        5'b10101    : Ergebnis = EinfacheRechnungErgebnis;

        //Bitoperatoren
        //Verneinung
        5'b11000    : Ergebnis = EinfacheRechnungErgebnis;
        //Und
        5'b11001    : Ergebnis = EinfacheRechnungErgebnis;
        //Oder
        5'b11010    : Ergebnis = EinfacheRechnungErgebnis;
        //Ungleich
        5'b11011    : Ergebnis = EinfacheRechnungErgebnis;
        //Gleich
        5'b11100    : Ergebnis = EinfacheRechnungErgebnis;

            default: Ergebnis <= 32'b0;
        endcase
    end else begin                  //Wenn Floatbefehl
        
    end
  end
endmodule