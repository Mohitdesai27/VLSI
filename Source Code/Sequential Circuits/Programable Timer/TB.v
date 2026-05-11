module tb_timer;

    reg clk, rst;
    reg load, enable;
    reg [7:0] load_value;

    wire timeout;
    wire [7:0] count;

    programmable_timer uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .enable(enable),
        .load_value(load_value),
        .timeout(timeout),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        load = 0;
        enable = 0;
        load_value = 0;

        #20 rst = 0;

        // Load count = 10
        #10;
        load = 1;
        load_value = 8'd10;

        #10;
        load = 0;
        enable = 1;

        // Wait for timeout
        #200;

        // Reload count = 5
        #20;
        load = 1;
        load_value = 8'd5;

        #10;
        load = 0;

        #100;

        $finish;
    end

endmodule
