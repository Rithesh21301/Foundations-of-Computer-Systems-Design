module FloatingPointAddition (
    input [31:0] a_operand,     
    input [31:0] b_operand,     
    output reg Exception,       
    output reg [31:0] result
);
    reg s_a, s_b;
    reg [7:0] expo_a, expo_b;
    reg [23:0] mant_a, mant_b;
    reg [7:0] exp_diff;
    reg [24:0] sum_mant;
    reg [23:0] mant_shifted_a, mant_shifted_b;
    reg [7:0] final_expo;
    reg final_sign;
    reg [23:0] normalized_mant;
    reg [7:0] normalized_expo;

    always @(*) begin
        s_a = a_operand[31];
        s_b = b_operand[31];
        expo_a = a_operand[30:23];
        expo_b = b_operand[30:23];
        mant_a = {1'b1, a_operand[22:0]}; 
        mant_b = {1'b1, b_operand[22:0]}; 
        if (expo_a > expo_b) begin
            exp_diff = expo_a - expo_b;
            mant_shifted_b = mant_b >> exp_diff;
            mant_shifted_a = mant_a;
            final_expo = expo_a;
        end else begin
            exp_diff = expo_b - expo_a;
            mant_shifted_a = mant_a >> exp_diff;
            mant_shifted_b = mant_b;
            final_expo = expo_b;
        end
        if (s_a == s_b) begin
            sum_mant = mant_shifted_a + mant_shifted_b;
            final_sign = s_a;
        end else begin
            if (mant_shifted_a > mant_shifted_b) begin
                sum_mant = mant_shifted_a - mant_shifted_b;
                final_sign = s_a;
            end else begin
                sum_mant = mant_shifted_b - mant_shifted_a;
                final_sign = s_b;
            end
        end

        {normalized_mant, normalized_expo} = normalize(sum_mant, final_expo);
        Exception = check_exceptions(a_operand, b_operand);
        result = {final_sign, normalized_expo, normalized_mant[22:0]};
    end
    function [31:0] normalize(input [24:0] mantissa, input [7:0] exponent);
        reg [23:0] mantissa_norm;
        reg [7:0] exponent_norm;
        integer shift;
        begin
            if (mantissa[24]) begin
                mantissa_norm = mantissa[24:1];
                exponent_norm = exponent + 1;
            end
            else if (mantissa[23:0] != 0) begin
                shift = 0;
                while (!mantissa[23]) begin
                    mantissa = mantissa << 1;
                    exponent = exponent - 1;
                    shift = shift + 1;
                end
                mantissa_norm = mantissa[23:0];
                exponent_norm = exponent;
            end else begin
                mantissa_norm = mantissa[23:0];
                exponent_norm = exponent;
            end
            normalize = {mantissa_norm, exponent_norm};
        end
    endfunction

    function check_exceptions(input [31:0] a, input [31:0] b);
    begin
        if ((a[30:23] == 8'b11111111 && a[22:0] != 0) || (b[30:23] == 8'b11111111 && b[22:0] != 0)) begin
            result = 32'b01111111110000000000000000000000; 
            check_exceptions = 1;
        end
        else if ((a[30:23] == 8'b11111111 && a[22:0] == 0) || (b[30:23] == 8'b11111111 && b[22:0] == 0)) begin
            if ((a[30:23] == 8'b11111111 && a[22:0] == 0) && (b[30:23] == 8'b11111111 && b[22:0] == 0)) begin
                if (a[31] == b[31]) begin
                    result = {a[31], 8'b11111111, 23'b0}; 
                end else begin
                    result = 32'b01111111110000000000000000000000; 
                end
            end else begin
                result = (a[30:23] == 8'b11111111 && a[22:0] == 0) ? a : b; 
            end
            check_exceptions = 1;
        end
        else if ((a[30:0] == 0) && (b[30:0] == 0)) begin
            result = 32'b0; 
            check_exceptions = 1;
        end
        else begin
            check_exceptions = 0;
        end
    end
    endfunction
endmodule