`include "../Prozessor/0_CPU.v"
`include "../Prozessor/1_RAM.v"
`include "../Grafikkarte/Verilog/Bildpuffer.v"
`include "../SDKarte/SDKartenLeser.v"
`include "../Grafikkarte/Verilog/HDMI_clock.v"
`include "../Grafikkarte/Verilog/HDMI_test_DDR.v"
`include "../Grafikkarte/Verilog/TMDS_encoder.v"
`ifndef IVERILOG
`include "../ecp5pll/hdl/sv/ecp5pll.sv"
`endif 

module Top
(
    input clk_25mhz,
    
    output[7:0] led,
    output[3:0] gpdi_dp,
    output sd_cmd,      //mosi
    output sd_clk,
    
    inout [3:0] sd_d    //miso //cs
);

 //Konstanten
 wire ONE = 1'b1;
 wire ZERO = 1'b0;

 // Input/Output
 //SDKARTE
 assign sd_d[0] = SDmiso;
 assign sd_d[1] = ONE;
 assign sd_d[2] = ONE;
 assign sd_d[3] = SDcs;
 assign sd_cmd = SDmosi;
 //LED
 assign led[6:0] = RAMDatenOutput[6:0];
 assign led[7] = zustand[2];

 //CLOCKS
 wire HauptClock;
 wire [3:0] clocks;
 assign HauptClock = clocks[3];

