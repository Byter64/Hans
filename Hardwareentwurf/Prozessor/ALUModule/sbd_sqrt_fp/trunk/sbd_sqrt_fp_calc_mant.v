/****************************************************************************
sbd_sqrt_fp_calc_mant

- mantissa calculation for sbd_sqrt_fp

Copyright (C) 2005 Samuel Brown 
sam.brown@sbdesign.org

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

****************************************************************************/

module sbd_sqrt_fp_calc_mant (MANT_IN,CLK,VAL_IN,MANT_OUT,VAL_OUT);

parameter mantlength = 24;
    
input [mantlength-1:0]	      MANT_IN;
input			      CLK;
input			      VAL_IN;
output wire [mantlength-1:0]  MANT_OUT;
output			      VAL_OUT;

wire init, lsr, enr, enl, en_d, dleft;

wire [1:0] shiftLeft1SerialOut;
wire [(2*mantlength)-1:0] biPOUT, adsuOutput, shiftLeft2ParallelOut;

sbd_shifter_left2 shiftLeft1 (
	.SIN(2'b00),
	.PIN(MANT_IN),
	.LOAD(init),
	.RST(1'b0),
	.SHIFT(enl),
	.CLK(CLK),
	.SOUT(shiftLeft1SerialOut));
	defparam shiftLeft1.bitlength = mantlength;

sbd_adsu adsu_inst (
	.A(shiftLeft2ParallelOut),
	.B(biPOUT),
	.ADD(shiftLeft2ParallelOut[47]),
	.C_IN(~shiftLeft2ParallelOut[47]),
	.S(adsuOutput));
	defparam adsu_inst.bitlength = 2*mantlength;

sbd_shifter_left2 shiftLeft2 (
	.SIN(shiftLeft1SerialOut),
	.PIN(adsuOutput),
	.LOAD(lsr),
	.RST(init),
	.SHIFT(enr),
	.CLK(CLK),
	.POUT(shiftLeft2ParallelOut));
        defparam shiftLeft2.bitlength = 2*mantlength;
	
sbd_shifter_left3_right2 shiftBI (
	.SINLSB({~shiftLeft2ParallelOut[(2*mantlength)-1],shiftLeft2ParallelOut[(2*mantlength)-1],1'b1}),
	.SINMSB(2'b00),
	.PIN({ {2*mantlength-1{1'b0}}, 1'b1 }),
	.LOAD(init),
	.LR(~dleft),
	.RST(1'b0),
	.SHIFT(en_d),
	.CLK(CLK),
	.POUT(biPOUT));
	defparam shiftBI.bitlength = 2*mantlength;

assign MANT_OUT = biPOUT[mantlength-1:0];

sbd_sqrt_fp_state_mach state_mach (
	.CLK(CLK),
	.VAL_IN(VAL_IN),
	.INIT(init),
	.LSR(lsr),
	.ENR(enr),
	.ENL(enl),
	.EN_D(en_d),
	.DLEFT(dleft),
	.VAL_OUT(VAL_OUT));
	defparam state_mach.termval = mantlength + 1;

endmodule
