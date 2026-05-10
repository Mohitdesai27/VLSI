module tb_usr;

parameter N = 4;

reg clk;
reg [1:0] sel;
reg [N-1:0] P;
reg SL, SR;
wire [N-1:0] Q;

universal_shift_register #(N) uut (
    .clk(clk),
    .sel(sel),
    .P(P),
    .SL(SL),
    .SR(SR),
    .Q(Q)
);

always #5 clk = ~clk;

initial begin
    clk = 0;

    // Parallel load
    P = 4'b1010; sel = 2'b11;
    #10;

    // Shift right
    SR = 1; sel = 2'b01;
    #20;

    // Shift left
    SL = 0; sel = 2'b10;
    #20;

    // Hold
    sel = 2'b00;
    #10;

    #50 $finish;
end

endmodule
