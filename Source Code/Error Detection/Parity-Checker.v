module parity_checker #(
    parameter WIDTH = 8
)(
    input  wire [WIDTH-1:0] data,
    input  wire parity_bit,
    output wire error
);

    assign error = ^{data, parity_bit};  // XOR all bits

endmodule
