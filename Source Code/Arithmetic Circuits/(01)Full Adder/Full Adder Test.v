`timescale 1ns/1ps

module tb_full_adder;

    // Inputs
    reg A;
    reg B;
    reg Cin;

    // Outputs
    wire SUM;
    wire Cout;

    // Instantiate the DUT (Device Under Test)
    full_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .SUM(SUM),
        .Cout(Cout)
    );

    initial begin
        // Dump waveform for GTKWave / Vivado
        $dumpfile("full_adder.vcd");
        $dumpvars(0, tb_full_adder);

        // Display header
        $display("A B Cin | SUM Cout");
        $display("-------------------");

        // Test Case 1: 0 + 0 + 0
        // Expected: SUM = 0, Cout = 0
        A = 0; B = 0; Cin = 0;
        #10;
        $display("%b %b  %b  |  %b    %b", A, B, Cin, SUM, Cout);

        // Test Case 2: 0 + 0 + 1
        // Expected: SUM = 1, Cout = 0
        A = 0; B = 0; Cin = 1;
        #10;
        $display("%b %b  %b  |  %b    %b", A, B, Cin, SUM, Cout);

        // Test Case 3: 0 + 1 + 0
        // Expected: SUM = 1, Cout = 0
        A = 0; B = 1; Cin = 0;
        #10;
        $display("%b %b  %b  |  %b    %b", A, B, Cin, SUM, Cout);

        // Test Case 4: 0 + 1 + 1
        // Expected: SUM = 0, Cout = 1
        A = 0; B = 1; Cin = 1;
        #10;
        $display("%b %b  %b  |  %b    %b", A, B, Cin, SUM, Cout);

        // Test Case 5: 1 + 0 + 0
        // Expected: SUM = 1, Cout = 0
        A = 1; B = 0; Cin = 0;
        #10;
        $display("%b %b  %b  |  %b    %b", A, B, Cin, SUM, Cout);

        // Test Case 6: 1 + 0 + 1
        // Expected: SUM = 0, Cout = 1
        A = 1; B = 0; Cin = 1;
        #10;
        $display("%b %b  %b  |  %b    %b", A, B, Cin, SUM, Cout);

        // Test Case 7: 1 + 1 + 0
        // Expected: SUM = 0, Cout = 1
        A = 1; B = 1; Cin = 0;
        #10;
        $display("%b %b  %b  |  %b    %b", A, B, Cin, SUM, Cout);

        // Test Case 8: 1 + 1 + 1
        // Expected: SUM = 1, Cout = 1
        A = 1; B = 1; Cin = 1;
        #10;
        $display("%b %b  %b  |  %b    %b", A, B, Cin, SUM, Cout);

        // End simulation
        $finish;
    end

endmodule
