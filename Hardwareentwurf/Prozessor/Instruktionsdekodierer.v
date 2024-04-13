module Instruktionsdekodierer (
    input[31:0] Instruktion,
    input DekodierSignal,
    input Reset,

    output[5:0] QuellRegister1,
    output[5:0] QuellRegister2,
    output[5:0] ZielRegister,
    output[31:0] IDaten,
    output ImmediateAktiv,
    output[5:0] FunktionsCode,
    output JALBefehl,
    output RelativerSprung,
    output LoadBefehl,
    output StoreBefehl,
    output UnbedingterSprungBefehl,
    output BedingterSprungBefehl,
    output AbsoluterSprung,
    output Sprungbedingung
);

//Aktuell gespeicherte Befehl
reg [31:0] AktuellerBefehl = 0;

//Wires für Lesbaren Code
wire[5:0] Opcode;
wire[1:0] Format;
wire[1:0] Kategorie;
wire[4:0] ZRegister;
wire[4:0] Q1Register;
wire[4:0] Q2Register;
wire[5:0] Funktion;
wire[5:0] FunktionAnfang;
wire[15:0] KleinerImmediate;
wire[25:0] GrosserImmediate;
wire[3:0] GleitkommaBefehl;

assign Opcode = AktuellerBefehl[31:26];
assign Format = AktuellerBefehl[31:30];
assign Kategorie = AktuellerBefehl[5:4];
assign ZRegister = AktuellerBefehl[25:21];
assign Q1Register = AktuellerBefehl[20:16];
assign Q2Register = AktuellerBefehl[15:11];
assign Funktion = AktuellerBefehl[5:0];
assign FunktionAnfang = AktuellerBefehl[30:26];
assign KleinerImmediate = AktuellerBefehl[15:0];
assign GrosserImmediate = AktuellerBefehl[25:0];
assign GleitkommaBefehl = AktuellerBefehl[3:0];

//wichtige Befehle die einzeln behandelt werden muessen
localparam[5:0] LoadCode   = 6'b111000;
localparam[5:0] LoadSCode  = 6'b111001;
localparam[5:0] StoreCode  = 6'b111010;
localparam[5:0] StoreSCode = 6'b111011;
localparam[5:0] JregCode   = 6'b111100;
localparam[5:0] BezCode    = 6'b111101;
localparam[5:0] BNezCode   = 6'b111110;
localparam[5:0] JALCode    = 6'b111111;
localparam[5:0] JmpCode    = 6'b010000;
localparam[5:0] AddisCode  = 6'b110000;

//wichtige Formate die behandelt werden muessen
localparam[1:0] RegisterFormat = 2'b00;
localparam[1:0] JumpFormat = 2'b01;
localparam ImmediateFormat = 1'b1;
localparam FloatVergleich = 1'b1;
localparam[1:0] Arithmetik = 2'b00;
localparam[1:0] Vergleich = 2'b01;
localparam[1:0] Gleitkomma = 2'b10;
localparam[1:0] Vektor = 2'b11;

//START LOGIK

always @(posedge Reset or posedge DekodierSignal) begin
    if(Reset)
        AktuellerBefehl <= 32'b00000000000000000000000000000000;
    else begin
        AktuellerBefehl <= Instruktion;
    end
end

assign QuellRegister1 =         {((Format == RegisterFormat && Kategorie == Gleitkomma) ? 1'b1 : 1'b0), Q1Register};

assign QuellRegister2 =         (Opcode == StoreCode) ? {1'b0, ZRegister}:
                                (Opcode == StoreSCode) ? {1'b1, ZRegister}:
                                {((Format == RegisterFormat && Kategorie == Gleitkomma) ? 1'b1 : 1'b0), Q2Register};

assign ZielRegister =           (Opcode==LoadSCode || Opcode == StoreSCode || ((Format == RegisterFormat && Kategorie == Gleitkomma && GleitkommaBefehl < 8)) ? {1'b1, ZRegister}:
                                (((Format == RegisterFormat) || (Format[1] == ImmediateFormat)) ? {1'b0, ZRegister}:
                                6'b0));

assign IDaten =                 (Format == JumpFormat) ? {6'b0, GrosserImmediate} :
                                (Opcode == AddisCode) ? {KleinerImmediate, 16'b0} : 
                                (Format[1] == ImmediateFormat) ? {{16{KleinerImmediate[15]}}, KleinerImmediate} :
                                32'b0;

assign ImmediateAktiv =         (Format == JumpFormat || Format[1] == ImmediateFormat);
                            
assign FunktionsCode =          (Format == RegisterFormat) ? Funktion :
                                ((Opcode == AddisCode || Format == JumpFormat||(Opcode >= LoadCode && Opcode <= JALCode)) ? 6'b0:
                                {1'b0,FunktionAnfang});

assign JALBefehl =              (Opcode == JALCode);

assign RelativerSprung =        (Opcode == JALCode || Opcode == JmpCode || Opcode == BezCode || Opcode == BNezCode);

assign AbsoluterSprung =        (Opcode == JregCode);                               

assign LoadBefehl =             (Opcode == LoadCode || Opcode == LoadSCode);

assign StoreBefehl =            (Opcode == StoreCode || Opcode == StoreSCode);

assign UnbedingterSprungBefehl =(Opcode == JregCode || Opcode == JALCode || Opcode == JmpCode);

assign BedingterSprungBefehl =  (Opcode == BezCode || Opcode == BNezCode); 

assign Sprungbedingung =           (Opcode == BezCode);

endmodule