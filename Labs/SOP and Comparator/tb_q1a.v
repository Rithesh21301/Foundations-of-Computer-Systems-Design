`timescale 1ns/1ns
`include "q1a.v"

module tb_q1a;
    reg x,y,z;
    wire w;

    q1a dut(.x(x),.y(y),.z(z),.f(w));

    initial begin
        $dumpfile("tb_q1a.vcd");
        $dumpvars(0, tb_q1a);
        $monitor ("x: %b ; y: %b ;z: %b ; output : ",x,y,z,w);
        x=0;
        y=0;
        z=0;
        #1
        x=1;
        y=0;
        z=0;
        #1
        x=0;
        y=1;
        z=0;
        #1
        x=0;
        y=0;
        z=1;
        #1
        x=0;
        y=1;
        z=1;
        #1
        $finish;
    end

endmodule