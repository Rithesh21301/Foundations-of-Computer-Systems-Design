module SR_a(output reg Q, output reg Q_bar,input S, input R);
always @ (S or R)begin
    if(S && !R) begin
        Q=1;
        Q_bar=0;
    end
    else if(!S && R) begin
        Q=0;
        Q_bar=1;
    end
    else if (!S && !R) begin
        ;
    end
    else begin
        Q=1'bx;
        Q_bar=1'bx;
    end
end

endmodule