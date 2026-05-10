module pwm_generator #(
    parameter WIDTH = 8
)(
    input clk,
    input rst,
    input [WIDTH-1:0] duty,   // duty cycle value
    output reg pwm
);

    reg [WIDTH-1:0] counter;

    // Counter
    always @(posedge clk or posedge rst) begin
        if (rst)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    // PWM logic
    always @(posedge clk or posedge rst) begin
        if (rst)
            pwm <= 0;
        else
            pwm <= (counter < duty);
    end

endmodule
