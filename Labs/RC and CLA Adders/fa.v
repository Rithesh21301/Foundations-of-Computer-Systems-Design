`include "ha.v"
module fa(a,b,ci,s,co);
    input a,b,ci;
    output s,co;
    wire x,y,z;
    ha a1(a,b,x,y);
    ha a2(x,ci,s,z);
    or(co,z,y);
endmodule