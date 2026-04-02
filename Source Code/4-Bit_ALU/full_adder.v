module full_adder (
    input A, B, Cin,
    output Sum, Cout
);
    wire x1, x2, x3;

    xor (x1, A, B);
    xor (Sum, x1, Cin);

    and (x2, x1, Cin);
    and (x3, A, B);
    or  (Cout, x2, x3);
endmodule
