`timescale 1ns/1ps

module tb_param_mux;

    parameter WIDTH = 8;
    parameter N     = 4;

    // Inputs
    reg  [WIDTH-1:0] in [0:N-1];
    reg  [$clog2(N)-1:0] sel;

    // Output
    wire [WIDTH-1:0] out;

    // Expected
    reg  [WIDTH-1:0] expected;

    integer i, s;

    // Instantiate DUT
    param_mux #(
        .WIDTH(WIDTH),
        .N(N)
    ) uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Waveform
        $dumpfile("param_mux.vcd");
        $dumpvars(0, tb_param_mux);

        $display("SEL | OUT        | EXPECTED   | STATUS | COMMENT");
        $display("--------------------------------------------------");



        for (i = 0; i < N; i = i + 1) begin
            in[i] = (i+1) * 8'h11;  // e.g., 0x11, 0x22, 0x33, ...
        end

        // Sweep all select values
        for (s = 0; s < N; s = s + 1) begin
            sel = s;
            #5;

            expected = in[s];

            $display("%0d   | %h | %h | %s | Select input index %0d",
                     sel, out, expected,
                     (out === expected) ? "PASS" : "FAIL",
                     s);
        end


        $display("\n--- Randomized Input Tests ---");

        for (i = 0; i < 10; i = i + 1) begin
            // Randomize all inputs
            for (s = 0; s < N; s = s + 1) begin
                in[s] = $random;
            end

            // Try all select values for this configuration
            for (s = 0; s < N; s = s + 1) begin
                sel = s;
                #5;

                expected = in[s];

                if (out !== expected) begin
                    $display("FAIL: sel=%0d out=%h expected=%h", sel, out, expected);
                end else begin
                    $display("PASS: sel=%0d correctly selects input", sel);
                end
            end
        end


        for (i = 0; i < N; i = i + 1) in[i] = 0;
        sel = 2; #5;
        $display("ALL ZERO: out=%h (should be 0)", out);


        for (i = 0; i < N; i = i + 1) in[i] = {WIDTH{1'b1}};
        sel = 1; #5;
        $display("ALL ONES: out=%h (should be all 1s)", out);

        for (i = 0; i < N; i = i + 1) in[i] = (1 << i);
        for (s = 0; s < N; s = s + 1) begin
            sel = s; #5;
            $display("ONE-HOT: sel=%0d out=%h", sel, out);
        end

        $finish;
    end

endmodule
