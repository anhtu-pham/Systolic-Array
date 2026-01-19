module Top #(
    parameter SIZE = 32,
    parameter ADDR_W = $clog2(SIZE),
    parameter DATA_W = 32
    ) (
    input wire clk, input wire rst,
    input wire [ADDR_W-1:0] addrA, input wire enA, input wire [DATA_W-1:0] dataA,
    input wire [ADDR_W-1:0] addrB, input wire enB, input wire [DATA_W-1:0] dataB,
    input wire [ADDR_W-1:0] addrI, input wire enI, input wire [DATA_W-1:0] dataI,
    input wire [ADDR_W-1:0] addrO, output wire [DATA_W-1:0] dataO,
    input wire ap_start,
    output wire ap_done
);

endmodule