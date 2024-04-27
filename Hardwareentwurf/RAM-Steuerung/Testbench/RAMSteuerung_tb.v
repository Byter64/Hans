// Testbench template
`include "../RAMSteuerung.v"
`include "../sdram_controller.v"
`default_nettype none
`define DUMPSTR(x) `"x.vcd"`
`timescale 10 ns / 1 ns
`define assert(signal, value) \
        if (signal !== value) begin \
            $display("ASSERTION FAILED in %m: signal != value"); \
            $finish; \
        end

module main_tb;

  // Ein und Ausgabe an Caches//////////////////////

  // Addresse von den Daten
  reg [22:0] BCAdresse;
  reg [22:0] DCAdresse;
  reg [22:0] VCAdresse;

  // Daten
  reg [31:0] BCDaten;
  reg [31:0] DCDaten;
  reg [31:0] VCDaten;
  
  // Ob ein Lese Signal anliegt
  reg BCLesen;
  reg DCLesen;
  reg VCLesen;

  // Ob ein Schreib Signal anliegt
  reg BCSchreiben;
  reg DCSchreiben;
  reg VCSchreiben;

  // Daten fertig geladen 
  wire BCFertig;
  wire DCFertig;
  wire VCFertig;
  
  // Gibt die Geladenen Daten Weiter
  wire [31:0] DatenAusgabe;

  // Ein und Ausgabe an SDRAM Controller
  wire [21:0] SchreibAdresse;
  wire [15:0] SchreibDaten;
  wire Schreiben;
  wire [21:0] LeseAdresse;
  reg [15:0] LeseDaten;
  wire Lesen;
  reg LesenGeladen;
  reg busy;

  reg Clock;
  reg Reset;

  // Module instance
  RAMSteuerung strg (
    .Clock(Clock),
    .Reset(Reset),
    .BCAdresse(BCAdresse),
    .DCAdresse(DCAdresse),
    .VCAdresse(VCAdresse),
    .BCDaten(BCDaten),
    .VCDaten(VCDaten),
    .DCDaten(DCDaten),
    .BCLesen(BCLesen),
    .DCLesen(DCLesen),
    .VCLesen(VCLesen),
    .BCSchreiben(BCSchreiben),
    .DCSchreiben(DCSchreiben),
    .VCSchreiben(VCSchreiben),
    .BCFertig(BCFertig),
    .DCFertig(DCFertig),
    .VCFertig(VCFertig),
    .DatenAusgabe(DatenAusgabe),
    .SchreibAdresse(SchreibAdresse),
    .SchreibDaten(SchreibDaten),
    .Schreiben(Schreiben),
    .LeseAdresse(LeseAdresse),
    .LeseDaten(LeseDaten),
    .Lesen(Lesen),
    .LesenGeladen(LesenGeladen),
    .busy(busy)
  );
 
  always begin
    #5 Clock = ~Clock;
  end
  always @ (posedge busy) begin
    #3 busy = ~busy;
  end
  always @ (posedge BCFertig) begin
    // Clear BCFertig related signals
    BCLesen <= 0;
    BCSchreiben <= 0;
  end
  always @ (posedge DCFertig) begin
    // Clear DCFertig related signals
    DCLesen <= 0;
    DCSchreiben <= 0;
  end
 always @ (posedge VCFertig) begin
    // Clear VCFertig related signals
    VCLesen <= 0;
    VCSchreiben <= 0;
  end
  parameter TIMESTEP = 5;

  initial begin
    $dumpvars(0, main_tb);

    // TODO: initialize the registers here
    // e.g. value = 1;
    // e.g. #2 value = 0;
    
    // Steuerung wird initialisiert
    Clock = 1;
    #1 Reset = 1;
    #TIMESTEP Reset = 0;

    #TIMESTEP busy = 0;
    LesenGeladen = 0;
    LeseDaten = 0;
    BCSchreiben = 0;
    DCSchreiben = 0;
    VCSchreiben = 0;
    BCLesen = 0;
    DCLesen = 0;
    VCLesen = 0;
    BCDaten = 0;
    DCDaten = 0;
    VCDaten = 0;
    BCAdresse = 0;
    DCAdresse = 0;
    VCAdresse = 0;

    #TIMESTEP


#TIMESTEP
BCAdresse = 8'h12;  
BCDaten = 123456789;
BCSchreiben = 1;        
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;

DCAdresse = 8'h34;  
DCDaten = 32'hABCDEFFF;  
DCSchreiben = 1;    

#TIMESTEP

#TIMESTEP
VCAdresse = 8'h56;  
VCLesen = 1;        
#TIMESTEP
LeseDaten = 100;
LesenGeladen = 1;
#TIMESTEP

#TIMESTEP


#TIMESTEP
busy = 1; 

#TIMESTEP
busy = 1;  
BCLesen = 1;
#TIMESTEP
busy = 1;

#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;
#TIMESTEP
busy = 1;


    #TIMESTEP $display("End of simulation");
    $finish;
  end

endmodule
