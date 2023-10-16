module Instruktionsdekodierer (
    input[31:0] Instruktion,
    input DekodierSignal,
    input Reset,
    input Clock,

    output[5:0] QuellRegister1,
    output[5:0] QuellRegister2,
    output[5:0] ZielRegister,
    output[25:0] IDaten,
    output KleinerImmediateAktiv,
    output GrosserImmediateAktiv,
    output[5:0] FunktionsCode,
    output JALBefehl,
    output RelativerSprung,
    output LoadBefehl,
    output StoreBefehl,
    output UnbedingterSprungBefehl,
    output BedingterSprungBefehl,
    output AbsoluterSprung
);

reg [31:0] AktuellerBefehl;

//lesbarkeit
wire[5:0] Opcode;

wire[1:0] RegisterFormat;
wire[1:0] JumpFormat;
wire ImmediateFormat;

wire[1:0] Arithmetik;
wire[1:0] Vergleich;
wire[1:0] Gleitkomma;
wire[1:0] Vektor;

wire[4:0] ZRegister;
wire[4:0] Q1Register;
wire[4:0] Q2Register;
wire[5:0] Funktion;

wire[5:0] FunktionAnfang;

wire[15:0] KleinerImmediate;
wire[25:0] GrosserImmediate;

localparam[5:0] StoreCode = 6'b101100;
localparam[5:0] LoadSCode = 6'b101011;
localparam[5:0] LoadCode  = 6'b101010;
localparam[5:0] JALCode   = 6'b101111;
localparam[5:0] JmpCode   = 6'b010000;
localparam[5:0] BezCode   = 6'b101110;
localparam[5:0] JregCode  = 6'b101101;

assign Opcode = AktuellerBefehl[31:26];

assign RegisterFormat = 2'b00;
assign JumpFormat = 2'b01;
assign ImmediateFormat = 1'b1;
assign Arithmetik = 2'b00;
assign Vergleich = 2'b01;
assign Gleitkomma = 2'b10;
assign Vektor = 2'b11;

assign ZRegister = AktuellerBefehl[25:21];
assign Q1Register = AktuellerBefehl[20:16];
assign Q2Register = AktuellerBefehl[15:11];
assign Funktion = AktuellerBefehl[5:0];
assign FunktionAnfang = AktuellerBefehl[30:26];
assign KleinerImmediate = AktuellerBefehl[15:0];
assign GrosserImmediate = AktuellerBefehl[25:0];
//

always @(posedge Clock) begin
    if(Reset)
        AktuellerBefehl <= 32'b00000000000000000000000000000000;
    else if (DekodierSignal) begin
        AktuellerBefehl <= Instruktion;
    end
end

assign QuellRegister1 =         (AktuellerBefehl[31:30] == RegisterFormat && AktuellerBefehl[5:4] != Gleitkomma) ? {1'b0, Q1Register}:
                                ((AktuellerBefehl[31:30] == RegisterFormat && AktuellerBefehl[5:4] == Gleitkomma) ? {1'b1, Q1Register}:
                                ((AktuellerBefehl[31:31] == ImmediateFormat) ? {1'b0, Q1Register}:
                                6'b0));

assign QuellRegister2 =         (AktuellerBefehl[31:30] == RegisterFormat && AktuellerBefehl[5:4]!= Gleitkomma) ? {1'b0, Q2Register}:
                                ((AktuellerBefehl[31:30] == RegisterFormat && AktuellerBefehl[5:4] == Gleitkomma) ? {1'b1, Q2Register}:
                                ((AktuellerBefehl[31:26] == StoreCode) ? {1'b0, ZRegister}:
                                6'b0));

assign ZielRegister =           (AktuellerBefehl[31:30] == RegisterFormat && AktuellerBefehl[5:4]!= Gleitkomma) ? {1'b0, ZRegister}:
                                (((AktuellerBefehl[31:30] == RegisterFormat && AktuellerBefehl[5:4] == Gleitkomma)||AktuellerBefehl[31:26]==LoadSCode) ? {1'b1, ZRegister}:
                                ((AktuellerBefehl[31:31] == ImmediateFormat) ? {1'b0, ZRegister}:
                                6'b0));
assign IDaten =                 (AktuellerBefehl[31:30] == JumpFormat) ? GrosserImmediate :
                                (AktuellerBefehl[31:31] == ImmediateFormat) ? {{10{AktuellerBefehl[15]}}, KleinerImmediate} :
                                26'b0;

            
assign KleinerImmediateAktiv =  (AktuellerBefehl[31:31] == ImmediateFormat);

assign GrosserImmediateAktiv =  (AktuellerBefehl[31:30] == JumpFormat);
                            
assign FunktionsCode =          (AktuellerBefehl[31:30] == RegisterFormat) ? Funktion:
                                ((AktuellerBefehl[31:30] == JumpFormat||(AktuellerBefehl[31:26] >= LoadCode && AktuellerBefehl[31:26] <= JALCode)) ? 6'b0:
                                {1'b0,FunktionAnfang});

assign JALBefehl =              (AktuellerBefehl[31:26] == JALCode);

assign RelativerSprung =        (AktuellerBefehl[31:26] == JALCode || AktuellerBefehl[31:26] == JmpCode || AktuellerBefehl[31:26] == BezCode);

assign AbsoluterSprung =        (AktuellerBefehl[31:26] == JregCode);                               

assign LoadBefehl =             (AktuellerBefehl[31:26] == LoadCode || AktuellerBefehl[31:26] == LoadSCode);

assign StoreBefehl =            (AktuellerBefehl[31:26] == StoreCode);

assign UnbedingterSprungBefehl =(AktuellerBefehl[31:26] == JregCode || AktuellerBefehl[31:26] == JALCode || AktuellerBefehl[31:26] == JmpCode);

assign BedingterSprungBefehl =  (AktuellerBefehl[31:26] == BezCode); 
endmodule