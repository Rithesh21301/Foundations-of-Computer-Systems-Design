module CLA4 (input [3:0]A,input [3:0]B,input carry_in, output carry_out, output [3:0] sum);
    wire [3:0] g,p;
    wire c1,c2,c3;
    wire x,y0,y1,z0,z1,z2,w0,w1,w2,w3;
    and(g[0],A[0],B[0]);
    and(g[1],A[1],B[1]);
    and(g[2],A[2],B[2]);
    and(g[3],A[3],B[3]);
    xor(p[0],A[0],B[0]);
    xor(p[1],A[1],B[1]);
    xor(p[2],A[2],B[2]);
    xor(p[3],A[3],B[3]);
    
    and(x,carry_in,p[0]);
    or(c1,x,g[0]);

    and(y0,carry_in,p[0],p[1]);
    and(y1,p[1],g[0]);
    or(c2,y0,y1,g[1]);

    and(z0,carry_in,p[0],p[1],p[2]);
    and(z1,g[0],p[1],p[2]);
    and(z2,g[1],p[2]);
    or(c3,z0,z1,z2,g[2]);

    and(w0,carry_in,p[0],p[1],p[2],p[3]);
    and(w1,g[0],p[1],p[2],p[3]);
    and(w2,g[1],p[2],p[3]);
    and(w3,p[3],g[2]);
    or(carry_out,w0,w1,w2,w3,g[3]);

    xor(sum[0],carry_in,p[0]);
    xor(sum[1],c1,p[1]);
    xor(sum[2],c2,p[2]);
    xor(sum[3],c3,p[3]);
endmodule



    