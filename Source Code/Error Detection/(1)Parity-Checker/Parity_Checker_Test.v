`timescale 1ns/1ps

module tb_parity_checker;

    // Parameters
    parameter WIDTH = 8;

    // Inputs
    reg [WIDTH-1:0] data;
    reg parity_bit;

    // Outputs
    wire error;

    // Instantiate DUT
    parity_checker #(WIDTH) uut (
        .data(data),
        .parity_bit(parity_bit),
        .error(error)
    );

    integer i;

    initial begin
        $dumpfile("parity_checker.vcd");
        $dumpvars(0, tb_parity_checker);

        $display("Data       | Parity | Error | Comment");
        $display("----------------------------------------");

        // Test representative set of data (0, 1, 2, 3, 127, 128, 255)
        for (i = 0; i <= 255; i = i + 51) begin
            data = i;


            parity_bit = ^data; #5;
            $display("%b | %b      | %b     | Correct parity, no error expected", data, parity_bit, error);


            parity_bit = ~(^data); #5;
            $display("%b | %b      | %b     | Incorrect parity, error expected", data, parity_bit, error);
        end

        $finish;
    end

endmodule
