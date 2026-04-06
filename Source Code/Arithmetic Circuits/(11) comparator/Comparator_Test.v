`timescale 1ns/1ps

module tb_comparator;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;

    // Outputs
    wire A_gt_B;
    wire A_eq_B;
    wire A_lt_B;

    // Expected outputs
    reg exp_gt;
    reg exp_eq;
    reg exp_lt;

    integer i, j;

    comparator uut (
        .A(A),
        .B(B),
        .A_gt_B(A_gt_B),
        .A_eq_B(A_eq_B),
        .A_lt_B(A_lt_B)
    );

    initial begin
        $dumpfile("comparator.vcd");
        $dumpvars(0, tb_comparator);

        $display("A   B   | A>B A==B A<B | Expected | Status");
        $display("--------------------------------------------");

        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                A = i; 
                B = j; 
                #5; 

                exp_gt = (A > B);
                exp_eq = (A == B);
                exp_lt = (A < B);

                $write("%b %b | %b    %b     %b | %b %b %b | ", 
                        A, B, A_gt_B, A_eq_B, A_lt_B, exp_gt, exp_eq, exp_lt);

                // Check correctness
                if ((A_gt_B === exp_gt) && (A_eq_B === exp_eq) && (A_lt_B === exp_lt))
                    $display("PASS");
                else
                    $display("FAIL  <-- ERROR");
            end
        end

        A = 4'b0000; B = 4'b0000; #5;
        $display("Edge Case: A=0 B=0 => A==B=%b, A>B=%b, A<B=%b", A_eq_B, A_gt_B, A_lt_B);

        A = 4'b1111; B = 4'b0000; #5;
        $display("Edge Case: A=15 B=0 => A>B=%b, A==B=%b, A<B=%b", A_gt_B, A_eq_B, A_lt_B);

        A = 4'b0000; B = 4'b1111; #5;
        $display("Edge Case: A=0 B=15 => A<B=%b, A==B=%b, A>B=%b", A_lt_B, A_eq_B, A_gt_B);

        $finish;
    end

endmodule
