module tb_debounce;

    reg clk, rst, sw;
    wire out;

    debounce_fsm uut (
        .clk(clk),
        .rst(rst),
        .sw(sw),
        .out(out)
    );

    // clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        sw = 0;

        #20 rst = 0;

        // simulate bouncing press
        #30 sw = 1;
        #10 sw = 0;
        #10 sw = 1;
        #10 sw = 0;
        #10 sw = 1;

        // stable high
        #200 sw = 1;

        // bouncing release
        #100 sw = 0;
        #10 sw = 1;
        #10 sw = 0;
        #10 sw = 0;

        #200 $finish;
    end

endmodule
