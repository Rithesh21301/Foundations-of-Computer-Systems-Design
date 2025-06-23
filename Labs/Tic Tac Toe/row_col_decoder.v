module row_col_decoder(input [1:0] row,input [1:0] col,input v,output [8:0] valid_out);

wire n_row0, n_row1, n_col0, n_col1;

not(n_row0, row[0]);
not(n_row1, row[1]);
not(n_col0, col[0]);
not(n_col1, col[1]);

and(valid_out[0], n_row1, row[0], n_col1, col[0], v);
and(valid_out[1], n_row1, row[0], n_col0, col[1], v);
and(valid_out[2], n_row1, row[0], col[1], col[0], v);
and(valid_out[3], n_row0, row[1], n_col1, col[0], v);
and(valid_out[4], n_row0, row[1], n_col0, col[1], v);
and(valid_out[5], n_row0, row[1], col[1], col[0], v);
and(valid_out[6], row[1], row[0], n_col1, col[0], v);
and(valid_out[7], row[1], row[0], n_col0, col[1], v);
and(valid_out[8], row[1], row[0], col[1], col[0], v);

endmodule