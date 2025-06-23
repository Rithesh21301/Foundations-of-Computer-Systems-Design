`include "q2_a.v"
module CLA16 (input [15:0] A,input [15:0] B,input carry_in, output carry_out, output [15:0] sum);
    wire c4,c8,c12;
    CLA4 h1(A[3:0],B[3:0],carry_in,c4,sum[3:0]);
    CLA4 h2(A[7:4],B[7:4],c4,c8,sum[7:4]);
    CLA4 h3(A[11:8],B[11:8],c8,c12,sum[11:8]);
    CLA4 h4(A[15:12],B[15:12],c12,carry_out,sum[15:12]);
endmodule