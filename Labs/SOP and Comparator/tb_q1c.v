`timescale 1ns/1ns
`include "q1c.v"

module tb_q1c;
    reg x,y,z;
    wire w;

    q1a dut(.x(x),.y(y),.z(z),.f(w));

    initial begin
        $dumpfile("tb_q1c.vcd");
        $dumpvars(0, tb_q1c);
        x=0;
        y=0;
        z=0;
        #1
        $display ("x: %b ; y: %b ;z: %b ; output : ",x,y,z,w);
        x=1;
        y=0;
        z=0;
        #1
        $display ("x: %b ; y: %b ;z: %b ; output : ",x,y,z,w);
        x=0;
        y=1;
        z=0;
        #1
        $display ("x: %b ; y: %b ;z: %b ; output : ",x,y,z,w);
        x=0;
        y=0;
        z=1;
        #1
        $display ("x: %b ; y: %b ;z: %b ; output : ",x,y,z,w);
        x=0;
        y=1;
        z=1;
        #1
        $display ("x: %b ; y: %b ;z: %b ; output : ",x,y,z,w);
        $finish;
    end

endmodule