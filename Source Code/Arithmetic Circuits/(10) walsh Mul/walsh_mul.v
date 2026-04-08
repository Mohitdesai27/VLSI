module walsh_multiplier #(
    parameter WIDTH = 4  
)(
    input  wire [WIDTH-1:0] A,
    input  wire [WIDTH-1:0] B,
    output wire [2*WIDTH-1:0] Product
);
    wire [WIDTH-1:0] PP [WIDTH-1:0];

    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : pp_gen
            assign PP[i] = A & {WIDTH{B[i]}};
        end
    endgenerate

    reg [2*WIDTH-1:0] temp_sum;
    integer k;

    always @(*) begin
        temp_sum = {2*WIDTH{1'b0}};
        for (k = 0; k < WIDTH; k = k + 1) begin
            temp_sum = temp_sum + (PP[k] << k);
        end
    end

    assign Product = temp_sum;

endmodule
