module TCell(input clk, set, reset, set_symbol, output reg valid,symbol);

initial begin
        valid<=0;
    end
always @(posedge clk)begin
    if(reset)begin
        valid<=0;
    end
    else begin
        if(set && !valid)begin
        symbol<=set_symbol;
            valid<=1;
        end
    end
end
endmodule