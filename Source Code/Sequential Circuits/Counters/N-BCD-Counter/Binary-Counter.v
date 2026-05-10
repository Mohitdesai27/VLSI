module binary_counter #(
    parameter N = 4
)(
    input clk,
    input rst,
    output reg [N-1:0] Q
);

always @(posedge clk or posedge rst) begin
    if (rst)
        Q <= 0;
    else
        Q <= Q + 1;
end

endmodule
