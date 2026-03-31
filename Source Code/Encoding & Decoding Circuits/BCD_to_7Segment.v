module BCD_to_7Segment (
    input  wire [3:0] BCD,   
    output wire [6:0] SEG    
);

    wire A = BCD[3];
    wire B = BCD[2];
    wire C = BCD[1];
    wire D = BCD[0];

    assign SEG[6] = A | C | (B & D) | (~B & ~D);        
    assign SEG[5] = (~B & ~D) | (C & D) | (~C & D);     
    assign SEG[4] = B | D | ~C;                          
    assign SEG[3] = A | (~B & C) | (C & ~D) | (~B & ~D);
    assign SEG[2] = (~B & ~D) | (C & ~D);                
    assign SEG[1] = A | (B & ~C) | (B & ~D) | (~C & ~D);
    assign SEG[0] = A | (B & ~C) | (~B & C) | (C & ~D);

endmodule
