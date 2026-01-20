`include "param.hv"

module Processing_Unit (
    input wire clk,
    input wire rst,
    input wire load,
    input wire [DATA_W-1:0] a_in, input wire [DATA_W-1:0] b_in,
    output wire [DATA_W-1:0] a_out, output wire [DATA_W-1:0] b_out,
    output wire [DATA_W-1:0] result
);
    reg [DATA_W-1:0] a, b;
    wire [MAC_W-1:0] product;
    reg [MAC_W-1:0] sum;
    wire [MAC_W-1:0] sum_next;

    assign a_out = a;
    assign b_out = b;
    assign product = a_in * b_in;
    assign sum_next = sum + product;
    assign result = sum;

    always @(posedge clk) begin
        if (rst) begin
            sum <= 0;
            a <= 0;
            b <= 0;
        end else if (load) begin
            sum <= sum_next;
            a <= a_in;
            b <= b_in;
        end
    end

endmodule