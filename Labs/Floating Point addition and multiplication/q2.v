module floating_point_mult (
    input [31:0] a,
    input [31:0] b,
    output reg [31:0] product,
    output reg exception, 
    output reg overflow,
    output reg underflow          
);

    wire sign_a = a[31];
    wire sign_b = b[31];
    wire [7:0] exp_a = a[30:23];
    wire [7:0] exp_b = b[30:23];
    wire [22:0] mant_a = a[22:0];
    wire [22:0] mant_b = b[22:0];


    wire [23:0] mant_a_extended = (exp_a == 8'h00) ? {1'b0, mant_a} : {1'b1, mant_a};
    wire [23:0] mant_b_extended = (exp_b == 8'h00) ? {1'b0, mant_b} : {1'b1, mant_b};

    wire product_sign = sign_a ^ sign_b;

    wire [47:0] mant_product = mant_a_extended * mant_b_extended;

    wire [8:0] exp_sum = exp_a + exp_b - 8'd127;

    reg [22:0] mantissa_normalized;
    reg [7:0] exponent_normalized;
    reg [47:0] mant_product_shifted;

    always @(*) begin
        exception = 1'b0;
        overflow = 1'b0;
        underflow = 1'b0;
        product = 32'b0;

        if ((exp_a == 8'hFF && mant_a != 0) || (exp_b == 8'hFF && mant_b != 0)) begin
            product = 32'h7FC00000;
            exception = 1'b1;
        end else if (exp_a == 8'hFF || exp_b == 8'hFF) begin
            product = {product_sign, 8'hFF, 23'b0};
            exception = 1'b1;
        end else if (a == 32'h00000000 || b == 32'h00000000) begin
            product = 32'h00000000;
            exception = 1'b1;
        end else begin
            mant_product_shifted = mant_product;
            if (mant_product_shifted[47]) begin
                mantissa_normalized = mant_product_shifted[46:24];
                exponent_normalized = exp_sum + 1;       
            end else begin
                mantissa_normalized = mant_product_shifted[45:23];
                exponent_normalized = exp_sum;            
            end
            if (exponent_normalized >= 8'hFF) begin
                product = {product_sign, 8'hFF, 23'b0};
                overflow = 1'b1;
                exception = 1'b1;
            end else if (exponent_normalized <= 8'h01) begin
                product = {product_sign, 8'b0, mantissa_normalized}; 
                underflow = 1'b1;
                exception = 1'b1;
            end else begin
                product = {product_sign, exponent_normalized[7:0], mantissa_normalized};
            end
        end
        if (product == 32'h00000000 && product_sign) begin
            product = 32'h80000000;
        end
    end
endmodule
 