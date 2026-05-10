module dpram #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
)(
    // Port A
    input clk_a,
    input we_a,
    input [ADDR_WIDTH-1:0] addr_a,
    input [DATA_WIDTH-1:0] din_a,
    output reg [DATA_WIDTH-1:0] dout_a,

    // Port B
    input clk_b,
    input we_b,
    input [ADDR_WIDTH-1:0] addr_b,
    input [DATA_WIDTH-1:0] din_b,
    output reg [DATA_WIDTH-1:0] dout_b
);

reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

always @(posedge clk_a) begin
    if (we_a)
        mem[addr_a] <= din_a;

    dout_a <= mem[addr_a];
end

always @(posedge clk_b) begin
    if (we_b)
        mem[addr_b] <= din_b;

    dout_b <= mem[addr_b];
end

endmodule
