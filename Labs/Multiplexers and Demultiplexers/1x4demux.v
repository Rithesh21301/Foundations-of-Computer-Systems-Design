module demux_1x4(output [3:0]o,input in,input [1:0]s);
    wire a,b;
    not(a,s[1]);
    not(b,s[0]);
    and(o[0],a,b,in);
    and(o[1],a,s[0],in);
    and(o[2],s[1],b,in);
    and(o[3],s[1],s[0],in);
endmodule