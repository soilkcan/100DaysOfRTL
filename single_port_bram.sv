`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2023 22:29:43
// Design Name: 
// Module Name: single_port_bram
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


module single_port_bram #(
    parameter RAM_WIDTH = 8,
    parameter RAM_DEPTH = 1024
    )
    (
    input  logic                         clk,
    input  logic                         wr_en,
    input  logic                         rd_en,
    input  logic [$clog2(RAM_DEPTH)-1:0] addr,
    input  logic [RAM_WIDTH-1:0]         din,
    output logic [RAM_WIDTH-1:0]         dout
    );

    (* ram_style = "block" *)
    logic [RAM_WIDTH-1:0] ram [0:RAM_DEPTH-1] = '{default:0};

    always_ff @(posedge clk) begin
        if (wr_en) begin
            ram[addr] <= din;
        end
        else if (rd_en) begin
            dout <= ram[addr];
        end
    end
endmodule
