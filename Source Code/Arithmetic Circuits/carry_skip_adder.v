module carry_skip_adder(
  input [3:0] A, B, 
  input Cin,
  output [3:0] SUM, 
  output Cout
);
    wire [3:0] P;
    wire c4;

    ripple_carry_adder RCA(A, B, Cin, SUM, c4);
    assign P = A ^ B;

    wire skip = &P; 
    assign Cout = skip ? Cin : c4;
endmodule
