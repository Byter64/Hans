/****************************************************************************
sbd_sqrt_fp

- square root function for single or double precisons ieee 754 
   floating-point numbers

This core is capable of handling single or double precision floating-
poing numbers.  For single precision, set the bitlength parameter to 32;
for double precision, set the bitlength parameter to 64.  The algorithm 
used is iterative and will take 52 clock cycles for single precision and
110 clock cycles for double precision.  The sign bit is simply passed 
through from input to output, so if given negative input, this core 
will produce a negative output corresponding to -1 * sqrt(|input|).

Ports: - all signals are active high

input [bitlength-1:0]	   D_IN;     // single or double precison input
input			   VAL_IN;   // Assert VAL_IN to signal a valid
				        input value. The module will only
				        accept input when RDY_IN is asserted.
					If RDY_IN is low, then VAL_IN should
					remain asserted until RDY_IN goes
					high.  VAL_IN and RDY_IN must both be
					asserted for one clock cycle for 
					computation to begin.
output wire		   RDY_IN;   // module is ready to accept input
input			   CLK;	     // clock
output reg [bitlength-1:0] D_OUT;    // single or double precision output  
output reg		   VAL_OUT;  // VAL_OUT is asserted when the output
				        is valid.  VAL_OUT will remain asserted
				        and D_OUT will persist until VAL_OUT and
					RDY_OUT have both been asserted for one
					clock cycle.
input			   RDY_OUT;  // when asserted, downstream logic is
				        ready to accept output of module

This core was designed using synchronous resets, for use in FPGAs.  The 
synchronous resets could easily be made asynchronous for use in ASICs by
editing the always @ (posedge CLK) blocks in this and all dependant files.

Resource Utilization:
(synthesized with XST for Virtex4 - no architectural dependancies exist in this core 
- this is merely an example)

Single Precision:
   Slices:	  155
   Flip Flops:	  204
   4-Input LUTs:  269 

Double Precision:
   Slices:	  324
   Flip Flops:	  417
   4-Input LUTs:  566

Both numerical accuracy and performance of the single and double precision versions of
this core have been verified in a Xilinx XC4VLX25-10 at 100MHz.  Without optimizations,
the single precision core should operate at up to at least 190MHz, and the double precision
core should operate at up to at least 134MHz in this platform.  Higher performance should
be possible with a little effort.
   
This module uses the following files:

sbd_sqrt_fp_calc_mant.v
sbd_sqrt_fp_state_mach.v
sbd_shifter_left2.v
sbd_shifter_left3_right2.v
sbd_adsu.v

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

module sbd_sqrt_fp ( D_IN, VAL_IN, RDY_IN, CLK, D_OUT, VAL_OUT, RDY_OUT );

parameter bitlength = 32;

input [bitlength-1:0]	   D_IN;
input			   VAL_IN;
output wire		   RDY_IN;
input			   CLK;
output reg [bitlength-1:0] D_OUT;
output reg		   VAL_OUT;
input			   RDY_OUT;

reg [bitlength-1:0] raw_data_reg;
reg beg_in_reg;
reg d_rdy_reg;
wire mant_out;
reg mant_out_reg;

wire [bitlength-1:0] sqrt_final;

generate
if(bitlength == 32)
begin:single

//------------------ Single Precision --------------------------------------

   wire [7:0] exp_off, exp_adj, exp_final;
   wire non_zero_exp = ~(!raw_data_reg[30:23]);

   wire [23:0] mant_final;
   wire [22:0] mant_final_imp = mant_final[22:0];
   reg [23:0] mant_adj; // mantissa with explicit leading bit - adjusted
			// for even/odd exponent

   //------------ Exponent Calculation & Mantissa Preparation --------------

   sbd_adsu exp_offset_adsu (
      .A(raw_data_reg[30:23]),
      .B(8'h7F),
      .ADD(1'b0),
      .C_IN(1'b1),
      .S(exp_off));
      defparam exp_offset_adsu.bitlength = 8;

   sbd_adsu exp_adjust_adsu (
      .A(8'h7F),
      .B({ exp_off[7], exp_off[7:1] }),
      .ADD(1'b1),
      .C_IN(1'b0),
      .S(exp_adj));
      defparam exp_adjust_adsu.bitlength = 8;

      assign exp_final = exp_adj & {8{non_zero_exp}};

      always @ (raw_data_reg, non_zero_exp)
      begin:mant_adj_mux
	 if(raw_data_reg[23]) mant_adj = { 1'b0, non_zero_exp, raw_data_reg[22:1] };
	 else mant_adj = { non_zero_exp, raw_data_reg[22:0] };
      end

   //------------- Mantissa Calculation --------------------------------------


   sbd_sqrt_fp_calc_mant mant_iterations (
      .MANT_IN(mant_adj),
      .CLK(CLK),
      .VAL_IN(beg_in_reg),
      .MANT_OUT(mant_final),
      .VAL_OUT(mant_out));
      defparam mant_iterations.mantlength = 24;

   assign sqrt_final = { raw_data_reg[bitlength-1], exp_final, mant_final_imp };

end
else if(bitlength == 64)
begin:double

//------------------ Doule Precision ---------------------------------------

   wire [10:0] exp_off, exp_adj, exp_final;
   wire non_zero_exp = ~(!raw_data_reg[62:52]);

   wire [52:0] mant_final;
   wire [51:0] mant_final_imp = mant_final[51:0];
   reg [52:0] mant_adj; // mantissa with explicit leading bit - adjusted
		     // for even/odd exponent

   //------------ Exponent Calculation & Mantissa Preparation --------------

   sbd_adsu exp_offset_adsu (
      .A(raw_data_reg[62:52]),
      .B(11'h3FF),
      .ADD(1'b0),
      .C_IN(1'b1),
      .S(exp_off));
      defparam exp_offset_adsu.bitlength = 11;

   sbd_adsu exp_adjust_adsu (
      .A(11'h3FF),
      .B({ exp_off[10], exp_off[10:1] }),
      .ADD(1'b1),
      .C_IN(1'b0),
      .S(exp_adj));
      defparam exp_adjust_adsu.bitlength = 11;

      assign exp_final = exp_adj & {11{non_zero_exp}};

      always @ (raw_data_reg, non_zero_exp)
      begin:mant_adj_mux
	 if(raw_data_reg[52]) mant_adj = { 1'b0, non_zero_exp, raw_data_reg[51:1] };
	 else mant_adj = { non_zero_exp, raw_data_reg[51:0] };
      end

   //------------- Mantissa Calculation --------------------------------------


   sbd_sqrt_fp_calc_mant mant_iterations (
      .MANT_IN(mant_adj),
      .CLK(CLK),
      .VAL_IN(beg_in_reg),
      .MANT_OUT(mant_final),
      .VAL_OUT(mant_out));
      defparam mant_iterations.mantlength = 53;

   assign sqrt_final = { raw_data_reg[bitlength-1], exp_final, mant_final_imp };

end
endgenerate


assign RDY_IN = ~d_rdy_reg;
wire beg_in = VAL_IN & RDY_IN;

initial 
begin:simzero
   
   D_OUT <= 0;
   VAL_OUT <= 0;
   raw_data_reg <= 0;
   beg_in_reg <= 0;
   d_rdy_reg <= 0;
   mant_out_reg <= 0;
   
end

always @ (posedge CLK) 
begin:reg_input
   // input buffer
   if(beg_in) raw_data_reg <= D_IN;

   // val delay
   beg_in_reg <= beg_in;

   // RDY state
   if(mant_out) d_rdy_reg <= 0;
   else if(beg_in) d_rdy_reg <= 1;

   // output registers
   if(mant_out_reg) D_OUT <= sqrt_final;
   if(VAL_OUT && RDY_OUT) VAL_OUT <= 0;
   else if(mant_out_reg) VAL_OUT <= 1;

   //delay output latch
   mant_out_reg <= mant_out;

end


endmodule
