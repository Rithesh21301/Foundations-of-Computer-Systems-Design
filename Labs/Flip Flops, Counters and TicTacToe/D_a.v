module D_a(input d, input en, input rstn, output reg q);
always @ (en or d or rstn) begin
    if (!rstn) begin
        q <= 0;
    end
    else if (en) begin
        q <= d;
    end
end

endmodule