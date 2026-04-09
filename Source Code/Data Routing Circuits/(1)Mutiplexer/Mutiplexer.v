module param_mux #(
    parameter WIDTH = 8,       // Width of each input
    parameter N = 4            // Number of inputs
)(
    input  wire [WIDTH-1:0] in [0:N-1], // Input vector array
    input  wire [$clog2(N)-1:0] sel,    // Select line
    output wire [WIDTH-1:0] out
);

    assign out = in[sel];  // Combinational selection

endmodule
