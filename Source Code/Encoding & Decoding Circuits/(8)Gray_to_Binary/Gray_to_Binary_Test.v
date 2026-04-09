`timescale 1ns/1ps

module tb_Gray_to_Binary;

    // Inputs
    reg [3:0] GRAY;

    // Outputs
    wire [3:0] BIN;

    // Instantiate the DUT
    Gray_to_Binary uut (
        .GRAY(GRAY),
        .BIN(BIN)
    );

    integer i;

    initial begin
        $dumpfile("Gray_to_Binary.vcd");
        $dumpvars(0, tb_Gray_to_Binary);

        $display("GRAY | BIN   | Comment");
        $display("------------------------");

        // Test all 4-bit Gray code inputs (0-15)
        for (i = 0; i <= 15; i = i + 1) begin
            GRAY = i; #5;
            $display("%b   | %b   | Gray=%b -> Binary=%b", GRAY, BIN, GRAY, BIN);
        end

        $finish;
    end

endmodule
