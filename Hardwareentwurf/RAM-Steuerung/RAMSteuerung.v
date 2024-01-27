module RAMSteuerung (
    input Clock,
    input Reset,
    //Ein und Ausgabe an Caches//////////////////////

    //Addresse von den Daten
    input [22:0] BCAdresse,
    input [22:0] DCAdresse,
    input [22:0] VCAdresse,

    //Daten
    input [31:0] BCDaten,
    input [31:0] DCDaten,
    input [31:0] VCDaten,
    
    //Ob ein Lese Signal anliegt
    input BCLesen,
    input DCLesen,
    input VCLesen,

    //Ob ein Schreib Signal anliegt
    input BCSchreiben,
    input DCSchreiben,
    input VCSchreiben,

    //Daten fertig geladen 
    output BCFertig,
    output DCFertig,
    output VCFertig,
    
    //Gibt die Geladenen Daten Weiter
    output [31:0] DatenAusgabe,

    //Ein und Ausgabe an SDRAM Controller
    output reg [21:0] SchreibAdresse,
    output reg [15:0] SchreibDaten,
    output reg Schreiben,
    output reg [21:0] LeseAdresse,
    input [15:0] LeseDaten,
    output reg Lesen,
    input LesenGeladen,
    input busy);

    localparam BefehlsCache     = 2'b01;
    localparam DatenCache       = 2'b10;
    localparam GrafikCache      = 2'b11;

    reg [1:0] BearbeitungsCache = 2'b00; //Angabe welche Cache gerade bearbeitet wird
    reg [1:0] Ergebniss = 2'b00;
    reg Bearbeitung = 0; // 0: Bits[15:0] 1: Bits[31:16]
    reg LesenOderSchreiben = 0; // 0:Lesen 1: Schreiben

    always @ (posedge Clock or posedge Reset) begin
        if (Reset) begin
            BearbeitungsCache = 0;
            Ergebniss = 0;
            Bearbeitung = 0;
            LesenOderSchreiben = 0;
            SchreibAdresse = 0;
            SchreibDaten = 0;
            Schreiben = 0;
            LeseAdresse = 0;
            Lesen = 0;
        end
        else if(!busy) begin
            if(!Bearbeitung) begin
                if(BCLesen || BCSchreiben) begin
                    SchreibAdresse <= {BCAdresse,1'b0};  
                    SchreibDaten <= BCDaten[15:0];
                    LeseAdresse <= {BCAdresse,1'b0}; 
                    LesenOderSchreiben <= BCSchreiben;
                    if(BCSchreiben == 1) begin
                        Schreiben <= 1;
                        Lesen <= 0;
                    end else begin
                        Schreiben <= 0;
                        Lesen <= 1;
                    end
                    BearbeitungsCache <= BefehlsCache;
                    Bearbeitung <= 1;
                end
                else if (DCLesen || DCSchreiben) begin
                    SchreibAdresse <= {VCAdresse,1'b0};  
                    SchreibDaten <= VCDaten[15:0];
                    LeseAdresse <= {VCAdresse,1'b0}; 
                    LesenOderSchreiben <= VCSchreiben;
                    if(DCSchreiben == 1) begin
                        Schreiben <= 1;
                        Lesen <= 0;
                    end else begin
                        Schreiben <= 0;
                        Lesen <= 1;
                    end
                    BearbeitungsCache <= GrafikCache;
                    Bearbeitung <= 1;
                end
                else if (VCLesen || VCSchreiben) begin
                    SchreibAdresse <= {DCAdresse,1'b0};  
                    SchreibDaten <= DCDaten[15:0];
                    LeseAdresse <= {DCAdresse,1'b0}; 
                    LesenOderSchreiben <= DCSchreiben;
                    if(VCSchreiben == 1) begin
                        Schreiben <= 1;
                        Lesen <= 0;
                    end else begin
                        Schreiben <= 0;
                        Lesen <= 1;
                    end
                    BearbeitungsCache <= DatenCache;
                    Bearbeitung <= 1;
                end else begin
                    Bearbeitung <= 0;
                end
            end
            else begin
                if(LesenOderSchreiben == 0) begin
                    Lesen <= 1;
                    Schreiben <= 0;
                end else begin
                    Schreiben <= 1;
                    Lesen <= 0;
                end
                SchreibAdresse <= SchreibAdresse+1;
                LeseAdresse <= LeseAdresse+1;
                Ergebniss <= BearbeitungsCache;
                if(BearbeitungsCache == 2'b01)
                    SchreibDaten <= BCDaten[31:16];
                else if(BearbeitungsCache == 2'b10)
                    SchreibDaten <= DCDaten[31:16];
                else 
                    SchreibDaten <= VCDaten[31:16];
                Bearbeitung = 0;
            end
        end
        else begin
             Lesen <= 0;
             Schreiben <= 0;
             Ergebniss <= 0;
        end
    end


    assign DatenAusgabe = SchreibDaten;

    assign BCFertig = (LesenGeladen && (Ergebniss == BefehlsCache)) || (Schreiben && (Ergebniss == BefehlsCache));
    assign DCFertig = (LesenGeladen && (Ergebniss == DatenCache)) || (Schreiben && (Ergebniss == DatenCache));
    assign VCFertig = (LesenGeladen && (Ergebniss == GrafikCache)) || (Schreiben && (Ergebniss == GrafikCache));


    


endmodule