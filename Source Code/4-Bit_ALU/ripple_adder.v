module ripple_adder #(
    parameter WIDTH = 4
)(
    input  [WIDTH-1:0] A, B,
    input  Cin,
    output [WIDTH-1:0] Sum,
    output Cout
);
    wire [WIDTH:0] C;
    assign C[0] = Cin;

    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : FA_CHAIN
            full_adder fa (
                .A   (A[i]),
                .B   (B[i]),
                .Cin (C[i]),
                .Sum (Sum[i]),
                .Cout(C[i+1])
            );
        end
    endgenerate

    assign Cout = C[WIDTH];
endmodule
