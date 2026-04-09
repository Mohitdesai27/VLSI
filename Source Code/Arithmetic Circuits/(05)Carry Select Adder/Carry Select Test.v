`timescale 1ns/1ps

module tb_carry_select_adder_4bit;

    reg  [3:0] A, B;
    reg        Cin;
    wire [3:0] SUM;
    wire       Cout;

    // Instantiate the Carry Select Adder
    carry_select_adder_4bit CSA (
        .A(A),
        .B(B),
        .Cin(Cin),
        .SUM(SUM),
        .Cout(Cout)
    );

    integer i, j;

    initial begin
        $display("Time\t A\t B\t Cin\t SUM\t Cout");


        A = 4'b0000; B = 4'b0000; Cin = 1'b0;
        #10 $display("%0dns\t %b\t %b\t %b\t %b\t %b", $time, A, B, Cin, SUM, Cout);


        A = 4'b1111; B = 4'b1111; Cin = 1'b1;
        #10 $display("%0dns\t %b\t %b\t %b\t %b\t %b", $time, A, B, Cin, SUM, Cout);


        A = 4'b1010; B = 4'b0110; Cin = 1'b0;
        #10 $display("%0dns\t %b\t %b\t %b\t %b\t %b", $time, A, B, Cin, SUM, Cout);

        Cin = 1'b1;
        #10 $display("%0dns\t %b\t %b\t %b\t %b\t %b", $time, A, B, Cin, SUM, Cout);

        A = 4'b0101; B = 4'b1001; Cin = 1'b0;
        #10 $display("%0dns\t %b\t %b\t %b\t %b\t %b", $time, A, B, Cin, SUM, Cout);

        Cin = 1'b1;
        #10 $display("%0dns\t %b\t %b\t %b\t %b\t %b", $time, A, B, Cin, SUM, Cout);

        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                A = i; B = j; Cin = 1'b0;
                #1 $display("%0dns\t %b\t %b\t %b\t %b\t %b", $time, A, B, Cin, SUM, Cout);
                Cin = 1'b1;
                #1 $display("%0dns\t %b\t %b\t %b\t %b\t %b", $time, A, B, Cin, SUM, Cout);
            end
        end

        $stop;
    end

endmodule
