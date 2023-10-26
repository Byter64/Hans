
//Taken from: https://verilogcodes.blogspot.com/2020/12/synthesizable-clocked-square-root.html
//Synthesisable Design for Finding Square root of a number.
module Intsqrt
    (   input Clock,  //Clock
        input Reset,  //Asynchronous active high Reset.      
        input [31:0] Num_in,   //this is the number for which we want to find square root.
        output reg Done,     //This signal goes high when output is ready
        output reg [31:0] Sq_root  //square root of 'Num_in'
    );

    reg [31:0] a;   //original input.
    reg [17:0] left,right;     //input to adder/sub.r-remainder.
    reg signed [17:0] r;
    reg [15:0] q;    //result.
    integer i;   //index of the loop. 

    always @(posedge Clock or posedge Reset) 
    begin
        if (Reset == 1) begin   //Reset the variables.
            Done <= 0;
            Sq_root <= 0;
            i = 0;
            a = 0;
            left = 0;
            right = 0;
            r = 0;
            q = 0;
        end    
        else begin
            //Before we start the first clock cycle get the 'input' to the variable 'a'.
            if(i == 0) begin  
                a = Num_in;
                Done <= 0;    //Reset 'Done' signal.
                i = i+1;   //increment the loop index.
            end
            else if(i < 16) begin //keep incrementing the loop index.
                i = i+1;  
            end
            //These statements below are derived from the block diagram.
            right = {q,r[17],1'b1};
            left = {r[15:0], a[31:30]};
            a = {a[29:0], 2'b0};  //shifting left by 2 bit.
            if ( r[17] == 1)    //add or subtract as per this bit.
                r = left + right;
            else
                r = left - right;
            q = {q[14:0], ~r[17]};
            if(i == 16) begin    //This means the max value of loop index has reached. 
                Done <= 1;    //make 'Done' high because output is ready.
                i = 0; //Reset loop index for beginning the next cycle.
                Sq_root <= {16'b0,q};   //assign 'q' to the output port.
                //Reset other signals for using in the next cycle.
                left = 0;
                right = 0;
                r = 0;
                q = 0;
            end
        end    
    end

endmodule