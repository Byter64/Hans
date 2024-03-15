`include "../Prozessor/ALUModule/Goldschmidt_Integer_Divider_Parallel-main/source/Goldschmidt_Integer_Divider_Parallel.v"
`include "../Prozessor/ALUModule/Intsqrt.v"
`include "../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/add.v"
`include "../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/mul.v"
`include "../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/sqrt.v"
`include "../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/div.v"
`include "../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/eq.v"
`include "../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/gt.v"
`include "../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/lt.v"
`include "../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/int_to_single.v"
`include "../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/unsigned_int_to_single.v"
`include "../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/single_to_int.v"
`include "../Prozessor/ALUModule/verilog-math-master_FLOAT_/components/single_to_unsigned_int.v"


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
reg DivStb = 0; 
//assign DivStb = (StartSignal&&~DivisionInArbeit) && (FunktionsCode == IntDivision || FunktionsCode == IntModulo);
reg[7:0] TakteBisFertig = 0;
wire[31:0] FloatAdditionDaten2;
wire[31:0] EinfacheRechnungErgebnis;
wire[31:0] DivisionErgebnis; //Div und Mod
wire[31:0] WurzelErgebnis;
wire[31:0] IntZuFloatErgebnis;
wire[31:0] UnsignedIntZuFloatErgebnis;
wire[31:0] AdditionFloatErgebnis;
wire[31:0] MultiplikationFloatErgebnis;
wire[31:0] WurzelFloatErgebnis;
wire[31:0] DivisionFloatErgebnis;
wire[31:0] FloatZuIntErgebnis;
wire[31:0] FloatZuUnsignedIntErgebnis;
wire FloatGleichheitErgebnis;
wire FloatGroesserErgebnis;
wire FloatKleinerErgebnis;
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
localparam LinksSchiebenArithm =6'b000110;
localparam RechtsSchiebenArithm=6'b000111;
localparam Gleichheit =         6'b001000;
localparam Ungleichheit =       6'b001001;
localparam Groesser =           6'b001010;
localparam Kleiner =            6'b001011;
localparam GroesserUnsigned =   6'b001100;
localparam KleinerUnsigned =    6'b001101;
localparam IntZuFloat =         6'b001110;
localparam UnsignedIntZuFloat = 6'b001111;

//Logik
localparam Verneinung =         6'b010000;
localparam Und =                6'b010001;
localparam Oder =               6'b010010;
localparam Ungleich =           6'b010011;
localparam Gleich =             6'b010100;
localparam LinksSchiebenLogik = 6'b010110;
localparam RechtsSchiebenLogik =6'b010111;

//Float Arithmetik
localparam FloatAddition =        6'b100000;
localparam FloatSubtraktion =     6'b100001;
localparam FloatMultiplikation =  6'b100010;
localparam FloatQuadratwurzel =   6'b100011;
localparam FloatDivision =        6'b100100;
localparam FloatGleichheit =      6'b101000;
localparam FloatUngleichheit =    6'b101001;
localparam FloatGroesser =        6'b101010;
localparam FloatKleiner =         6'b101011;
localparam FloatZuInt =           6'b101110;
localparam FloatZuUnsignedInt =   6'b101111;

Goldschmidt_Integer_Divider_Parallel #(
    .P_GDIV_FACTORS_MSB(31), 
    .P_GDIV_FRAC_LENGTH(32),
    .P_GDIV_ROUND_LVL(10)
) DivisionsModule (
    // Component's clocks and resets
    .i_clk(Clock), // clock
    .i_rst(Reset), // reset
    // Wishbone(Pipeline) Slave Interface
    .i_wb4s_cyc(1'b1),     // WB: If high, slave accepts new data, put low again, when finished
    .i_wb4s_tgd({FunktionsCode[0], 1'b0}),     // WB data tag, 0=quotient, 1=remainder; 0=signed, 1=unsigned
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

int_to_single IntZuFloatMacher(
    .clk(Clock),
    .int_to_single_a(Daten1),
    .int_to_single_z(IntZuFloatErgebnis)
);

unsigned_int_to_single UnsignedIntZuFloatMacher(
    .clk(Clock),
    .unsigned_int_to_single_a(Daten1),
    .unsigned_int_to_single_z(UnsignedIntZuFloatErgebnis)
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

eq FloatVergleicherGleich(
    .clk(Clock),
    .eq_a(Daten1),
    .eq_b(Daten2),
    .eq_z(FloatGleichheitErgebnis)
);

gt FloatVergleicherGroesser(
    .clk(Clock),
    .gt_a(Daten1),
    .gt_b(Daten2),
    .gt_z(FloatGroesserErgebnis)
);

lt FloatVergleicherKleiner(
    .clk(Clock),
    .lt_a(Daten1),
    .lt_b(Daten2),
    .lt_z(FloatKleinerErgebnis)
);

single_to_int FloatZuIntMacher(
    .clk(Clock),
    .single_to_int_a(Daten1),
    .single_to_int_z(FloatZuIntErgebnis)
);

single_to_unsigned_int FloatZuUnsignedIntMacher(
    .clk(Clock),
    .single_to_unsigned_int_a(Daten1),
    .single_to_unsigned_int_z(FloatZuUnsignedIntErgebnis)
);

assign EinfacheRechnungErgebnis =   FunktionsCode[5:0] == IntAddition        ? $signed(Daten1) + $signed(Daten2) :
                                    FunktionsCode[5:0] == IntSubtraktion     ? $signed(Daten1) - $signed(Daten2) :
                                    FunktionsCode[5:0] == IntMultiplikation  ? $signed(Daten1) * $signed(Daten2) :
                                    FunktionsCode[5:0] == LinksSchiebenArithm? $signed(Daten1) <<< $signed(Daten2) :
                                    FunktionsCode[5:0] == RechtsSchiebenArithm? $signed(Daten1) >>> $signed(Daten2) :
                                    FunktionsCode[5:0] == Gleichheit         ? $signed({31'b0, Daten1 == Daten2})  : 
                                    FunktionsCode[5:0] == Ungleichheit       ? $signed({31'b0, Daten1 != Daten2})  :
                                    FunktionsCode[5:0] == Groesser             ? $signed({31'b0, $signed(Daten1) > $signed(Daten2)})  :     
                                    FunktionsCode[5:0] == Kleiner              ? $signed({31'b0, $signed(Daten1) < $signed(Daten2)})  :
                                    FunktionsCode[5:0] == GroesserUnsigned? $signed({31'b0, Daten1 > Daten2}) : 
                                    FunktionsCode[5:0] == KleinerUnsigned? $signed({31'b0, Daten1 < Daten2}) : 
                                    FunktionsCode[5:0] == Verneinung         ? $signed(~Daten1) : 
                                    FunktionsCode[5:0] == Und                ? $signed(Daten1 & Daten2) :        
                                    FunktionsCode[5:0] == Oder               ? $signed(Daten1 | Daten2) :       
                                    FunktionsCode[5:0] == Ungleich           ? $signed(Daten1 ^ Daten2) :   
                                    FunktionsCode[5:0] == Gleich             ? $signed(Daten1 ~^ Daten2) :
                                    FunktionsCode[5:0] == LinksSchiebenLogik ? $signed(Daten1 << $signed(Daten2)) :
                                    FunktionsCode[5:0] == RechtsSchiebenLogik? $signed(Daten1 >> $signed(Daten2)) : $signed(0);

assign Ergebnis =   FunktionsCode[5:0] == IntQuadratwurzel ? WurzelErgebnis :
                    FunktionsCode[5:0] == IntDivision ? DivisionErgebnis :
                    FunktionsCode[5:0] == IntModulo ? DivisionErgebnis :
                    FunktionsCode[5:0] == IntZuFloat ? IntZuFloatErgebnis :
                    FunktionsCode[5:0] == UnsignedIntZuFloat ? UnsignedIntZuFloatErgebnis :
                    FunktionsCode[5:0] == FloatAddition ? AdditionFloatErgebnis :
                    FunktionsCode[5:0] == FloatSubtraktion ? AdditionFloatErgebnis :
                    FunktionsCode[5:0] == FloatMultiplikation ? MultiplikationFloatErgebnis :
                    FunktionsCode[5:0] == FloatQuadratwurzel ? WurzelFloatErgebnis :
                    FunktionsCode[5:0] == FloatDivision ? DivisionFloatErgebnis :
                    FunktionsCode[5:0] == FloatGleichheit ? {31'b0, FloatGleichheitErgebnis} :
                    FunktionsCode[5:0] == FloatUngleichheit ? {31'b0, ~FloatGleichheitErgebnis} :
                    FunktionsCode[5:0] == FloatGroesser ? {31'b0, FloatGroesserErgebnis} :
                    FunktionsCode[5:0] == FloatKleiner ? {31'b0, FloatKleinerErgebnis} :
                    FunktionsCode[5:0] == FloatZuInt ? {31'b0, FloatZuIntErgebnis} :
                    FunktionsCode[5:0] == FloatZuUnsignedInt ? {31'b0, FloatZuUnsignedIntErgebnis} :
                                                        EinfacheRechnungErgebnis;

assign HatFertigGerechnet =     FunktionsCode[5:1] == IntDivision[5:1] ? DivisionFertig:
                                FunktionsCode[5:0] == IntQuadratwurzel ? WurzelFertig :
                                (TakteBisFertig == 0);

assign IntWurzelReset = (FunktionsCode[5:0] == IntQuadratwurzel & StartSignal) | Reset;

assign FloatAdditionDaten2 = {(FunktionsCode[5:0] != FloatAddition),Daten2[30:0]};


always @(posedge Reset or posedge Clock) begin
    if(Reset) begin
        Radikand <= 0;
        TakteBisFertig <= 0;
        DivStb <= 0;
    end else if(TakteBisFertig != 0) begin
        TakteBisFertig <= TakteBisFertig - 1;
        DivStb <= 0;
    end
    else if (StartSignal) begin
        Radikand <= Daten1;
        DivStb <= 0;
        case (FunktionsCode[5:0])
            IntZuFloat : begin
                TakteBisFertig <= 4;
            end
            UnsignedIntZuFloat : begin
                TakteBisFertig <= 4;
            end
            IntDivision: begin
                DivStb <= 1;
            end
            IntModulo: begin
                DivStb <= 1;
            end
            //Float Arithmetik
            //Add.s
            6'b100000: begin
                TakteBisFertig <= 6;
            end
            //Sub.s 
            6'b100001: begin 
                TakteBisFertig <= 6;
            end
            //Mul.s
            6'b100010    : begin 
                TakteBisFertig <= 8;
            end
            //Sqrt.s
            6'b100011    : begin 
                TakteBisFertig <= 9;
            end
            //Div.s
            6'b100100    : begin 
                TakteBisFertig <= 31;
            end
            //Cg.s
            6'b101010	: begin
                TakteBisFertig <= 6;
            end
            //Cl.s
            6'b101011	: begin
                TakteBisFertig <= 6;
            end
            FloatZuInt : begin
                TakteBisFertig <= 1;
            end
            default : begin
                TakteBisFertig <= 0;
            end
        endcase
    end else begin 
        DivStb <= 0;
    end
    
end
endmodule