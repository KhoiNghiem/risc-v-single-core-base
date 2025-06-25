module immediate_gen (
    input [31:0] instruction,
    output reg [31:0] ImmExt
);

wire [6:0] opCode;

assign opCode = instruction[6:0];

always @(*) begin
    begin
        case (opCode)
            7'b0000011 : ImmExt <= {{20{instruction[31]}}, instruction[31:20]};
            7'b0010011 : ImmExt <= {{20{instruction[31]}}, instruction[31:20]};
            7'b0100011 : ImmExt <= {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
            7'b1100011 : ImmExt <= {{19{instruction[31]}}, instruction[31], instruction[30:25], instruction[11:7], 1'b0};
            default: ImmExt <= 32'b00;
        endcase
    end
end
    
endmodule