module bcd_to_excess3 (
    input  wire [3:0] bcd,
    output wire [3:0] excess3
);

    wire A = bcd[3];
    wire B = bcd[2];
    wire C = bcd[1];
    wire D = bcd[0];

    assign excess3[3] = A | (B & C) | (B & D);
    assign excess3[2] = (~B & C) | (~B & D) | (B & ~C & ~D);
    assign excess3[1] = ( C & D) | (~C & ~D);
    assign excess3[0] = ~D;

endmodule