//Clock
`ifdef  IVERILOG
reg[3:0] __SimulationsClocks;

assign clocks = __SimulationsClocks;

initial begin
    __SimulationsClocks = 4'b0;
end

always begin //Tatsächliche Taktrate: 41,66666667 MHz
   #12 __SimulationsClocks[0] = ~__SimulationsClocks[0]; 
end

always begin //Tatsächliche Taktrate: 50 MHz
   #10 __SimulationsClocks[1] = ~__SimulationsClocks[1]; 
end


always begin //Tatsächliche Taktrate: 62,5 MHz MHz
   #10 __SimulationsClocks[2] = ~__SimulationsClocks[2]; 
end


always begin //Tatsächliche Taktrate: 5 MHz
   #10 __SimulationsClocks[3] = ~__SimulationsClocks[3]; 
end

`else
ecp5pll
#(
      .in_hz(25000000),
    .out0_hz(40000000),                 .out0_tol_hz(0),
    .out1_hz(50000000), .out1_deg( 90), .out1_tol_hz(0),
    .out2_hz(60000000), .out2_deg(180), .out2_tol_hz(0),
    .out3_hz( 5000000), .out3_deg(300), .out3_tol_hz(0)
)
ecp5pll_inst
(
    .clk_i(clk_25mhz),
    .clk_o(clocks)
);
`endif

//CPU
//Inputs
wire [31:0] CPUDatenRein;
wire [31:0] CPUInstruktion;
//Outputs
wire [31:0] CPUInstruktionAdresse;
wire [31:0] CPUDatenRaus;
wire [31:0] CPUDatenAdresse;
wire CPULeseDaten;
wire CPUSchreibeDaten;
wire CPULeseInstruktion;

//RAM
//Inputs
wire RAMClock;
wire RAMSchreibenAn;
wire [31:0] RAMDatenInput;
wire [15:0] RAMAdresse;
//Outputs
wire [31:0] RAMDatenOutput;

//SDKarte
//Inputs
wire [31:0] SDAdresse;
wire SDLesen;
wire SDmiso;
//Outputs
wire [31:0] SDDaten;
wire SDFertig;
wire SDBusy;
wire SDcs;
wire SDmosi;
wire[4:0] SDDebug;
wire[2:0] SDZustand;

//Bildpuffer
//Inputs
wire [7:0] BildpufferX;
wire [7:0] BildpufferY;
wire [7:0] BildpufferColor;
wire BildpufferWrite;
wire [7:0] BildpufferXData;
wire [7:0] BildpufferYData;
//Outputs
wire [7:0] BildpufferPixelData;

//HDMI
//Inputs
wire [7:0] HDMIPixelData;
//Outputs
wire [7:0] HDMIX;
wire [7:0] HDMIY;
wire [3:0] HDMIgpdi_dp;

//Loader (hat nicht für eigenes Modul gereicht)
wire [31:0] loaderDaten;
reg loaderLesen = 0;
reg [31:0] loaderAdresse = 0;
reg [31:0] loaderRAMAdresse = ~0;
reg [31:0] loaderDatenMenge = 0; //Wie viele Bytes müssen in den RAM geladen werden?
reg loaderSchreibeDaten = 0;
reg [2:0] zustand = RESET;
reg loaderWarte = 1;


CPU cpu (
    .Clock(HauptClock),
    .Reset(globalerReset || loaderReset),
    .DatenRein(CPUDatenRein),
    .Instruktion(CPUInstruktion),
    .InstruktionGeladen(1'b1),
    .DatenGeladen(1'b1),
    .DatenGespeichert(1'b1),

    .InstruktionAdresse(CPUInstruktionAdresse),
    .DatenRaus(CPUDatenRaus),
    .DatenAdresse(CPUDatenAdresse),
    .LeseDaten(CPULeseDaten),
    .SchreibeDaten(CPUSchreibeDaten),
    .LeseInstruktion(CPULeseInstruktion),
);

RAM #(
    .WORDSIZE(32),
    .WORDS(2**10) //2**16
) ram (
    .SchreibenAn(RAMSchreibenAn),
    .DatenRein(RAMDatenInput),
    .Adresse(RAMAdresse),
    .Clock(RAMClock),

    .DatenRaus(RAMDatenOutput)
);

SDKarte sdkarte(
    .Clock(clk_25mhz),
    .Reset(globalerReset),
    .Adresse(SDAdresse),
    .Lesen(SDLesen),
    .Daten(SDDaten),
    .Fertig(SDFertig),
    .Busy(SDBusy),
    .cs(SDcs),
    .mosi(SDmosi),
    .miso(SDmiso),
    .sclk(sd_clk),
    .debug(SDDebug),
    .zustand(SDZustand)
);

Bildpuffer bildpuffer (
    .clk(HauptClock),
    .x(BildpufferX),
    .y(BildpufferY),
    .color(BildpufferColor),
    .write(BildpufferWrite),
    .x_data(BildpufferXData),
    .y_data(BildpufferYData),
    .pixelData(BildpufferPixelData)
);

HDMI_test_DDR hdmi_test_ddr(
    .clk(clk_25mhz), //Braucht 25 MHz um zu funktionieren
    .pixelData(HDMIPixelData),
    .x(HDMIX),
    .y(HDMIY),
    .gpdi_dp(gpdi_dp)
);


//INPUT LOGIK
//CPU
    assign CPUDatenRein = RAMDatenOutput;
    assign CPUInstruktion = RAMDatenOutput;
//RAM
    assign RAMClock = loaderReset ? clk_25mhz : HauptClock;
    assign RAMSchreibenAn = (zustand != LAEUFT) ? loaderSchreibeDaten : (0);
    assign RAMDatenInput = loaderReset ? loaderDaten : CPUDatenRaus;
    //assign RAMAdresse = loaderReset ? loaderRAMAdresse : (CPULeseInstruktion ? CPUInstruktionAdresse[15:0] : CPUDatenAdresse[15:0]);
    assign RAMAdresse = (zustand != LAEUFT) ? loaderRAMAdresse : (debugRAMAdresse);
//SDKarte
    assign SDAdresse = loaderAdresse;
    assign SDLesen = loaderLesen;
//Loader
    assign loaderDaten = SDDaten;
//Bildpuffer
    assign BildpufferX = CPUDatenAdresse[23:16];
    assign BildpufferY = CPUDatenAdresse[31:24];
    assign BildpufferColor = CPUDatenRaus[7:0];
    assign BildpufferWrite = (CPUDatenAdresse[15:0] == 16'b0) ? CPUSchreibeDaten : 0; 
    assign BildpufferXData = HDMIX;
    assign BildpufferYData = HDMIY;
//HDMI
    assign HDMIPixelData = BildpufferPixelData;


localparam RESET = 3'd0;
localparam GROESSELADEN = 3'd1;
localparam AUFGROESSEWARTEN = 3'd2;
localparam RAMLADEN = 3'd3;
localparam RAMLADENBEENDEN = 3'd4;
localparam LAEUFT = 3'd5;

reg [9:0] resetTimer = ~0;
reg globalerReset = 0;
reg loaderReset = 0;
reg [15:0] debugRAMAdresse = 0;
reg [24:0] debugTimer = 1;

always @(posedge clk_25mhz) begin
    case (zustand)
        RESET: begin
            globalerReset <= 1;
            loaderReset <= 1;

            loaderAdresse <= 0;
            loaderRAMAdresse <= ~0;
            loaderLesen <= 0;
            loaderWarte <= 1;

            resetTimer <= resetTimer - 1;

            if(resetTimer == 0) begin
                globalerReset <= 0;
                zustand = GROESSELADEN;
            end
        end
        GROESSELADEN: begin
            //Sobald SDKartenleser initialisiert, lese das erste Byte
            if(~SDBusy && loaderWarte) begin
                loaderWarte <= 0;
                loaderLesen <= 0;
            end
            else if(~SDBusy && loaderWarte == 0) begin
                loaderLesen <= 1;
                loaderWarte <= 1;
                zustand <= AUFGROESSEWARTEN;
            end
            else begin
                loaderLesen <= 0;
            end
        end
        AUFGROESSEWARTEN: begin
            if(~SDBusy && loaderWarte) begin
                loaderWarte <= 0;
                loaderLesen <= 0;
            end
            else if(~SDBusy && loaderWarte == 0) begin
                loaderDatenMenge <= SDDaten;
                zustand <= RAMLADEN;
                loaderWarte <= 1;

                //Beginne, das erste Byte von der SDKarte zu laden
                loaderAdresse <= loaderAdresse + 1;
                loaderLesen <= 1;
            end
            else begin
                loaderWarte <= 1;
                loaderLesen <= 0;
            end
        end
        RAMLADEN: begin
            if(~SDBusy && loaderWarte) begin
                loaderWarte <= 0;
                loaderLesen <= 0;
            end
            else if(~SDBusy && loaderWarte == 0) begin
                loaderWarte <= 1;
                loaderSchreibeDaten <= 1;
                loaderLesen <= 1;

                loaderAdresse <= loaderAdresse + 1;
                loaderRAMAdresse <= loaderRAMAdresse + 1;
                loaderDatenMenge <= loaderDatenMenge - 1;

                //Wenn DatenMenge == 0, muss nichts mehr von der SDKarte gelesen werden
                //Nur noch das letzte Byte muss in den RAM geladen werden
                if(loaderDatenMenge == 0) begin
                    zustand <= RAMLADENBEENDEN;
                end
            end
            else if(SDBusy) begin
                loaderSchreibeDaten <= 1;
                loaderLesen <= 0;
                loaderWarte <= 1;
            end
        end
        RAMLADENBEENDEN: begin
            loaderSchreibeDaten <= 0;
            loaderReset <= 0;
            zustand <= LAEUFT;
        end
        LAEUFT: begin
            loaderReset <= 1;
            globalerReset <= 0;

            debugTimer <= debugTimer + 1;
            if(debugTimer == 0) begin
                debugRAMAdresse <= debugRAMAdresse + 1;
            end

        end
        default: zustand <= RESET;
    endcase
end


endmodule
