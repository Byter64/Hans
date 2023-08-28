`include "../ALU.v"
`include "../Instruktionsdekodierer.v"
`include "../MultiplexerAluDaten.v"
`include "../MultiplexerAluDaten2.v"
`include "../MultiplexerNeuerPC.v"
`include "../MultiplexerZielDaten.v"
`include "../NullPruefer.v"
`include "../Programmzahler.v"
`include "../Register.v"
`include "../Steuerung.v"


module CPU (
    input[31:0] DatenRein,
    input[31:0] Instruktion,
    input InstruktionGeladen,
    input DatenGeladen,
    input DatenGespeichert,
    input Clock,
    input Reset,

    output[31:0] InstruktionAdresse,
    output[31:0] DatenRaus,
    output[31:0] DatenAdresse,
    output       LeseDaten,
    output       SchreibeDaten,
    output       LeseInstruktion
);


assign InstruktionAdresse = {6'b0, AktuellerPC};
assign DatenRaus = ALUErgebnis;
assign DatenAdresse = QuellDaten2;

//██████████████████████████████████████████
//████Signale von Instruktionsdekodierer████
//██████████████████████████████████████████
wire[5:0] QuellRegister1; 
wire[5:0] QuellRegister2; 
wire[5:0] ZielRegister;   
wire[25:0] IDaten;       
wire KleinerImmediateAktiv;  
wire GrosserImmediateAktiv;  
wire[5:0] FunktionsCode;  
wire JALBefehl;              
wire RelativerSprungBefehl;        
wire FloatBefehl;            
wire LoadBefehl;             
wire StoreBefehl;            
wire UnbedingterSprungBefehl;
wire BedingterSprungBefehl;  
wire AbsoluterSprung;

//███████████████████████████████████████
//████Signale von MultiplexerAluDaten████
//███████████████████████████████████████
wire[31:0] AluDaten2 = 32'b0;

//████████████████████████████████████████
//████Signale von MultiplexerZielDaten████
//████████████████████████████████████████
wire[31:0] ZielDaten = 32'b0;

//██████████████████████████████████████
//████Signale von MultiplexerNeuerPC████
//██████████████████████████████████████
wire[25:0] NeuerPC = 32'b0;

//█████████████████████████████████████████
//████Signale von MultiplexerAluPCDaten████
//█████████████████████████████████████████
wire[31:0] AluDaten1 = 32'b0;


//████████████████████████████
//████Signale von Register████
//████████████████████████████
wire[31:0] QuellDaten1 = 32'b0;
wire[31:0] QuellDaten2 = 32'b0;

//███████████████████████████████
//████Signale von Nullpruefer████
//███████████████████████████████
wire Sprungbedingung = 0;

//█████████████████████████████
//████Signale von Steuerung████
//█████████████████████████████
wire ALUStartSignal = 0;
wire ALUSchreibSignal = 0;
wire DekodierSignal;
wire PCSprungSignal = 0;
wire PCSignal = 0;
wire RegisterSchreibsignal = 0;

//███████████████████████
//████Signale von ALU████
//███████████████████████
wire[31:0] ALUErgebnis = 32'b0;

//██████████████████████
//████Signale von PC████
//██████████████████████
wire[25:0] AktuellerPC = 25'b0;

Instruktionsdekodierer Indek(
    .Instruktion(Instruktion),
    .DekodierSignal(DekodierSignal),
    .Reset(Reset),
    .QuellRegister1(QuellRegister1),
    .QuellRegister2(QuellRegister2),
    .ZielRegister(ZielRegister),
    .IDaten(IDaten),
    .KleinerImmediateAktiv(KleinerImmediateAktiv),
    .GrosserImmediateAktiv(GrosserImmediateAktiv),
    .FunktionsCode(FunktionsCode),
    .JALBefehl(JALBefehl),
    .RelativerSprung(RelativerSprung),
    .FloatBefehl(FloatBefehl),
    .LoadBefehl(LoadBefehl),
    .StoreBefehl(StoreBefehl),
    .UnbedingterSprungBefehl(UnbedingterSprungBefehl),
    .BedingterSprungBefehl(BedingterSprungBefehl),
    .AbsoluterSprung(AbsoluterSprung)
);

Register Register(
    .QuellRegister1(QuellRegister1),
    .QuellRegister2(QuellRegister2),
    .ZielDaten(ZielDaten),
    .ZielRegister(ZielRegister),
    .Schreibsignal(RegisterSchreibsignal),
    .Reset(Reset),
    .QuellDaten1(QuellDaten1),
    .QuellDaten2(QuellDaten2)
);

MultiplexerAluDaten MulAluDaten(
    .RegisterDaten2(QuellDaten2),
    .Immediate(IDaten),
    .ImmediateAktiv(ImmediateAktiv),
    .Daten2(AluDaten2)
);

MultiplexerZielDaten MulZielDaten(
    .ALUErgebnis(ALUErgebnis),
    .AktuellerPC(AktuellerPC),
    .LoadErgebnis(DatenRein),
    .JALBefehl(JALBefehl),
    .LoadBefehl(LoadBefehl),
    .ZielDaten(ZielDaten)
);

MultiplexerNeuerPC MulNeuerPC(
    .RelativerPC(ALUErgebnis),
    .AbsoluterPC(QuellDaten1),
    .IstAbsolut(AbsoluterSprung),
    .NeuerPC(NeuerPC)
);

MultiplexerAluDaten2 MulAluDaten2(
    .AktuellerPC(AktuellerPC),
    .QuellDaten1(QuellDaten1),
    .RelativerSprungBefehl(RelativerSprungBefehl),
    .Daten1(AluDaten1)
);

NullPruefer NullPruefer(
    .Eingang(QuellDaten1),
    .Ergebnis(Sprungbedingung)
);

Steuerung Steuerung(
    .Funktionscode(FunktionsCode),
    .LoadBefehl(LoadBefehl),
    .StoreBefehl(StoreBefehl),
    .JALBefehl(JALBefehl),
    .UnbedingterSprungBefehl(UnbedingterSprungBefehl),
    .BedingterSprungBefehl(BedingterSprungBefehl),
    .Bedingung(Sprungbedingung),
    .BefehlGeladen(InstruktionGeladen),
    .DatenGeladen(DatenGeladen),
    .DatenGespeichert(DatenGespeichert),
    .Reset(Reset),
    .Clock(Clock),

    .RegisterSchreibSignal(RegisterSchreibsignal),
    .ALUStartSignal(ALUStartSignal),
    .ALUSchreibSignal(ALUSchreibSignal),
    .LoadBefehlSignal(LeseInstruktion),
    .LoadDatenSignal(LeseDaten),
    .StoreDatenSignal(SchreibeDaten),
    .PCSprungSignal(PCSprungSignal),
    .PCSignal(PCSignal),
    .DekodierSignal(DekodierSignal)
);

ALU ALU(
    .Daten1(AluDaten1),
    .Daten2(AluDaten2),
    .FunktionsCode(FunktionsCode),
    .StartSignal(ALUStartSignal),
    .Schreibsignal(ALUSchreibSignal),
    .Reset(Reset),
    .Clock(Clock),
    .Ergebnis(ALUErgebnis)
);

Programmzahler Programmzahler(
    .NeuerPC(NeuerPC),
    .SchreibSignal(PCSprungSignal),
    .TaktSignal(PCSignal),
    .Reset(Reset),
    .AktuellerPC(AktuellerPC)
);

endmodule