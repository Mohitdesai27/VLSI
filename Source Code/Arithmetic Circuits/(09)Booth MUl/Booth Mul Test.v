`timescale 1ns/1ps

module tb_booth_multiplier_comb;

    parameter WIDTH = 8;

    // Inputs
    reg signed [WIDTH-1:0] multiplicand;
    reg signed [WIDTH-1:0] multiplier;

    // Outputs
    wire signed [2*WIDTH-1:0] product;

    // Expected product
    reg signed [2*WIDTH-1:0] expected;

    integer i, j;

    // Instantiate DUT
    booth_multiplier_comb #(.WIDTH(WIDTH)) uut (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

    initial begin
        // Waveform dump
        $dumpfile("booth_multiplier_comb.vcd");
        $dumpvars(0, tb_booth_multiplier_comb);

        $display("Multiplicand Multiplier | Product | Expected | Status");
        $display("-------------------------------------------------------");

        // ------------------------------
        // Exhaustive testing for 4-bit
        // (Optional for 8-bit: too many combinations)
        // ------------------------------
        if (WIDTH <= 4) begin
            for (i = -(1<<(WIDTH-1)); i < (1<<(WIDTH-1)); i = i + 1) begin
                for (j = -(1<<(WIDTH-1)); j < (1<<(WIDTH-1)); j = j + 1) begin
                    multiplicand = i;
                    multiplier = j;
                    #10;
                    expected = multiplicand * multiplier;
                    $write("%d       %d        | %d | %d | ", multiplicand, multiplier, product, expected);
                    if (product === expected) $display("PASS");
                    else $display("FAIL  <-- ERROR");
                end
            end
        end

        // ------------------------------
        // Targeted Test Cases for 8-bit
        // ------------------------------

        // Case 1: Positive x Positive
        multiplicand = 12; multiplier = 10; #10;
        expected = multiplicand * multiplier;
        $display("POSxPOS: %d x %d = %d (DUT=%d)", multiplicand, multiplier, expected, product);

        // Case 2: Positive x Negative
        multiplicand = 15; multiplier = -7; #10;
        expected = multiplicand * multiplier;
        $display("POSxNEG: %d x %d = %d (DUT=%d)", multiplicand, multiplier, expected, product);

        // Case 3: Negative x Positive
        multiplicand = -9; multiplier = 6; #10;
        expected = multiplicand * multiplier;
        $display("NEGxPOS: %d x %d = %d (DUT=%d)", multiplicand, multiplier, expected, product);

        // Case 4: Negative x Negative
        multiplicand = -8; multiplier = -4; #10;
        expected = multiplicand * multiplier;
        $display("NEgxNEG: %d x %d = %d (DUT=%d)", multiplicand, multiplier, expected, product);

        // Case 5: Multiplication by zero
        multiplicand = 0; multiplier = 123; #10;
        expected = multiplicand * multiplier;
        $display("ZERO MULT: %d x %d = %d (DUT=%d)", multiplicand, multiplier, expected, product);

        multiplicand = -45; multiplier = 0; #10;
        expected = multiplicand * multiplier;
        $display("ZERO MULT: %d x %d = %d (DUT=%d)", multiplicand, multiplier, expected, product);

        // Case 6: Max and Min 8-bit numbers
        multiplicand = 127; multiplier = 127; #10;
        expected = multiplicand * multiplier;
        $display("MAX POS: %d x %d = %d (DUT=%d)", multiplicand, multiplier, expected, product);

        multiplicand = -128; multiplier = -128; #10;
        expected = multiplicand * multiplier;
        $display("MAX NEG: %d x %d = %d (DUT=%d)", multiplicand, multiplier, expected, product);

        $finish;
    end

endmodule