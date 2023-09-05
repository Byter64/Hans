module Instruktionsdekodierer (
    input[31:0] Instruktion,
    input DekodierSignal,
    input Reset,

    output[5:0] QuellRegister1,
    output[5:0] QuellRegister2,
    output[5:0] ZielRegister,
    output[25:0] IDaten,
    output KleinerImmediateAktiv,
    output GrosserImmediateAktiv,
    output[5:0] FunktionsCode,
    output JALBefehl,
    output RelativerSprung,
    output FloatBefehl,
    output LoadBefehl,
    output StoreBefehl,
    output UnbedingterSprungBefehl,
    output BedingterSprungBefehl,
    output AbsoluterSprung
);

reg [31:0] AktuellerBefehl;

always @(posedge Reset) begin
    AktuellerBefehl <= 32'b00000000000000000000000000000000; 
end

always @(posedge DekodierSignal) begin
    AktuellerBefehl <= Instruktion;
end

assign QuellRegister1 =         (AktuellerBefehl[31:30]==2'b00 && AktuellerBefehl[5:4]!=2'b10) ? {1'b0, AktuellerBefehl[20:16]}:
                                ((AktuellerBefehl[31:30]==2'b00 && AktuellerBefehl[5:4]==2'b10) ? {1'b1, AktuellerBefehl[20:16]}:
                                ((AktuellerBefehl[31:31]==1'b1) ? {1'b0, AktuellerBefehl[20:16]}:
                                6'b0));

assign QuellRegister2 =         (AktuellerBefehl[31:30]==2'b00 && AktuellerBefehl[5:4]!=2'b10) ? {1'b0, AktuellerBefehl[15:11]}:
                                ((AktuellerBefehl[31:30]==2'b00 && AktuellerBefehl[5:4]==2'b10) ? {1'b1, AktuellerBefehl[15:11]}:
                                ((AktuellerBefehl[31:26]==6'b101100) ? {1'b0, AktuellerBefehl[25:21]}:
                                6'b0));

assign ZielRegister =           (AktuellerBefehl[31:30]==2'b00 && AktuellerBefehl[5:4]!=2'b10) ? {1'b0, AktuellerBefehl[25:21]}:
                                (((AktuellerBefehl[31:30]==2'b00 && AktuellerBefehl[5:4]==2'b10)||AktuellerBefehl[31:26]==6'b101011) ? {1'b1, AktuellerBefehl[25:21]}:
                                ((AktuellerBefehl[31:31]==1'b1) ? {1'b0, AktuellerBefehl[25:21]}:
                                6'b0));
assign IDaten =                 (AktuellerBefehl[31:30] == 2'b01) ? AktuellerBefehl[25:0] :
                                (AktuellerBefehl[31:31] == 1'b1) ? {{10{AktuellerBefehl[15]}}, AktuellerBefehl[15:0]} :
                                26'b0;

            
assign KleinerImmediateAktiv =  (AktuellerBefehl[31:31]==1'b1);

assign GrosserImmediateAktiv =  (AktuellerBefehl[31:30]==2'b01);
                            
assign FunktionsCode =          (AktuellerBefehl[31:30]==2'b00) ? AktuellerBefehl[5:0]:
                                ((AktuellerBefehl[31:30]==2'b01||(AktuellerBefehl[31:26]>=6'b101010&&AktuellerBefehl[31:26]<=6'b101111)) ? 6'b0:
                                {1'b0,AktuellerBefehl[30:26]});

assign JALBefehl =              (AktuellerBefehl[31:26]==6'b101111);

assign RelativerSprung =        (AktuellerBefehl[31:26]==6'b101111 || AktuellerBefehl[31:26]==6'b010000 || AktuellerBefehl[31:26]==6'b101110);

assign AbsoluterSprung =        (AktuellerBefehl[31:26]==6'b101101);                               

assign FloatBefehl =            ((AktuellerBefehl[31:30]==2'b00 && AktuellerBefehl[5:4]==2'b10)||AktuellerBefehl[31:26]==6'b101011);

assign LoadBefehl =             (AktuellerBefehl[31:27]==5'b10101);

assign StoreBefehl =            (AktuellerBefehl[31:26]==6'b101100);

assign UnbedingterSprungBefehl =(AktuellerBefehl[31:26]==6'b101101 || AktuellerBefehl[31:26]==6'b101111 || AktuellerBefehl[31:26]==6'b010000);

assign BedingterSprungBefehl =  (AktuellerBefehl[31:26]==6'b101110); 
endmodule