module param_demux #(
    parameter WIDTH = 8,       
    parameter N = 4            
)(
    input  wire [WIDTH-1:0] in,          
    input  wire [$clog2(N)-1:0] sel,    
    output wire [WIDTH-1:0] out [0:N-1]  
);

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : demux_block
            assign out[i] = (sel == i) ? in : {WIDTH{1'b0}};
        end
    endgenerate

endmodule
