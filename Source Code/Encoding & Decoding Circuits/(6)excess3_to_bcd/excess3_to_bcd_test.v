`timescale 1ns/1ps

module tb_excess3_to_bcd;

    // Inputs
    reg [3:0] excess3;

    // Outputs
    wire [3:0] bcd;

    // Instantiate DUT
    excess3_to_bcd uut (
        .excess3(excess3),
        .bcd(bcd)
    );

    integer i;

    initial begin
        $dumpfile("excess3_to_bcd.vcd");
        $dumpvars(0, tb_excess3_to_bcd);

        $display("Excess-3 | BCD  | Comment");
        $display("----------------------------");

        // Test valid Excess-3 inputs (3-12)
        for (i = 3; i <= 12; i = i + 1) begin
            excess3 = i; #5;
            $display("%b       | %b   | Excess-3=%0d -> BCD=%b", excess3, bcd, excess3, bcd);
        end

        for (i = 0; i <= 2; i = i + 1) begin
            excess3 = i; #5;
            $display("%b       | %b   | Invalid input, undefined behavior", excess3, bcd);
        end
        for (i = 13; i <= 15; i = i + 1) begin
            excess3 = i; #5;
            $display("%b       | %b   | Invalid input, undefined behavior", excess3, bcd);
        end

        $finish;
    end

endmodule
