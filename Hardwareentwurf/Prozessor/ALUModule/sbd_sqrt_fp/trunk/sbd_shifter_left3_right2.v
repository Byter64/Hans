/****************************************************************************
sbd_shifter_left3_right2
- shift register - shifts left - towards MSB - 3 bits or shifts right - 
   towards LSB - 2 bits

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

module sbd_shifter_left3_right2 (SINLSB,SINMSB,PIN,LOAD,LR,RST,SHIFT,CLK,POUT);
   
parameter bitlength = 48;
    
input [2:0] SINLSB;
input [1:0] SINMSB;
input [bitlength-1:0] PIN;
input LOAD;
input LR;
input RST;
input SHIFT;
input CLK;
output wire [bitlength-1:0] POUT;

reg [bitlength-1:0] writeData, readData;
wire [1:0] sel = { LOAD, LR };

assign POUT = readData;

always @ ( posedge CLK)
begin:shiftreg
   if(RST) readData <= 0;
   else if(SHIFT | LOAD) readData <= writeData;
end

always @ (sel, readData, SINLSB, SINMSB, PIN)
begin:loadmux
   casez(sel)
      2'b00: writeData = { readData[bitlength-4:0], SINLSB };
      2'b01: writeData = { SINMSB, readData[bitlength-1:2] };
      2'b1z: writeData = PIN;
   endcase
end

endmodule
