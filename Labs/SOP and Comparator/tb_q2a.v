`timescale 1ns/1ns
`include "q2a.v"

module tb_q2a;
    reg x,y,z;
    wire w;

    q1b dut(.x(x),.y(y),.z(z),.f(w));

    initial begin
        $dumpfile("tb_q2a.vcd");
        $dumpvars(0, tb_q2a);
        $monitor ("x: %b ; y: %b ;z: %b ; output : ",x,y,z,w);
        x=0;
        y=0;
        z=0;
        #1
        $finish;
    end
endmodule