module tb_spram;

reg clk, we;
reg [3:0] addr;
reg [7:0] din;
wire [7:0] dout;

spram uut (
    .clk(clk),
    .we(we),
    .addr(addr),
    .din(din),
    .dout(dout)
);

always #5 clk = ~clk;

initial begin
    clk = 0;

    // Write
    we = 1;
    addr = 4'd2;
    din = 8'hAA;
    #10;

    // Read
    we = 0;
    addr = 4'd2;
    #10;

    $finish;
end

endmodule
