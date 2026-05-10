module tb_dpram;

reg clk_a, clk_b;
reg we_a, we_b;

reg [3:0] addr_a, addr_b;
reg [7:0] din_a, din_b;

wire [7:0] dout_a, dout_b;

dpram uut (
    .clk_a(clk_a),
    .we_a(we_a),
    .addr_a(addr_a),
    .din_a(din_a),
    .dout_a(dout_a),

    .clk_b(clk_b),
    .we_b(we_b),
    .addr_b(addr_b),
    .din_b(din_b),
    .dout_b(dout_b)
);

always #5 clk_a = ~clk_a;
always #7 clk_b = ~clk_b;

initial begin
    clk_a = 0;
    clk_b = 0;

    // Port A write
    we_a = 1;
    addr_a = 4'd1;
    din_a = 8'h55;

    // Port B read
    we_b = 0;
    addr_b = 4'd1;

    #50 $finish;
end

endmodule
