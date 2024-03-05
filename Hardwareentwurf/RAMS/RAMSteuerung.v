module RAMSteuerung (
    //Die RAM Steuerung bietet den Caches Zugriff auf den RAM und vergibt Prioritäten

    //RAM soll Daten schreiben
    input BCSchreiben,
    input DCSchreiben,
    input VCSchreiben,

    //RAM soll Daten ausgeben
    input BCLesen,
    input DCLesen,
    input VCLesen,

    //Die Adresse im RAM, die beschrieben, gelesen werden soll
    input [22:0] BCAdresse,
    input [22:0] DCAdresse,
    input [22:0] VCAdresse,

    //Die Daten die geschrieben werden sollen
    input [31:0] BCDaten,
    input [31:0] DCDaten,
    input [31:0] VCDaten,

    //Die Daten, die der RAM zurück gibt
    input [31:0] LeseDaten,
    //RAM signalisiert für einen Takt, dass er fertig ist
    input RAMFertig,

    input Clock,
    input Reset,

    //Geimeinsame Datenausgabe für alle Caches
    output [31:0] DatenAusgabe,

    //Signalisiert einem Cache, dass die Aktion fertig ist
    output BCFertig,
    output DCFertig,
    output VCFertig,

    //Gibt Daten vom priorisierten Cache an RAM weiter
    output Schreiben,
    output Lesen,
    output [25:0] Adresse,
    output [31:0] SchreibDaten,

    //maskiert das Schreiben in den RAM, RAM Steuerung soll immer alles schreiben -> alles 1 (vielleicht 0, muss getestet werden)
    output [3:0] WriteMask
);

//hier sind die states der Steuerung
//mit DC und VC noch erweitern
//hier kann sich auch am Cache orientiert werden
localparam IDLE = 3'b001;
localparam BC = 3'b010;
localparam BC_RETURN = 3'b100;

reg [3 : 0] current_state;
reg [3 : 0] next_state;

//Datenausgabe sind immer die Daten, die entweder geschrieben oder gelesen werden
//Hier muss noch LeseDaten in ein Register geschrieben werden, sobald sie verfügbar sind, sodass sie dann im nächsten Takt im RETURN weitergegeben werden können an die Caches
assign DatenAusgabe = Schreiben ? SchreibDaten : LeseDaten;

//die Fertig signale sollen für einen Takt oben sein, je nach dem was fertig ist
//hier sind die Fertig Signale mit Prio Logik gemacht, besser ist es einzelne Zustände zu haben und dann Fertig ausgeben
//assign BCFertig = current_state[4] && (BCSchreiben || BCLesen);
//assign DCFertig = current_state[4] && !(BCSchreiben || BCLesen) && (DCSchreiben || DCLesen);
//assign DCFertig = current_state[4] && !(BCSchreiben || BCLesen) && !(DCSchreiben || DCLesen) && (VCSchreiben || VCLesen);

//mask ist entweder alles 1
assign WriteMask = 4'b1111;


always @* begin
    case (current_state)
    //Hier erwartet die RAM Steuerung eine Operation
    //Bei mehreren gleichzeitig soll es eine Priorität geben
    //Hier müssen noch die Daten vom richtigen Cache an den RAM weitergegeben werden (Schreiben, Lesen, Adresse, Daten)
    IDLE: begin
        if (BCSchreiben || BCLesen)
            next_state = BC;
        else if (DCSchreiben || DCLesen)
            next_state = DC;
        else if (VCSchreiben || VCLesen)
            next_state = VC;
        else
            next_state = IDLE;
    end
    //Befehlscache
    BC: begin
        //sobald der RAM die Ausgabe bereit hat soll im nächsten Takt die Ausgabe erfolgen
        if (RAMFertig)
            //hier muss schon Fertig hoch gesetzt werden, damit der Befehlscache die Daten einlesen kann
            next_state = RETURN;
        else
            next_state = BC;
    end
    BC_RETURN: begin
        //es soll nur in IDLE zurück wechseln, wenn Befehlscache nicht mehr Lesen oder Schreiben muss
        if (BCSchreiben || BCLesen)
            next_state = BC;
        else
            next_state = IDLE;
        //vielleicht kann return und idle verbunden werden, dann kann schneller zwischen den Caches gesprungen werden
    end
    endcase
end


always @(posedge Clock) begin
    if (Reset) begin
        current_state <= IDLE;
    end else begin
        //hier muss noch die Datenausgabe vom RAM in ein Zwischenregister übertragen werden
        current_state <= next_state;
    end
end

endmodule