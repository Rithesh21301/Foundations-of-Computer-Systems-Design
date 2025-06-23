module fa(output s,c,input a,b,cin);
    wire w1,w2,w3;
    and(w1,a,b);
    xor(w2,a,b);
    xor(s,w2,cin);
    and(w3,cin,w2);
    or(c,w3,w1);
endmodule