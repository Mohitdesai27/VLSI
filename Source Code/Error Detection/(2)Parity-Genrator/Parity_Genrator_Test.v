`timescale 1ns/1ps

module tb_parity_generator;

    // Parameters
    parameter WIDTH = 8;

    // Inputs
    reg [WIDTH-1:0] data;

    // Outputs
    wire parity;

    // Instantiate DUT
    parity_generator #(WIDTH) uut (
        .data(data),
        .parity(parity)
    );

    integer i;

    initial begin
        $dumpfile("parity_generator.vcd");
        $dumpvars(0, tb_parity_generator);

        $display("Data       | Parity | Comment");
        $display("--------------------------------");

        for (i = 0; i <= 255; i = i + 51) begin
            data = i; #5;
            $display("%b | %b      | XOR parity of data=%b", data, parity, parity);
        end

        $finish;
    end

endmodule
