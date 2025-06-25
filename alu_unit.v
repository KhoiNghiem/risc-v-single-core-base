module alu_unit (
    input [31:0] A, B, 
    input [3:0] control_in, 
    output reg [31:0] ALU_result, 
    output reg zero
);

    always @(control_in or A or B) begin
        begin
            case (control_in)
                4'b0000 : begin
                    zero <= 0; 
                    ALU_result <= A & B;
                end

                4'b0001 : begin
                    zero <= 0; 
                    ALU_result <= A | B;
                end

                4'b0010 : begin
                    zero <= 0; 
                    ALU_result <= A + B;
                end

                4'b0110 : begin
                    if (A == B) begin
                        zero <= 1;
                    end else begin
                        zero <= 0;
                        ALU_result <= A - B;
                    end
                end

                default: ALU_result <= 32'b00;
            endcase
        end
    end
    
endmodule