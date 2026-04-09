module carry_select_adder_4bit(
    input  [3:0] A, B,
    input        Cin,
    output [3:0] SUM,
    output       Cout
);
    wire [3:0] sum0, sum1;
    wire       c0, c1;

    // 4-bit ripple adder assuming Cin = 0
    ripple_adder adder0(
        .A(A),
        .B(B),
        .Cin(1'b0),
        .SUM(sum0),
        .Cout(c0)
    );

    // 4-bit ripple adder assuming Cin = 1
    ripple_adder adder1(
        .A(A),
        .B(B),
        .Cin(1'b1),
        .SUM(sum1),
        .Cout(c1)
    );

    // MUX: select the correct sum & carry based on actual Cin
    assign SUM  = Cin ? sum1 : sum0;
    assign Cout = Cin ? c1   : c0;

endmodule
