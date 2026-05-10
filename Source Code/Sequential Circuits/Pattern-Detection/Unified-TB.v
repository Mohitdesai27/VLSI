module tb_pattern_detector;

    reg clk;
    reg rst;
    reg x;

    wire z_overlap;
    wire z_nonoverlap;

    // Instantiate Overlapping FSM
    pattern_overlap U1 (
        .clk(clk),
        .rst(rst),
        .x(x),
        .z(z_overlap)
    );

    // Instantiate Non-Overlapping FSM
    pattern_nonoverlap U2 (
        .clk(clk),
        .rst(rst),
        .x(x),
        .z(z_nonoverlap)
    );

    // Clock Generation (10ns period)
    always #5 clk = ~clk;

    // Stimulus
    reg [7:0] data_stream;
    integer i;

    initial begin
        clk = 0;
        rst = 1;
        x = 0;

        data_stream = 8'b10110110;  // test input

        #10 rst = 0;

        // Apply input bit-by-bit
        for (i = 7; i >= 0; i = i - 1) begin
            x = data_stream[i];
            #10;
        end

        #20;

        $finish;
    end

    // Monitor Outputs
    initial begin
        $monitor("Time=%0t | x=%b | Overlap Z=%b | NonOverlap Z=%b",
                 $time, x, z_overlap, z_nonoverlap);
    end
endmodule
