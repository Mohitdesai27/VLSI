module full_subtractor(
  input A, B, Bin,
  output DIFF, Bout
);
    assign DIFF = A ^ B ^ Bin;
    assign Bout = (~A & B) | (~A & Bin) | (B & Bin);
endmodule
