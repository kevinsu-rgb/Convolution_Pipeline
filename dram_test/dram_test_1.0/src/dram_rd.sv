`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2025 02:45:02 PM
// Design Name: 
// Module Name: dram_rd
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


module dram_rd
    #(parameter ADDR_WIDTH = 15,
      SIZE_WIDTH = 17,
      OUTPUT_WIDTH = 16,
      DATA_IN_WIDTH = 16)
    (
    dram_clk             : in  std_logic;
    user_clk             : in  std_logic;
    dram_rst             : in  std_logic;
    user_rst             : in  std_logic;
    go                   : in  std_logic;
    rd_en                : in  std_logic;
    stall                : in  std_logic;
    start_addr           : in  std_logic_vector (ADDR_WIDTH-1 downto 0);
    size                 : in  std_logic_vector (SIZE_WIDTH-1 downto 0);
    valid                : out std_logic;
    data                 : out std_logic_vector (OUTPUT_WIDTH-1 downto 0);
    done                 : out std_logic;
    dram_ready           : in  std_logic;
    dram_rd_en           : out std_logic;
    dram_rd_addr         : out std_logic_vector (ADDR_WIDTH-1 downto 0);
    dram_rd_data         : in  std_logic_vector (DATA_IN_WIDTH-1 downto 0);
    dram_rd_valid        : in  std_logic
    );
endmodule
