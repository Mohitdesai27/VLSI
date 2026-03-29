module bus_selector #(
    parameter BUS_WIDTH = 32,      
    parameter SLICE_WIDTH = 8      
)(
    input  wire [BUS_WIDTH-1:0] bus_in, 
    input  wire [$clog2(BUS_WIDTH/SLICE_WIDTH)-1:0] sel,  
    output wire [SLICE_WIDTH-1:0] bus_out
);

    assign bus_out = bus_in[sel*SLICE_WIDTH +: SLICE_WIDTH];

endmodule
