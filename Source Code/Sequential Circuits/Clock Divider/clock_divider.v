module clock_divider (
    input clk,
    input rst,
    input [31:0] N,     // programmable divide factor
    output reg clk_out
);

    reg [31:0] count;

    always @(posedge clk or posedge rst) begin

        if (rst) begin
            count   <= 0;
            clk_out <= 0;
        end

        else begin

            if (count == (N - 1)) begin
                count   <= 0;
                clk_out <= ~clk_out;
            end

            else begin
                count <= count + 1;
            end

        end
    end

endmodule
