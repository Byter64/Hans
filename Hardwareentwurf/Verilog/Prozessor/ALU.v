`include "../ALUModule/Goldschmidt_Integer_Divider_Parallel-main/source/Goldschmidt_Integer_Divider_Parallel.v"
`include "../ALUModule/intsqrt.v"
`include "../ALUModule/ZyklischerSchieber.v"
`include "../ALUModule/verilog-math-master_FLOAT_/components/add.v"
`include "../ALUModule/verilog-math-master_FLOAT_/components/mul.v"
`include "../ALUModule/verilog-math-master_FLOAT_/components/sqrt.v"
`include "../ALUModule/verilog-math-master_FLOAT_/components/div.v"

module ALU (
    input[31:0] Daten1,
    input[31:0] Daten2,
    input[5:0] FunktionsCode,
    input StartSignal,
    input Schreibsignal,
    input Reset,
    input Clock,
    output reg[31:0] Ergebnis
);

reg[31:0] EinfacheRechnungErgebnis;
reg[31:0] Radikand; //Wurzel
reg[31:0] FloatAdditionDaten2;
reg DivCyc = 0;
reg DivStb = 0;
wire[31:0] DivisionErgebnis; //Div und Mod
wire[31:0] WurzelErgebnis;
wire[31:0] ZyklischerSchieberErgebnis;
wire[31:0] AdditionFloatErgebnis;
wire[31:0] MultiplikationFloatErgebnis;
wire[31:0] WurzelFloatErgebnis;
wire[31:0] DivisionFloatErgebnis;
wire[31:0] ModuloFloatErgebnis;
wire WurzelFertig;
wire DivisionFertig;
wire DivisionInArbeit;


ZyklischerSchieber#(32, 5) Schieber (
    .Zahl(Daten1),
    .Stellen(Daten2[4:0]),
    .Ergebnis(ZyklischerSchieberErgebnis),
    .SchiebRechts(FunktionsCode[0])
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
    .i_wb4s_cyc(DivCyc),     // WB: If high, slave accepts new data, put low again, when finished
    .i_wb4s_tgc({FunktionsCode[0], 1'b0}),     // WB data tag, 0=quotient, 1=remainder; 0=signed, 1=unsigned
    .i_wb4s_stb(DivStb),     // WB stb, valid strobe
    .i_wb4s_data({Daten2, Daten1}),   // WB data 0
    .o_wb4s_stall(DivisionInArbeit), // if high, slave does not take inputs yet.
    .o_wb4s_ack(DivisionFertig),     // WB: If this signal is up, the result is at o_wb4_data
    .o_wb4s_data(DivisionErgebnis)    // WB data, result
);

Intsqrt QuadratModul(
    .Clock(Clock),
    .Reset(Reset),
    .Num_in(Radikand),
    .Done(WurzelFertig),
    .Sq_root(WurzelErgebnis)
);

add FloatAddierer(
    .clk(Clock),
    .add_a(Daten1),
    .add_b(FloatAdditionDaten2),
    .add_z(AdditionFloatErgebnis)
);

mul FloatMultiplizierer(
    .clk(Clock),
    .mul_a(Daten1),
    .mul_b(Daten2),
    .mul_z(MultiplikationFloatErgebnis)
);

//Nur Quadratwurzeln!!
sqrt FloatWurzeler(
    .clk(Clock),
    .sqrt_a(Daten1),
    .sqrt_z(WurzelFloatErgebnis)
);

div FloatDividierer(
    .clk(Clock),
    .div_a(Daten1),
    .div_b(Daten2),
    .div_z(DivisionFloatErgebnis)
);

always @(posedge StartSignal) begin
        if (FunktionsCode[5] == 0) begin //Wenn Arithmetik- oder Logikbefehl
        case (FunktionsCode[4:0])
        //Integerarithmetik
        //Add
        5'b00000    : EinfacheRechnungErgebnis <= $signed(Daten1) + $signed(Daten2);
        //Sub
        5'b00001    : EinfacheRechnungErgebnis <= $signed(Daten1) - $signed(Daten2);
        //Mul
        5'b00010    : EinfacheRechnungErgebnis <= $signed(Daten1) * $signed(Daten2);
        //Sqrt
        5'b00011    : Radikand <= Daten1;
        //Div
        5'b00100    : begin
            DivCyc <= 1;
            DivStb <= 1;
        end
        //Mod
        5'b00101    : begin
            DivCyc <= 1;
            DivStb <= 1;
        end
        
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
        endcase
    end else begin                  //Wenn Floatbefehl
        case (FunktionsCode[4:0])
        //Add.s
        5'b00000: FloatAdditionDaten2 <= Daten2;
            //Calculation starts automatically
        //Sub.s 
        5'b00001: begin 
            FloatAdditionDaten2[30:0] <= Daten2[30:0];
            FloatAdditionDaten2[31] <= ~Daten2[31];
        end
            //Calculation starts automatically
        //Mul.s
            //Calculation starts automatically
        //Sqrt.s
        5'b00011    : Radikand <= Daten1;
        //Div.s
        5'b00100    : begin
            DivCyc <= 1;
            DivStb <= 1;
        end
        //Mod.s
        5'b00101    : begin
            DivCyc <= 1;
            DivStb <= 1;
        end
        endcase
    end
end

always @(posedge Clock) begin
    if (DivisionInArbeit == 0 && DivStb == 1)
        DivStb = 0;

    if(DivisionFertig == 1) begin
        DivCyc = 0;
    end
end

  always @(posedge Schreibsignal) begin
    if (FunktionsCode[5] == 0) begin //Wenn Arithmetik- oder Logikbefehl
        case (FunktionsCode[4:0])
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
        //Mod
        5'b00101    : Ergebnis = DivisionErgebnis;

        //Schiebearithmetik
        //Links Schieben
        5'b00110    : Ergebnis = EinfacheRechnungErgebnis;
        //Rechts Schieben
        5'b00111    : Ergebnis = EinfacheRechnungErgebnis;
        //Zyklisches links Schieben
        5'b01000    : Ergebnis = ZyklischerSchieberErgebnis;
        //Zyklisches rechts Schieben
        5'b01001    : Ergebnis = ZyklischerSchieberErgebnis;

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

            default: Ergebnis = 32'b0;
        endcase
    end else begin                  //Wenn Floatbefehl
        case (FunktionsCode[4:0])
        //Add.s
        5'b00000    : Ergebnis = AdditionFloatErgebnis;
        //Sub.s
        5'b00001    : Ergebnis = AdditionFloatErgebnis;
        //Mul.s
        5'b00010    : Ergebnis = MultiplikationFloatErgebnis;
        //SQRT.s
        5'b00011    : Ergebnis = WurzelFloatErgebnis;
        //Div.s
        5'b00100    : Ergebnis = DivisionFloatErgebnis;
        //Mod.s
        5'b00101    : Ergebnis = ModuloFloatErgebnis;
        endcase
    end
  end
endmodule