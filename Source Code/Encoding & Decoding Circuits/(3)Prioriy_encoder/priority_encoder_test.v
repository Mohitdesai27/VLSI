`timescale 1ns/1ps

module tb_priority_encoder_4to2;

    // Inputs
    reg [3:0] D;

    // Outputs
    wire [1:0] Y;

    // Instantiate DUT
    priority_encoder_4to2 uut (
        .D(D),
        .Y(Y)
    );

    integer i;

    initial begin
        $dumpfile("priority_encoder_4to2.vcd");
        $dumpvars(0, tb_priority_encoder_4to2);

        $display("D    | Y   | Comment");
        $display("----------------------------");

        // Test all 4-bit input combinations (0-15)
        for (i = 0; i <= 15; i = i + 1) begin
            D = i; #5;

            // Determine which input has priority
            if (D[3]) $display("%b | %b | D3 has priority", D, Y);
            else if (D[2]) $display("%b | %b | D2 has priority", D, Y);
            else if (D[1]) $display("%b | %b | D1 has priority", D, Y);
            else if (D[0]) $display("%b | %b | D0 has priority", D, Y);
            else $display("%b | %b | All inputs 0, default output", D, Y);
        end

        $finish;
    end

endmodule
