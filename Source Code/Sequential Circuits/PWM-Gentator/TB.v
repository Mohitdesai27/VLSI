module tb_pwm;

    reg clk, rst;
    reg [7:0] duty;
    wire pwm;

    pwm_generator #(8) uut (
        .clk(clk),
        .rst(rst),
        .duty(duty),
        .pwm(pwm)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        duty = 0;

        #20 rst = 0;

        // 25% duty
        #50 duty = 8'd64;

        // 50% duty
        #200 duty = 8'd128;

        // 75% duty
        #200 duty = 8'd192;

        // 100% duty
        #200 duty = 8'd255;

        #200 $finish;
    end

endmodule
