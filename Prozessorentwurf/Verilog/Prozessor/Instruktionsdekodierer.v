module Register (
    output wire [5:0] QuellRegister1,
    output wire [5:0] QuellRegister2,
    output wire [5:0] ZielRegister,
    output wire [25:0] IDaten,
    output wire KleinerImmediateAktiv,
    output wire GrosserImmediateAktiv,
    output wire [5:0] FunktionsCode,
    output wire JALBefehl,
    output wire RelativerSprung,
    output wire FloatBefehl,
    output wire LoadBefehl,
    output wire StoreBefehl,
    output wire UnbedingterSprungBefehl,
    output wire BedingterSprungBefehl,
    output wire AbsoluterSprung,
    

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

assign QuellRegister1 =         (AktuellerBefehl[31:30]==2'b00 && AktuellerBefehl[5:4]!=2'b10) ? {1'b0, AktuellerBefehl[15:11]}:
                                (AktuellerBefehl[31:30]==2'b00 && AktuellerBefehl[5:4]==2'b10) ? {1'b1, AktuellerBefehl[15:11]}:
                                (AktuellerBefehl[31:31]==1'b1) ? {1'b0, AktuellerBefehl[20:16]}:
                                6'b0;

assign QuellRegister2 =         (AktuellerBefehl[31:30]==2'b00 && AktuellerBefehl[5:4]!=2'b10) ? {1'b0, AktuellerBefehl[20:16]}:
                                (AktuellerBefehl[31:30]==2'b00 && AktuellerBefehl[5:4]==2'b10) ? {1'b1, AktuellerBefehl[20:16]}:
                                (AktuellerBefehl[31:26]==6'b101100) ? {1'b0, AktuellerBefehl[25:21]}:
                                6'b0;

assign ZielRegister =           (AktuellerBefehl[31:30]==2'b00 && AktuellerBefehl[5:4]!=2'b10) ? {1'b0, AktuellerBefehl[25:21]}:
                                (AktuellerBefehl[31:30]==2'b00 && AktuellerBefehl[5:4]==2'b10) ? {1'b1, AktuellerBefehl[25:21]}:
                                (AktuellerBefehl[31:31]==1'b1) ? {1'b0, AktuellerBefehl[25:21]}:
                                6'b0;

assign IDaten =                 (AktuellerBefehl[31:30]==2'b01) ? AktuellerBefehl[25:0]:
                                (AktuellerBefehl[31:31]==1'b1) ? {10'b0, AktuellerBefehl[15:0]}:
                                26'b0;
            
assign KleinerImmediateAktiv =  (AktuellerBefehl[31:31]==1'b1) ? 1'b1:
                                1'b0;

assign GrosserImmediateAktiv =  (AktuellerBefehl[31:30]==2'b01) ? 1'b1:
                                1'b0;
                            
//Hier Bitte Funktionscode einfügen
assign FunktionsCode =          (AktuellerBefehl[31:30]==2'b00) ? AktuellerBefehl[5:0]:
                                (AktuellerBefehl[31:30]==2'b01) ? 6'b0:
                                {1'b0,AktuellerBefehl[30:26]};

assign JALBefehl =              (AktuellerBefehl[31:26]==6'b101111) ? 1'b1:
                                1'b0;

assign RelativerSprung =        (AktuellerBefehl[31:26]==6'b101111 || AktuellerBefehl[31:26]==6'b010000 || AktuellerBefehl[31:26]==6'b101110) ? 1'b1:
                                1'b0;

assign AbsoluterSprung =        (AktuellerBefehl[31:26]==6'b101101) ? 1'b1:
                                1'b0;                                

assign FloatBefehl =            (AktuellerBefehl[31:30]==2'b00 && AktuellerBefehl[5:4]==2'b10) ? 1'b1:
                                1'b0;

assign LoadBefehl =             (AktuellerBefehl[31:27]==5'b10101) ? 1'b1:
                                1'b0; 

assign StoreBefehl =            (AktuellerBefehl[31:26]==6'b101100) ? 1'b1:
                                1'b0; 

assign UnbedingterSprungBefehl =(AktuellerBefehl[31:26]==6'b101101 || AktuellerBefehl[31:26]==6'b101111 || AktuellerBefehl[31:26]==6'b010000) ? 1'b1:
                                1'b0;

assign BedingterSprungBefehl =  (AktuellerBefehl[31:26]==6'b101110) ? 1'b1:
                                1'b0; 
endmodule