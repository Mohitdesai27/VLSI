module tb_sync_fifo;

reg clk, rst;
reg wr_en, rd_en;
reg [7:0] din;

wire [7:0] dout;
wire full, empty;

sync_fifo uut (
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .din(din),
    .dout(dout),
    .full(full),
    .empty(empty)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;

    #10 rst = 0;

    // Write data
    wr_en = 1;
    rd_en = 0;

    din = 8'h11; #10;
    din = 8'h22; #10;
    din = 8'h33; #10;

    // Read data
    wr_en = 0;
    rd_en = 1;

    #40;

    $finish;
end

endmodule
