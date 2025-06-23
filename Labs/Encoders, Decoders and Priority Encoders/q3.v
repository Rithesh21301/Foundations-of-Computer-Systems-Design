`timescale 1ns / 1ns
`include "q2.v"

module row_col_encoder(input [8:0] d, output [1:0] row, output [1:0] col, output v);
    wire v1,v2;
    wire [3:0] a;
    wire [3:0] b;
    buf (a[0],0);
    buf (b[0],0);
    or(a[1],d[0],d[1],d[2]);
    or(a[2],d[3],d[4],d[5]);
    or(a[3],d[6],d[7],d[8]);
    or(b[1],d[0],d[3],d[6]);
    or(b[2],d[1],d[4],d[7]);
    or(b[3],d[2],d[5],d[8]);
        priority_encoder r(a,row,v1);
        priority_encoder c(b,col,v2);
        and(v,v1,v2);
endmodule





