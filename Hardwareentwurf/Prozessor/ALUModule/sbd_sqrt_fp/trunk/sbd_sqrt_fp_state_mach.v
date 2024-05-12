/****************************************************************************
sbd_sqrt_fp_state_mach

- state machine for sbd_sqrt_fp32

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


module sbd_sqrt_fp_state_mach ( CLK,VAL_IN,INIT,LSR,ENR,ENL,EN_D,DLEFT,VAL_OUT );
    
parameter termval = 25;    
    
input CLK;
input VAL_IN;
output wire INIT;
output wire LSR;
output wire ENR;
output wire ENL;
output wire EN_D;
output wire DLEFT;
output wire VAL_OUT;

wire  begPulse;
reg   terminate;
reg   [6:0] currentState;
wire  [6:0] nextState;
reg   [5:0] countValue;

reg val_state_reg;
wire active;

initial
begin
   currentState = 0;
   countValue = 0;
   val_state_reg = 0;
end

assign INIT = currentState[6];
assign LSR = currentState[5];
assign ENR = currentState[4];
assign ENL = currentState[3];
assign EN_D = currentState[2];
assign DLEFT = currentState[1];

assign nextState[6] = begPulse & ~terminate;
assign nextState[5] = currentState[4];  // 31 or 25
assign nextState[4] = currentState[6] | (currentState[5] & ~terminate);
assign nextState[3] = currentState[6] | (currentState[5] & ~terminate);
assign nextState[2] = currentState[4] | (currentState[5] & ~terminate);
assign nextState[1] = currentState[5] & ~terminate;
assign nextState[0] = currentState[6] | (currentState[5] & ~terminate);

always @ (posedge CLK)
begin:sqrtcount
   if(begPulse) countValue <= 0;
   else if(currentState[0]) countValue <= countValue + 1;
end

always @ (posedge CLK)
begin:stateReg
   currentState <= nextState;
end

always @*
begin:termassign
   if((countValue == termval) && ~begPulse) terminate = 1;
   else terminate = 0;
end

//assign terminate = (countValue[4] & countValue[3] & ~countValue[2] & ~countValue[1] & countValue[0]) & ~begPulse; 

//------------------- val in and out states ---------------------

always @ (posedge CLK)
begin:val_state_register
   val_state_reg <= active & ~VAL_OUT;
end

assign begPulse = VAL_IN & ~val_state_reg;
assign active = begPulse | val_state_reg;
assign VAL_OUT = terminate & active;

endmodule
