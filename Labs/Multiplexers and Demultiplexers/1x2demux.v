module demux_1x2(output [1:0]o,input in,input s);
    wire a;
    not(a,s);
    and(o[0],a,in);
    and(o[1],s,in);
endmodule
