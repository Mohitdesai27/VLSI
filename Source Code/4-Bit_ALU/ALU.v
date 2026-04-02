module ALU #(
    parameter WIDTH = 4
)(
    input  [WIDTH-1:0] A, B,
    input  [5:0] func6,
    output [WIDTH-1:0] Y
);

    wire [WIDTH-1:0] add_out, sub_out, inc_out, dec_out;
    wire [WIDTH-1:0] and_out, or_out, xor_out, not_out;
    wire Cout_dummy;

    wire [WIDTH-1:0] B_inv;

    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : INV_B
            not (B_inv[i], B[i]);
        end
    endgenerate


    // ADD
    ripple_adder #(WIDTH) ADD (
        .A(A), .B(B), .Cin(1'b0),
        .Sum(add_out), .Cout(Cout_dummy)
    );
  
    ripple_adder #(WIDTH) SUB (
        .A(A), .B(B_inv), .Cin(1'b1),
        .Sum(sub_out), .Cout(Cout_dummy)
    );

    ripple_adder #(WIDTH) INC (
        .A(A), .B({WIDTH{1'b0}}), .Cin(1'b1),
        .Sum(inc_out), .Cout(Cout_dummy)
    );

    ripple_adder #(WIDTH) DEC (
        .A(A), .B({WIDTH{1'b1}}), .Cin(1'b0),
        .Sum(dec_out), .Cout(Cout_dummy)
    );

    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : LOGIC_OPS
            and (and_out[i], A[i], B[i]);
            or  (or_out[i],  A[i], B[i]);
            xor (xor_out[i], A[i], B[i]);
            not (not_out[i], A[i]);
        end
    endgenerate

    assign Y = (func6 == 6'b000000) ? add_out :
               (func6 == 6'b000001) ? sub_out :
               (func6 == 6'b000010) ? and_out :
               (func6 == 6'b000011) ? or_out  :
               (func6 == 6'b000100) ? xor_out :
               (func6 == 6'b000101) ? not_out :
               (func6 == 6'b000110) ? inc_out :
               (func6 == 6'b000111) ? dec_out :
               {WIDTH{1'b0}};

endmodule
