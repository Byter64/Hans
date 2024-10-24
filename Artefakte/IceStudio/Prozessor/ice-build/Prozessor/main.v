// Code generated by Icestudio 0.11.0-rc2

`default_nettype none

//---- Top entity
module main (
 input [31:0] vbabb27,
 input [31:0] v6c8a4c,
 input vcee139,
 input v1c9ad2,
 input v8eb1f0,
 output [31:0] vf2527f,
 output [31:0] va2e910,
 output vc27e51,
 output vac2531,
 output v5b8f0c,
 output [25:0] vc219a6
);
 wire w0;
 wire w1;
 wire w2;
 wire w3;
 wire [0:5] w4;
 wire [0:5] w5;
 wire [0:5] w6;
 wire [0:5] w7;
 wire w8;
 wire [0:31] w9;
 wire [0:31] w10;
 wire [0:31] w11;
 wire [0:31] w12;
 wire w13;
 wire [0:31] w14;
 wire [0:31] w15;
 wire w16;
 wire w17;
 wire w18;
 wire [0:25] w19;
 wire [0:31] w20;
 wire [0:31] w21;
 wire w22;
 wire [0:31] w23;
 wire [0:31] w24;
 wire [0:31] w25;
 wire w26;
 wire w27;
 wire w28;
 wire [0:31] w29;
 wire w30;
 wire w31;
 wire w32;
 wire w33;
 wire w34;
 wire w35;
 wire w36;
 wire w37;
 wire [0:25] w38;
 wire w39;
 wire [0:25] w40;
 wire [0:25] w41;
 wire w42;
 wire w43;
 wire [0:31] w44;
 wire [0:31] w45;
 assign w9 = vbabb27;
 assign w15 = v6c8a4c;
 assign vc27e51 = w16;
 assign vac2531 = w17;
 assign v5b8f0c = w18;
 assign vf2527f = w23;
 assign va2e910 = w24;
 assign w31 = v1c9ad2;
 assign w32 = v8eb1f0;
 assign w35 = vcee139;
 assign vc219a6 = w40;
 assign w20 = w10;
 assign w21 = w12;
 assign w23 = w10;
 assign w23 = w20;
 assign w25 = w12;
 assign w25 = w21;
 assign w28 = w8;
 assign w29 = w24;
 assign w37 = w36;
 assign w40 = w38;
 assign w41 = w38;
 assign w41 = w40;
 v07c3e9 vc2f165 (
  .v733f38(w0),
  .vcf476d(w1),
  .vc2ff47(w2),
  .vefc2f0(w4),
  .v1d4fda(w5),
  .vcc5aff(w6),
  .v9859e3(w7),
  .ve7b995(w8),
  .vd56645(w15),
  .v009d23(w22),
  .vd5ffa3(w26),
  .vd57811(w27),
  .veae0d5(w36),
  .ve70a4a(w42),
  .vf89c40(w43),
  .v600479(w44)
 );
 v098059 v44d510 (
  .vb9f6e8(w3),
  .v64b2fc(w19),
  .vd4605e(w33),
  .v469cec(w38)
 );
 vd073da v710b38 (
  .v394d0e(w0),
  .v708034(w1),
  .v2d8bc3(w2),
  .v7af967(w3),
  .vdf76b1(w13),
  .vd25d6a(w16),
  .vb561af(w17),
  .vc9a715(w18),
  .v6b1ac6(w27),
  .v54902b(w28),
  .vc6aa74(w30),
  .v5f89cf(w31),
  .v5118c6(w32),
  .vba26c3(w33),
  .v5fb4ea(w34),
  .v6dbede(w35),
  .v333e4c(w37),
  .v4dd373(w39)
 );
 v51b9cf v9b2244 (
  .vaa5d49(w5),
  .v102134(w6),
  .v14eae6(w7),
  .v7d1d02(w11),
  .vc46106(w12),
  .vfab6dd(w24),
  .v247656(w30)
 );
 v625d79 vab0f0a (
  .vcd159e(w4),
  .vea2f6e(w10),
  .v360926(w14),
  .v799830(w34),
  .v1f4289(w39),
  .v3b8228(w45)
 );
 vaa9caf v0ca40e (
  .v604d67(w8),
  .v51b6bc(w9),
  .vcf12e3(w10),
  .va874ad(w11),
  .va16ad8(w36),
  .vbaf620(w38)
 );
 v1215e7 v64a763 (
  .ve0f1d2(w12),
  .va34f84(w13),
  .va96744(w42)
 );
 vef4843 v19f6e3 (
  .ve4871c(w14),
  .v3b6447(w29),
  .v301daf(w43),
  .vc64ed9(w44)
 );
 v433ce5 v059689 (
  .vbda1cf(w19),
  .v5a59b5(w20),
  .vb6adaf(w21),
  .vf95e96(w22)
 );
 v26af9a v1647fe (
  .v5cb37b(w25),
  .vb74a8b(w26),
  .v30c415(w41),
  .v2cf625(w45)
 );
endmodule

//---- Top entity
module v07c3e9 (
 input [31:0] vd56645,
 input vd57811,
 input v39aa65,
 output vd5ffa3,
 output [31:0] v600479,
 output vf89c40,
 output [5:0] vefc2f0,
 output [5:0] v1d4fda,
 output [5:0] vcc5aff,
 output [5:0] v9859e3,
 output veae0d5,
 output v733f38,
 output ve7b995,
 output vcf476d,
 output vc2ff47,
 output ve70a4a,
 output v009d23
);
 wire [0:31] w0;
 wire w1;
 wire w2;
 wire [0:5] w3;
 wire w4;
 wire w5;
 wire w6;
 wire w7;
 wire w8;
 wire w9;
 wire w10;
 wire w11;
 wire w12;
 wire [0:31] w13;
 wire [0:5] w14;
 wire [0:5] w15;
 wire [0:5] w16;
 assign w0 = vd56645;
 assign w1 = vd57811;
 assign w2 = v39aa65;
 assign vefc2f0 = w3;
 assign vf89c40 = w4;
 assign ve7b995 = w5;
 assign veae0d5 = w6;
 assign ve70a4a = w7;
 assign v009d23 = w8;
 assign vc2ff47 = w9;
 assign vcf476d = w10;
 assign v733f38 = w11;
 assign vd5ffa3 = w12;
 assign v600479 = w13;
 assign v9859e3 = w14;
 assign vcc5aff = w15;
 assign v1d4fda = w16;
 v07c3e9_vb2d435 vb2d435 (
  .Instruktion(w0),
  .DekodierSignal(w1),
  .Reset(w2),
  .FunktionsCode(w3),
  .ImmediateAktiv(w4),
  .JALBefehl(w5),
  .LoadBefehl(w6),
  .Sprungbedingung(w7),
  .AbsoluterSprung(w8),
  .BedingterSprungBefehl(w9),
  .UnbedingterSprungBefehl(w10),
  .StoreBefehl(w11),
  .RelativerSprung(w12),
  .IDaten(w13),
  .ZielRegister(w14),
  .QuellRegister2(w15),
  .QuellRegister1(w16)
 );
endmodule

//---------------------------------------------------
//-- Instruktionsdekodierer
//-- - - - - - - - - - - - - - - - - - - - - - - - --
//-- 
//---------------------------------------------------

module v07c3e9_vb2d435 (
 input [31:0] Instruktion,
 input DekodierSignal,
 input Reset,
 output [5:0] QuellRegister1,
 output [5:0] QuellRegister2,
 output [5:0] ZielRegister,
 output [31:0] IDaten,
 output ImmediateAktiv,
 output [5:0] FunktionsCode,
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
 reg [31:0] AktuellerBefehl;
 
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
                                 (Format[1] == ImmediateFormat && Opcode > AddisCode && Opcode < LoadCode) ? {16'b0, KleinerImmediate} :
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
//---- Top entity
module v098059 (
 input [25:0] v64b2fc,
 input vb9f6e8,
 input vd4605e,
 input vfd4a34,
 output [25:0] v469cec
);
 wire [0:25] w0;
 wire [0:25] w1;
 wire w2;
 wire w3;
 wire w4;
 assign v469cec = w0;
 assign w1 = v64b2fc;
 assign w2 = vb9f6e8;
 assign w3 = vd4605e;
 assign w4 = vfd4a34;
 v098059_v6a75bb v6a75bb (
  .AktuellerPc(w0),
  .NeuerPC(w1),
  .SchreibSignal(w2),
  .TaktSignal(w3),
  .Reset(w4)
 );
endmodule

//---------------------------------------------------
//-- Programmzähler
//-- - - - - - - - - - - - - - - - - - - - - - - - --
//-- 
//---------------------------------------------------

module v098059_v6a75bb (
 input [25:0] NeuerPC,
 input SchreibSignal,
 input TaktSignal,
 input Reset,
 output [25:0] AktuellerPc
);
 reg[25:0] programmzahler;
 reg[25:0] AktuellerPC;
 always @(posedge TaktSignal or posedge Reset) begin
     if(Reset)
         AktuellerPC <= 25'b0;
     else begin
         if(SchreibSignal)
             AktuellerPC <= NeuerPC + 1'b1;
         else
             AktuellerPC <= AktuellerPC + 1'b1;
     end
 end
endmodule
//---- Top entity
module vd073da (
 input v333e4c,
 input v394d0e,
 input v54902b,
 input v708034,
 input v2d8bc3,
 input vdf76b1,
 input v6dbede,
 input v5f89cf,
 input v5118c6,
 input v4dd373,
 input v9d2ce3,
 input v581dfa,
 output vc6aa74,
 output v5fb4ea,
 output vd25d6a,
 output vb561af,
 output vc9a715,
 output v7af967,
 output vba26c3,
 output v6b1ac6
);
 wire w0;
 wire w1;
 wire w2;
 wire w3;
 wire w4;
 wire w5;
 wire w6;
 wire w7;
 wire w8;
 wire w9;
 wire w10;
 wire w11;
 wire w12;
 wire w13;
 wire w14;
 wire w15;
 wire w16;
 wire w17;
 wire w18;
 wire w19;
 assign w0 = v333e4c;
 assign w1 = v394d0e;
 assign w2 = v54902b;
 assign w3 = v708034;
 assign w4 = v2d8bc3;
 assign w5 = vdf76b1;
 assign w6 = v4dd373;
 assign w7 = v6dbede;
 assign w8 = v5f89cf;
 assign w9 = v5118c6;
 assign w10 = v9d2ce3;
 assign w11 = v581dfa;
 assign vc6aa74 = w12;
 assign v5fb4ea = w13;
 assign vd25d6a = w14;
 assign vb561af = w15;
 assign vc9a715 = w16;
 assign v7af967 = w17;
 assign vba26c3 = w18;
 assign v6b1ac6 = w19;
 vd073da_ve6caed ve6caed (
  .LoadBefehl(w0),
  .StoreBefehl(w1),
  .JALBefehl(w2),
  .UnbedingterSprungBefehl(w3),
  .BedingterSprungBefehl(w4),
  .Bedingung(w5),
  .ALUFertig(w6),
  .BefehlGeladen(w7),
  .DatenGeladen(w8),
  .DatenGespeichert(w9),
  .Clock(w10),
  .Reset(w11),
  .RegisterSchreibSignal(w12),
  .ALUStartSignal(w13),
  .LoadBefehlSignal(w14),
  .LoadDatenSignal(w15),
  .StoreDatenSignal(w16),
  .PCSprungSignal(w17),
  .PCSignal(w18),
  .DekodierSignal(w19)
 );
endmodule

//---------------------------------------------------
//-- Steuerung
//-- - - - - - - - - - - - - - - - - - - - - - - - --
//-- 
//---------------------------------------------------

module vd073da_ve6caed (
 input LoadBefehl,
 input StoreBefehl,
 input JALBefehl,
 input UnbedingterSprungBefehl,
 input BedingterSprungBefehl,
 input Bedingung,
 input ALUFertig,
 input BefehlGeladen,
 input DatenGeladen,
 input DatenGespeichert,
 input Clock,
 input Reset,
 output RegisterSchreibSignal,
 output ALUStartSignal,
 output LoadBefehlSignal,
 output LoadDatenSignal,
 output StoreDatenSignal,
 output PCSprungSignal,
 output PCSignal,
 output DekodierSignal
);
   localparam FETCH = 3'b000;
     localparam DECODE = 3'b001;
     localparam ALU1 = 3'b010;
     localparam ALU = 3'b011;
     localparam WRITEBACK_JUMP = 3'b100;
     localparam WRITEBACK_STORE = 3'b101;
     localparam WRITEBACK_LOAD = 3'b110;
     localparam WRITEBACK_DEFAULT = 3'b111;
 
     reg [2:0] current_state;
     reg [2:0] next_state;
 
     //combinational portion
     
     always @(*) begin
         case(current_state)
             FETCH: begin
                 if (BefehlGeladen)
                     next_state <= DECODE;
                 else
                     next_state <= FETCH;
             end
             DECODE:
                 next_state <= ALU1;
             ALU1: begin
                 if (ALUFertig) begin
                     if (UnbedingterSprungBefehl || BedingterSprungBefehl)
                         next_state <= WRITEBACK_JUMP;
                     else if (StoreBefehl)
                         next_state <= WRITEBACK_STORE;
                     else if (LoadBefehl)
                         next_state <= WRITEBACK_LOAD;
                     else
                         next_state <= WRITEBACK_DEFAULT;
                 end
                 else
                     next_state <= ALU;
             end
             ALU: begin
                 if (ALUFertig) begin
                     if (UnbedingterSprungBefehl || BedingterSprungBefehl)
                         next_state <= WRITEBACK_JUMP;
                     else if (StoreBefehl)
                         next_state <= WRITEBACK_STORE;
                     else if (LoadBefehl)
                         next_state <= WRITEBACK_LOAD;
                     else
                         next_state <= WRITEBACK_DEFAULT;
                 end
                 else
                     next_state <= ALU;
             end
             WRITEBACK_JUMP:
                 next_state <= FETCH;
             WRITEBACK_STORE: begin
                 if (DatenGespeichert)
                     next_state <= FETCH;
                 else
                     next_state <= WRITEBACK_STORE;
             end
             WRITEBACK_LOAD: begin
                 if (DatenGeladen)
                     next_state <= WRITEBACK_DEFAULT;
                 else
                     next_state <= WRITEBACK_LOAD;
             end
             WRITEBACK_DEFAULT:
                 next_state <= FETCH;
             default:
                 next_state <= FETCH;
         endcase
     end
     
     assign LoadBefehlSignal = current_state == FETCH;
     assign DekodierSignal = current_state == DECODE;
     assign ALUStartSignal = current_state == ALU1;
     assign RegisterSchreibSignal = ((current_state == ALU || current_state == ALU1) && JALBefehl) || current_state == WRITEBACK_DEFAULT;
     assign PCSignal = current_state > ALU;
     assign StoreDatenSignal = current_state == WRITEBACK_STORE;
     assign LoadDatenSignal = current_state == WRITEBACK_LOAD;
 
     assign PCSprungSignal = UnbedingterSprungBefehl || (BedingterSprungBefehl && Bedingung);
 
     //sequential portion
 
     always @(posedge Clock) begin
         if (Reset)
             current_state <= FETCH;
         else
             current_state <= next_state;
     end
endmodule
//---- Top entity
module v51b9cf (
 input [31:0] v7d1d02,
 input [5:0] vaa5d49,
 input [5:0] v102134,
 input [5:0] v14eae6,
 input v247656,
 input v0c6cf9,
 input vf4f365,
 output [31:0] vfab6dd,
 output [31:0] vc46106
);
 wire [0:31] w0;
 wire [0:31] w1;
 wire [0:5] w2;
 wire [0:5] w3;
 wire [0:31] w4;
 wire [0:5] w5;
 wire w6;
 wire w7;
 wire w8;
 assign vfab6dd = w0;
 assign vc46106 = w1;
 assign w2 = vaa5d49;
 assign w3 = v102134;
 assign w4 = v7d1d02;
 assign w5 = v14eae6;
 assign w6 = v247656;
 assign w7 = v0c6cf9;
 assign w8 = vf4f365;
 v51b9cf_v2e62ee v2e62ee (
  .QuellDaten2(w0),
  .QuellDaten1(w1),
  .QuellRegister1(w2),
  .QuellRegister2(w3),
  .ZielDaten(w4),
  .ZielRegister(w5),
  .Schreibsignal(w6),
  .Reset(w7),
  .Clock(w8)
 );
endmodule

//---------------------------------------------------
//-- Register
//-- - - - - - - - - - - - - - - - - - - - - - - - --
//-- 
//---------------------------------------------------

module v51b9cf_v2e62ee (
 input [5:0] QuellRegister1,
 input [5:0] QuellRegister2,
 input [31:0] ZielDaten,
 input [5:0] ZielRegister,
 input Schreibsignal,
 input Reset,
 input Clock,
 output [31:0] QuellDaten1,
 output [31:0] QuellDaten2
);
 reg [31:0] registers [63:0];
 
 assign QuellDaten1 = registers[QuellRegister1];
 assign QuellDaten2 = registers[QuellRegister2];
 integer i;
 
 always @(posedge Clock) begin
     if(Reset) begin
         for (i = 0; i < 64; i = i + 1) begin
             registers[i] <= 32'b00000000000000000000000000000000; 
         end
     end
     else if(Schreibsignal) begin 
         if(ZielRegister != 0)
             registers[ZielRegister] <= ZielDaten;
     end
 end
endmodule
//---- Top entity
module v625d79 (
 input [5:0] vcd159e,
 input [31:0] v3b8228,
 input [31:0] v360926,
 input v799830,
 input va8998d,
 input v71b696,
 output v1f4289,
 output [31:0] vea2f6e
);

endmodule

//---------------------------------------------------
//-- ALU
//-- - - - - - - - - - - - - - - - - - - - - - - - --
//-- 
//---------------------------------------------------
//---- Top entity
module vaa9caf (
 input [31:0] vcf12e3,
 input [25:0] vbaf620,
 input [31:0] v51b6bc,
 input v604d67,
 input va16ad8,
 output [31:0] va874ad
);
 wire [0:31] w0;
 wire [0:31] w1;
 wire [0:25] w2;
 wire [0:31] w3;
 wire w4;
 wire w5;
 assign va874ad = w0;
 assign w1 = vcf12e3;
 assign w2 = vbaf620;
 assign w3 = v51b6bc;
 assign w4 = v604d67;
 assign w5 = va16ad8;
 vaa9caf_vf5b85c vf5b85c (
  .ZielDaten(w0),
  .ALUErgebnis(w1),
  .AktuellerPC(w2),
  .LoadErgebnis(w3),
  .JALBefehl(w4),
  .LoadBefehl(w5)
 );
endmodule

//---------------------------------------------------
//-- MultiplexerZielDaten
//-- - - - - - - - - - - - - - - - - - - - - - - - --
//-- Multiplext Datan von der ALU, vom RAM und vom Immediate Operand
//---------------------------------------------------

module vaa9caf_vf5b85c (
 input [31:0] ALUErgebnis,
 input [25:0] AktuellerPC,
 input [31:0] LoadErgebnis,
 input JALBefehl,
 input LoadBefehl,
 output [31:0] ZielDaten
);
  assign ZielDaten = (JALBefehl==1'b1)? {6'b0,AktuellerPC}:
                     ((LoadBefehl==1'b1)? LoadErgebnis:
                     ALUErgebnis);
 
endmodule
//---- Top entity
module v1215e7 (
 input va96744,
 input [31:0] ve0f1d2,
 output va34f84
);
 wire w0;
 wire w1;
 wire [0:31] w2;
 assign va34f84 = w0;
 assign w1 = va96744;
 assign w2 = ve0f1d2;
 v1215e7_v750499 v750499 (
  .Ergebnis(w0),
  .GleichNullPruefen(w1),
  .Eingang(w2)
 );
endmodule

//---------------------------------------------------
//-- Bedingungsprüfer
//-- - - - - - - - - - - - - - - - - - - - - - - - --
//-- Vornort alle Bits und gibt das Ergebnis aus
//---------------------------------------------------

module v1215e7_v750499 (
 input [31:0] Eingang,
 input GleichNullPruefen,
 output Ergebnis
);
 assign Ergebnis = GleichNullPruefen ? Eingang == 32'b0:
                                       Eingang != 32'b0;
endmodule
//---- Top entity
module vef4843 (
 input [31:0] vc64ed9,
 input v301daf,
 input [31:0] v3b6447,
 output [31:0] ve4871c
);
 wire [0:31] w0;
 wire [0:31] w1;
 wire [0:31] w2;
 wire w3;
 assign ve4871c = w0;
 assign w1 = v3b6447;
 assign w2 = vc64ed9;
 assign w3 = v301daf;
 vef4843_v1f6a49 v1f6a49 (
  .Daten2(w0),
  .RegisterDaten2(w1),
  .Immediate(w2),
  .ImmediateAktiv(w3)
 );
endmodule

//---------------------------------------------------
//-- MultiplexerAluDaten
//-- - - - - - - - - - - - - - - - - - - - - - - - --
//-- Multiplext die möglichen ALU Eingänge (Register, kleiner und großer Immediate)
//---------------------------------------------------

module vef4843_v1f6a49 (
 input [31:0] RegisterDaten2,
 input [31:0] Immediate,
 input ImmediateAktiv,
 output [31:0] Daten2
);
  assign Daten2 = (ImmediateAktiv==1'b1)? Immediate:
                     RegisterDaten2;
 
endmodule
//---- Top entity
module v433ce5 (
 input [31:0] v5a59b5,
 input [31:0] vb6adaf,
 input vf95e96,
 output [25:0] vbda1cf
);
 wire [0:25] w0;
 wire [0:31] w1;
 wire [0:31] w2;
 wire w3;
 assign vbda1cf = w0;
 assign w1 = v5a59b5;
 assign w2 = vb6adaf;
 assign w3 = vf95e96;
 v433ce5_va3c7f8 va3c7f8 (
  .NeuerPC(w0),
  .RelativerPC(w1),
  .AbsoluterPC(w2),
  .IstAbsolut(w3)
 );
endmodule

//---------------------------------------------------
//-- MultiplexerNeuerPc
//-- - - - - - - - - - - - - - - - - - - - - - - - --
//-- Multiplext relative und absolute neue PCs. Die Bits 31 bis 26 werden ignoriert
//---------------------------------------------------

module v433ce5_va3c7f8 (
 input [31:0] RelativerPC,
 input [31:0] AbsoluterPC,
 input IstAbsolut,
 output [25:0] NeuerPC
);
 
  assign NeuerPC = (IstAbsolut)?AbsoluterPC[25:0]:
                                RelativerPC[25:0];
endmodule
//---- Top entity
module v26af9a (
 input [25:0] v30c415,
 input vb74a8b,
 input [31:0] v5cb37b,
 output [31:0] v2cf625
);
 wire [0:25] w0;
 wire [0:31] w1;
 wire w2;
 wire [0:31] w3;
 assign w0 = v30c415;
 assign w1 = v5cb37b;
 assign w2 = vb74a8b;
 assign v2cf625 = w3;
 v26af9a_v1a718f v1a718f (
  .AktuellerPC(w0),
  .QuellDaten1(w1),
  .RelativerSprungBefehl(w2),
  .Daten1(w3)
 );
endmodule

//---------------------------------------------------
//-- MultiplexerAluDaten2
//-- - - - - - - - - - - - - - - - - - - - - - - - --
//-- Multiplext den aktuellen PC mit den Quelldaten2
//---------------------------------------------------

module v26af9a_v1a718f (
 input [25:0] AktuellerPC,
 input [31:0] QuellDaten1,
 input RelativerSprungBefehl,
 output [31:0] Daten1
);
  assign Daten1 = (RelativerSprungBefehl==1'b1)? {6'b0,AktuellerPC}:
                     QuellDaten1;
 
endmodule
