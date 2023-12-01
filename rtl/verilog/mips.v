`include "mips-defines.v"
module MIPS (
    input clk
);
    wire stall_f,
    wire stall_d,
    wire stall_e,
    

endmodule

module MIPS_register (
    input clk,
    // Control Input
    input [`REG_WIDTH:0] rs_i,
    input [`REG_WIDTH:0] rt_i,
    input [`REG_WIDTH:0] rd_i,
    input write_i,

    // Data Input
    input [`OPERAND_WIDTH:0] rd_data_i,
    output [`OPERAND_WIDTH:0] rs_data_o,
    output [`OPERAND_WIDTH:0] rt_data_o,
)
    reg [`OPERAND_WIDTH:0] register [31:0] ;

    assign rs_data_o = register[rs_i];
    assign rt_data_o = register[rd_i];

    initial begin
        register[`REG_ZERO] = 32'h0; // zero
        register[`REG_GP] = 32'h1fffffff; // gp
    end

    always @(posedge clk, rd_data_i) begin
        if (write_i && rd_i != `REG_ZERO) begin
            register[rd_i] <= rd_data_i;
        end
    end
endmodule

module instruction_memory (
    input clk,
    input [`OPERAND_WIDTH - 1 : 0] pc_i,
    output [`INSN_WIDTH - 1 : 0] insn_o
);
    reg [`OPERAND_WIDTH - 1 : 0] insn_mem [511 : 0];

endmodule


module data_memory (
    input clk,

);
    
endmodule