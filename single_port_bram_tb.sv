`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2023 22:30:00
// Design Name: 
// Module Name: single_port_bram_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module single_port_bram_tb # 
(
    parameter RAM_WIDTH = 8,
    parameter RAM_DEPTH = 1024
);
    logic                         clk=0;
    logic                         wr_en;
    logic                         rd_en;
    logic [$clog2(RAM_DEPTH)-1:0] addr;
    logic [RAM_WIDTH-1:0]         din;
    logic [RAM_WIDTH-1:0]         dout;

    bram_single_port # 
    (
        .RAM_WIDTH  (RAM_WIDTH),
        .RAM_DEPTH  (RAM_DEPTH)
    )
    bram_single_port_inst 
    (
        .clk(clk),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    always #5 clk <= ~clk;

    initial begin
        #100;
        @(negedge clk);
        wr_en <= 1'b1;
        din <= 8'hAB;
        addr <= 0;
        @(negedge clk);
        din <= 8'hCD;
        addr <= 1;
        @(negedge clk);
        wr_en <= 1'b0;

        #50;

        @(negedge clk);
        addr <= 0;
        rd_en <= 1'b1;
        @(negedge clk);
        addr <= 1;
        @(negedge clk);
        rd_en <= 1'b0;
        #50;
        $stop;
    end
endmodule
