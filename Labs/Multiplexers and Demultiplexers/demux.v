`include "1x2demux.v"
`include "1x4demux.v"
module demux_1x8(output [7:0] out, input in, input [2:0] sel);
wire [1:0]a;
    demux_1x2 A(a[1:0],in,sel[0]);
    demux_1x4 B(out[3:0],a[0],sel[2:1]);
    demux_1x4 C(out[7:4],a[1],sel[2:1]);
endmodule
