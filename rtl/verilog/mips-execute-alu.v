`include "mips-defines.v"

module MIPS_ALU (
    input clk,
    input pipeline_flush_i,
    
    // Control Inputs
    input r_type_i,
    input [`OPCODE_WIDTH - 1 : 0] opcode_i,
    input [`FUNCT_WIDTH - 1 : 0] funct_i,

    // Data Inputs
    input [`OPERAND_WIDTH - 1 : 0] alu_input1_i,
    input [`OPERAND_WIDTH - 1 : 0] alu_input2_i,
    input [`OPERAND_WIDTH - 1 : 0] pc_i,
    // Control Outputs
    output overflow_o,
    output zero_o,
    output negative_o,
    // Data Output
    output [`OPERAND_WIDTH - 1 : 0] alu_result_o,
);
    reg overflow;
    reg zero;
    reg negative;
    reg [`OPERAND_WIDTH - 1 : 0] alu_result;

    assign alu_result_o = alu_result;
    assign overflow_o = overflow;
    assign zero_o = zero;
    assign negative_o = negative;

    always @(posedge clk) begin
        if (r_type_i) begin
            case (funct_i)
                `FUNCT_ADD: begin
                    alu_result = alu_input1_i + alu_input2_i;
                    overflow = (~alu_result[`OPERAND_WIDTH - 1] & alu_input1_i[`OPERAND_WIDTH - 1] 
                    & alu_input2_i[`OPERAND_WIDTH - 1]) | (alu_result[`OPERAND_WIDTH - 1] 
                    & ~alu_input1_[`OPERAND_WIDTH - 1] & ~alu_input2_i[`OPERAND_WIDTH - 1]);
                end 
                `FUNCT_ADDU: begin
                    alu_result = alu_input1_i + alu_input2_i;
                end
                `FUNCT_SUB: begin
                    alu_result = alu_input1_i - alu_input2_i;
                    overflow = (~alu_result[`OPERAND_WIDTH - 1] & ~alu_input1_i[`OPERAND_WIDTH - 1] 
                    & alu_input2_i[`OPERAND_WIDTH - 1]) | (alu_result[`OPERAND_WIDTH - 1] 
                    & alu_input1_[`OPERAND_WIDTH - 1] & ~alu_input2_i[`OPERAND_WIDTH - 1]);
                end
                `FUNCT_SUBU: begin
                    alu_result = alu_input1_i - alu_input2_i;
                end
                `FUNCT_AND: begin // and
                    alu_result = alu_input1_i & alu_input2_i;
                end
                `FUNCT_NOR: begin // nor
                    alu_result = ~(alu_input1_i | alu_input2_i);
                end
                `FUNCT_OR: begin // or
                    alu_result = alu_input1_i | alu_input2_i;
                end
                `FUNCT_XOR: begin // xor
                    alu_result = alu_input1_i ^ alu_input2_i;
                end
                `FUNCT_SLL: begin // sll
                    alu_result = alu_input1_i << alu_input2_i[4:0];
                end
                `FUNCT_SLLV: begin // sllv
                    alu_result = alu_input1_i << alu_input2_i[4:0];
                end
                `FUNCT_SRL: begin // srl
                    alu_result = alu_input1_i >> alu_input2_i[4:0];
                end
                `FUNCT_SRLV: begin // srlv
                    alu_result = alu_input1_i >> alu_input2_i[4:0];
                end
                `FUNCT_SRA: begin // sra
                    alu_result = $signed(alu_input1_i) >>> alu_input2_i[4:0];
                end
                `FUNCT_SRAV: begin // srav
                    alu_result = $signed(alu_input1_i) >>> alu_input2_i[4:0];
                end
                `FUNCT_SLT: begin // slt
                    alu_result <= $signed(alu_input1_i) < $signed(alu_input2_i);
                    neg <= $signed(alu_input1_i) < $signed(alu_input2_i);
                end
                `FUNCT_JR: begin // jr
                    alu_result = alu_input1_i;
                end
            endcase
        end
        else begin
            case (opcode_i)
                `OP_ADDI: begin
                    alu_result = alu_input1_i + alu_input2_i;
                    overflow = (~alu_result[`OPERAND_WIDTH - 1] & alu_input1_i[`OPERAND_WIDTH - 1] 
                    & alu_input2_i[`OPERAND_WIDTH - 1]) | (alu_result[`OPERAND_WIDTH - 1] 
                    & ~alu_input1_[`OPERAND_WIDTH - 1] & ~alu_input2_i[`OPERAND_WIDTH - 1]);
                end
                `OP_ADDIU: begin
                    alu_result = alu_input1_i + alu_input2_i;
                end
                `OP_ANDI: begin
                    alu_result = alu_input1_i & alu_input2_i;
                end
                `OP_ORI: begin
                    alu_result = alu_input1_i | alu_input2_i;
                end
                `OP_XORI: begin
                    alu_result = alu_input1_i ^ alu_input2_i;
                end
                `OP_BEQ: begin
                    alu_result <= alu_input1_i == alu_input2_i;
                    zero <= alu_input1_i == alu_input2_i;
                end
                `OP_BNE: begin
                    alu_result <= alu_input1_i != alu_input2_i;
                    zero <= alu_input1_i == alu_input2_i;
                end
                `OP_LW: begin
                    alu_result = alu_input1_i + alu_input2_i;
                end
                `OP_SW: begin
                    alu_result = alu_input1_i + alu_input2_i;
                end
            endcase
        end
    end
endmodule