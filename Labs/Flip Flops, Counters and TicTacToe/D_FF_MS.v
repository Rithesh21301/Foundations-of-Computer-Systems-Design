`include "D_a.v"
module D_FF_MS(input D, input CLK, input RESET, output Q);
    wire q1;
    D_a d1(D,CLK,1'b1,q1);
    D_a d2(q1,~CLK,1'b1,Q);
endmodule
