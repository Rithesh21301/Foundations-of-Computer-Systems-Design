`include "fa.v"
module RCA4(input [3:0] A,input [3:0] B,input carry_in, output carry_out, output [3:0] sum);
    wire c1,c2,c3;
    fa b1(A[0],B[0],carry_in,sum[0],c1);
    fa b2(A[1],B[1],c1,sum[1],c2);
    fa b3(A[2],B[2],c2,sum[2],c3);
    fa b4(A[3],B[3],c3,sum[3],carry_out);
endmodule