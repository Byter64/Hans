/****************************************************************************
sbd_adsu

- ADSU

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

module sbd_adsu(A,B,ADD,C_IN,C_OUT,S);
 
parameter bitlength=8;

    input [bitlength-1:0] A;
    input [bitlength-1:0] B;
    input ADD;
    input C_IN;
    output wire C_OUT;
    output wire [bitlength-1:0] S;
	
    wire [bitlength-1:0] Bx;
    wire [bitlength:0] tmp;
    
    assign Bx = B ^ {bitlength{~ADD}}; 
    assign tmp = A + Bx + C_IN;

    assign S = tmp[bitlength-1:0];
    assign C_OUT = tmp[bitlength];

endmodule
