`timescale 1ns/1ps

module tb_bcd_to_excess3;

    // Inputs
    reg [3:0] bcd;

    // Outputs
    wire [3:0] excess3;

    // Instantiate DUT
    bcd_to_excess3 uut (
        .bcd(bcd),
        .excess3(excess3)
    );

    integer i;

    initial begin
        $dumpfile("bcd_to_excess3.vcd");
        $dumpvars(0, tb_bcd_to_excess3);

        $display("BCD  | Excess-3 | Comment");
        $display("----------------------------");

        // Test all valid BCD inputs (0-9)
        for (i = 0; i <= 9; i = i + 1) begin
            bcd = i; #5;
            $display("%b    | %b      | BCD=%0d -> Excess-3=%b", bcd, excess3, bcd, excess3);
        end

        // Optional: test invalid BCD inputs (10-15)
        for (i = 10; i <= 15; i = i + 1) begin
            bcd = i; #5;
            $display("%b    | %b      | Invalid BCD=%0d, behavior undefined", bcd, excess3, bcd);
        end

        $finish;
    end

endmodule
