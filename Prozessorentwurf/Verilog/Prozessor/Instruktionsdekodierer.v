module Register (
    output reg [5:0] QuellRegister1,
    output reg [5:0] QuellRegister2,
    output reg [5:0] ZielRegister,
    output reg [25:0] IDaten,
    output reg KleinerImmediateAktiv,
    output reg GrosserImmediateAktiv,
    output reg [5:0] FunktionsCode,
    output reg JALBefehl,
    output reg RelativerSprung,
    output reg FloatBefehl,
    output reg LoadBefehl,
    output reg StoreBefehl,
    output reg UnbedingterSprungBefehl,
    output reg BedingterSprungBefehl,
    output reg AbsoluterSprung,
    

    input [31:0] Instruktion,
    input DekodierSignal,
    input Reset
);

reg [31:0] AktuellerBefehl;

always @(posedge Reset) begin
    AktuellerBefehl <= 32'b00000000000000000000000000000000; 
end

always @(posedge DekodierSignal) begin
    AktuellerBefehl <= Instruktion;
end

assign QuellRegister1 =         (AktuellerBefehl[31:30]==2'b00 and AktuellerBefehl[5:4]!=2'b10) ? {0'b1, AktuellerBefehl[15:11]}:
                                (AktuellerBefehl[31:30]==2'b00 and AktuellerBefehl[5:4]==2'b10) ? {1'b1, AktuellerBefehl[15:11]}:
                                (AktuellerBefehl[31:31]==1'b1) ? {0'b1, AktuellerBefehl[20:16]}:
                                6'b0;

assign QuellRegister2 =         (AktuellerBefehl[31:30]==2'b00 and AktuellerBefehl[5:4]!=2'b10) ? {0'b1, AktuellerBefehl[20:16]}:
                                (AktuellerBefehl[31:30]==2'b00 and AktuellerBefehl[5:4]==2'b10) ? {1'b1, AktuellerBefehl[20:16]}:
                                (AktuellerBefehl[31:26]==6'b101100) ? {0'b1, AktuellerBefehl[25:21]}:
                                6'b0;

assign ZielRegister =           (AktuellerBefehl[31:30]==2'b00 and AktuellerBefehl[5:4]!=2'b10) ? {0'b1, AktuellerBefehl[25:21]}:
                                (AktuellerBefehl[31:30]==2'b00 and AktuellerBefehl[5:4]==2'b10) ? {1'b1, AktuellerBefehl[25:21]}:
                                (AktuellerBefehl[31:31]==1'b1) ? {0'b1, AktuellerBefehl[25:21]}:
                                6'b0;

assign IDaten =                 (AktuellerBefehl[31:30]==2'b01) ? AktuellerBefehl[25:0]:
                                (AktuellerBefehl[31:31]==1'b1) ? {10'b0, AktuellerBefehl[15:0]}:
                                26'b0;
            
assign KleinerImmediateAktiv =  (AktuellerBefehl[31:31]==1'b1) ? 1'b1:
                                1'b0;

assign GrosserImmediateAktiv =  (AktuellerBefehl[31:30]==2'b01) ? 1'b1:
                                1'b0;
                            
//Hier Bitte Funktionscode einfügen

assign JALBefehl =              (AktuellerBefehl[31:26]==6'b101111) ? 1'b1:
                                1'b0;

assign RelativerSprung =        (AktuellerBefehl[31:26]==6'b101111 or AktuellerBefehl[31:26]==6'b010000 or AktuellerBefehl[31:26]==6'b101110) ? 1'b1:
                                1'b0;

assign AbsoluterSprung =        (AktuellerBefehl[31:26]==6'b101101) ? 1'b1:
                                1'b0;                                

assign FloatBefehl =            (AktuellerBefehl[31:30]==2'b00 and AktuellerBefehl[5:4]==2'b10) ? 1'b1:
                                1'b0;

assign LoadBefehl =             (AktuellerBefehl[31:27]==5'b10101) ? 1'b1:
                                1'b0; 

assign StoreBefehl =            (AktuellerBefehl[31:26]==6'b101100) ? 1'b1:
                                1'b0; 

assign UnbedingterSprungBefehl =(AktuellerBefehl[31:26]==6'b101101 or AktuellerBefehl[31:26]==6'b101111 or AktuellerBefehl[31:26]==6'b010000) ? 1'b1:
                                1'b0;

assign BedingterSprungBefehl =  (AktuellerBefehl[31:26]==6'b101110) ? 1'b1:
                                1'b0; 
endmodule