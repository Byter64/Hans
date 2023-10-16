`include "Verilog/ALUModule/Goldschmidt_Integer_Divider_Parallel-main/source/Goldschmidt_Integer_Divider_Parallel.v"
`include "Verilog/ALUModule/intsqrt.v"
`include "Verilog/ALUModule/verilog-math-master_FLOAT_/components/add.v"
`include "Verilog/ALUModule/verilog-math-master_FLOAT_/components/mul.v"
`include "Verilog/ALUModule/verilog-math-master_FLOAT_/components/sqrt.v"
`include "Verilog/ALUModule/verilog-math-master_FLOAT_/components/div.v"

module ALU (
    input[31:0] Daten1,
    input[31:0] Daten2,
    input[5:0] FunktionsCode,
    input StartSignal,
    input Reset,
    input Clock,
    output HatFertigGerechnet,
    output[31:0] Ergebnis
);

reg[31:0] Radikand; //Wurzel
reg[31:0] FloatAdditionDaten2;
reg DivCyc = 0;
reg DivStb = 0;
reg[7:0] TakteBisFertig = 0;
wire[31:0] EinfacheRechnungErgebnis;
wire[31:0] DivisionErgebnis; //Div und Mod
wire[31:0] WurzelErgebnis;
wire[31:0] AdditionFloatErgebnis;
wire[31:0] MultiplikationFloatErgebnis;
wire[31:0] WurzelFloatErgebnis;
wire[31:0] DivisionFloatErgebnis;
wire WurzelFertig;
wire DivisionFertig;
wire DivisionInArbeit;
wire IntWurzelReset;

//Int Arithmetik
localparam IntAddition =        6'b000000;
localparam IntSubtraktion =     6'b000001;
localparam IntMultiplikation =  6'b000010;
localparam IntQuadratwurzel =   6'b000011;
localparam IntDivision =        6'b000100;
localparam IntModulo =          6'b000101;
//Float Arithmetik
localparam FloatAddition =        6'b100000;
localparam FloatSubtraktion =     6'b100001;
localparam FloatMultiplikation =  6'b100010;
localparam FloatQuadratwurzel =   6'b100011;
localparam FloatDivision =        6'b100100;
localparam FloatModulo =          6'b100101;
//Schieben
localparam LinksSchieben =      6'b000110;
localparam Rechtsschieben =     6'b000111;
//Vergleiche
localparam Gleichheit =         6'b010000;
localparam Ungleichheit =       6'b010001;
localparam Groesser =             6'b010010;
localparam Groessergleich =       6'b010011;
localparam Kleiner =            6'b010100;
localparam Kleinergleich =      6'b010101;
//Bitoperationen
localparam Verneinung =         6'b011000;
localparam Und =                6'b011001;
localparam Oder =               6'b011010;
localparam Ungleich =           6'b011011;
localparam Gleich =             6'b011100;

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
    .Reset(IntWurzelReset),
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

assign EinfacheRechnungErgebnis =   FunktionsCode[5:0] == IntAddition        ? $signed(Daten1) + $signed(Daten2) :
                                    FunktionsCode[5:0] == IntSubtraktion     ? $signed(Daten1) - $signed(Daten2) :
                                    FunktionsCode[5:0] == IntMultiplikation  ? $signed(Daten1) * $signed(Daten2) :
                                    FunktionsCode[5:0] == LinksSchieben      ? Daten1 << $signed(Daten2) :
                                    FunktionsCode[5:0] == Rechtsschieben     ? Daten1 >> $signed(Daten2) :
                                    FunktionsCode[5:0] == Gleichheit         ? Daten1 == Daten2 : 
                                    FunktionsCode[5:0] == Ungleichheit       ? Daten1 != Daten2 :
                                    FunktionsCode[5:0] == Groesser             ? Daten1 > Daten2 :     
                                    FunktionsCode[5:0] == Groessergleich       ? Daten1 >= Daten2 :
                                    FunktionsCode[5:0] == Kleiner            ? Daten1 < Daten2 :    
                                    FunktionsCode[5:0] == Kleinergleich      ? Daten1 <= Daten2 :
                                    FunktionsCode[5:0] == Verneinung         ? ~Daten1 : 
                                    FunktionsCode[5:0] == Und                ? Daten1 & Daten2 :        
                                    FunktionsCode[5:0] == Oder               ? Daten1 | Daten2 :       
                                    FunktionsCode[5:0] == Ungleich           ? Daten1 ^ Daten2 :   
                                    FunktionsCode[5:0] == Gleich             ? Daten1 ~^ Daten2 : 0;

assign Ergebnis =   FunktionsCode[5:0] == IntQuadratwurzel ? WurzelErgebnis :
                    FunktionsCode[5:0] == IntDivision ? DivisionErgebnis :
                    FunktionsCode[5:0] == IntModulo ? DivisionErgebnis :
                    FunktionsCode[5:0] == FloatAddition ? AdditionFloatErgebnis :
                    FunktionsCode[5:0] == FloatSubtraktion ? AdditionFloatErgebnis :
                    FunktionsCode[5:0] == FloatMultiplikation ? MultiplikationFloatErgebnis :
                    FunktionsCode[5:0] == FloatQuadratwurzel ? WurzelFloatErgebnis :
                    FunktionsCode[5:0] == FloatDivision ? DivisionFloatErgebnis 
                                                        : EinfacheRechnungErgebnis;

assign HatFertigGerechnet = TakteBisFertig <= 0;

assign IntWurzelReset = (FunktionsCode[5:0] == IntQuadratwurzel & StartSignal) | Reset;

always @(posedge Clock) begin
    if(Reset) begin
            Radikand = 0;
            FloatAdditionDaten2 = 0;
            DivCyc = 0;
            DivStb = 0;
            TakteBisFertig = 0;
        end
    else if(StartSignal) begin
        case (FunktionsCode[5:0])
        default : begin
            DivCyc <= 0;
            DivStb <= 0;
            TakteBisFertig = 1;
        end

        //Integerarithmetik
        //Sqrt
        6'b000011    : begin 
            Radikand <= Daten1;
            TakteBisFertig = 16;
        end
        //Div
        6'b000100    : begin
            DivCyc <= 1;
            DivStb <= 1;
            TakteBisFertig = 7;
        end
        //Mod
        6'b000101    : begin
            DivCyc <= 1;
            DivStb <= 1;
            TakteBisFertig = 9;
        end

        //Float Arithmetik
        //Add.s
        6'b100000: begin
            FloatAdditionDaten2 <= Daten2;
            TakteBisFertig = 7;
        end
        //Sub.s 
        6'b100001: begin 
            FloatAdditionDaten2[30:0] <= Daten2[30:0];
            FloatAdditionDaten2[31] <= ~Daten2[31];
            TakteBisFertig = 7;
        end
        //Mul.s
        6'b100010    : begin 
            TakteBisFertig = 9;
        end
        //Sqrt.s
        6'b100011    : begin 
            //Radikand <= Daten1; wenn CPU ohne diese Zeile funktioniert, bitte diese Zeile loeschen
            TakteBisFertig = 10;
        end
        //Div.s
        6'b100100    : begin 
            TakteBisFertig = 32;
        end
        endcase
    end
    else begin
        if (DivisionInArbeit == 0 && DivStb == 1)
            DivStb = 0;

        if(DivisionFertig == 1) begin
            DivCyc = 0;
        end

        TakteBisFertig = TakteBisFertig - 1;
    end
end

endmodule