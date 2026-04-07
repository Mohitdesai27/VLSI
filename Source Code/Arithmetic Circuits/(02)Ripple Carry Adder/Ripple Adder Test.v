`timescale 1ns/1ps

module tb_ripple_carry_adder;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;

    // Outputs
    wire [3:0] SUM;
    wire Cout;

    // Expected result (for verification)
    reg [4:0] expected;

    integer i, j, k;

    // Instantiate DUT
    ripple_carry_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .SUM(SUM),
        .Cout(Cout)
    );

    initial begin
        // Dump waveform
        $dumpfile("ripple_adder.vcd");
        $dumpvars(0, tb_ripple_carry_adder);

        $display("A     B     Cin | SUM   Cout | Expected | Status");
        $display("---------------------------------------------------");

        // Exhaustive Testing: All combinations
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin

                    A = i; 
                    B = j; 
                    Cin = k;

                    #10; // allow propagation

                    // Expected result using behavioral addition
                    expected = A + B + Cin;

                    // Display results
                    $write("%b  %b   %b  |  %b   %b   |  %b   ",
                           A, B, Cin, SUM, Cout, expected);

                    // Check correctness
                    if ({Cout, SUM} === expected) begin
                        $display("  PASS");
                    end else begin
                        $display("  FAIL  <-- ERROR");
                    end

                end
            end
        end

        // Edge Case Highlighting (important scenarios)
        $display("\n--- Edge Case Verification ---");

        // Case: Maximum + Maximum
        // 1111 + 1111 + 1 = 11111 (overflow)
        A = 4'b1111; B = 4'b1111; Cin = 1;
        #10;
        $display("MAX CASE: A=1111 B=1111 Cin=1 => SUM=%b Cout=%b",
                  SUM, Cout);

        // Case: Zero addition
        // 0000 + 0000 + 0 = 0000
        A = 4'b0000; B = 4'b0000; Cin = 0;
        #10;
        $display("ZERO CASE: A=0000 B=0000 Cin=0 => SUM=%b Cout=%b",
                  SUM, Cout);

        // Case: Carry propagation through all stages
        // 1111 + 0001 = ripple through all full adders
        A = 4'b1111; B = 4'b0001; Cin = 0;
        #10;
        $display("RIPPLE CASE: A=1111 B=0001 Cin=0 => SUM=%b Cout=%b",
                  SUM, Cout);

        $finish;
    end

endmodule