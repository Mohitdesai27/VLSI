`timescale 1ns/1ps

module tb_priority_resolver;

    // Inputs
    reg [3:0] D;

    // Outputs
    wire [1:0] Y;

    // Expected output
    reg [1:0] expected;

    integer i;

    // Instantiate DUT
    priority_resolver uut (
        .D(D),
        .Y(Y)
    );

    initial begin
        $dumpfile("priority_resolver.vcd");
        $dumpvars(0, tb_priority_resolver);

        $display("D    | Y  | Expected | Status | Comment");
        $display("--------------------------------------------");

        // Test all 4-bit input combinations
        for (i = 0; i < 16; i = i + 1) begin
            D = i; #5;

            // Expected behavior (priority: D3 > D2 > D1 > D0)
            if (D[3])      expected = 2'b11;
            else if (D[2]) expected = 2'b10;
            else if (D[1]) expected = 2'b01;
            else if (D[0]) expected = 2'b00;
            else           expected = 2'b00;

            $display("%b | %b |   %b     | %s | %s",
                     D, Y, expected,
                     (Y === expected) ? "PASS" : "FAIL",
                     (D[3]) ? "D3 highest priority" :
                     (D[2]) ? "D2 active" :
                     (D[1]) ? "D1 active" :
                     (D[0]) ? "D0 active" :
                              "No input active");
        end

        $display("\n--- Edge Cases ---");

        D = 4'b0000; #5;
        $display("No inputs active → Y=%b (Expected 00)", Y);

        D = 4'b1111; #5;
        $display("All inputs active → Y=%b (Expected 11, D3 wins)", Y);

        D = 4'b0101; #5;
        $display("Multiple inputs (D2 highest) → Y=%b (Expected 10)", Y);

        D = 4'b0011; #5;
        $display("Multiple inputs (D1 highest) → Y=%b (Expected 01)", Y);

        $finish;
    end

endmodule
