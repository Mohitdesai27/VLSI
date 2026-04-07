`timescale 1ns/1ps

module tb_carry_skip_adder;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;

    // Outputs
    wire [3:0] SUM;
    wire Cout;

    // Expected result
    reg [4:0] expected;

    // Internal expected skip behavior
    reg skip_expected;

    integer i, j, k;

    // Instantiate DUT
    carry_skip_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .SUM(SUM),
        .Cout(Cout)
    );

    initial begin
        // Waveform dump
        $dumpfile("carry_skip_adder.vcd");
        $dumpvars(0, tb_carry_skip_adder);

        $display("A     B     Cin | SUM   Cout | Exp | Skip | Status");
        $display("-----------------------------------------------------");

        // Exhaustive Testing
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin

                    A = i;
                    B = j;
                    Cin = k;

                    #10;

                    // Golden arithmetic result
                    expected = A + B + Cin;

                    // Skip condition (P = A ^ B)
                    skip_expected = &(A ^ B);

                    $write("%b  %b   %b  |  %b   %b   | %b |  %b  ",
                           A, B, Cin, SUM, Cout, expected, skip_expected);

                    // Check 1: Arithmetic correctness
                    if ({Cout, SUM} !== expected) begin
                        $display(" FAIL (WRONG SUM/CARRY)");
                    end

                    // Check 2: Skip logic correctness
                    else if (skip_expected && Cout !== Cin) begin
                        $display(" FAIL (SKIP ERROR)");
                    end

                    else begin
                        $display(" PASS");
                    end

                end
            end
        end


        $display("\n--- Carry Skip Specific Cases ---");

        // Case 1: Skip Active (P = 1111)
        // A ^ B = 1111 → carry should bypass RCA
        A = 4'b1010; B = 4'b0101; Cin = 1;
        #10;
        $display("SKIP ACTIVE: A=1010 B=0101 Cin=1 => Cout=%b (should equal Cin=1)", Cout);

        // Case 2: Skip Active with Cin=0
        A = 4'b0101; B = 4'b1010; Cin = 0;
        #10;
        $display("SKIP ACTIVE: A=0101 B=1010 Cin=0 => Cout=%b (should equal Cin=0)", Cout);

        // Case 3: Skip NOT active (normal ripple behavior)
        A = 4'b1111; B = 4'b0001; Cin = 0;
        #10;
        $display("NO SKIP: A=1111 B=0001 Cin=0 => Cout=%b (from RCA)", Cout);

        // Case 4: Partial propagate (not all bits propagate)
        A = 4'b1100; B = 4'b0011; Cin = 1;
        #10;
        $display("PARTIAL PROP: A=1100 B=0011 Cin=1 => Cout=%b", Cout);

        // Case 5: Overflow case
        A = 4'b1111; B = 4'b1111; Cin = 1;
        #10;
        $display("OVERFLOW: A=1111 B=1111 Cin=1 => SUM=%b Cout=%b", SUM, Cout);

        $finish;
    end

endmodule