`include "../Prozessor/ALU.v"
`include "../Prozessor/Instruktionsdekodierer.v"
`include "../Prozessor/MultiplexerAluDaten.v"
`include "../Prozessor/MultiplexerAluDaten2.v"
`include "../Prozessor/MultiplexerNeuerPC.v"
`include "../Prozessor/MultiplexerZielDaten.v"
`include "../Prozessor/NullPruefer.v"
`include "../Prozessor/Programmzahler.v"
`include "../Prozessor/Register.v"
`include "../Prozessor/Steuerung.v"
`include "../Prozessor/BedingungsPruefer.v"


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
assign DatenRaus = QuellDaten2;
assign DatenAdresse = ALUErgebnis;

//██████████████████████████████████████████
//████Signale von Instruktionsdekodierer████
//██████████████████████████████████████████
wire[5:0] QuellRegister1; 
wire[5:0] QuellRegister2; 
wire[5:0] ZielRegister;   
wire[31:0] IDaten;       
wire ImmediateAktiv;  
wire[5:0] FunktionsCode;  
wire JALBefehl;              
wire RelativerSprungBefehl;               
wire LoadBefehl;             
wire StoreBefehl;            
wire UnbedingterSprungBefehl;
wire BedingterSprungBefehl;  
wire AbsoluterSprung;
wire Sprungbedingung;

//███████████████████████████████████████
//████Signale von MultiplexerAluDaten████
//███████████████████████████████████████
wire[31:0] AluDaten2;

//████████████████████████████████████████
//████Signale von MultiplexerZielDaten████
//████████████████████████████████████████
wire[31:0] ZielDaten;

//██████████████████████████████████████
//████Signale von MultiplexerNeuerPC████
//██████████████████████████████████████
wire[25:0] NeuerPC;

//█████████████████████████████████████████
//████Signale von MultiplexerAluPCDaten████
//█████████████████████████████████████████
wire[31:0] AluDaten1;


//████████████████████████████
//████Signale von Register████
//████████████████████████████
wire[31:0] QuellDaten1;
wire[31:0] QuellDaten2;

//███████████████████████████████
//████Signale von Nullpruefer████
//███████████████████████████████
wire SprungbedingungErgebnis;

//█████████████████████████████
//████Signale von Steuerung████
//█████████████████████████████
wire ALUStartSignal;
wire DekodierSignal;
wire PCSprungSignal;
wire PCSignal;
wire RegisterSchreibsignal;

//███████████████████████
//████Signale von ALU████
//███████████████████████
wire AluHatFertigGerechnet;
wire[31:0] ALUErgebnis;

//██████████████████████
//████Signale von PC████
//██████████████████████
wire[25:0] AktuellerPC;

Instruktionsdekodierer Indek(
    .Instruktion(Instruktion),
    .DekodierSignal(DekodierSignal),
    .Reset(Reset),
    .Clock(Clock),
    .QuellRegister1(QuellRegister1),
    .QuellRegister2(QuellRegister2),
    .ZielRegister(ZielRegister),
    .IDaten(IDaten),
    .ImmediateAktiv(ImmediateAktiv),
    .FunktionsCode(FunktionsCode),
    .JALBefehl(JALBefehl),
    .RelativerSprung(RelativerSprungBefehl),
    .LoadBefehl(LoadBefehl),
    .StoreBefehl(StoreBefehl),
    .UnbedingterSprungBefehl(UnbedingterSprungBefehl),
    .BedingterSprungBefehl(BedingterSprungBefehl),
    .AbsoluterSprung(AbsoluterSprung),
    .Sprungbedingung(Sprungbedingung)
);

Register Register(
    .QuellRegister1(QuellRegister1),
    .QuellRegister2(QuellRegister2),
    .ZielDaten(ZielDaten),
    .ZielRegister(ZielRegister),
    .Schreibsignal(RegisterSchreibsignal),
    .Clock(Clock),
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

//NullPruefer NullPruefer(
//    .Eingang(QuellDaten1),
//    .Ergebnis(Sprungbedingung)
//);
BedingungsPruefer BedingungsPruefer(
    .Eingang(QuellDaten1),
    .Bedingung(Sprungbedingung),
    .Ergebnis(SprungbedingungErgebnis)
);

Steuerung Steuerung(
    .LoadBefehl(LoadBefehl),
    .StoreBefehl(StoreBefehl),
    .JALBefehl(JALBefehl),
    .UnbedingterSprungBefehl(UnbedingterSprungBefehl),
    .BedingterSprungBefehl(BedingterSprungBefehl),
    .Bedingung(SprungbedingungErgebnis),
    .BefehlGeladen(InstruktionGeladen),
    .DatenGeladen(DatenGeladen),
    .DatenGespeichert(DatenGespeichert),
    .ALUFertig(AluHatFertigGerechnet),
    .Reset(Reset),
    .Clock(Clock),

    .RegisterSchreibSignal(RegisterSchreibsignal),
    .ALUStartSignal(ALUStartSignal),
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
    .Reset(Reset),
    .Clock(Clock),
    .HatFertigGerechnet(AluHatFertigGerechnet),
    .Ergebnis(ALUErgebnis)
);

Programmzahler Programmzahler(
    .NeuerPC(NeuerPC),
    .SchreibSignal(PCSprungSignal),
    .TaktSignal(PCSignal),
    .Clock(Clock),
    .Reset(Reset),
    .AktuellerPC(AktuellerPC)
);

endmodule