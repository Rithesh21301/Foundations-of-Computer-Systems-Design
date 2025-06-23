module SR_c(output reg Q, output reg Q_bar, input S, input R, input E);
wire w_Q,w_Qb;
always @(S or R or E) begin
    if(E)begin
        if(!S && !R)begin   
        ;
        end
        if((!S && R))begin  
        Q=0;
        Q_bar=1;
        end
        if(S && !R)begin
            Q=1;
            Q_bar=0;
        end
    end  
end
endmodule


