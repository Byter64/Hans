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
    output reg DatenBereit = 0,
    output reg DatenGeschrieben = 0
);

reg[WORDSIZE - 1:0] Daten[WORDS - 1:0];
integer idx;
localparam ProgrammNummer = 0;
initial begin
    if(ProgrammNummer == 0) begin
    //Hochzaehlen. Hier sollten LEDs auf DatenRaus 24:17 sein
    Daten[0] = 32'b10000000001000000000000000000001; //Addi R1, R0, #0
    Daten[1] = 32'b10000011111000000000000000000001; //Addi R31, R0, #1
    Daten[2] = 32'b10011011111111110000000000011111; //Sli R31, R31, #31
    Daten[3] = 32'b11101000001111110000000000000000; //Store R1, R31, #0
    Daten[4] = 32'b10000000001000010000000000000001; //Addi R1, R1, #1
    Daten[5] = 32'b01000011111111111111111111111101; //jmp -3
    for (idx = 6; idx < WORDS; idx = idx + 1) 
        Daten[idx] = 0;
    end else if(ProgrammNummer == 1) begin
    //Gausssumme für 15 (= 120). Hier sollten LEDs auf DatenRaus 7:0 sein
    Daten[0] = 32'h8040000F; //Addi R2, R0, #15
    Daten[1] = 32'h00200000; //Add R1, R0, R0
    Daten[2] = 32'h83E00001; //Addi R31, R0, #1
    Daten[3] = 32'hDBFF001F; //Sli R31, R31, #31
    Daten[4] = 32'h00211000; //Add R1, R1, R2
    Daten[5] = 32'h84420001; //Subi R2, R2, 1
    Daten[6] = 32'h00620008; //Ce R3, R2, R0
    Daten[7] = 32'hEBE10000; //Store R1, R31, #0
    Daten[8] = 32'hF403FFF2; //Bez R3, -5
    Daten[9] = 32'h43FFFFF5; //jmp -1
    for (idx = 10; idx < WORDS; idx = idx + 1) 
        Daten[idx] = 0;
    end 
end

always @(posedge Clock) begin
    
    if (LesenAn) begin
        DatenRaus = Daten[Adresse];
        DatenBereit = 1;
    end
    else if(DatenBereit) begin
        DatenBereit = 0;
    end
end

always @(posedge Clock ) begin
    if(SchreibenAn) begin
        Daten[Adresse] = DatenRein;
        DatenGeschrieben = 1;
    end
    else if(DatenGeschrieben) begin
        DatenGeschrieben = 0;
    end
end
endmodule