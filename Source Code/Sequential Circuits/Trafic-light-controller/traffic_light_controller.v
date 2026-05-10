module traffic_light_controller #(
    parameter MAX = 5   // state duration
)(
    input clk,
    input rst,
    output reg NS_R, NS_Y, NS_G,
    output reg EW_R, EW_Y, EW_G
);

    reg [1:0] state, next_state;
    reg [3:0] counter;

    localparam S0 = 2'b00;
    localparam S1 = 2'b01;
    localparam S2 = 2'b10;
    localparam S3 = 2'b11;

    // Counter
    always @(posedge clk or posedge rst) begin
        if (rst)
            counter <= 0;
        else if (counter == MAX)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    wire done = (counter == MAX);

    // Next state logic
    always @(*) begin
        case (state)
            S0: next_state = done ? S1 : S0;
            S1: next_state = done ? S2 : S1;
            S2: next_state = done ? S3 : S2;
            S3: next_state = done ? S0 : S3;
            default: next_state = S0;
        endcase
    end

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

    // Output logic
    always @(*) begin
        // default OFF
        {NS_R, NS_Y, NS_G, EW_R, EW_Y, EW_G} = 6'b0;

        case (state)
            S0: begin NS_G = 1; EW_R = 1; end
            S1: begin NS_Y = 1; EW_R = 1; end
            S2: begin NS_R = 1; EW_G = 1; end
            S3: begin NS_R = 1; EW_Y = 1; end
        endcase
    end

endmodule
