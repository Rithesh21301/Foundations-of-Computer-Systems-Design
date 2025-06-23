`include "D_a.v"
module D_FF_ED(input D, input CLK, input RESET, output Q);
wire c, cn;
not (cn, CLK);
and (c, cn, CLK);
D_a d1(D,c,~RESET,Q);

endmodule

