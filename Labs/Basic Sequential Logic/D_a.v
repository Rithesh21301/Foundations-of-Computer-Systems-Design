module D_a(input d, input en, input rstn, output reg q);
always @ (en or d) begin
    if(rstn)begin
        if(en)begin
            q=d;
        end
        else if(!en)begin
            
        end
    end
    else if(!rstn) begin
        q=0;
    end
end

endmodule