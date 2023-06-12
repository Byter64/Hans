module ZyklischerSchieber #( //Erstmal nur ein zyklischer Linksschieber
    parameter BREITE = 32,
    parameter LOG2BREITE = 5 //Das hier muss immer der Logarithmus zur Breite sein
) (
    input[BREITE - 1:0] Zahl,
    input[LOG2BREITE - 1:0] Stellen,
    input SchiebRechts,
    output[BREITE - 1:0] Ergebnis
);
    reg[BREITE - 1:0] hilfsRegister;
    
    assign Ergebnis = hilfsRegister;
    
    always @(*) begin
        if(SchiebRechts == 0) begin
            hilfsRegister = Zahl << Stellen;
            for(integer i = 0; i < Stellen; i = i + 1)begin
                hilfsRegister[i] = Zahl[BREITE - Stellen + i];
            end 
        end
        else begin
            hilfsRegister = Zahl >> Stellen;
            for(integer i = 0; i < Stellen; i = i + 1)begin
                hilfsRegister[BREITE - Stellen + i] = Zahl[i];
            end 
        end
    end
endmodule