module Halbaddierer 
        (
            input summand1,
            input summand2,
            
            output summe,
            output uebertrag
        );
    assign uebertrag = summand1 & summand2;
    assign summe = summand1 ^ summand2;
endmodule