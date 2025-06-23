`timescale 1ns/1ns

// Uncomment ONLY ONE of the following lines
// to check the corresponding question
`define CHECK_Q2A 
// `define CHECK_Q2B
// `define CHECK_Q2C

`ifdef CHECK_Q2A
    `include "q2a.v"
`elsif CHECK_Q2B
    `include "q2b.v"
`elsif CHECK_Q2C
    `include "q2c.v"
`else
    `error "Please define CHECK_Q2A or CHECK_Q2B or CHECK_Q2C"
`endif

module q2_test;

    reg a, b, c, d;
    wire f;

`ifdef CHECK_Q2A
    q2a inst1(f, a, b, c, d);
`elsif CHECK_Q2B
    q2b inst2(f, a, b, c, d);
`elsif CHECK_Q2C
    q2c inst3(f, a, b, c, d);
`else
    `error "Please define CHECK_Q2A or CHECK_Q2B or CHECK_Q2C"
`endif

    initial begin

        $dumpfile("q2_test.vcd");
        $dumpvars(0, q2_test); 
        
        // Decimal: 0
        a = 0; b = 0; c = 0; d = 0;
        #10 
        if (f != 1) $error("Error: f should be 1, but it is %0d at a=%0d, b=%0d, c=%0d, d=%0d", f, a, b, c, d);

        // Decimal: 1
        a = 0; b = 0; c = 0; d = 1;
        #10 
        if (f != 1) $error("Error: f should be 1, but it is %0d at a=%0d, b=%0d, c=%0d, d=%0d", f, a, b, c, d);

        // Decimal: 2
        a = 0; b = 0; c = 1; d = 0;
        #10 
        if (f != 0) $error("Error: f should be 0, but it is %0d at a=%0d, b=%0d, c=%0d, d=%0d", f, a, b, c, d);

        // Decimal: 3
        a = 0; b = 0; c = 1; d = 1;
        #10 
        if (f != 0) $error("Error: f should be 0, but it is %0d at a=%0d, b=%0d, c=%0d, d=%0d", f, a, b, c, d);

        // Decimal: 4
        a = 0; b = 1; c = 0; d = 0;
        #10 
        if (f != 1) $error("Error: f should be 1, but it is %0d at a=%0d, b=%0d, c=%0d, d=%0d", f, a, b, c, d);

        // Decimal: 5
        a = 0; b = 1; c = 0; d = 1;
        #10 
        if (f != 1) $error("Error: f should be 1, but it is %0d at a=%0d, b=%0d, c=%0d, d=%0d", f, a, b, c, d);

        // Decimal: 6
        a = 0; b = 1; c = 1; d = 0;
        #10 
        if (f != 0) $error("Error: f should be 0, but it is %0d at a=%0d, b=%0d, c=%0d, d=%0d", f, a, b, c, d);

        // Decimal: 7
        a = 0; b = 1; c = 1; d = 1;
        #10 
        if (f != 0) $error("Error: f should be 0, but it is %0d at a=%0d, b=%0d, c=%0d, d=%0d", f, a, b, c, d);

        // Decimal: 8
        a = 1; b = 0; c = 0; d = 0;
        #10 
        if (f != 0) $error("Error: f should be 0, but it is %0d at a=%0d, b=%0d, c=%0d, d=%0d", f, a, b, c, d);

        // Decimal: 9
        a = 1; b = 0; c = 0; d = 1;
        #10 
        if (f != 0) $error("Error: f should be 0, but it is %0d at a=%0d, b=%0d, c=%0d, d=%0d", f, a, b, c, d);

        // Decimal: 10
        a = 1; b = 0; c = 1; d = 0;
        #10 
        if (f != 1) $error("Error: f should be 1, but it is %0d at a=%0d, b=%0d, c=%0d, d=%0d", f, a, b, c, d);

        // Decimal: 11
        a = 1; b = 0; c = 1; d = 1;
        #10 
        if (f != 1) $error("Error: f should be 1, but it is %0d at a=%0d, b=%0d, c=%0d, d=%0d", f, a, b, c, d);

        // Decimal: 12
        a = 1; b = 1; c = 0; d = 0;
        #10 
        if (f != 0) $error("Error: f should be 0, but it is %0d at a=%0d, b=%0d, c=%0d, d=%0d", f, a, b, c, d);

        // Decimal: 13
        a = 1; b = 1; c = 0; d = 1;
        #10 
        if (f != 0) $error("Error: f should be 0, but it is %0d at a=%0d, b=%0d, c=%0d, d=%0d", f, a, b, c, d);

        // Decimal: 14
        a = 1; b = 1; c = 1; d = 0;
        #10 
        if (f != 1) $error("Error: f should be 1, but it is %0d at a=%0d, b=%0d, c=%0d, d=%0d", f, a, b, c, d);

        // Decimal: 15
        a = 1; b = 1; c = 1; d = 1;
        #10 
        if (f != 1) $error("Error: f should be 1, but it is %0d at a=%0d, b=%0d, c=%0d, d=%0d", f, a, b, c, d);

        $finish;
    
    end

endmodule
