module data_memory (
    input clk,
    input rst_n,
    input memWrite,
    input memRead,
    input [31:0] read_Address,
    input [31:0] write_Data,
    output [31:0] memData_Out
);

    integer i;
    reg [31:0] D_memory [63:0];

    always @(posedge clk) begin
        D_memory[17] <= 32'd100;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < 64; i = i + 1) begin
                D_memory[i] <= 32'b00;
            end
        end else begin
            if (memWrite) begin
                D_memory[read_Address] <= write_Data;
            end
        end
    end
    
    assign memData_Out = (memRead) ? D_memory[read_Address] : 32'b00;

endmodule