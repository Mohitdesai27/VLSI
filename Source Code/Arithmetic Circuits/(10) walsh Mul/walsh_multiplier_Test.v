`timescale 1ns/1ps

module tb_walsh_multiplier;

    parameter WIDTH = 4;

    reg  [WIDTH-1:0] A;
    reg  [WIDTH-1:0] B;
    wire [2*WIDTH-1:0] Product;

    // Instantiate DUT
    walsh_multiplier #(.WIDTH(WIDTH)) uut (
        .A(A),
        .B(B),
        .Product(Product)
    );

    integer i, j;
    integer errors;

    initial begin
        errors = 0;

        // Loop through all combinations
        for (i = 0; i < (1 << WIDTH); i = i + 1) begin
            for (j = 0; j < (1 << WIDTH); j = j + 1) begin
                
                A = i;
                B = j;

                #1; // small delay for propagation

                // Check result
                if (Product !== (A * B)) begin
                    $display("ERROR: A=%0d B=%0d | Expected=%0d Got=%0d",
                              A, B, (A*B), Product);
                    errors = errors + 1;
                end
            end
        end

        // Final result
        if (errors == 0)
            $display("✅ ALL TEST CASES PASSED");
        else
            $display("❌ TOTAL ERRORS = %0d", errors);

        $finish;
    end

endmodule
