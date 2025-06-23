`include "D_b.v"
module dflipflop(input d,input clk,input reset,output q);
wire q1;
D_b x1(d,clk,1'b1,q1);
D_b x2(q1,clk,1'b1,q);

endmodule