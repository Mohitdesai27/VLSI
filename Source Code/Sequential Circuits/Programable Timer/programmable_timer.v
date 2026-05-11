module programmable_timer #(
    parameter WIDTH = 8
)(
    input clk,
    input rst,
    input load,
    input enable,
    input [WIDTH-1:0] load_value,

    output reg timeout,
    output reg [WIDTH-1:0] count
);

    reg state;

    localparam IDLE  = 1'b0;
    localparam COUNT = 1'b1;

    // State machine
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= IDLE;
        else begin
            case (state)

                IDLE:
                    if (load)
                        state <= COUNT;

                COUNT:
                    if (count == 0)
                        state <= IDLE;

            endcase
        end
    end

    // Counter logic
    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 0;

        else begin
            case (state)

                IDLE: begin
                    if (load)
                        count <= load_value;
                end

                COUNT: begin
                    if (enable && count != 0)
                        count <= count - 1;
                end

            endcase
        end
    end

    // Timeout logic
    always @(posedge clk or posedge rst) begin
        if (rst)
            timeout <= 0;
        else
            timeout <= (count == 0 && state == COUNT);
    end

endmodule
