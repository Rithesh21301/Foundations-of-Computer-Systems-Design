`include "4x1.v"
module mux_16x1(output out, input [15:0] in, input [3:0]sel);
    wire [3:0] f1;
    wire [3:0] a1;
    mux_4x1 A(f1[0],in[3:0],sel[1:0]);
    mux_4x1 B(f1[1],in[7:4],sel[1:0]);
    mux_4x1 C(f1[2],in[11:8],sel[1:0]);
    mux_4x1 D(f1[3],in[15:12],sel[1:0]);
    mux_4x1 E(out,f1[3:0],sel[3:2]);
endmodule



