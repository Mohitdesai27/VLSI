module cla_4bit(
  input [3:0] A, B, 
  input Cin,
  output [3:0] SUM, 
  output Cout
);
    wire [3:0] P, G;
    wire c1, c2, c3;

    assign P = A ^ B;
    assign G = A & B;

    assign c1 = G[0] | (P[0] & Cin);
    assign c2 = G[1] | (P[1] & c1);
    assign c3 = G[2] | (P[2] & c2);
    assign Cout = G[3] | (P[3] & c3);

    assign SUM = P ^ {c3, c2, c1, Cin};
endmodule
