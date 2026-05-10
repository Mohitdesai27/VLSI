module tb_tlc;

    reg clk, rst;
    wire NS_R, NS_Y, NS_G;
    wire EW_R, EW_Y, EW_G;

    traffic_light_controller #(3) uut (
        .clk(clk),
        .rst(rst),
        .NS_R(NS_R),
        .NS_Y(NS_Y),
        .NS_G(NS_G),
        .EW_R(EW_R),
        .EW_Y(EW_Y),
        .EW_G(EW_G)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;

        #20 rst = 0;

        #300 $finish;
    end

endmodule
