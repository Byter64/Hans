`include "../Prozessor/ALUModule/Intsqrt.v"
`include "../Prozessor/ALUModule/divfunc.v"
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
reg[7:0] TakteBisFertig = 0;
wire[31:0] FloatAdditionDaten2;
wire[31:0] EinfacheRechnungErgebnis;
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
wire DivModFertig;
wire DivModStart;
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


wire[30:0] DivDaten1;
wire[30:0] DivDaten2;
wire[31:0] DivisionErgebnis;
wire[31:0] ModuloErgebnis;
wire[30:0] DivisionErgebnisU; //Div und Mod
wire[30:0] ModuloErgebnisU;
assign DivDaten1 = (Daten1[31] == 1'b0)?Daten1[30:0]:~Daten1[30:0]+30'b1;
assign DivDaten2 = (Daten2[31] == 1'b0)?Daten2[30:0]:~Daten2[30:0]+30'b1;
assign ModuloErgebnis = (Daten1[31] ~^ Daten2[31])?{1'b0,ModuloErgebnisU}:{1'b1,~(ModuloErgebnisU-30'b1)};
assign DivisionErgebnis = (Daten1[31] ~^ Daten2[31])?{1'b0,DivisionErgebnisU}:{1'b1,~(DivisionErgebnisU-30'b1)};
divfunc #(  .XLEN(31),
            .STAGE_LIST(31'b0000010101010101111111111111111))
        DivisionsModul (
            .clk(Clock),
            .rst(Reset),
            .a(DivDaten1),
            .b(DivDaten2),
            .vld(DivModStart),
            .quo(DivisionErgebnisU),
            .rem(ModuloErgebnisU),
            .ack(DivModFertig)
        );

assign DivModStart = StartSignal && (FunktionsCode == IntDivision || FunktionsCode == IntModulo);

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

assign EinfacheRechnungErgebnis =   FunktionsCode[5:0] == IntAddition           ? $signed(Daten1) + $signed(Daten2) :
                                    FunktionsCode[5:0] == IntSubtraktion        ? $signed(Daten1) - $signed(Daten2) :
                                    FunktionsCode[5:0] == IntMultiplikation     ? $signed(Daten1) * $signed(Daten2) :
                                    FunktionsCode[5:0] == LinksSchiebenArithm   ? $signed(Daten1) <<< $signed(Daten2) :
                                    FunktionsCode[5:0] == RechtsSchiebenArithm  ? $signed(Daten1) >>> $signed(Daten2) :
                                    FunktionsCode[5:0] == Gleichheit            ? $signed({31'b0, Daten1 == Daten2})  : 
                                    FunktionsCode[5:0] == Ungleichheit          ? $signed({31'b0, Daten1 != Daten2})  :
                                    FunktionsCode[5:0] == Groesser              ? $signed({31'b0, $signed(Daten1) > $signed(Daten2)})  :     
                                    FunktionsCode[5:0] == Kleiner               ? $signed({31'b0, $signed(Daten1) < $signed(Daten2)})  :
                                    FunktionsCode[5:0] == GroesserUnsigned      ? $signed({31'b0, Daten1 > Daten2}) : 
                                    FunktionsCode[5:0] == KleinerUnsigned       ? $signed({31'b0, Daten1 < Daten2}) : 
                                    FunktionsCode[5:0] == Verneinung            ? $signed(~Daten1) : 
                                    FunktionsCode[5:0] == Und                   ? $signed(Daten1 & Daten2) :        
                                    FunktionsCode[5:0] == Oder                  ? $signed(Daten1 | Daten2) :       
                                    FunktionsCode[5:0] == Ungleich              ? $signed(Daten1 ^ Daten2) :   
                                    FunktionsCode[5:0] == Gleich                ? $signed(Daten1 ~^ Daten2) :
                                    FunktionsCode[5:0] == LinksSchiebenLogik    ? $signed(Daten1 << $signed(Daten2)) :
                                    FunktionsCode[5:0] == RechtsSchiebenLogik   ? $signed(Daten1 >> $signed(Daten2)) : $signed(0);

assign Ergebnis =   FunktionsCode[5:0] == IntQuadratwurzel      ? WurzelErgebnis :
                    FunktionsCode[5:0] == IntDivision           ? DivisionErgebnis :
                    FunktionsCode[5:0] == IntModulo             ? ModuloErgebnis :
                    FunktionsCode[5:0] == IntZuFloat            ? IntZuFloatErgebnis :
                    FunktionsCode[5:0] == UnsignedIntZuFloat    ? UnsignedIntZuFloatErgebnis :
                    FunktionsCode[5:0] == FloatAddition         ? AdditionFloatErgebnis :
                    FunktionsCode[5:0] == FloatSubtraktion      ? AdditionFloatErgebnis :
                    FunktionsCode[5:0] == FloatMultiplikation   ? MultiplikationFloatErgebnis :
                    //FunktionsCode[5:0] == FloatQuadratwurzel  ? WurzelFloatErgebnis :
                    FunktionsCode[5:0] == FloatDivision         ? DivisionFloatErgebnis :
                    FunktionsCode[5:0] == FloatGleichheit       ? {31'b0, FloatGleichheitErgebnis} :
                    FunktionsCode[5:0] == FloatUngleichheit     ? {31'b0, ~FloatGleichheitErgebnis} :
                    FunktionsCode[5:0] == FloatGroesser         ? {31'b0, FloatGroesserErgebnis} :
                    FunktionsCode[5:0] == FloatKleiner          ? {31'b0, FloatKleinerErgebnis} :
                    FunktionsCode[5:0] == FloatZuInt            ? {31'b0, FloatZuIntErgebnis} :
                    FunktionsCode[5:0] == FloatZuUnsignedInt    ? {31'b0, FloatZuUnsignedIntErgebnis} :
                                                                  EinfacheRechnungErgebnis;

assign HatFertigGerechnet = (FunktionsCode == IntDivision || FunktionsCode == IntModulo)?(DivModFertig):
                            (FunktionsCode == IntQuadratwurzel)?(WurzelFertig):
                            (TakteBisFertig == 0);

assign IntWurzelReset = (FunktionsCode == IntQuadratwurzel & StartSignal) | Reset;

assign FloatAdditionDaten2 = {(FunktionsCode != FloatAddition),Daten2[30:0]};
//Fehlende Befehle
//FloatQuadratwurzel

always @(posedge Clock) begin
    if(TakteBisFertig != 0) begin
        TakteBisFertig <= TakteBisFertig - 1;
    end
    else if (StartSignal) begin
        Radikand <= Daten1;
        case (FunktionsCode[5:0])
            IntZuFloat : begin
                TakteBisFertig <= 5;
            end
            UnsignedIntZuFloat : begin
                TakteBisFertig <= 5;
            end
            //Float Arithmetik
            //Add.s
            FloatAddition: begin
                TakteBisFertig <= 7;
            end
            //Sub.s 
            FloatSubtraktion: begin 
                TakteBisFertig <= 7;
            end
            //Mul.s
            FloatMultiplikation    : begin 
                TakteBisFertig <= 9;
            end
            //Sqrt.s
            FloatQuadratwurzel    : begin 
                TakteBisFertig <= 10;
            end
            //Div.s
            FloatDivision    : begin 
                TakteBisFertig <= 36;
            end
            //Cg.s
            FloatGroesser	: begin
                TakteBisFertig <= 7;
            end
            //Cl.s
            FloatKleiner	: begin
                TakteBisFertig <= 7;
            end
            FloatZuInt : begin
                TakteBisFertig <= 2;
            end
            FloatZuUnsignedInt : begin
                TakteBisFertig <= 1;
            end
            default : begin
                TakteBisFertig <= 0;
            end
        endcase
    end
    if(Reset) begin
        TakteBisFertig <= 0;
    end
end
endmodule