`include "4x1.v"
`include "1x4demux.v"
module top(output[6:0] y,output en_a,en_b,en_c,en_d,
input[1:0] a,b,c,d,input[1:0] sel,input en);
    wire o1[1:0];
    wire [3:0]i;
    buf(i[0],a[0]);
    buf(i[1],b[0]);
    buf(i[2],c[0]);
    buf(i[3],d[0]);
    wire [3:0]j;
    buf(j[0],a[1]);
    buf(j[1],b[1]);
    buf(j[2],c[1]);
    buf(j[3],d[1]);
    mux_4x1 A(o1[1],i[3:0],sel[1:0]);
    mux_4x1 A(o1[0],j[3:0],sel[1:0]);
endmodule