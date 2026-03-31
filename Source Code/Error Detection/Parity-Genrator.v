module parity_generator #(
    parameter WIDTH = 8
)(
    input  wire [WIDTH-1:0] data,
    output wire parity
);

    assign parity = ^data;  // XOR reduction

endmodule
