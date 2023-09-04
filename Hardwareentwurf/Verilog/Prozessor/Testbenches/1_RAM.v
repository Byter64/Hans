module RAM#(
    parameter WORDSIZE = 32,
    parameter WORDS = 32
)
(
    input LesenAn,
    input SchreibenAn,
    input[WORDSIZE - 1:0] DatenRein,
    input[WORDSIZE - 1:0] Adresse,
    input Clock,

    output reg[WORDSIZE - 1:0] DatenRaus,
    output reg DatenBereit,
    output reg DatenGeschrieben
);

reg[WORDSIZE - 1:0] Daten[WORDS - 1:0];

always @(posedge Clock) begin
    
    if(DatenBereit) begin
        DatenBereit = 0;
    end

    if(DatenGeschrieben) begin
        DatenGeschrieben = 0;
    end
    
    if (LesenAn) begin
        DatenRaus = Daten[Adresse];
        DatenBereit = 1;
    end

    if(SchreibenAn) begin
        Daten[Adresse] = DatenRein;
        DatenGeschrieben = 1;
    end
end

endmodule