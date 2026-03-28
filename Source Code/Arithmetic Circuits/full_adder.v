module full_adder(input A, B, Cin, output SUM, Cout);
    assign SUM = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule
