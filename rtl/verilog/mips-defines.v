// Width
`define OPERAND_WIDTH 32
`define INSN_WIDTH 32
`define FUNCT_WIDTH 6
`define OPCODE_WIDTH 6
`define REG_WIDTH 5

// Ranges
`define OPCODE_RANGE 31:26
`define RS_RANGE 25:21
`define RT_RANGE 20:16
`define RD_RANGE 15:11
`define SA_RANGE 10:6
`define FUNCT_RANGE 5:0
`define IMM_RANGE 15:0
`define TARGET_RANGE 25:0

// Funct
`define FUNCT_ADD `FUNCT_WIDTH'h20
`define FUNCT_ADDU `FUNCT_WIDTH'h21
`define FUNCT_AND `FUNCT_WIDTH'h24
`define FUNCT_NOR `FUNCT_WIDTH'h27
`define FUNCT_OR `FUNCT_WIDTH'h25
`define FUNCT_XOR `FUNCT_WIDTH'h26
`define FUNCT_SUB `FUNCT_WIDTH'h22
`define FUNCT_SUBU `FUNCT_WIDTH'h23
`define FUNCT_SLL `FUNCT_WIDTH'h00
`define FUNCT_SLLV `FUNCT_WIDTH'h04
`define FUNCT_SRA `FUNCT_WIDTH'h03
`define FUNCT_SRAV `FUNCT_WIDTH'h07
`define FUNCT_SRL `FUNCT_WIDTH'h02
`define FUNCT_SRLV `FUNCT_WIDTH'h06
`define FUNCT_SLT `FUNCT_WIDTH'h2A
`define FUNCT_JR `FUNCT_WIDTH'h08

// Opcode
`define OP_ADDI `OPCODE_WIDTH'h08
`define OP_ADDIU `OPCODE_WIDTH'h09
`define OP_BEQ `OPCODE_WIDTH'h04
`define OP_BNE `OPCODE_WIDTH'h05
`define OP_ANDI `OPCODE_WIDTH'h0C
`define OP_ORI `OPCODE_WIDTH'h0D
`define OP_XORI `OPCODE_WIDTH'h0E
`define OP_LW `OPCODE_WIDTH'h23
`define OP_SW `OPCODE_WIDTH'h2B
`define OP_J `OPCODE_WIDTH'h02
`define OP_JAL `OPCODE_WIDTH'h03

// Special Registers
`define REG_ZERO `REG_WIDTH'd0
`define REG_GP `REG_WIDTH'd28
`define REG_SP `REG_WIDTH'd29
`define REG_FP `REG_WIDTH'd30
`define REG_RA `REG_WIDTH'd31