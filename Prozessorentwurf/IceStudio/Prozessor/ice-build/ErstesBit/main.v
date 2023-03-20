// Code generated by Icestudio 0.10

`default_nettype none

//---- Top entity
module main (
 input [31:0] ve0f1d2,
 output va34f84
);
 wire [0:31] w0;
 wire w1;
 assign w0 = ve0f1d2;
 assign va34f84 = w1;
 main_v1b6c91 v1b6c91 (
  .Eingang(w0),
  .NiedrigstesBit(w1)
 );
endmodule

//---------------------------------------------------
//-- ErstesBit
//-- - - - - - - - - - - - - - - - - - - - - - - - --
//-- Gibt das erste (= niedrigste) Bit weiter
//---------------------------------------------------

module main_v1b6c91 (
 input [31:0] Eingang,
 output NiedrigstesBit
);
 assign NiedrigstesBit = Eingang[0];
endmodule
