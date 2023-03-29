module Register (
    input [5:0] QuellRegister1,
    input [5:0] QuellRegister2,
    input [31:0] ZielDaten,
    input [5:0] ZielRegister,
    input Schreibsignal,
    input Reset,

    output reg [31:0] QuellDaten1,
    output reg [31:0] QuellDaten2
);

reg [31:0] registers [63:0];

always @(posedge Reset) begin
    for (integer i = 0; i < 64; i = i + 1) begin
       registers[i] <= 32'b00000000000000000000000000000000; 
    end
end

always @(QuellRegister1, QuellRegister2) begin
    QuellDaten1 <= registers[QuellRegister1];
    QuellDaten2 <= registers[QuellRegister2];
end

always @(posedge Schreibsignal) begin
    if(ZielRegister != 0)
    registers[ZielRegister] <= ZielDaten;
end
    
endmodule