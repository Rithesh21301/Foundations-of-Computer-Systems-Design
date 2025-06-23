module mux_4x1(output out,input [3:0] in,input [1:0]s);
    wire a,b,x,y,z,w;
    not(a,s[1]);
    not(b,s[0]);
    and(x,a,b,in[0]);
    and(y,a,s[0],in[1]);
    and(z,s[1],b,in[2]);
    and(w,s[1],s[0],in[3]);
    or(out,x,y,z,w);
endmodule