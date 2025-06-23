module decoder(input [1:0] i, output [3:0] o);
    wire ni1,ni0;
    not(ni1,i[1]);
    not(ni0,i[0]);
    and(o[3],i[1],i[0]);
    and(o[2],i[1],ni0);
    and(o[1],ni1,i[0]);
    and(o[0],ni1,ni0);
endmodule