module round_robin_arbiter (
    input clk,
    input rst,
    input [3:0] req,
    output reg [3:0] gnt
);

reg [1:0] pointer;

integer i;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        pointer <= 0;
        gnt <= 0;
    end
    else begin
        gnt <= 4'b0000;

        for (i = 1; i <= 4; i = i + 1) begin
            case ((pointer + i) % 4)

                0: if (req[0]) begin
                    gnt[0] <= 1;
                    pointer <= 0;
                    disable for;
                end

                1: if (req[1]) begin
                    gnt[1] <= 1;
                    pointer <= 1;
                    disable for;
                end

                2: if (req[2]) begin
                    gnt[2] <= 1;
                    pointer <= 2;
                    disable for;
                end

                3: if (req[3]) begin
                    gnt[3] <= 1;
                    pointer <= 3;
                    disable for;
                end

            endcase
        end
    end
end

endmodule
