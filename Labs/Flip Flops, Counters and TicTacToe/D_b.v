module D_b(input d, input en, input rstn, output q);
    wire x,y,z,w,ny;
    and(x,en,d);
    nand(y,x,w);
    nand(z,rstn,en);
    nand(w,z,y);
    not(ny,y);
    buf(q,ny);
endmodule