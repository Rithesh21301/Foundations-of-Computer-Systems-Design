module q1a(output f,input x,input y,input z);
    wire a,b,c,p,q;
    and(a,x,y);
    not(p,x);
    not(q,y);
    and(b,p,q);
    and(c,q,z);
    or(f,a,b,c);
endmodule