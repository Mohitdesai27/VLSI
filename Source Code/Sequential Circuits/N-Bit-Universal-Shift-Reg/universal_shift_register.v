module universal_shift_register #(
    parameter N = 4
)(
    input clk,
    input [1:0] sel,        // S1 S0
    input [N-1:0] P,        // Parallel input
    input SL,               // Shift left input
    input SR,               // Shift right input
    output reg [N-1:0] Q
);

integer i;

always @(posedge clk) begin
    case (sel)
        2'b00: Q <= Q; // Hold

        2'b01: begin // Shift Right
            Q[N-1] <= SR;
            for (i = 0; i < N-1; i = i + 1)
                Q[i] <= Q[i+1];
        end

        2'b10: begin // Shift Left
            Q[0] <= SL;
            for (i = 1; i < N; i = i + 1)
                Q[i] <= Q[i-1];
        end

        2'b11: Q <= P; // Parallel Load
    endcase
end

endmodule
