`timescale 1ns/1ps

module tb_cla_4bit;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;

    // Outputs
    wire [3:0] SUM;
    wire Cout;

    // Expected result
    reg [4:0] expected;

    integer i, j, k;

    // Instantiate DUT
    cla_4bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .SUM(SUM),
        .Cout(Cout)
    );

    initial begin
        // Dump waveform
        $dumpfile("cla_4bit.vcd");
        $dumpvars(0, tb_cla_4bit);

        $display("A     B     Cin | SUM   Cout | Expected | Status");
        $display("---------------------------------------------------");

        // Exhaustive Testing (512 cases)
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin

                    // Apply inputs
                    A = i;
                    B = j;
                    Cin = k;

                    #10; // allow combinational propagation

                    // Golden reference model
                    expected = A + B + Cin;

                    // Print result
                    $write("%b  %b   %b  |  %b   %b   |  %b   ",
                           A, B, Cin, SUM, Cout, expected);

                    // Self-check
                    if ({Cout, SUM} === expected) begin
                        $display("  PASS");
                    end else begin
                        $display("  FAIL  <-- ERROR");
                    end

                end
            end
        end

        // -----------------------------
        // Focused Test Cases (Important)
        // -----------------------------

        $display("\n--- Targeted CLA-Specific Cases ---");

        // Case 1: No carry generation (all propagate, no generate)
        // P=1, G=0 → behaves like XOR chain
        // Example: A=0101, B=1010
        A = 4'b0101; B = 4'b1010; Cin = 0;
        #10;
        $display("PROPAGATE ONLY: A=0101 B=1010 Cin=0 => SUM=%b Cout=%b",
                  SUM, Cout);

        // Case 2: Immediate carry generation at LSB
        // G[0]=1 → carry instantly generated
        A = 4'b0001; B = 4'b0001; Cin = 0;
        #10;
        $display("GEN LSB: A=0001 B=0001 Cin=0 => SUM=%b Cout=%b",
                  SUM, Cout);

        // Case 3: Full carry propagation chain (P=1 across all bits)
        // tests lookahead correctness
        A = 4'b1111; B = 4'b0000; Cin = 1;
        #10;
        $display("FULL PROPAGATION: A=1111 B=0000 Cin=1 => SUM=%b Cout=%b",
                  SUM, Cout);

        // Case 4: Multiple generate conditions
        // tests parallel carry resolution
        A = 4'b1111; B = 4'b1111; Cin = 0;
        #10;
        $display("MULTI GENERATE: A=1111 B=1111 Cin=0 => SUM=%b Cout=%b",
                  SUM, Cout);

        // Case 5: Overflow case
        A = 4'b1111; B = 4'b1111; Cin = 1;
        #10;
        $display("OVERFLOW: A=1111 B=1111 Cin=1 => SUM=%b Cout=%b",
                  SUM, Cout);

        $finish;
    end

endmodule