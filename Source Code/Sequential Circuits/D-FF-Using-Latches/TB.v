module tb_d_ff_latch;

reg D, clk;
wire Q;

d_ff_latch uut (.D(D), .clk(clk), .Q(Q));

// clock generation
always #5 clk = ~clk;

initial begin
    clk = 0;
    D = 0;

    #10 D = 1;
    #10 D = 0;
    #10 D = 1;
    #10 D = 1;
    #10 D = 0;

    #50 $finish;
end

endmodule
