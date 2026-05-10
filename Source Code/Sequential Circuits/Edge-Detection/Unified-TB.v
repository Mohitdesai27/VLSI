module edge_detector #(
    parameter MODE = 0
    // 0 = Rising
    // 1 = Falling
    // 2 = Both
)(
    input clk,
    input X,
    output reg Y
);

reg Qprev;

always @(posedge clk) begin

    case (MODE)

        0: Y <= X & ~Qprev;

        1: Y <= ~X & Qprev;

        2: Y <= X ^ Qprev;

    endcase

    Qprev <= X;

end

endmodule
