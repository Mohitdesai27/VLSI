module tb_ring;

reg clk, rst;
wire [3:0] Q;

ring_counter uut (
    .clk(clk),
    .rst(rst),
    .Q(Q)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;

    #100 $finish;
end

endmodule
