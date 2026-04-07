`timescale 1ns/1ps

module tb_full_subtractor;

    // Inputs
    reg A;
    reg B;
    reg Bin;

    // Outputs
    wire DIFF;
    wire Bout;

    // Instantiate DUT
    full_subtractor uut (
        .A(A),
        .B(B),
        .Bin(Bin),
        .DIFF(DIFF),
        .Bout(Bout)
    );

    initial begin
        // Waveform dump for GTKWave/Vivado
        $dumpfile("full_subtractor.vcd");
        $dumpvars(0, tb_full_subtractor);

        $display("A B Bin | DIFF Bout | Expected DIFF Bout | Comment");
        $display("-----------------------------------------------");

        // Test Case 1: 0 - 0 - 0
        // Expected: DIFF = 0, Bout = 0
        A = 0; B = 0; Bin = 0; #10;
        $display("%b %b  %b  | %b    %b  | 0 0 | No borrow, zero subtraction", A,B,Bin,DIFF,Bout);

        // Test Case 2: 0 - 0 - 1
        // Expected: DIFF = 1, Bout = 1 (borrow needed)
        A = 0; B = 0; Bin = 1; #10;
        $display("%b %b  %b  | %b    %b  | 1 1 | Borrow in, zero minus 1", A,B,Bin,DIFF,Bout);

        // Test Case 3: 0 - 1 - 0
        // Expected: DIFF = 1, Bout = 1 (borrow needed)
        A = 0; B = 1; Bin = 0; #10;
        $display("%b %b  %b  | %b    %b  | 1 1 | Borrow needed: 0-1", A,B,Bin,DIFF,Bout);

        // Test Case 4: 0 - 1 - 1
        // Expected: DIFF = 0, Bout = 1
        A = 0; B = 1; Bin = 1; #10;
        $display("%b %b  %b  | %b    %b  | 0 1 | Borrow: 0-1-1", A,B,Bin,DIFF,Bout);

        // Test Case 5: 1 - 0 - 0
        // Expected: DIFF = 1, Bout = 0
        A = 1; B = 0; Bin = 0; #10;
        $display("%b %b  %b  | %b    %b  | 1 0 | Normal subtraction, no borrow", A,B,Bin,DIFF,Bout);

        // Test Case 6: 1 - 0 - 1
        // Expected: DIFF = 0, Bout = 0
        A = 1; B = 0; Bin = 1; #10;
        $display("%b %b  %b  | %b    %b  | 0 0 | Borrow in cancels out difference", A,B,Bin,DIFF,Bout);

        // Test Case 7: 1 - 1 - 0
        // Expected: DIFF = 0, Bout = 0
        A = 1; B = 1; Bin = 0; #10;
        $display("%b %b  %b  | %b    %b  | 0 0 | Equal subtraction, no borrow", A,B,Bin,DIFF,Bout);

        // Test Case 8: 1 - 1 - 1
        // Expected: DIFF = 1, Bout = 1
        A = 1; B = 1; Bin = 1; #10;
        $display("%b %b  %b  | %b    %b  | 1 1 | Subtract 1 with borrow in", A,B,Bin,DIFF,Bout);

        $finish;
    end

endmodule