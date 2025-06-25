module program_counter (
    input clk,
    input rst_n,
    input [31:0] PC_in,
    output reg [31:0] PC_out
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        PC_out <= 32'h0000000;
    end else begin
        PC_out <= PC_in;
    end
end
    
endmodule