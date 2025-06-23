module q2b(output f,input a,input b,input c,input d);
    wire p,q,r,s,x,y,z;
    not(p,a);
    not(q,c);
    and(x,r);
    not(y,s);
    and(z,x,y);
    not(f,z);
endmodule