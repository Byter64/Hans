`include "Volladdierer.v"
module VolladdiererTest ();
    reg s1, s2, s3;
    wire uebertrag, summe;

    Volladdierer va(s1, s2, s3, summe, uebertrag);

    initial begin 
        $dumpfile("test.vcd");
        $dumpvars(0, VolladdiererTest);
        s1 = 0; s2 = 0; s3 = 0;
        #10
        s1 = 0; s2 = 0; s3 = 1;
        #10
        s1 = 0; s2 = 1; s3 = 0;
        #10
        s1 = 0; s2 = 1; s3 = 1;
        #10
        s1 = 1; s2 = 0; s3 = 0;
        #10
        s1 = 1; s2 = 0; s3 = 1;
        #10
        s1 = 1; s2 = 1; s3 = 0;
        #10
        s1 = 1; s2 = 1; s3 = 1;
        #10
        $finish;


    end
endmodule