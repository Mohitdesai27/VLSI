module walsh_multiplier #(
    parameter WIDTH = 4  
)(
    input  wire [WIDTH-1:0] A,
    input  wire [WIDTH-1:0] B,
    output wire [2*WIDTH-1:0] Product
);
    wire [WIDTH-1:0] PP [WIDTH-1:0];
    wire [2*WIDTH-1:0] sum [WIDTH-1:0];
    integer i, j;

    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : pp_gen
            assign PP[i] = A & {WIDTH{B[i]}}; 
        end
    endgenerate

    reg [2*WIDTH-1:0] temp_sum;
    always @(*) begin
        temp_sum = 0;
        for (i = 0; i < WIDTH; i = i + 1) begin
            temp_sum = temp_sum + (PP[i] << i);
        end
    end

    assign Product = temp_sum;

endmodule
