`include "q2_a.v"
module priority_encoder(input [3:0] i, output [1:0] o);
    wire ni1,ni0,ni2,a,b,c,d;
    not(ni1,i[1]);
    not(ni0,i[0]);
    not(ni2,i[2]);
    and(a,i[1],ni0);
    and(b,i[3],ni0,ni2);
    or(d,i[3],i[2]);
    and(o[1],d, ni0, ni1);
    or(o[0],a,b);
endmodule
module mux_4x1(output out,input in0,in1,in2,in3,input [1:0]s);
    wire a,b,x,y,z,w;
    not(a,s[1]);
    not(b,s[0]);
    and(x,a,b,in0);
    and(y,a,s[0],in1);
    and(z,s[1],b,in2);
    and(w,s[1],s[0],in3);
    or(out,x,y,z,w);
endmodule
module Adder4 (input [3:0] x1,x2,x3,x4, output [3:0] sum, output [1:0] count);
    wire [3:0]c;
    wire [3:0]sum1,sum2,sum3,sum4;
    buf(sum4[1],0);
    buf(sum4[3],0);
    buf(sum4[2],0);
    buf(sum4[0],0);
    CLA4 n1(.A(x1),.B(x2),.carry_in(1'b0),.carry_out(c[0]),.sum(sum1));
    CLA4 n2(.A(sum1),.B(x3),.carry_in(1'b0),.carry_out(c[1]),.sum(sum2));
    CLA4 n3(.A(sum2),.B(x4),.carry_in(1'b0),.carry_out(c[2]),.sum(sum3));
    buf(c[3],1);
    priority_encoder y1(.i(c),.o(count));
    mux_4x1 m1(.out(sum[0]),.in0(sum4[0]),.in1(sum1[0]),.in2(sum2[0]),.in3(sum3[0]),.s(count));
    mux_4x1 m2(.out(sum[1]),.in0(sum4[1]),.in1(sum1[1]),.in2(sum2[1]),.in3(sum3[1]),.s(count));
    mux_4x1 m3(.out(sum[2]),.in0(sum4[2]),.in1(sum1[2]),.in2(sum2[2]),.in3(sum3[2]),.s(count));
    mux_4x1 m4(.out(sum[3]),.in0(sum4[3]),.in1(sum1[3]),.in2(sum2[3]),.in3(sum3[3]),.s(count));
endmodule