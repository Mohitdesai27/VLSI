module sync_fifo #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 16,
    parameter ADDR_WIDTH = 4
)(
    input clk,
    input rst,

    input wr_en,
    input rd_en,

    input [DATA_WIDTH-1:0] din,
    output reg [DATA_WIDTH-1:0] dout,

    output full,
    output empty
);

reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

reg [ADDR_WIDTH:0] wr_ptr;
reg [ADDR_WIDTH:0] rd_ptr;

// Empty condition
assign empty = (wr_ptr == rd_ptr);

// Full condition
assign full =
    ((wr_ptr[ADDR_WIDTH] != rd_ptr[ADDR_WIDTH]) &&
     (wr_ptr[ADDR_WIDTH-1:0] == rd_ptr[ADDR_WIDTH-1:0]));

// Write
always @(posedge clk or posedge rst) begin
    if (rst)
        wr_ptr <= 0;

    else if (wr_en && !full) begin
        mem[wr_ptr[ADDR_WIDTH-1:0]] <= din;
        wr_ptr <= wr_ptr + 1;
    end
end

// Read
always @(posedge clk or posedge rst) begin
    if (rst) begin
        rd_ptr <= 0;
        dout <= 0;
    end

    else if (rd_en && !empty) begin
        dout <= mem[rd_ptr[ADDR_WIDTH-1:0]];
        rd_ptr <= rd_ptr + 1;
    end
end

endmodule
