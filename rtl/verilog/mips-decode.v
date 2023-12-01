`include "mips-defines.v"

module sign_extend (
    input [`IMM_RANGE] imm_i,
    output [`OPERAND_WIDTH - 1 : 0] se_imm_o
);
    assign se_imm_o = $signed(imm_i);
endmodule