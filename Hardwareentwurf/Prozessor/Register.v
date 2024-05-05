module Register (
    input [5:0] QuellRegister1,
    input [5:0] QuellRegister2,
    input [31:0] ZielDaten,
    input [5:0] ZielRegister,
    input Schreibsignal,
    input Clock,
    input Reset,

    output [31:0] QuellDaten1,
    output [31:0] QuellDaten2
);

reg [31:0] registers [63:0];

initial begin
    registers[0] = 32'b0;
end

assign QuellDaten1 = registers[QuellRegister1];
assign QuellDaten2 = registers[QuellRegister2];

integer i;

always @(posedge Clock) begin
    if(Schreibsignal) begin 
        if(ZielRegister != 0) begin
            registers[ZielRegister] <= ZielDaten;
        end
    end
    if(Reset)
        registers[0] <= 0;
end
    
endmodule