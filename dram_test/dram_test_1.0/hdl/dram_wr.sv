`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2025 09:21:59 PM
// Design Name: 
// Module Name: dram_wr
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


module dram_wr
    #(parameter ADDR_WIDTH = 15,
        SIZE_WIDTH         = 17,
        OUTPUT_WIDTH       = 32,
        DATA_IN_WIDTH      = 16)
    (
        input logic                         dram_clk,
        input logic                         user_clk,
        input logic                         dram_rst,
        input logic                         user_rst,
        input logic                         go,
        input logic                         wr_en,
        input logic [ADDR_WIDTH-1:0]        start_addr,
        input logic [SIZE_WIDTH-1:0]        size,
        input logic [DATA_IN_WIDTH-1:0]     data,
        output logic                        done,
        output logic                        ready,
        input  logic                        dram_ready,      
        output logic                        dram_wr_en,
        output logic [ADDR_WIDTH-1:0]       dram_wr_addr,
        output logic [OUTPUT_WIDTH-1:0]     dram_wr_data,
        input logic                         dram_wr_pending
    );
endmodule
