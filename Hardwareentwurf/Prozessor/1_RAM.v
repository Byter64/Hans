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
integer idx;

//initial begin
    //Daten[0] = 32'b10000000001000000000000000000001; //Addi R1, R0, #0
    //Daten[1] = 32'b10000011111000000000000000000001; //Addi R31, R0, #1
    //Daten[2] = 32'b10011011111111110000000000011111; //Sli R31, R31, #31
    
    //iDaten[3] = 32'b10110000001111110000000000000000; //Store R1, R31, #0
    //Daten[4] = 32'b10000000001000010000000000000001; //Addi R1, R1, #1
    //Daten[5] = 32'b01000011111111111111111111111101; //jmp -3

    //for (idx = 6; idx < WORDS; idx = idx + 1) 
    //Daten[idx] = 0;
//end

always @(posedge Clock) begin
    if(SchreibenAn)
    Daten[Adresse] <= DatenRein;
    else
    DatenRaus <= Daten[Adresse];
end

endmodule