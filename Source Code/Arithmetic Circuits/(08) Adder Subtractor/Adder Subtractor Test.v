`timescale 1ns/1ps

module tb_adder_subtractor;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg M;  // 0=add, 1=sub

    // Outputs
    wire [3:0] RESULT;
    wire Cout;

    // Expected result
    reg [4:0] expected;

    integer i, j, m;

    // Instantiate DUT
    adder_subtractor uut (
        .A(A),
        .B(B),
        .M(M),
        .RESULT(RESULT),
        .Cout(Cout)
    );

    initial begin
        // Waveform dump
        $dumpfile("adder_subtractor.vcd");
        $dumpvars(0, tb_adder_subtractor);

        $display("M A    B    | RESULT Cout | Expected | Comment");
        $display("-----------------------------------------------");

        // Exhaustive testing
        for (m = 0; m < 2; m = m + 1) begin
            for (i = 0; i < 16; i = i + 1) begin
                for (j = 0; j < 16; j = j + 1) begin

                    A = i; 
                    B = j; 
                    M = m;

                    #10; // allow propagation

                    // Compute expected result
                    if (M == 0) begin
                        // Addition
                        expected = A + B;
                    end else begin
                        // Subtraction
                        expected = A - B; // Verilog interprets as 5-bit signed
                    end

                    $write("%b %b %b | %b   %b   | %b  ",
                           M, A, B, RESULT, Cout, expected);

                    // Check
                    if ({Cout, RESULT} === expected) begin
                        $display("PASS");
                    end else begin
                        $display("FAIL  <-- ERROR");
                    end

                end
            end
        end

        // -----------------------------
        // Important Edge Cases
        // -----------------------------

        $display("\n--- Edge Cases ---");

        // Max addition: 1111 + 1111 = 11110
        A = 4'b1111; B = 4'b1111; M = 0;
        #10;
        $display("MAX ADD: A=1111 B=1111 => RESULT=%b Cout=%b", RESULT, Cout);

        // Max subtraction: 0000 - 1111 = -1111 (2's complement)
        A = 4'b0000; B = 4'b1111; M = 1;
        #10;
        $display("MAX SUB: A=0000 B=1111 => RESULT=%b Cout=%b", RESULT, Cout);

        // Zero result addition
        A = 4'b0000; B = 4'b0000; M = 0;
        #10;
        $display("ZERO ADD: A=0000 B=0000 => RESULT=%b Cout=%b", RESULT, Cout);

        // Zero result subtraction
        A = 4'b1111; B = 4'b1111; M = 1;
        #10;
        $display("ZERO SUB: A=1111 B=1111 => RESULT=%b Cout=%b", RESULT, Cout);

        $finish;
    end

endmodule