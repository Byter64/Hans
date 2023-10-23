module Register (
    input [5:0] QuellRegister1,
    input [5:0] QuellRegister2,
    input [31:0] ZielDaten,
    input [5:0] ZielRegister,
    input Schreibsignal,
    input Reset,
    input Clock,

    output [31:0] QuellDaten1,
    output [31:0] QuellDaten2
);

reg [31:0] registers [63:0];

assign QuellDaten1 = registers[QuellRegister1];
assign QuellDaten2 = registers[QuellRegister2];
integer i;

always @(posedge Clock) begin
    if(Reset) begin
        for (i = 0; i < 64; i = i + 1) begin
            registers[i] <= 32'b00000000000000000000000000000000; 
        end
    end
    else if(Schreibsignal) begin 
        if(ZielRegister != 0)
            registers[ZielRegister] <= ZielDaten;
    end
end
    
endmodule