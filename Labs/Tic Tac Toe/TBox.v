`include "TCell.v"
`include "row_col_decoder.v"

module TBox(input clk, set, reset, input [1:0] row, input [1:0] col,output [8:0] valid, output [8:0] symbol, output reg [1:0] game_state);

wire [8:0] inte_valid;
wire [8:0] inte_symbol;

reg curr_turn;
reg [3:0] cell_index;
wire [8:0] set_sym; 

row_col_decoder d1(.row(row),.col(col),.v(set),.valid_out(set_sym));

genvar i;
generate
    for (i = 0; i < 9; i = i + 1) begin
        TCell tttt (
            .clk(clk),
            .set(set & set_sym[i]),
            .reset(reset),
            .set_symbol(curr_turn),
            .valid(inte_valid[i]),
            .symbol(inte_symbol[i])
        );
    end
endgenerate

assign valid = inte_valid;
assign symbol = inte_symbol;



initial begin
    game_state=2'b00;
    curr_turn=1;
    cell_index=0;
end

always @ (posedge clk or posedge reset)begin
    if(reset)begin
        game_state <= 2'b00;
        curr_turn <= 1;
        cell_index <= 0;
    end
    else if(set && game_state==2'b00 )begin
        if(set_sym & ~inte_valid)begin
            curr_turn <=  ~curr_turn;
            cell_index <= cell_index +1;
        end
    end
end

    always @(*) begin

        if(inte_valid[0] && inte_valid[1] && inte_valid[2] && inte_symbol[0] ==inte_symbol[1] && inte_symbol[1]==inte_symbol[2])begin
            game_state=inte_symbol[0]? 2'b01 : 2'b10;
        end
        else if(inte_valid[5] && inte_valid[4] && inte_valid[3] && inte_symbol[3] ==inte_symbol[4] && inte_symbol[4]==inte_symbol[5])begin
            game_state=inte_symbol[3]? 2'b01 : 2'b10;
        end
        else if(inte_valid[6] && inte_valid[7] && inte_valid[1] && inte_symbol[6] ==inte_symbol[7] && inte_symbol[7]==inte_symbol[8])begin
            game_state=inte_symbol[6]? 2'b01 : 2'b10;
        end
        else if(inte_valid[0] && inte_valid[3] && inte_valid[6] && inte_symbol[0] ==inte_symbol[3] && inte_symbol[3]==inte_symbol[6])begin
            game_state=inte_symbol[0]? 2'b01 : 2'b10;
        end
        else if(inte_valid[1] &&inte_valid[4] && inte_valid[7] && inte_symbol[1] ==inte_symbol[4] && inte_symbol[4]==inte_symbol[7])begin
            game_state=inte_symbol[1]? 2'b01 : 2'b10;
        end
        else if(inte_valid[2] && inte_valid[5] &&inte_valid[8] && inte_symbol[2] ==inte_symbol[5] && inte_symbol[5]==inte_symbol[8])begin
            game_state=inte_symbol[2]? 2'b01 : 2'b10;
        end
        else if(inte_valid[0] && inte_valid[4] &&inte_valid[8] && inte_symbol[0] ==inte_symbol[4] && inte_symbol[4]==inte_symbol[8])begin
            game_state=inte_symbol[0]? 2'b01 : 2'b10;
        end
        else if(inte_valid[2] &&inte_valid[4] &&inte_valid[6] && inte_symbol[2] ==inte_symbol[4] && inte_symbol[4]==inte_symbol[6])begin
            game_state=inte_symbol[2]? 2'b01 : 2'b10;
        end
        else if(&inte_valid)begin
            game_state <= 2'b11;
        end
        else begin
            game_state <= 2'b00;
        end
    end



    
endmodule
