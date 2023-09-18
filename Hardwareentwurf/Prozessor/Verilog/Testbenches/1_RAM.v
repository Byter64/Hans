module RAM#(
    parameter WORDSIZE = 32,
    parameter WORDS = 32
)
(
    input LesenAn,
    input SchreibenAn,
    input[WORDSIZE - 1:0] DatenRein,
    input[$clog2(WORDS) - 1:0] Adresse,
    input Clock,

    output reg[WORDSIZE - 1:0] DatenRaus,
    output reg DatenBereit,
    output reg DatenGeschrieben
);

reg[WORDSIZE - 1:0] Daten[WORDS - 1:0];
integer idx;

initial begin
    for (idx = 0; idx < WORDS; idx = idx + 1) 
    Daten[idx] = 0;
end

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