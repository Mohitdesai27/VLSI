module tb_flipflops;

reg clk;
reg S,R,J,K,D,T;
wire Q_sr, Q_jk, Q_d, Q_t;

// Instantiate
sr_ff uut1(S,R,clk,Q_sr);
jk_ff uut2(J,K,clk,Q_jk);
d_ff  uut3(D,clk,Q_d);
t_ff  uut4(T,clk,Q_t);

// Clock
always #5 clk = ~clk;

initial begin
    clk = 0;

    // SR Test
    S=0; R=0;
    #10 S=1; R=0;
    #10 S=0; R=1;
    #10 S=0; R=0;

    // JK Test
    J=0; K=0;
    #10 J=1; K=0;
    #10 J=0; K=1;
    #10 J=1; K=1;

    // D Test
    D=0;
    #10 D=1;
    #10 D=0;

    // T Test
    T=0;
    #10 T=1;
    #30 T=0;

    #50 $finish;
end

endmodule
