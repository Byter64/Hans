module RAM#(
    parameter WORDSIZE = 32,
    parameter WORDS = 256
)
(
    input SchreibenAn,
    input[WORDSIZE - 1:0] DatenRein,
    input[$clog2(WORDS) - 1:0] Adresse,
    input Clock,
    output reg[WORDSIZE - 1:0] DatenRaus
);

reg[WORDSIZE - 1:0] Daten[WORDS - 1:0];

initial begin
    Daten[0] <= 32'h8020FFFF; //Addi R1, R0, -1
    Daten[1] <= 32'hE8200000; //Store R1, R0, 0
    Daten[2] <= 32'h43FFFFFF; //Jmp (dead lock)
end

always @(posedge Clock) begin
    if(SchreibenAn)
        Daten[Adresse] <= DatenRein;
    else
        DatenRaus <= Daten[Adresse];
end

endmodule