module booth_multiplier_comb #(
    parameter WIDTH = 8
)(
    input  wire [WIDTH-1:0] multiplicand,
    input  wire [WIDTH-1:0] multiplier,
    output wire [2*WIDTH-1:0] product
);
    reg signed [2*WIDTH-1:0] partial;
    integer i;

    always @(*) begin
        partial = 0;
        for (i = 0; i < WIDTH; i = i + 1) begin
            // Check current bit and previous bit (Q[i], Q[i-1])
            // For i=0, Q[-1] is treated as 0
            case ({multiplier[i], (i==0 ? 1'b0 : multiplier[i-1])})
                2'b01: partial = partial + (multiplicand << i);
                2'b10: partial = partial - (multiplicand << i);
                default: partial = partial; // 00 or 11: do nothing
            endcase
        end
    end

    assign product = partial;

endmodule
