module q2a(output f,input a,input b,input c,input d);
    wire p,q,r,s,x,y,z,w,g,h,i,j;
    not(p,a);
    not(q,b);
    not(r,c);
    not(s,d);
    and(x,p,q,r,s);
    and(y,p,q,r,d);
    and(z,p,b,r,s);
    and(w,p,b,r,d);
    and(g,a,b,c,d);
    and(h,a,b,c,s);
    and(i,a,q,c,d);
    and(j,a,q,c,s);
    or(f,x,y,z,w,g,h,i,j);
endmodule
    
