module tb_arbiter;

reg clk, rst;
reg [3:0] req;
wire [3:0] gnt;

round_robin_arbiter uut (
    .clk(clk),
    .rst(rst),
    .req(req),
    .gnt(gnt)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    req = 0;

    #20 rst = 0;

    #10 req = 4'b1111;
    #200 req = 4'b1011;
    #200 req = 4'b0101;

    #200 $finish;
end

endmodule
