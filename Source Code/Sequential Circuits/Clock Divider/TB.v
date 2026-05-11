module tb_clock_divider;

    reg clk, rst;
    reg [31:0] N;

    wire clk_out;

    clock_divider uut (
        .clk(clk),
        .rst(rst),
        .N(N),
        .clk_out(clk_out)
    );

    // 100 MHz equivalent simulation clock
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        rst = 1;
        N   = 5;

        #20 rst = 0;

        // Divide by 5
        #200;

        // Change dynamically to divide by 10
        N = 10;

        #400;

        // Change dynamically to divide by 3
        N = 3;

        #200;

        $finish;
    end

endmodule
