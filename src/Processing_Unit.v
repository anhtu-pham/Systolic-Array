module Processing_Unit #(
    parameter SIZE = 32,
    parameter ADDR_W = $clog2(SIZE),
    parameter DATA_W = 32,
    parameter MAC_W = 64
) (
    input clk,
    input rst,
    input [DATA_W-1:0] a_in, input [DATA_W-1:0] b_in,
    output [DATA_W-1:0] a_out, output [DATA_W-1:0] b_out
);
    wire [MAC_W-1:0] product;
    reg [MAC_W-1:0] sum_curr;
    wire [MAC_W-1:0] sum_next;

    assign product = a_in * b_in;
    assign sum_next = sum_curr + product;

    always @(posedge clk) begin
        if (rst) begin
            sum_curr <= 0;
        end else begin
            sum_curr <= sum_next;
        end
        a_out <= a_in;
        b_out <= b_in;
    end

endmodule