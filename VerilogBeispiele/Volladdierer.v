`include "Halbaddierer.v"

module Volladdierer
        (
            input summand1,
            input summand2,
            input summand3,

            output summe,
            output uebertrag
        );
    wire summe1;
    wire uebertrag1;
    wire uebertrag2;
    assign uebertrag = uebertrag1 | uebertrag2;
    Halbaddierer hb1 (summand1, summand2, summe1, uebertrag1);
    Halbaddierer hb2 (summe1, summand3, summe, uebertrag2);
endmodule