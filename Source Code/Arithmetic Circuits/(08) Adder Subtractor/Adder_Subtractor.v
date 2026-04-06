module adder_subtractor(
  input [3:0] A, B, 
  input M,
  output [3:0] RESULT, 
  output Cout
);
    wire [3:0] Bmod;

    assign Bmod = B ^ {4{M}};
    assign {Cout, RESULT} = A + Bmod + M;
endmodule
