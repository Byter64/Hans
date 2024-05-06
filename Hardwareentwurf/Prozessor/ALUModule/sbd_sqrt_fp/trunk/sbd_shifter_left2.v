/****************************************************************************
sbd_shifter_left2
- shift register - shifts left - towards MSB - 2 bits

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



module sbd_shifter_left2 (SIN,PIN,LOAD,RST,SHIFT,CLK,SOUT,POUT);

parameter bitlength = 24;
    
input [1:0] SIN;
input [bitlength-1:0] PIN;
input LOAD;
input RST;
input SHIFT;
input CLK;
output wire [1:0] SOUT;
output wire [bitlength-1:0] POUT;

reg  [bitlength-1:0] writeData, readData; 

assign POUT = readData;
assign SOUT = readData[bitlength-1:bitlength-2];

always @ (posedge CLK)
begin:shiftreg
   if(RST) readData <= 0;
   else if(SHIFT | LOAD) readData <= writeData;
end

always @ (readData, SIN, PIN, LOAD)
begin:shiftmux
   if(LOAD) writeData = PIN;
   else writeData = { readData[bitlength-3:0], SIN };
end

endmodule
