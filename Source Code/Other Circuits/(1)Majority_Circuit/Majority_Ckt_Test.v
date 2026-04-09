`timescale 1ns/1ps

module tb_majority3;

    // Inputs
    reg A, B, C;

    // Output
    wire Y;

    // Expected output
    reg expected;

    integer i;

    // Instantiate DUT
    majority3 uut (
        .A(A),
        .B(B),
        .C(C),
        .Y(Y)
    );

    initial begin
        $dumpfile("majority3.vcd");
        $dumpvars(0, tb_majority3);

        $display("A B C | Y | Expected | Status | Comment");
        $display("------------------------------------------");

        for (i = 0; i < 8; i = i + 1) begin
            {A, B, C} = i; #5;

            // Majority logic: output = 1 if at least 2 inputs are 1
            expected = (A + B + C >= 2);

            $display("%b %b %b | %b |    %b     | %s | %s",
                     A, B, C, Y, expected,
                     (Y === expected) ? "PASS" : "FAIL",
                     (expected) ? "At least two 1s → output 1"
                                : "Less than two 1s → output 0");
        end

        $display("\n--- Edge Cases ---");

        {A, B, C} = 3'b000; #5;
        $display("All 0s → Y=%b (Expected 0)", Y);
        {A, B, C} = 3'b111; #5;
        $display("All 1s → Y=%b (Expected 1)", Y);
        {A, B, C} = 3'b110; #5;
        $display("Two 1s → Y=%b (Expected 1)", Y);
        {A, B, C} = 3'b101; #5;
        $display("Two 1s → Y=%b (Expected 1)", Y);
        {A, B, C} = 3'b011; #5;
        $display("Two 1s → Y=%b (Expected 1)", Y);

        $finish;
    end

endmodule
