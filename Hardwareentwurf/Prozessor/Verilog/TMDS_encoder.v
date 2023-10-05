module HDMI_Schnittstelle(
	input pixclk,  // 25MHz
	output [2:0] TMDSp, TMDSn,

	/////////////////////////////////////https://www.fpga4fun.com/HDMI.html

  input clk_TMDS, //250MHz Clock
  input [7:0] pixelDaten,
  output[15:0] pixelX,
  output[15:0] pixelY  
);
///////////////////////////////////////////////////////////////////////

  reg [9:0] CounterX=0, CounterY=0;
  reg hSync, vSync, DrawArea;
  always @(posedge pixclk) DrawArea <= (CounterX<640) && (CounterY<480);

  always @(posedge pixclk) CounterX <= (CounterX==799) ? 0 : CounterX+1;
  always @(posedge pixclk) if(CounterX==799) CounterY <= (CounterY==524) ? 0 : CounterY+1;

  always @(posedge pixclk) hSync <= (CounterX>=656) && (CounterX<752);
  always @(posedge pixclk) vSync <= (CounterY>=490) && (CounterY<492);

////////////////

  assign pixelX = (CounterX);
  assign pixelY = (CounterY);
  reg [7:0] red, green, blue;
  always @(posedge pixclk) red <= (DrawArea)? {pixelDaten[7:5],{5{1'b0}}}:8'b0;
  always @(posedge pixclk) green <= (DrawArea)? {pixelDaten[4:2],{5{1'b0}}}:8'b0;
  always @(posedge pixclk) blue <= (DrawArea)? {pixelDaten[1:0],{6{1'b0}}}:8'b0;

//////////////////////////////////////////////////////////////////////// Hier oben hinzufügen, dass die Pixel aus dem Framebuffer genommen werden
  wire [9:0] TMDS_red, TMDS_green, TMDS_blue;
  TMDS_encoder encode_R(.clk(pixclk), .VD(red  ), .CD(2'b00)        , .VDE(DrawArea), .TMDS(TMDS_red));
  TMDS_encoder encode_G(.clk(pixclk), .VD(green), .CD(2'b00)        , .VDE(DrawArea), .TMDS(TMDS_green));
  TMDS_encoder encode_B(.clk(pixclk), .VD(blue ), .CD({vSync,hSync}), .VDE(DrawArea), .TMDS(TMDS_blue));

////////////////////////////////////////////////////////////////////////
  reg [3:0] TMDS_mod10=0;  // modulus 10 counter
  reg [9:0] TMDS_shift_red=0, TMDS_shift_green=0, TMDS_shift_blue=0;
  reg TMDS_shift_load=0;
  always @(posedge clk_TMDS) TMDS_shift_load <= (TMDS_mod10==4'd9);

  always @(posedge clk_TMDS)
  begin
	  TMDS_shift_red   <= TMDS_shift_load ? TMDS_red   : TMDS_shift_red  [9:1];
	  TMDS_shift_green <= TMDS_shift_load ? TMDS_green : TMDS_shift_green[9:1];
	  TMDS_shift_blue  <= TMDS_shift_load ? TMDS_blue  : TMDS_shift_blue [9:1];	
	  TMDS_mod10 <= (TMDS_mod10==4'd9) ? 4'd0 : TMDS_mod10+4'd1;
  end

  OBUFDS OBUFDS_red  (.I(TMDS_shift_red  [0]), .O(TMDSp[2]), .OB(TMDSn[2]));
  OBUFDS OBUFDS_green(.I(TMDS_shift_green[0]), .O(TMDSp[1]), .OB(TMDSn[1]));
  OBUFDS OBUFDS_blue (.I(TMDS_shift_blue [0]), .O(TMDSp[0]), .OB(TMDSn[0]));

endmodule



module TMDS_encoder(
	input clk,
	input [7:0] VD,  // video data (red, green or blue)
	input [1:0] CD,  // control data
	input VDE,  // video data enable, to choose between CD (when VDE=0) and VD (when VDE=1)
	output reg [9:0] TMDS = 0
);

  wire [3:0] Nb1s = VD[0] + VD[1] + VD[2] + VD[3] + VD[4] + VD[5] + VD[6] + VD[7];
  wire XNOR = (Nb1s>4'd4) || (Nb1s==4'd4 && VD[0]==1'b0);
  wire [8:0] q_m = {~XNOR, q_m[6:0] ^ VD[7:1] ^ {7{XNOR}}, VD[0]};

  reg [3:0] balance_acc = 0;
  wire [3:0] balance = q_m[0] + q_m[1] + q_m[2] + q_m[3] + q_m[4] + q_m[5] + q_m[6] + q_m[7] - 4'd4;
  wire balance_sign_eq = (balance[3] == balance_acc[3]);
  wire invert_q_m = (balance==0 || balance_acc==0) ? ~q_m[8] : balance_sign_eq;
  wire [3:0] balance_acc_inc = balance - ({q_m[8] ^ ~balance_sign_eq} & ~(balance==0 || balance_acc==0));
  wire [3:0] balance_acc_new = invert_q_m ? balance_acc-balance_acc_inc : balance_acc+balance_acc_inc;
  wire [9:0] TMDS_data = {invert_q_m, q_m[8], q_m[7:0] ^ {8{invert_q_m}}};
  wire [9:0] TMDS_code = CD[1] ? (CD[0] ? 10'b1010101011 : 10'b0101010100) : (CD[0] ? 10'b0010101011 : 10'b1101010100);

  always @(posedge clk) TMDS <= VDE ? TMDS_data : TMDS_code;
  always @(posedge clk) balance_acc <= VDE ? balance_acc_new : 4'h0;
endmodule

module OBUFDS (
  input wire I,
  output wire O,
  output wire OB 
  );
  assign O = I;
  assign OB = -I;
endmodule