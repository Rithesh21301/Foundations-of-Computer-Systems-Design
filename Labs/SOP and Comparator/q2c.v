module q2c(output f,input a,input b,input c,input d);
    wire p,q,r,s;
    not(p,a);
    not(q,c);
    and(r,p,q);
    and(s,a,c);
    or(f,r,s);
endmodule

