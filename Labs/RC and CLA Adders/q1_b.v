`include "q1_a.v"
module RCA16(input [15:0] A,input [15:0] B,input carry_in , output carry_out, output [15:0] sum);
    wire c1,c2,c3;
    RCA4 d1(A[3:0],B[3:0],carry_in,c1,sum[3:0]);
    RCA4 d2(A[7:4],B[7:4],c1,c2,sum[7:4]);
    RCA4 d3(A[11:8],B[11:8],c2,c3,sum[11:8]);
    RCA4 d4(A[15:12],B[15:12],c3,carry_out,sum[15:12]);
endmodule