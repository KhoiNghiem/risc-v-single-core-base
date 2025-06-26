module immediate_gen (
    input [31:0] instruction,
    output reg [31:0] ImmExt
);

wire [6:0] opCode;

assign opCode = instruction[6:0];

always @(*) begin
    case (opCode)
        7'b0000011, 7'b0010011: 
            ImmExt = {{20{instruction[31]}}, instruction[31:20]};  // I-type
        7'b0100011: 
            ImmExt = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]}; // S-type
        7'b1100011: 
            ImmExt = {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0}; // B-type
        default:                                            // Tăng dần bit immediate
            ImmExt = 32'b0;
    endcase
end
    
endmodule