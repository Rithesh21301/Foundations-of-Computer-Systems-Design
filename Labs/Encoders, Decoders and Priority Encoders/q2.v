module priority_encoder(input [3:0] i, output [1:0] o, output v);
    wire ni1,ni0,ni2,a,b,c;
    or(v,i[3],i[2],i[1],i[0]);
    not(ni1,i[1]);
    not(ni0,i[0]);
    not(ni2,i[2]);
    and(a,i[1],ni0);
    and(b,ni1,ni0,ni2);
    and(o[1],ni1,ni0,v);
    or(c,a,b);
    and(o[0],c,v);
endmodule