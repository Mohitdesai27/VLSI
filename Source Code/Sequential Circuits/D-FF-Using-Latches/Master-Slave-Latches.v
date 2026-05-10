module d_ff_latch(
    input D,
    input clk,
    output Q
);

wire Qm;

// Master latch (enabled when clk = 1)
d_latch master (
    .D(D),
    .EN(clk),
    .Q(Qm)
);

// Slave latch (enabled when clk = 0)
d_latch slave (
    .D(Qm),
    .EN(~clk),
    .Q(Q)
);

endmodule
