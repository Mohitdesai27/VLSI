module binary_adder #(
    parameter WIDTH = 8
)(
    input  wire [WIDTH-1:0] A,
    input  wire [WIDTH-1:0] B,
    input  wire             Cin,
    output wire [WIDTH-1:0] Sum,
    output wire             Cout
);

    wire [WIDTH:0] carry; 
    assign carry[0] = Cin;

    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : full_adder_block
            assign Sum[i] = A[i] ^ B[i] ^ carry[i];
            assign carry[i+1] = (A[i] & B[i]) | (B[i] & carry[i]) | (A[i] & carry[i]);
        end
    endgenerate

    assign Cout = carry[WIDTH]; // Final carry-out

endmodule
