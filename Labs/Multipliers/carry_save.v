`include "fa.v"
`include "CLA4.v"
module carry_save(input [3:0] op1,op2, output [7:0] res);
    wire a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16;
    and(a1,op1[0],op2[0]);
    and(a2,op1[1],op2[0]);
    and(a3,op1[0],op2[1]);
    and(a4,op1[2],op2[0]);
    and(a5,op1[1],op2[1]);
    and(a6,op1[0],op2[2]);
    and(a7,op1[3],op2[0]);
    and(a8,op1[2],op2[1]);
    and(a9,op1[1],op2[2]);
    and(a10,op1[0],op2[3]);
    and(a11,op1[3],op2[1]);
    and(a12,op1[2],op2[2]);
    and(a13,op1[1],op2[3]);
    and(a14,op1[3],op2[2]);
    and(a15,op1[2],op2[3]);
    and(a16,op1[3],op2[3]);
    buf(res[0],a1);
    wire s1,c1,s2,c2,s3,c3,s4,c4,s5,c5,s6,c6,s7,c7,s8,c8;
    wire s9,c9,s10,c10,s11,c11,s12,c12;

    fa fa1(s1,c1,a2,a3,1'b0);
    fa fa2(s2,c2,a4,a5,a6);
    fa fa3(s3,c3,a7,a8,a9);
    fa fa4(s4,c4,a11,a12,1'b0);
    buf(res[1],s1);
    
    fa fa5(s5,c5,s2,1'b0,c1);
    fa fa6(s6,c6,s3,a10,c2);
    fa fa7(s7,c7,s4,a13,c3);
    fa fa8(s8,c8,a14,a15,c4);
    buf(res[2],s5);

    wire [3:0]p,q;
    wire [3:0]r;
    wire cout;
    buf(p[0],s6);
    buf(q[0],c5);
    buf(p[1],s7);
    buf(q[1],c6);
    buf(p[2],s8);
    buf(q[2],c7);
    buf(p[3],a16);
    buf(q[3],c8);

    CLA4 cla(p,q,1'b0,cout,r);
    buf(res[3],r[0]);
    buf(res[4],r[1]);
    buf(res[5],r[2]);
    buf(res[6],r[3]);
    buf(res[7],cout);
endmodule

    