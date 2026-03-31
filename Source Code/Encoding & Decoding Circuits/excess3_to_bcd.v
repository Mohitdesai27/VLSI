module excess3_to_bcd (
    input  wire [3:0] excess3,
    output wire [3:0] bcd
);

    wire W = excess3[3];
    wire X = excess3[2];
    wire Y = excess3[1];
    wire Z = excess3[0];

    assign bcd[3] = W & X;
    assign bcd[2] = X ^ Y ^ Z;
    assign bcd[1] = Y ^ Z;
    assign bcd[0] = ~Z;

endmodule
