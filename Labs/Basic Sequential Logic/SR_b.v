module SR_b(output Q, output Q_bar, input S, input R);
    nor(Q,R,Q_bar);
    nor(Q_bar,S,Q);
endmodule