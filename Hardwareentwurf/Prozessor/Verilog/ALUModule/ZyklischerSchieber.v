module ZyklischerSchieber #(
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
    integer i;

    always @* begin
        if(SchiebRechts == 0) begin
            hilfsRegister = Zahl << Stellen;
            
            for(i = 0; i < BREITE; i = i + 1)begin
                if(i - Stellen <= -1)
                hilfsRegister[i] <= Zahl[BREITE - Stellen + i];
            end 
        end
        else begin
            hilfsRegister = Zahl >> Stellen;
            
            for(i = 0; i < BREITE; i = i + 1)begin
                if(i - Stellen < 0)
                hilfsRegister[BREITE - Stellen + i] <= Zahl[i];
            end 
        end
    end
endmodule