module q1b(output f,input x,input y,input z);
    wire p,q,r,a,b,c,m,n,o;
    not(p,x);
    not(q,y);
    not(r,z);
    or(a,p,q);
    or(b,x,y);
    or(c,y,r);
    not(m,a);
    not(n,b);
    not(o,c);
    or(f,m,n,o);

endmodule
    