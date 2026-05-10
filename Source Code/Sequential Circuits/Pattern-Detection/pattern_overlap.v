module pattern_overlap (
    input wire clk,
    input wire rst,
    input wire x,
    output reg z
);

    // State Encoding
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;

    reg [1:0] state, next_state;

    // State Register
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

    // Next State Logic
    always @(*) begin
        case(state)

            S0: begin
                if (x)
                    next_state = S1;
                else
                    next_state = S0;
            end

            S1: begin
                if (x)
                    next_state = S1;
                else
                    next_state = S2;
            end

            S2: begin
                if (x)
                    next_state = S3;
                else
                    next_state = S0;
            end

            S3: begin
                if (x)
                    next_state = S1; // overlap reuse
                else
                    next_state = S2;
            end

            default: next_state = S0;

        endcase
    end

    // Output Logic
    always @(*) begin
        if (state == S3 && x == 1'b1)
            z = 1'b1;
        else
            z = 1'b0;
    end

endmodule

