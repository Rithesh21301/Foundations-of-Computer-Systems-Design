`include "ha.v"
`include "fa.v"
`include "CLA4.v"

module wallace_tree(input [3:0] op1,op2, output [7:0] res);
    wire b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16;
    and(b1,op1[0],op2[0]);
    and(b2,op1[1],op2[0]);
    and(b3,op1[0],op2[1]);
    and(b4,op1[2],op2[0]);
    and(b5,op1[1],op2[1]);
    and(b6,op1[0],op2[2]);
    and(b7,op1[3],op2[0]);
    and(b8,op1[2],op2[1]);
    and(b9,op1[1],op2[2]);
    and(b10,op1[0],op2[3]);
    and(b11,op1[3],op2[1]);
    and(b12,op1[2],op2[2]);
    and(b13,op1[1],op2[3]);
    and(b14,op1[3],op2[2]);
    and(b15,op1[2],op2[3]);
    and(b16,op1[3],op2[3]);

    wire s1,c1,s2,c2,s3,c3;
    ha ha1(s1,c1,b12,b13);
    ha ha2(s2,c2,b9,b10);

    wire s4,c4,s5,c5,s6,c6;
    ha ha3(s3,c3,b5,b6);
    fa fa1(s4,c4,b14,b15,c1);
    fa fa2(s5,c5,s1,c2,b11);
    fa fa3(s6,c6,s2,b7,b8);

    wire [3:0] x1,y1,x2,y2;
    buf(x1[0],b1);
    buf(x1[1],b2);
    buf(x1[2],b4);
    buf(x1[3],c3);
    buf(y1[0],1'b0);
    buf(y1[1],b3);
    buf(y1[2],s3);
    buf(y1[3],s6);

    buf(x2[0],c6);
    buf(x2[1],c5);
    buf(x2[2],c4);
    buf(x2[3],1'b0);
    buf(y2[0],s5);
    buf(y2[1],s6);
    buf(y2[2],b16);
    buf(y2[3],1'b0);

    wire [3:0] u1,u2;
    wire cout1,cout2;

    CLA4 cla1(x1,y1,1'b0,cout1,u1);
    CLA4 cla2(x2,y2,cout1,cout2,u2);
    buf(res[0],u1[0]);
    buf(res[1],u1[1]);
    buf(res[2],u1[2]);
    buf(res[3],u1[3]);
    buf(res[4],u2[0]);
    buf(res[5],u2[1]);
    buf(res[6],u2[2]);
    buf(res[7],u2[3]);
endmodule



