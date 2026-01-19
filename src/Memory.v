module Memory #(
    parameter SIZE = 32,
    parameter ADDR_W = $clog2(SIZE),
    parameter DATA_W = 32
) (
    input wire clk,
    input wire rd_nwr,
    input wire [ADDR_W-1:0] addr,
    input wire [DATA_W-1:0] data_in, 
    output wire [DATA_W-1:0] data_out,
);
    reg [DATA_W-1:0] mem [SIZE];
    reg [DATA_W-1:0] data;

    always @(posedge clk) begin
        if (rd_nwr) begin
            data <= mem[addr];
        end else begin
            mem[addr] <= data_in;
        end
    end

    assign data_out = data;
    
endmodule