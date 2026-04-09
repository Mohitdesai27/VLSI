module tri_state_buffer(
  input A, 
  input EN, 
  output Y
);
    assign Y = EN ? A : 1'bz;
endmodule
