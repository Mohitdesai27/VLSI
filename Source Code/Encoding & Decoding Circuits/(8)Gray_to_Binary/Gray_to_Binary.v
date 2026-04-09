module Gray_to_Binary (
    input  wire [3:0] GRAY,  
    output wire [3:0] BIN     
);

    assign BIN[3] = GRAY[3];                       
    assign BIN[2] = GRAY[3] ^ GRAY[2];             
    assign BIN[1] = GRAY[3] ^ GRAY[2] ^ GRAY[1];   
    assign BIN[0] = GRAY[3] ^ GRAY[2] ^ GRAY[1] ^ GRAY[0]; 

endmodule
