module priority_encoder(input [3:0] i, output [1:0] o);
    wire ni1,ni0,ni2,a,b,c;
    not(ni1,i[1]);
    not(ni0,i[0]);
    not(ni2,i[2]);
    and(a,i[1],ni0);
    and(b,i[3],ni0,ni2);
    and(o[1],i[3],i[2]);
    or(c,a,b);
    and(o[0],c);
endmodule