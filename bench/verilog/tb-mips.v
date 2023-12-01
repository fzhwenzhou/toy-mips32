`timescale 1ns/1ps


module tb_mips;
    reg clk;
    reg rst_n;

    
    MIPS test_MIPS(
        .clk (clk)
    );

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD / 2) clk = ~clk;

    initial begin
        clk <= 0;
    end
endmodule