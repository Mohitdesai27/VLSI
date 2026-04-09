`timescale 1ns/1ps

module tb_ALU;

    parameter WIDTH = 4;

    reg  [WIDTH-1:0] A, B;
    reg  [5:0] func6;
    wire [WIDTH-1:0] Y;

    reg [WIDTH-1:0] expected;

    // Instantiate DUT
    ALU #(WIDTH) uut (
        .A(A),
        .B(B),
        .func6(func6),
        .Y(Y)
    );

    // Task for checking
    task check;
        input [WIDTH-1:0] exp;
        input [100*8:0] comment;
        begin
            expected = exp;
            #5;
            $display("A=%b B=%b func=%b | Y=%b | Exp=%b | %s | %s",
                     A, B, func6, Y, expected,
                     (Y===expected) ? "PASS" : "FAIL",
                     comment);
        end
    endtask

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, tb_ALU);

        $display("\n===== ALU TEST START =====\n");

        // =====================================
        // ADD (000000)
        // =====================================
        func6 = 6'b000000;

        A=4'd3; B=4'd2; check(A+B, "ADD normal case");
        A=4'd7; B=4'd1; check(A+B, "ADD second case");
        A=4'd15; B=4'd1; check(A+B, "ADD overflow edge");

        // =====================================
        // SUB (000001)
        // =====================================
        func6 = 6'b000001;

        A=4'd5; B=4'd2; check(A-B, "SUB normal case");
        A=4'd9; B=4'd3; check(A-B, "SUB second case");
        A=4'd2; B=4'd5; check(A-B, "SUB negative edge (wrap)");

        // =====================================
        // AND (000010)
        // =====================================
        func6 = 6'b000010;

        A=4'b1100; B=4'b1010; check(A&B, "AND case 1");
        A=4'b1111; B=4'b0001; check(A&B, "AND case 2");
        A=4'b0000; B=4'b1111; check(A&B, "AND edge (zero)");

        // =====================================
        // OR (000011)
        // =====================================
        func6 = 6'b000011;

        A=4'b1100; B=4'b0011; check(A|B, "OR case 1");
        A=4'b1000; B=4'b0001; check(A|B, "OR case 2");
        A=4'b0000; B=4'b0000; check(A|B, "OR edge (zero)");

        // =====================================
        // XOR (000100)
        // =====================================
        func6 = 6'b000100;

        A=4'b1100; B=4'b1010; check(A^B, "XOR case 1");
        A=4'b1111; B=4'b1111; check(A^B, "XOR case 2");
        A=4'b0000; B=4'b0000; check(A^B, "XOR edge (zero)");

        // =====================================
        // NOT (000101)
        // =====================================
        func6 = 6'b000101;

        A=4'b1010; B=0; check(~A, "NOT case 1");
        A=4'b0000; B=0; check(~A, "NOT case 2");
        A=4'b1111; B=0; check(~A, "NOT edge (all ones)");

        // =====================================
        // INC (000110)
        // =====================================
        func6 = 6'b000110;

        A=4'd3; B=0; check(A+1, "INC case 1");
        A=4'd8; B=0; check(A+1, "INC case 2");
        A=4'd15; B=0; check(A+1, "INC overflow edge");

        // =====================================
        // DEC (000111)
        // =====================================
        func6 = 6'b000111;

        A=4'd5; B=0; check(A-1, "DEC case 1");
        A=4'd1; B=0; check(A-1, "DEC case 2");
        A=4'd0; B=0; check(A-1, "DEC underflow edge");

        // =====================================
        // DEFAULT CASE
        // =====================================
        func6 = 6'b111111;
        A=4'd5; B=4'd3; check(0, "DEFAULT opcode → zero output");

        $display("\n===== ALU TEST END =====\n");

        $finish;
    end

endmodule
