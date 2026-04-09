`timescale 1ns/1ps

module tb_buffer_gate;

    // Input
    reg A;

    // Output
    wire Y;

    // Expected output
    reg expected;

    // Instantiate DUT
    buffer_gate uut (
        .A(A),
        .Y(Y)
    );

    initial begin
        $dumpfile("buffer_gate.vcd");
        $dumpvars(0, tb_buffer_gate);

        $display("A | Y | Expected | Status | Comment");
        $display("------------------------------------");

        A = 0; #5;
        expected = 0;
        $display("%b | %b |    %b     | %s | Input LOW propagated",
                 A, Y, expected,
                 (Y === expected) ? "PASS" : "FAIL");

        A = 1; #5;
        expected = 1;
        $display("%b | %b |    %b     | %s | Input HIGH propagated",
                 A, Y, expected,
                 (Y === expected) ? "PASS" : "FAIL");


        $display("\n--- Transition Test ---");

        A = 0; #5;
        A = 1; #5;
        A = 0; #5;

        $display("Transition observed: Check waveform for glitches/delay");

        $finish;
    end

endmodule
