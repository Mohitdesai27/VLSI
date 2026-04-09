`timescale 1ns/1ps

module tb_param_demux;

    parameter WIDTH = 8;
    parameter N     = 4;

    // Inputs
    reg [WIDTH-1:0] in;
    reg [$clog2(N)-1:0] sel;

    // Output
    wire [WIDTH-1:0] out [0:N-1];

    // Instantiate DUT
    param_demux #(
        .WIDTH(WIDTH),
        .N(N)
    ) uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    integer i;

    initial begin
        $dumpfile("param_demux.vcd");
        $dumpvars(0, tb_param_demux);

        $display("SEL | INPUT | OUTPUTS                       | COMMENT");
        $display("---------------------------------------------------------------");

        in = 8'hAA;  // Example input
        for (i = 0; i < N; i = i + 1) begin
            sel = i; #5;
            $write("%0d   | %h    | ", sel, in);
            // Display all outputs
            integer j;
            for (j = 0; j < N; j = j + 1) begin
                $write("%h ", out[j]);
            end
            $display("| Active output should be at index %0d", sel);
        end


        in = 0;
        for (i = 0; i < N; i = i + 1) begin
            sel = i; #5;
            $write("SEL=%0d IN=0x%h OUT=", sel, in);
            integer j;
            for (j = 0; j < N; j = j + 1) begin
                $write("%h ", out[j]);
            end
            $display("| All outputs should be zero except selected");
        end


        in = {WIDTH{1'b1}};
        for (i = 0; i < N; i = i + 1) begin
            sel = i; #5;
            $write("SEL=%0d IN=0x%h OUT=", sel, in);
            integer j;
            for (j = 0; j < N; j = j + 1) begin
                $write("%h ", out[j]);
            end
            $display("| Selected output should be all 1s, others 0");
        end


        $display("\n--- Randomized Tests ---");
        for (integer t = 0; t < 5; t = t + 1) begin
            in = $random;
            sel = $random % N; #5;
            $write("SEL=%0d IN=0x%h OUT=", sel, in);
            for (integer j = 0; j < N; j = j + 1) begin
                $write("%h ", out[j]);
            end
            $display("| Selected output at index %0d should match input", sel);
        end

        $finish;
    end

endmodule
