// Taken from: https://www.fpga4fun.com/HDMI.html
// (c) fpga4fun.com & KNJN LLC 2013

module TMDS_encoder(
	input clk,                // Pixel clock (25 MHz for 640x480)
	input [7:0] VD,           // video VD (one of red, green or blue)
	input [1:0] CD,           // control VD
	input VDE,                // video VD enable, to choose between CD (when VDE=0) and VD (when VDE=1)
	output reg [9:0] TMDS = 0 // The generated 10-bits signal (scrambled to minimize transitions, and 0/1-balanced)
);


    // # of ones for VD, # of ones for q_m, # of zeros for q_m
    reg [3:0] n1d, n1q_m, n0q_m;

    // Buffer for first stage VD input
    reg [7:0] data_buf;

    // Buffer for first stage VD output
    wire [8:0] q_m;

    // operation for 1st stage VD transformation
    wire op;

    // signals for pipelining
    reg disp_en_q, disp_en_reg;
    reg [1:0] ctrl_q, ctrl_reg;
    reg [8:0] q_m_reg;

    // Disparity counter
    reg [4:0] disparity;

    // 1st stage: 8-bit to 9-bit transformation

    // Determine XNOR vs XOR operation
    assign op = (n1d > 4'd4) || (n1d == 4'd4 && VD[0] == 1'b0);

    // Perform operation
    assign q_m[0] = data_buf[0];
    assign q_m[1] = (op) ? (q_m[0] ^~ data_buf[1]) : (q_m[0] ^ data_buf[1]);
    assign q_m[2] = (op) ? (q_m[1] ^~ data_buf[2]) : (q_m[1] ^ data_buf[2]);
    assign q_m[3] = (op) ? (q_m[2] ^~ data_buf[3]) : (q_m[2] ^ data_buf[3]);
    assign q_m[4] = (op) ? (q_m[3] ^~ data_buf[4]) : (q_m[3] ^ data_buf[4]);
    assign q_m[5] = (op) ? (q_m[4] ^~ data_buf[5]) : (q_m[4] ^ data_buf[5]);
    assign q_m[6] = (op) ? (q_m[5] ^~ data_buf[6]) : (q_m[5] ^ data_buf[6]);
    assign q_m[7] = (op) ? (q_m[6] ^~ data_buf[7]) : (q_m[6] ^ data_buf[7]);
    assign q_m[8] = (op) ? 1'b0 : 1'b1;
    
    always @ (posedge clk) begin
        data_buf <= VD;

        // Count the ones in the input VD
        n1d    <= VD[0] + VD[1] + VD[2] + VD[3] + VD[4] + VD[5] + VD[6] + VD[7];

        // Count the ones from the first stage VD
        n1q_m  <= q_m[0] + q_m[1] + q_m[2] + q_m[3] + q_m[4] + q_m[5] + q_m[6] + q_m[7];

        // Count the zeros from the first stage VD
        n0q_m  <= 4'h8 - (q_m[0] + q_m[1] + q_m[2] + q_m[3] + q_m[4] + q_m[5] + q_m[6] + q_m[7]);

        // Pipelining of key signals
        disp_en_q   <= VDE;
        disp_en_reg <= disp_en_q;

        ctrl_q      <= CD;
        ctrl_reg    <= ctrl_q;

        q_m_reg     <= q_m;
    end

    // 2nd stage: 9-bit to 10-bit transformation
    always @ (posedge clk) begin
      if (disp_en_reg) begin
            if ((disparity == 5'h0) | (n1q_m == n0q_m)) begin
               TMDS[9]   <= ~q_m_reg[8];
               TMDS[8]   <= q_m_reg[8];
               TMDS[7:0] <= (q_m_reg[8]) ? q_m_reg[7:0] : ~q_m_reg[7:0];

               disparity <= (~q_m_reg[8]) ? (disparity + n0q_m - n1q_m) : (disparity + n1q_m - n0q_m);
            end
            else begin
               if ((~disparity[4] & (n1q_m > n0q_m)) | (disparity[4] & (n0q_m > n1q_m))) begin
                  TMDS[9]   <= 1'b1;
                  TMDS[8]   <= q_m_reg[8];
                  TMDS[7:0] <= ~q_m_reg[7:0];

                  disparity <= disparity + {q_m_reg[8], 1'b0} + (n0q_m - n1q_m);
               end
               else begin
                  TMDS[9]   <= 1'b0;
                  TMDS[8]   <= q_m_reg[8];
                  TMDS[7:0] <= q_m_reg[7:0];

                  disparity <= disparity - {~q_m_reg[8], 1'b0} + (n1q_m - n0q_m);
               end
            end
      end
      else begin
            // Control VD from: https://en.wikipedia.org/wiki/Transition-minimized_differential_signaling
            case (ctrl_reg)
               2'b00: TMDS <= 10'b1101010100;
               2'b01: TMDS <= 10'b0010101011;
               2'b10: TMDS <= 10'b0101010100;
               default: TMDS <= 10'b1010101011;
            endcase

            disparity <= 4'd0;
      end
    end
endmodule