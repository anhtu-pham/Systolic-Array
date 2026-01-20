`include "param.hv"

module Top (
    input wire clk, input wire rst,
    input wire [ADDR_W-1:0] addrA, input wire enA, input wire [DATA_W-1:0] dataA,
    input wire [ADDR_W-1:0] addrB, input wire enB, input wire [DATA_W-1:0] dataB,
    input wire [ADDR_W-1:0] addrI, input wire enI, input wire [DATA_W-1:0] dataI,
    input wire [ADDR_W-1:0] addrO, output wire [DATA_W-1:0] dataO,
    input wire ap_start,
    output wire ap_done
);
    wire [DATA_W-1:0] a_wires [(ARR_SIZE + 1) * ARR_SIZE];
    wire [DATA_W-1:0] b_wires [(ARR_SIZE + 1) * ARR_SIZE];
    wire [DATA_W-1:0] results [ARR_SIZE * ARR_SIZE];

    Controller control (
    );

    Memory DMem_A (
        .clk(clk),
        .rd_nwr(),
        .addr(),
        .data_in(), 
        .data_out()
    );

    Memory DMem_B (
        .clk(clk),
        .rd_nwr(),
        .addr(),
        .data_in(), 
        .data_out()
    );

    Memory IMem (
        .clk(clk),
        .rd_nwr(),
        .addr(),
        .data_in(), 
        .data_out()
    );

    genvar i;
    genvar j;
    generate 
        for (i = 0; i < ARR_SIZE; i++) begin
            for (j = 0; j < ARR_SIZE; j++) begin
                Processing_Unit P_U (
                    .clk(clk),
                    .rst(rst),
                    .load(load),
                    .a_in(a_wires[i * (ARR_SIZE + 1) + j]),
                    .b_in(b_wires[j * (ARR_SIZE + 1) + i]),
                    .a_out(a_wires[i * (ARR_SIZE + 1) + (j + 1)]),
                    .b_out(b_wires[j * (ARR_SIZE + 1) + (i + 1)]),
                    .result(results[i * ARR_SIZE + j])
                );
            end
        end
    endgenerate
    

endmodule