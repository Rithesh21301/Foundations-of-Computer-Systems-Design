module q1a(output f,input x,input y,input z);
    wire p,q,r,a,b,c,m,n,o,l;
    not(p,x);
    not(q,y);
    not(r,z);
    and(a,x,y);
    and(b,p,q);
    and(c,q,z);
    not(m,a);
    not(n,b);
    not(o,c);
    and(l,m,n,o);
    not(f,l);

endmodule