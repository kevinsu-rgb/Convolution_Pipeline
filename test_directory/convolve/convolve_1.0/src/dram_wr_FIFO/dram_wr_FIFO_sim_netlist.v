// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Sat Dec  6 17:54:02 2025
// Host        : Kevin_Laptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/kevin/K_Documents/EEL4720/final-project-final-project-group-40/dram_test/dram_test_1.0/src/dram_wr_FIFO/dram_wr_FIFO_sim_netlist.v
// Design      : dram_wr_FIFO
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dram_wr_FIFO,fifo_generator_v13_2_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_6,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module dram_wr_FIFO
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    wr_rst_busy,
    rd_rst_busy);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [15:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [15:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [6:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [5:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [6:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "7" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "16" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "32" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "127" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "126" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "6" *) 
  (* C_RD_DEPTH = "64" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "6" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "7" *) 
  (* C_WR_DEPTH = "128" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "7" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  dram_wr_FIFO_fifo_generator_v13_2_6 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[6:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[5:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[6:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "7" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module dram_wr_FIFO_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [6:0]src_in_bin;
  input dest_clk;
  output [6:0]dest_out_bin;

  wire [6:0]async_path;
  wire [5:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [6:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [6:0]\dest_graysync_ff[1] ;
  wire [6:0]dest_out_bin;
  wire [5:0]gray_enc;
  wire src_clk;
  wire [6:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(binval[1]),
        .O(binval[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(\dest_graysync_ff[1] [6]),
        .I4(\dest_graysync_ff[1] [4]),
        .I5(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[6]),
        .Q(async_path[6]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "6" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module dram_wr_FIFO_xpm_cdc_gray__parameterized1
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [5:0]src_in_bin;
  input dest_clk;
  output [5:0]dest_out_bin;

  wire [5:0]async_path;
  wire [4:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [5:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [5:0]\dest_graysync_ff[1] ;
  wire [5:0]dest_out_bin;
  wire [4:0]gray_enc;
  wire src_clk;
  wire [5:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [4]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .I5(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(\dest_graysync_ff[1] [4]),
        .I4(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[5]),
        .Q(async_path[5]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module dram_wr_FIFO_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module dram_wr_FIFO_xpm_cdc_single__2
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module dram_wr_FIFO_xpm_cdc_sync_rst
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module dram_wr_FIFO_xpm_cdc_sync_rst__2
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
lYvhEjj3nb5oH8uSNLeXMIy7nJYVR9CgwYrS2YsK1wH0yG7GgJF3h7LWVAsRpUASOB7rHmuPVhb5
Ot5CFu1eFeE97Zpvi2xwlrFd2yOm/xOs4mKX3gkTIBIJmAKj42AUYk/LR9j6mOwXFIQmoZqYXHak
Pq2yC2ljr0hY1gwTFtI=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Z+2GQWpqmewONlHVkL658DHQ1gOkrvPjxsrm0NDcBmt2DgE1WctRC0/WtmZNRR2P9xNPEc1AnD3g
x2bmQ9ClncBm4tJJUerktYV7SZWaAFXLpL0mImalEctnoiL1emAUpqT2xWqYmc7/Up4fedi3U63/
6fZpFkfLPe1f/3mRlu+DKs00gVRP+t6V+01C1oWFsyvdyS5tDx/D7YWjpI8AZn7PAxGanwdNWWSB
/kAFPcC2bUzb0T91+nSe2x7K7ugumFrWpHW6iiuiY86OlLeqrAD5SZsqHhPT9GqJmSzj5PdAcMm2
1N7wj661ojPTxlfvw7ydkwisxeQEZRQ1H8LwwA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
NWkv++1uc4OUvmLLmKamw2rSfdpVbwBET7oFkV2XGR6y3sZCnAwLR/UY8EXqGYSYtRzQMSec4n13
l7DB/8txjOrwXvZKfRBpPdz4pIT7HDh50CC1gJaraDaEr18dxcLyq6t0fo14o+JyrAxZm7/nDg78
7/uEhQnwCkDeOEnusng=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RPz1UvQF5/1bAGbmkE93ADh5aKEj2NdkJKJJhSjosDEbYcFH8ZSL5Ew53E1CBLn7KjAnpfOLAKVf
fX9beeVP5C5vU0n7ZMu9ISDuX947ttq4eCcbaV78UxB5l1Lj8hlouzML1BQecqW1z0mUCgW7CBoO
kvS93cLpph/VpfSwuTwO3q41V7Gxeshrw2U3zfZGHMUL2TI8fX+U+qCt5oG7UGDkIiE+SZRN8eQK
SY18ZEkuzeSrAbp1xn25WHjeUYF1dwHmcNf4wRKiww67b89Lqk9DBKAL9rsw0KWuua8qjESM8t3w
D+f6RYj2AciBO842MNa2LlXNkWM+oLq1CtukmQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QcQzkZp4Sch9TwvI82NYHoYu7Fu4A68g8HQ0GQQvhgP0VPOA5fVtIXlGeuCjshtvB9SbR/JdhJVW
H0AcjAKKgHxZK+en5z2azbfr9d1BbF03MjLpFIxdwUacvQfXpyvYKYFtjplThociLLWtOUmXj84s
4nP0l8PXdvTblIHap6SfZL6Dhv1jlcCTvUTUGoULVvQRU16E+vFCep9sJnLwhCCldBnB5vBZ5TCu
AXnNJpF2Gx4Y+BC9c7XyNRkVfKm11TUyI3pc5OcNWX+42CRvLbMSKG711f5VO+yZsWi9YEWqMTjN
RN18y3FwbJ9g/6K9ZswbGNgjRnn7l2PRbFrMKg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ic0gE1G8ZymuhdpWjbURYCva14oPCOYHWxeY1WbqEo4fRdhM6YimsmNp3RyJRpeG6TFY0iDQtGg1
f5g5G1LTD2KIG+dBZyfKNnTE/ZOWrLJOblPxV8gmBtOye+53NJXzi8+oEuZceCLJxPBg1t44/kD6
M9x687RC58J0HT1/+RsMdCvAGIhlkdNOkb4+dhOoGEPVtNJhV6u4ccNdcnLz1ZaIW6yGByR8UXna
8XH9yb/yWXZzxveULhlxfYe5edpqYlF99QdUnueTFFmCXxIYP4G0xwFM1S929iLWZUS13jbam+X4
5SLDsqw5epDM/DVK5Cv0VD4JajhRoM+fGT/I4Q==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
W34Gq4IReWdH4guFD03wBoHFTA+s1wgkA3uEFz/xWEihtgcet7BzSoGE0K8FQKLVs+D+mR8yPD8Z
vuUkN7L+imyxs7FeoUUpCBNbo0z5XahETBApULQzISBGdsC2f/p8wwDdoHY5E0UjcHOTr+Pah6x+
Kb/OiJAA3/B3geutymFuXHhdGJVoLS30F7CpbZpHTVoZZBU1TgUTFXAySsVWu7k+NMAoSxDKr4k3
10DyqW8wuvTaTG+NdumVzlwtmHHXVSiGk0//Q/9EJmzEzH0Pi9m/wmiONCYRmb0c/K5YHCIs7xNF
nWpl/fzOUJQequCzR636PCmQz3/wSjGRil3HDQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
iEsUxC8JQZnRxQOm+O4jwBmkm5PoeeMBxaBqVOvKpTXSyjvbLGMDYSb0fxpNvdSJbtZpFIPnAww+
aq3rl7doHEf1kjM2dC4rjvZWa0jWRoJIANcbomcPl6IeiRfAUGCGIDrNDxK+Y3GNvZf2de79ApcB
dTaCVwgrbloNzIJwiJkRY1og57CtPhYfZGFMkwwQ1yHtCyOiuh1DFTM1HOr7jtC54Rj43wY2EpJp
V8vuUqRPQXW8kinGG+26i34AsoOI/xAYSbvXdBHrgwQSzEVIApd8q+QxH+P/twlQ/rFGh9QkEtsf
01rrVJSI2TzVwOQBjP9yRmeHw8y91krSW2dGHHjOd+HVO8Mpbdh4nOvQiYQjNK1lqwInPGOH2bM6
kuUfNcfP9+0NlRUDVuuhbzPVr++hGny3Hvo5Aq7bQqtKrYhqiaLWIWoY6mFPGyfIoZrbVClEO/oY
G2CKj5JTQTRFxNUtusbqdXg+69YwdnuXoF9oFfaVJwpFYlKtWBm5LeRv

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YKagekiHOyMnMVPg7PmagWsOMo70GABOzboT0+MRxNHoWf+7KtPwFZmbZAZPMjbv2wgx5vSsG1VZ
GZlduGJPTey/Q2+Yx2fvgCJb2dlR/HDmPB+1X4vVosJEw5nD6m8yWJd0L+NZCG6gtRelGjAxjm68
yPC9qOiRc6jrOM91cmFC6Xi2jeY4t5FHi4zmBceasIzRWIBnat7p0fZ3CZaaY76+K02CE2jND22R
W0XlRGoYVtWNukn5s4Z4AkME8oKdQugjp9rNooVbn7sWp5td9RHT1ZxOWgINwiHb6D9MOnsOSGwz
2K1jXhGDdXe4TOnFPIn6VglS5Y05u1snfUxFlA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 91696)
`pragma protect data_block
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
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
oESHD2Q5NORrmTVTCApB+YFZJwjA1ezq7U6VZh96by+ofPCvSFp06AIoCLvB4BhPvxfob6kIkBpR
xVCOLM7HsDk7nO1JVWiYIJ6okoWTA8hAlPj3sdGuMwRlZNSBKn/c6F+CW5Jl37TEGotkhycSB3Bg
B/uu1THUZwIG87RPahE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RovEhaqHrFqzjckk+DIWG8LQeqg2Y/nACQDyXKKtSav7YHlgpKmgHZnsxwwNpqrqVRGyjTecSQ+e
6Mr/Pi9au3AgJVPL6VOgwNVE0yj2LpA4LPyWzxLN3+DiSDmsaCBNCBlVQi2MRKUabou8nLaXldbL
+7pv4pYhQdcyjDzuC2dx3HmzADqstdEiyXeU3ktJ29CDLDmGwDWdmsrl90s4YQSfBV2nj4/Vut3L
p/8dzphf1htPaNMujMxxgp3z4JzUEDJJokDL+gNutEEHiaWpI3URIA5v22vJu+NPD+eEraSioHfL
DPKAajZTwK5FHnonu4O2D0co8GWqWW5cUqZz9A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jBQ6Th9yy7jtKQD1h235YLT6qO6XiBaBKGJrV1Z8H9M9ePJ9R/fA8E1okt4LyBvoWjR7tmCbIg7A
0/vuKOogkLtDE/BtTlp4z1iurO8rQrAcdZy/e+7GATawyJxFY7kZhnXASu9zB8TiOBELSlapkpxe
WuAzXLde9FBMBkq4RSc=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
eucSNV2Zbm4zYc2tIGRlGmlVM8+WHY1NHe9drZdgDhGPOHz8PTqHapfnZ1kWuTLtPBLSMvcXNScn
UTvpULofBV6qD7WHLPg7UJcjpZVDL69lk88chgqrlc/RqaJXKNVv+Ubku53ZLU20uZK71bNymjSM
855RVWw5lvTHTCNC2MYIS94Fmrzuq8i0+tFh5qBKkHK2BC+fD7xVyyfuh4mZR2yr/hRs/emoI79E
IKoJnLiglVp6RXTsXFzZW4pIthbjWSuZlOQvoYkS2RMj8a0r9lyariphRQunoudc0bLO4Phk578c
40gusaaS/MI7idMT7k1Di96kvu5mHi23loRcZQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
E/syLaRG2Ss/xTTkuAkOKXzm53+rCptYO2DkVukWhvlLmEB2daHCPrXt4gKeuG+0hIGWedSwCiLJ
7KNtEAiTumJ/j+3p7s3oXN9ftCSRolXoACsCclEAmwYjVM0ubCXUx6JNFOGt0yDl2Jsd5+W10mSJ
bYEKvRKi7koXM/eYJqbhTrtsrHDwRJEY0JVUPh8EOkLLqaIKbnjb6ENEY6qZOamp5PaWsSS30gJM
N6fB8D1AmGKnFbfY+d5TexS55Z92aYcAHNX2XwHsKnm45az1vHeZ0rTEU/oONIaSZfikRni1iDBg
x2GOue6sLiwxTEHaVkTJsOVR4mx0VsfFxavwRg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dSHHpkQiOEzzKs4D71WVyDXLpkKuR9h9h3pBLtnCq2bXiwE/eQHmk5HeQb+qREg0Yv193OukqaQz
RZyuF5GQcqOpqFHMxO62HQ2pdjdpMT5CC7gHvmgiw9qBkJJrXpihIHER4X7OF2iNUfeqxJ8eiSz3
C0V20NlIwKG7Mxg8MVj++xmb32KMUqL7ptikkym20vVdhecVMNvpPoXp8uvaGT7991enWP9HGKUC
9kLY2DEYwRGE71UJJLGWo4n49R50ExFRj91xWnYfvp7uJsMNwnBp5l3GTZiMELX2RkRVSPOHr7l1
n2p5Vq7Uee2drny1IxZ/4c0hYY6y3QWSEqpESw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HUtfqZ9dh5oZTOAt9a0ebo+wQbzg3izFQ0kVqZN81S4cBjQEF53WUiVlTKBDVjvLNUby4Se9WZjj
j86TQzuGJxLPDTohmbytErsg5JrlXHbHGwR4zGNGTbBs12X7PkxtS8wVCp+7b1rX6pOGOPqm6FoG
g6rZY/bTzVfGYF2CAOhjJUqUOXEAKnZRehspRyiBI28/ZZPSAUD/abKprW8PWCxMx2zPWztZz4No
R96jgvHezNzB1Ta8W7uRBFTMp+XVSToxTp2jzSXJZ0V5xJl+gdVjAMmf6+te2vqrK2wDWdMxk3Sf
iyLI4d0s25vCybcY2fZWacq5iO9pSlSaOQWgCA==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
vYYu2Kvhv3RZi0pFbjRTQ/BBwfilCrGpkMls+Dz6HBGTZvSaC/anWgymoDS0XnoSENGG3Pz3EBF0
19OqLbyna95IHFe2bA7f8RgU9SEUffZ8eXGigfOjAWpZCN07Q77RkhGUKal7okWe3Q6xHtZy83l2
kW8ma3kOYL7GzQjtpbP3lINHLMqpGEo0dzbOHiJ5r6W5U6DsILGsoLQOXcw+MwrevvNRB0KkSklj
QnL8K2AK8PIsJGM6F8dj5KwRYhSBYNb1opuVpiJWlbHgADoeM+dhiRxBLmnaDE8PWs1ReY6uMzzH
SvvO6UEyxQtvS/Smm/uogr1eUFedUaBHPMEXnYlTAv/SKrh942GeknsqfrjGkZxWTN2NEnvpRUwT
fS0pyd/Err0s94b0srmcTYyxZfJGRUct2T8MCphZFaScAlhn655pxW9RaHMfcvDJUHpW8Qa+KhRt
9CWYScPIH6YNDByLQbhKL5BTpAYMNYPF2W7vM2ZzDob2NB7m6GGeKRr3

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QSNmIeTT4pBji+CTjknWXN6sH9Wff8+t8KF+AC3fIoIw08jtLtShcB9ZGeEKG02RGCO4lNIUf5YB
2TVYk6EJ5XyCav12qDhc60n56UVrnpfo7drorY0NmOypuxECgO43h6SDWp9W7px3r4CJnQ4+X2Mj
943GdP30WfL5kbWHZJC1Dz9cBIqRa1EbNXvvAqBvRPS2+aXBXAPOC4rNVZGeIUspn/33IW3yJLSp
Jm5GIct87ZuSoz8+DXhUvsTj4hq8lgirVhfz1qhHm8SfODcE91FGUPw3vbpGWXsBX73t2zxFC1Hz
/6m4YqQJVxd+H5iGE4kbHxHyHnH7FIerqc8Phw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UhfxKxECbuHK/o9ZExa2zP/MIPmFXuDNZwgpiawuBmPeRI1nJsYB7vzbBGMPKny4yIHLT8mHrQRc
fs05atkjIAbLea4+WNoCdCeg7/0PzuodM1ol3it6BHQ6Yzq4mnZbzlk8Xtwmk8ACAbzOr2SYxYWX
ueuUlimUSRusIe4+NiPvzbfHMAOVPjdmSY7zaSyeJuhdAR+fUGeHy5B23Xe2X6cDPeJ75IqcBeul
ox3dTXi3L8r/s1bTKX3FhxRyPZuh/xCWuEajsF2fEYdwWHKtLX6IQniLBJ5ZnVSS8D7IYPsvV4t0
9rWJqto5O1n3rAM44OvKvc9pOYXJupuv7g3gWg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fmo66vhS7nigYtLDMjdj7hgUnDG/fnO+cIaY/3qHrcwT7u/paj5enLuWHovegu9O9WRq3pPNnjuN
6vZRpuCgz5p4VAV7dVg9fuzg99BAjThp1Q/+HIPfdQ2LM14ZpTh4FXxthHGkTyS5PJArvZ3/UMpW
zwfdYd5+k2/emJ4/nuqoJHQG8k+O5EjSprLTvNZ/wrE1cT/fW/Lu2pxI4msHqVVYAXz7sJ13cQ+C
7tKxCV8vTyf0rpStdE+kZXg+jrc7vFKuPJO0U9axMsC0nXyeYx2jzfAHptGWKvfQaPg/Eo9mgLyN
qSJfFS6aIycuxNmg7L82WK401aWhnUn7GNrudg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 25248)
`pragma protect data_block
OrAgeHHf/9DNFQOuEnAvjsBqgCmjutb9h1NnZg/MXjBvy1OA73Deths9flk4axIugeHRbXUO8L7X
c/MFSEQ70ldrXwYBKqZZrDd/ZbWQCC7EfkYFUH+TdRJfZd8READ1UcxpzhqDM2Ri4pFHpyfvIxFB
kzto06xEwFwblHJQyxZa8cOuE756rzkuwb1tjMYeCtU4t8ScFIlhcUZxqo5f/FMhTZUAfJFqIe/U
AhxZXYt0nbxNHC0IkWwdEpHP8S+AHyfm2Sc/t/DOcw5kd3KnnXDJ4t2TQiWzAeKnrbSY6idyUB/j
2faaLzV0n7wO7QYu1IaqpVYgWVxXVDAGJPQCja8p9NzaK1tKsgSlhRT3Hh16QHQp+hOwvtbL9KMt
rhc2m+OePMi+IKHFa9PlZrnwAuJrtFU0r8gdS1SToqNlwlhSCeFZcW9D7JOg748k+UXB3B9a6R4S
wU+A3Mc1yLj9uELizVJHtpLmqEp3B7Ex+DGAzTh1POGy5clLstSUUZMxtIZ9kbp32r3QbkXRVggW
aQLo8quYasG8+woDREpbAl+WeeFiFeziZda/cVX83i6L/fxltgLItUY8hTEnvQDzyu3N70sYp+Hj
IPn0TsBjFn9KqaeMsrQq7LHpLzPmn7VX7bhpX3bbv3ryI0FKNFfsxqzjvhfn/2vfQ3PjFIdr1HTr
52eJHTXUbzOB6F5VDeH8iOaTkbhPw+YQOcv4r5sqVOUuf272XL1B+8BvY+7czpbMdPMFaxy/Yd6D
XDhe3BZGCAqgnpFZYQPAa6F0cwM6clXteMqXIsUVGpIHDFjX4N68VocHE8XmkOpikMD3GAL6Y1PR
mv3Cis79sM/kZdYE7bizT5LHwz+BDQQxVIL4vV/Fn3P/2kN/42ND8X9M/w5ksq3hPSwn4nI/gHji
W15UXw+ER/8tANimLHKPJFhHHgF3SBuBPPBrOLFxRr6dcaoyJetXZzVR6mo094i7EIV19BeVfNn4
fijy6CjgNAPcRk9wlKizkSHk5GKFzu4hYz/7jCiff6XnK0cm1zumaHUGOpD1GlFBxtAhv2m+gq+I
Ae0ImMwvxlHgsVpHyJm+R33b3ay5KmWLkqmuluMs7dOQPdfmDME5O5eHvgUGOvX5asdA2bWz5RaC
tY/hSk6wxhOQYEkqDj0gGiWbyU7HIM1bSAXl7K5cCbh772Gsz6dWQiox9/3yrp7Ciw4LZ2YFI8Zr
kvDUDEdQzUK3b/TZqP8jxY+XIMAwW9NuOyPyvg7NB6fjwbafpm7hJj6Nrc0YFKcskdqOBaneVbna
UOI8H2+tpWAKwLOWx6L0g2ieWb5RMt2pIt1rWb3pdcaViXloMxrGIQUNAbJYZ3EG27K5ZeK4L+J3
75Yk2YMIsr/FI7Z+frYS/Jz8sep2iEYYYrK1Wn6S3OlBT2biGJ2y4XXOpgs9iVZwar4fL6ZP2tHA
zn22LlMtyhDBjacp1LjcOkuJGs9gqHN5Pq194ge/oW1Vr283BmvRuuiArgPQZhA63QuAgw0bnnx8
Bi9Hi6SOs78112TT/8M84hD3FUx7E+LR/yWKBeBMHyLyHpuQA1b9RzuodXszK3XmrGr61UeV4X5f
uTzOAbXKjD/IDCUb+aTzEG9SnmC4RP2bUZDcBIMxYha69MfOaYr0xLQ/dsCCbUwI9TCZazTKmTtN
36DAM6rc1K9AwFM+2Mf+AgxfEYUQWt8eYVh/7iSD2VACNnEePCPL5sKLFqUiD9lVrI0Tp1WfXPB0
Qoqp+/KBHXZhUYveokx5uvRdqFZaXIWs9pp0kRCHWeH8FFTCbjZ/HkNqgXv9QNCqQSk5wLLPbhlF
8ZxLU42m94enJ/jE0weqDSvmLZw0oFVE44VJiN04/OEN6ww7oAFF7pJ/FayeYXTHrmiaBBjWodpY
GKKgnDAGb4cbhlKR+wfw1JQqo9qbBeIWMZShzvR4eRFKkK9wYQJ2W4U1X/obX2d3hOVecKLnAv6q
Ie/nDqRTx5dxvtru3Jf7Aa/aXFSl4rK1B4yojVKV1QpbzKt3mxVW6D2ML9/3kaE5j5H6BRcxsls7
7Jz0i2htXdrTcfXzwPEMz95SpjIrczsuDvh2pT8cC1RrxojPi0ZFGFAWDE3PLfVY26m/4ATN6vd1
dJEOp+AxqkjmBAmpbJZwtVEBVk7BuazNjFNsor7DiCPYzMYHsDmugDT4Km+bvGeU43Cha+v3RCk/
YXlYvl91woShIeggQnH4bXz7s83fEzi0MJyce4QSCWxZPjgUxlbJngDGQjLCBuElq9A/By+iiGCf
0Lz27dsACXyh/E8PfbRRli8irkeXL9hfl/Gv1TYpfYAjUPbTLPnxxfi87dOOHQQX3VdT+Vebu9AL
GlBWl6ZeGjl0ZvkgTgt2uS55RYwhtYRzRmAU2EJmv6BN6MzaLrMMXTBKADKtbTP127WzWEYHYwzu
rS/GtqEHRbwdA8wnFdygLPHQGOhEB9lXSjAziNwvvA8UPh2//3+CR0wHNqeoLRN2yGIAhv4ae7TH
GGpQDOm87iqFooctqiOI0avCPgvu4KvZ933op/OoQV3abITFgXXsNngy1pXYaystWuYx31FN5JYo
cDFZTu2lg5YhQAliJQIp0guuiHy4NnCanQaz+Kgg1RILMMNBlxvzbqgOekhx2mPSNH6DzjBAWMft
TTU4BT2WbChY+NJhZEmoUARdNOVfY9v//X2Bv/gRHBdgYLQpmM2FOwyuPVm8ub76ArIEGhzbovku
G0JSOBVYuuTjSOv6WaffaPDcCKOSLw87zrjeHz85eLdRIWE55b9Z0+zSkazftVWkAG5Hi3l4mzNw
RFj+pWldkNvk1Y656LLDRp83uFqvPfJTuUbdlBS7krnxbQ/y4VFr05aCn1cxg5eVINU74eNGVSLt
QlVSVmVOxHU3p3U+vSwmZxDZ6lgBXH43Z93/DZ85vCxgb4pS5ninCaze5d1iJpmiZ7MSbcW8nlnn
S0lD36L9uWPRQNALVkanGme7Qex2zn50Z7wdtBW5OfO3/zt/AroaI5iMN62S3lkdRN35n9Xf0adf
M+irofCclTBMtO0Wpcr816BDoFtlNf+19ru4JX/GnsMKg3CT41KmmvoTDGi649R5af6yN13QjTvT
Mb6KceAfZ9Iyu9OTcgkaxAYiJ4gZHn+D5McyPfjCHuD/QTUTKh7/G95E4o44GYEidXGAPgfK6B3q
68MF9nWEkx7HdgvpElwBv5fPMeGTkk9FLhjBrKpy3rSJzLwMdQXcBI4lpy20oI+QS/SYOnOqaAmI
3RlPuye1CFRtZriWCSPdeokkh03qOD4jWjQzlf+NLt+XH7zJM8L5DZ25WXlipvlT4ffQq2fCls6b
XCoPBD9Jey/QJe2EofQCX27347TE3JhZN/ywwX4jKT0vwMCzaPUHY8OfA/sbANL+GACnFzWczcEa
qp9w/XbJRo+oWBL0vZj1AHHRL+GsDGmj66kYFn3A6LO5tNi+Zk/xqmv6KRnqQq97OV63szKyDphr
z3ybyPNLAdQYTFwrjGw9RQlMwUXx1uJk123mUP+QDYnFs+jlN1t/vowJH75FW4ZdDpl3PcEFFHdx
LYcEkeXU1OXm/rzIxJ9H1I1OJ9F6vvp40upW3JLTxmcaUNuM9Z0I+WIjRYXyKrXZ7kLCpr5WtpqZ
N2hir/C+/MRE6qDeRgu7ow1asgfBzcqBQCFn1ty24QtLVXF/YmgrChh34o5nwypOGrkPQe3r0LAP
48k6rDibsGMaWHI2xzwL4eSHW01iGxM94uE6G/xCCUrmjiDEjJ1S+9n4Oqc0U2yoQoE/zM9YZ/M6
X/jh0+N081zYNXJ3o9HKKxbP/c1ILhJWVr296UW/iiRqXPNFGwAF6jdypcrb2E6CMDaf2Sj9qh+S
0nVDYFQmSv/KdWOCM/UczNDsTmzZhSneuSKAFt8Zw4ntXKxgHkpBodIi5IrlDyglKsjqJ1L/u6fa
M0QmWf+de/g/l8EnOABJJkUeCj9wVoFjr5nbMpiLFxXNIVMsFsr/io3aiTcNuAEAjAYlfPgMVy2k
Lid3wcjvDEoJFC1asrZtqVZRul0qMNUHj+6DjnU07Z099+X/PMQHblMOAvEPaqyceYXdxpGplgWq
RFAtOejl6TNicY6qLPOnZdHqfcA+8RmmpHW/D4MVepoDmWfs1PekG6ck2Vc4xHaQz3bLk6ejpMWM
JPXcaPdbVSHKPF6y142wKayHFgScTOEsyOIvIOohWZC1k2gGOqbfz9OPE/Nar0aElMB04djhmQqq
RcHmGWCsYHEIttPhREklb7hdI68bdkH/9Xn1t8X7nyboHRL5K3OiYLFL/4FCcOz+igcmChzzkbwE
OIXX2qz4TYJtSh1dMhZRK4abZZxsix+6soBx2dd88cFQ8Mo+55gWFuM8AteDWO5eatydM1qRUM7D
b9Lt1WQCh0RqJ/KcGN678NOMYMczC/a3j0yPKaPBNcd0Q0A3qt1EOAP9W+Ux8c7hIFXwvPGP79Z3
shRyNTBF/vnUZ2JkAI52w3+3mVC3B85+86u/c6Y2EnkHRMas7B05teCK1bBbt+3oV1bfrpXBu0gm
IGFQg8rIyCRXLHmW60REcePBxoJHgf2Unf4GtdHNxSiT8D/P4qAUsPwsxf6r32QnwabVCBDgslBd
oFBM6DJLNBRtIsHWI6oQ/ihoN+ZftH52HhbZ8p6hW1TWvmhbe/SD5R5cCP34bQ742ZtxDRpIyiOF
4on/Kc1EiycctHQ3utbKDDCBtd91auqtbNT0liW+yRu+ftK15LUM27N6sh0Zy26fFsnPm5vztlFc
beHYACHNd6q8O0Fa3aNPmDVGKNo4oXMJihlvmcww4RyXvblKmH8KvCjdh2HPx7l5BgbeQXgswFgm
B7tjfvMu9OghnSMqq6nUUl4Z9P+FcvjuqXs+Aww8j9yag1Vej0+ntZrj+TSgDSmaVF8ynsc93+GX
KGLEXbQaz8BzTeIQeMg3bxnwmDP8iA+cD6l2Gi+nSiw49ji8vJtUxByookGACqddl+7+1KNQsZZF
DbjpmR+/GqetmKsVnF8Lg5TMUTO/GAMuI+bnKohXQ0cfyOb1HUQ60by1yhno7RfQ0IDS2/SvASER
Gm9943TQpezRBlQaVGq2rz6/5+oW0rAGrAv7RuKQylbFEZbGNCvGKkM8tno6QLF4bhIY1baUZVD8
C8Zbwsqr3S+XsrbmxiPm7VcKEa+LFfeybQzHjgace6W3YsO7nBD/xhDSEScGq9fk23dRRPZV8g/H
FmZ4cpB0HoOO7syWx6HEGw02S1VXFOcIRJbmfOYypcAs2/J6WeC19Ko2EhCr/4QpjpaEF/BbjGwK
MG/UKotkHqnwVSDqtyCr+fKHynQw9Xrk3mfPzBX0wtFterIiCxk6Qa3Lp6Fby7yW/E60elx7QZ27
zrBIBWH9XFT8DDM++r2Ydmtg3PONxwNmsc3yuwCaxdDcriWCr4yFJUh8jWRx9gHe1kcmkjuGcoOC
pmLPzmjl5XP1Hj937Od0v0wQ0bBgjo+lzmJiUWGAUt2hiQbHDBoTV29Gc5cXJlkl4ZePsGievScd
0JMnDqZN9FkCQfidjCyXxEKBS8PWwWcyZpuC5AZ0z+7aoiBZK79f2JwtiQaSY5SK4KKgi53WQs1o
Juz/YOnBZD2uEBqcoeRT5bRwH30ZsQ+EF2+5vCskkv/O2mJ/3hz7a7mfP/DTfZr3wznmQ16DraBo
WESEVBk1mmVXQ3DAWGaeMetWD5H3RTFxSSIxEdtKa9EEvhrA/OcpHv19ia7YHrnPAFLS/i1sclto
zzVEdg7FzVe+JIIqhY8IO17pUX0XS+OA6PXVA9dOo4DOZow254TD4ipnUz4qi0RwOGzIneSgjLd9
iyM6zYUdUgY6Wx/B7Gw5e2bqBtMifxZbZhO0eBLXB3AmRDxcjx1x7zk7NMoHikXuU43Z6rHhodMj
PT44MzocgIbrD+FeZgWNoNvdQU8I6LDVXScQuEBymaAL5x4WBRdVMIvgicU1Mhvr27PpSmu8PRIM
UK09OUuwXkvViIbFVOXI0QHs2PcVEXY8hkAb0eRHa0yn4t/wIXUopHH+DQVByiD7sUv2y9yxUR+8
B6Lbn/XXT+EyRaiiSIhtxwpjttz2mBS4aNq3nh4o8/0ZJsjq23UnD46ZcmU9CQJnjfqpnS6RceGD
WWtlqgwicjvIMgHPuUlMMMIB/xcVtSedI1yoeOREOU7SzY5oTNdfTVn3fKIM8DCVit92w73QLCk8
r+3DHyqBBC+vRtZbb7LEyNOmAIMoFw8BsXWqmRd/K2aUnemcYp+9S75uDYso8xPuPNy4EgSSDRGL
4C6eaAh/jlBLeNbaOEXqGynTYLBpe+ipbEXFeAcQrrE9tY/gmTstc7t8Fx64u7wonFub3BZ9hDpF
GqhUmvWFgyd6RE15b5pbQ5kAnZEcHVbCdmioof1be8jHYnsgve+j/lmvWvXw28u8Tt8fWX/enMMy
0ZaojawgE6zCQHW4A/O+HxIV7I9r1MktUggfYxbLCaDhhXw7jjTxnwmb4QdV+zKtJe/69PT7G4O8
5JewR19j5L7VDfD0W+r3Ck4xBl0WANlSKSpD1d5OaG49Eub94kL5U8qqZWD4dnayl4ssk9tq8e1P
Yux5fnWAqAkiB2HCmmpw/Az/ZbuoucttO83pzIXmSA+BLfsCwqnCiamrfD7AF2cqcV7CdP17oEov
Dha190ilTSkpGPiYzTQqmyV5pF/mbELcK2rcMas4/TkWda47z+bNtBeNc5XJiOmzYy9VL41r6AJ9
I9MATD/o3VeVBl09xOKoAcgc2LGu63SPKFXu9Z0+fB+4E4IiAuYbothKtzuIUaKU9vfwxPYE5AR4
15QA0kyDFhxasfGdBqQ5o7deIDPMLUfWXXmHQrOrDVgxmCjdPzSNNT2YV7ugU34XQN2SM7vTo9nc
+zQimf9VqpZKp4RardZ6/Py1JrAjmzPIJIkZHqBf7Djm8NvvV4RCcdsZM5BZfrgeMfWc7YSL9mQx
qCAkgcFFfCtM2LgPbLx5E3fs+KfcahCV11IufpnBjj3MvwOVQZdfsSrBYlB6NEKO3Nr7MuhprlP7
53J63JVZ1Ug+771J39yikQEwa9dabSLaCstebEP7DKBIvf9fhtIhyvmU09Q6yGlDF6YHw+kWmrj3
W0z8LnyTzbuUEMGONZjTxcKDkow32dS2UOExE+S3mVT07lHlvFZDJ76COxCAF5Sxz5Pm5aO7OzPf
tvumIgVpymebNSe/3p41e9jwkQsaLTxH8j6UHj9CVX+ywoE0Ap656vDvnz9cRuHMTrTKIyZZ4xqn
EIhOghQdv0XxX8Hdw9axqvEaupkxq/tqNWQD/iwI4nNAdoyL8uXLPV9dIFKRksuAC1fp3Z8a64N/
g6ukBDqO/9Db88H+kE9Nx9O3VD7VPI3nt0ilvUnXaWmQ5VA9/GVU/KHVE56HwXgkx6lH0HY4nU+D
Fw5yGL75yb+6E/a7ruT6eydYpRFPiiGBCwQHCKMDFfjpB06ZfvzxzQDM0TmwYPChSpZCfZIcyxjY
FcOS7hvkWKxq8JiYK1yR5D+CPWdhhkMQFyr14uy2ZxRofeHoRWqSCaZpe2Np8yM5UBU6CE7BFQzX
MveBOc7FHCNws8DSPLl7og4eog451hwYKyB1hcrx8jzvOgl0CzDyNgwJKCM3ZXcp8XAu7a7LZ4z5
ZlNFhVgLpZj9BXZ8c6r/3ae/0RLP74W2uyqyLxzICyqgIvJjHFD0p0FvXsc8hZmZholkufmy8ZAE
m15u41vAQaVki2V/izrj2Efy6fHN1BUulbJw0A9oWucBTI98cQskUQ5wKABcxWpWqGsLPz23oFrg
AXa99XpAkH11iCkUpH2W3I45oUBiRGCKvjU7kzfmal8Fq9AqCPqhvB29NddpcNRBHC9y3rsD1vk8
iBG6M+fSBco2mnStv/lglkowQCdeLhbjQJdwhY7wGOo7N1LR4cIY2GAO2C35myRvJIHh51dcE7ui
kgddPyMGi8S51pAz8U1MglHjQ2bMGHsa9FeCXLtWRQT5UifeqO4P/89bi2yeVHk4BklY2cS90107
81htCzD+VDlz00AHnd9th/bqJLujvJUvnDWBfbGQLgB3tTu3Qmrm+Z3fxPH2jpxUSh3/q1wst3J7
eHul0IadKvryrBYRa+N6vZ4eihrE0gbYl45p3PqXYkaE/LEvEQULfuFUiOfn6Xsm1GU6yUTWQazq
136IwFTWpDoAA2yyBv/C2YRAaWZIiu3ennt+pI9/ZYnnp2TCQtxWK+VG9hfC1bP7ScSyR3cHQSyP
Xs7VyLbJ+UyBUAlaumRHSqxm/4q9dPTIk4Zfdp8lmUZ7MGkJ4uW/jH6sDoGzyp2Vrqnh8U99440w
TZ5zXIdDMZDozzOmDGpsEKHcMpocsqFk46q7aC3gHd6JPWJ416s7ugAZPBmztF/lPUTX92cxE+so
OEXqG0Gk5EewZJYMu8+wxKEzkSR250HmIpQQbKSj3/XPE8TwJEqS+pvqCbEhMn14Nl2IqNHktvn6
qjAAKBpjOx7cv4Uy4Uw8MwzEF6F6jt/j0C3fRzhOm7b8/G92EETQBbd4nXOER27+WQ9Tadwp3vD0
i+KeY0/bTg7B0Pk/r54DNvireCNmKBh6fGfsWCbH+XHBUgTh43RRPhYDE0vspwvVuZg1rY5zc+2s
SZe0L5kj65eN7n+qbj3L8bm4eGHohmNVAgoWK3RV5XsDz/HpIhoj0w+CR7yokdvvnPRJcx2K779U
CguCDfk/MJplM05dIx7RLWDXVPk5oGhdelEb1gGTiuhuU2uBD4M+Z0FbjlGJ4Lz/5674QKhM+Og5
hQa1/2YTrddnljtPf2zh9cghs0Qk6lBaJYz02OnxctA7IzWW3Dc6MPGKsE/Hr0USfXrSxUPG6S5z
PyuAvJIMfvbYFTJZ7+pcn44Prb684fkIzevSH+EBNAChFxDVSK7XbFiQqzmpjJS+BavpknKxgbWe
dJBL0iTCg3OhQiaUBWoueoKPdtn9XQoXa4P1e1Ez0xHu8/ydFIJMvQs8j30XYXZeEzCbL1AJjSu0
m2WwZdv1zietSYHPB1gPjoNfUMAlH9/A66Rp1tpLHbOKttInbvdUdpIJxOLMQYmuiP/wCwXi8JyO
UJ55+GcxgGHgQIhYYW61ZocfmmmqgTmOWQnz0dexEzcjwUr+OzR4xnePfx2709ttJ81N5t2aS43N
0ojb/lcjrp9UxvP31hvVHuPQsDMWDBY6z6FDMf6FgHjUVTf4RDcbgbkrXvLG1XkWlQrVlPBNwAfU
pLx3TLGorwQldL9KVGMQEEsZVYUxPaWj/P5bvQa7D9TMqZ19glxGnoHU5NdhrK51tVCvIU2WAnjV
DwIEHG6tpkx+GXL6JdSHB8aNQRYSQAaW+FDzupcL+qhT7FqXfcjMZZdmrgzKjw+oKSfJ4+S+4+qk
c33zAPpZVDW10UHuBaTeeoCSvVNNTllRrCSVD5oWQBtBSWT3mrWseVpTgxvw4HRNMzuksDv0JTgx
J1IsVck8BubatYiVI/hvUBGSrIfYiHRHALzfyYUOqPUoD43FkHyvCK2TcRqxjhtjnEInUQga/lVt
muaxKw+snkincIgM5UtcV+TmtVMKZGH1RMfQuaObDHoZdSGxB8D/oORxTYn7HTfCTbO7HkEwvTNR
S2Z52rhoH4GYZPYb9642hz3M8r8V6iFBcnHUYze5M6HVPSRz07sws9rs3JiEMCqBhcMRVVHLh1DW
8rH+w3wpMjL/DUD3Mzy7EI3VTfaYWvifQurowTBc5ErZGoGKcf1cLbgzNqWj0opj0igL5SPY5jV7
sAcdxfmCc2NaC77phJw/XXsxBoSzH1+//WQowFYuAlD2lIo8/vf3aWX10q7aLU34AXt0eS2Rhpac
QwmHqrj0lxMPGBxlHGlRGjqLUYn57jxKqw79oNXKYSk5X4ZKm/BFR/1Z0lLSRhHrBeaxJhgyG8my
PYmSJUu/EG4HwHq/0ML3VDz1LSmO/sv3qcv/kZCf1Bf7OpmSYCxBBtpgYNAmJcn8FEeQQMceBoH7
kw4qXP1tRiiEf7rbZWtFrCNSatGJ4N6rAIanWnBRqFq1k+8hJN5X+AAMMn77QW1vrK0TCXHVuq27
hO8xnO4I/0HkENjmKjVBnhu0EObEZLBaetraG4jL4LbclibXVVG6Ws7jaFIdDz8G/hNgSQJ8YGem
6Vh2nuT9fNQFttEKjCBdn/KGOrq4VZfSpLb7RYx0kL+V05JPpv8SdRJkiprUvmM9XBM9nhtTjP2K
u1wVuXvAlVlax5zDhr4Y2VwTwLzfP2s+6jb00k85EA0WJ6amgoR5ZqBiWVaFtGgZ0TeIOgDdj1rf
g4Csamow1W9HKSviyJYlGLBRYVlCH0F4IQvKs6BdrnL4cwH0yduJ473NM+OFvfB0SbgOt8x7sp3T
bHLYyUfrwAhVViCPzFfFWiH7qdG/16gyTbj3pQAm/AZFKafQAAbhdhdPT17WZZLC5bdbYyJNtwtu
kdLUnmLsTBHLFugP/D4IBbH26CvdiHFkawuHh7nqDLz+gPA5L2KEvGWIRkpbuM9RHtTMwxYgqctt
de+NsQjd2Rpk+qPKhgVVAX4YQDvRm2nO0CmX30WAPo9Wg62kTqL6TMXXRGcOOW1AlyQIEeNgBBlH
RMoc0En3y9mszwmEB+vMpnDf0+1/OPfzU+Aso5Q99BYFsQHa+3RYCiEu+9wtInrro5PwIFqKCMKf
CE0YYtTg7ooZJHCRKrvZGcoaK2K7GRQvubJ9Q5jRbBT6mdbc5ge1vasI/5PpAJJ0AKF1iWpbXQVk
DpMz4fVAp3ZH/yC89CCO1JJanD0CB0YPtvxVLA1z0UxVBMaQeWW0xbxF4glvuX8x5ieCPVJJxf8M
t28akdTNe3kYXsH0ktOSi0xobZuyUYlgf8HknifLcHz6I6Ffih4Wyq+ceL0JLl/qyLU3ObwloWqm
6pNkd4EX114YOpUXB7TSn91oV7XQV1FeeoLH3EKH/zV7Sd/DiSTX2wquLbuZAOYbiDYHHYQNLlok
tNwv7bm1q21SHA2cozDbpH/M+kf7ztiGLrxjdhhNHiXoFnlag4yaP/mejxIO39k46z6Em8ExafvC
88Yy1X7eNddWBWKUX5rV38OxJXrZWA2X1OUiMbWj4ILpRcIwToCEsxuY3gA8/g2jwtyI2aZWJkjI
4DE7N2n6dlHwczThFeqqg/qCV4liB2Oxdp+yhDmp1o92HEW7kGpHcLu26s3Sbu0zNYKNq9Zjwbs8
E3pnq+uL5wjjiVVB+GVYy6MPAgd1qxizMx9mM4sifo39MfdvcHIEWNZ0Q5vAVx/PRU7Kf+kb+2k9
h8goKd5zwY8UJtx/QL5gMnbCXqYnPeHwi8tjhcDg02yEoYioHtTGWDpIkMyAgSgH0iLo12jtA39s
Tc+Bo/1NWi+2exkSayWs7xrmmX2SjLK/myCdphXFD+smWfvTvu8A0ekZX5TihDM/bt6U4q22pyef
rDh1IfXEm4EVXdReFdi27mWxP/9HE09hXpTZ7gz99pJMeSMw4zqmXavfYt9tttfz7QnZ7QXWE/pa
PSPCml8WqkvPr7k5M9Y1RXVUdepNiIdImtqMC8ZFDdi5g6qOs7I/GJ1wsIa4RfGh/A7oXvf579B1
g/i2Wok155Ago9F3FUyNhWT3mih8X20Lr4V+anCWkWo+2Mh8l/co1b/4vlqof5VvV+ehvZWsO/or
Cy8moUmTCVg3ZIUj/knrRBrlWyPxXy0YFgEexqVEXmiIk6kQQAu3aAycIQAgceEdQPMB2F6TU+Cw
WNxCGxr62XXDjOFM5h9GsWpiWGLO6Rbphn+0OTwswOjJjPeYjer9qsmSL/p+NARm6bX8e7TqnojU
KsQcvOCTtkKiI3PPRfdrVSlkQCrsbMQP/d92wxg0G6VHxfFdmG0zmcSeg1MfgepgIYzwX0CozKDS
etpERiSlx6HdTJePgDs6Dad0hr8h7hdW9hZicU44vX2sYVR7rmnnEnw1jm3iIRTxTe88fkWcVmf+
7Au2vZxu4uijJJM7FgRwklwP2iMS/rOLyqZcEa6CYFwOf04x97A4ODheLrL+cJonq7b98pUxSrpu
ShgsU2KftAELzcdiiq8ZwOD41PrHWmRJzK/Yl710//O18+QZSrRp6jcekR0CsGMKwvzCw+hsy5MH
Aph32x5j5tFaJDNAWQmpJS5fdpp72kDpFqbV+jY+Z0sgdef1iuueiCzSozCF4/IJt9tCBwb4lGzd
7GnbTbb3XEtz/fCWtAniVMDiWX+ZmJRVVR+h+mkkMAt/7RqZFu6ftPFsSXKgEqdwaBzmiw+/hQfO
j6wG8ZlAURLTZNoCNyiP+OP40SrkYQpiDkd/cFAAfXF+0OdDLB6mDhvlDepqXbbFsvoW7M2XyN4a
cgi67+BHnFhkFDNZq0IHFCfGy6VFnnuNyg7t43Xrdop9uiJUX8baGaBOQs2BT8PbsB8YDYZMiAb2
6Ojsm1pFIRKMr7dn8W7R8+pp+f04m8IzbMy73p46QwmiSS4PAsJ68yQc8C3bCUkxhr7Pnm2AKIL8
yx8tpjhJ9oDFYkveOZCx9oNuy2jzA0zfWMwfysGa88dUuVbIw87g2OiALQLh+JtRO5acg+Viph0k
IChjdjdx208PhbqjueNOP6Ob8bBD6/hgwQFwflEIC/B2DNk5GcaP6W/lFAgODEVW5JQOCQQdXn8l
BW1/swtTsgQ2vk7JCaI0fRhyAyCyuc/lqf6sEsv+gBxNUKGl3MfYmYC8TLhGb/wXLtXbdqsm1JAs
cA/iSMeuS71bPj4piLL4u28mH7iByKWsjg37Y33tU3Od7itC0Ednc0fNiWnkC9gTrcbCmPXnFVr4
8JKujW3qimP3XxDmEfTnrm/27KSkNjVunKVy0vNB7CouXNxlktJSfpNDPw5dU49gH7OdQMEUQ/yS
E28dneb+lauenyZzhS/MBZXo2MW0C7NUz/Ik5OcadQ0464Y5lm60l26QRlHUIRHEMnB9Host95x1
MrCVqEPIxIV89OcrP5/C8UkplchdRsjHPWzaTSLhZVXfC4b8PguuSQFY5zBNEpstYWp0GdRboB5x
ysA9Gu6JywYjUTSGalOF6g7kxMv/QotDhhHsslaqeOt9FL9A/SQeTP5M871TK+GlLWvk2T6EMVPg
X6IdMVEhHpFSrl0eVlz32kZOJFS1Hbm7bMncGS92oIeaex58XvqlVgaqgLJV7sGcvn2tx/nJQZ5i
8X3z8AAKrvLq6Jiql+SC9XS9ViEinyYY8wF732LfEwziW5DcldbmzFmWEYaSBatJnDrWl63L4/+h
C7/PfboXtt83vP1W43bmkNkhvgbUcVEx9sLbnD2JfYgpaDZC18TPG81zHb8DS2NFwsTwbpxP4myx
yLaq3Z/WddxTVIQA5XUBapgjFF0JeRLisJBc8Fm/sIe5Q6hH4/QPRKDveKiMH773m6jQVE3OEJvf
7HbKsIUeU0jGB92niVFGyPJ9xECI4J3dUmJ5UnvMuV+tE4JpEjm6Dflv76VMaRHMWBCYPHni3Cwk
xk/JiSR0y/1KwcV69fkk1DBLAUpKwXW3BlUDOepgBgoE2nwgB6ivNvtkH98eE67Zr32kD6MIkOXK
OUfYdtmFBla/fiV9hUcDMUXBGBRzMXQLqS9FuvHlMjaHsN/oVmMSr21YGl4rSOEV10O8RlCpuiFw
6iRJO5Fmjf7H7KjwriWoB6VSSVzlHR8vGS1vzMLmWtd5hKbIaKQbt2BVFnA+30392F2XJ61lOpe+
97Ij2UDv0JCorP0DNefQ1iXd74AfGHxG3BpOJriR5MNX4DvMSNZTFTyp3nVMAvHkiIklp3AbqmAs
KCUrha036FBb489SqzaO4BEiQd1i4asNVbg6CWsfGHOoI0SDwo6MMpWm6Ke9NTVbV11NU6RS8vqg
rMiGK726fc7k+e0W0eHkg9n9W/s77RJWS738Iu3b1Un3i7tRMDkhHKtRFgDeJ43t+6q4CHsXFDSX
ZdeYG9Iy28TsqeFyKp1XRjNPF3DPWDyvXTShAr3VYZiMzj99wyeT34HiOq8Gatbvo0FfNIXsSCca
WilcZFjPqkENVToJGFZVoAOGhEO84KiHurRjoD5BFXt7JKCtBLOD+5x3WCSlMMoxEkSfAYh0QpD4
rBim8Y+q0JwhiGrm40Olqzee+FyxTP/E087Q61jrRMxB1kJUnnG5S4UloQ7XsdD65yDrhD1XNFGX
//jM0Amo82Ch5/ME8gWumf1F9TnttwiuaObaNxhglrgPPisbTFZj8XI8JDQ/uXTUysYx3hvZmQl0
7gpUP1DsnjItLErlvwy/fhqA+PPDMk4hIYF9KmZeJCwjPDHXic82yjdpAEpcOGQqvUEQ0fMngupo
Mj4aSW+r0D2DOMcPSRd8evuJI8BuPbJO3uj21iwi4dxw1CPlfxGqpXhiiz3/gRHyUZGGq0cGp3f2
n4nm03m0u79QhJrdZFsnMiBsLEXqPDxPL0jol6K2h1VqAHjzt5sZK0jqJ7krqx/qFNzjzyUxBFDr
lFHw9do00O0X6XKZ+N92vtkd+juQWg94lpltnGooI5gp5DfNrtSy4UQc9Dm9xHxG+hhC0SfH1gGC
WkoQ+mEw60Vk7KPVb7mPM1YjrG5GMPz+SGcj0MVjv4mJDqzGJz9jStzZcilH3gQAABGiifjTU+K6
PQ/lVDGbJM5WGlhRjaQ604HZAyohd93yHIpRg1u2jwZeSj0+EMyVUjnfuWLDTv7NqlaIh7cI1z+x
L2Bnz23K1KfYeBJqm/RQMqsXmMKcXQic5QfXPcY95cVfxwiMP4asrj0N5rVTgncgBJlzTY3oGsPW
S7HwlCF97COh3VxbxAYBdm4f0EX1HHORF1cKYUNf4ogKklE6QCLhMgkXslrbD2otRONzEkpfYYkB
lwR9Rzed0UX8ysNj2qQAxpuIqLDrJh90eYAOVh+wnC0Yjpdnd59fI2w4hUqpaj9xsHlk6Wd1ZpjC
/MJzJgMBwjos2Rco3Wf/xxhmzysgFIona/dMiZ/kvYdhPjQu7ODwmozsjNVffGU3KJW+kU5/IRTI
uDNBheWMBpe8iLXrirX3eqZhoxwMIx2W0r9I8L17AUYfhFoPgeW+QtuUjUmOw7y5JjWMocuqT1iF
2AnD1AAP6XsHqDlhcvJKoeBAqcVDrhP/SM/1SKAbbTeK6dpalz934WpFaEN8FvyGI/Dy99Yn1zrs
T4g4R8vN6ZDJCw7feC6t4AsXPBqD2xcrkW2al0LtD+YpUrkuvzXB/bG7Ho1JtYQsEI4KzstN+4Lw
Yv3/7Cmzb0o0SmYMrMDdRsZ+9TakS+p02AV5vKfSn9EtTVyIVgfThUVmGxm1iBLmqLcKvFdfNM/I
m1bSPVTdXxgQ0XJl7GpyiMCWhL/xUL7dpYwyppTczDX9lkNQp/j2lOElFvQ1DfbKgcNpGp97VR0U
7pWDdiXE4V/3AjwthlqFdqos6lb9e5QBAWXWlyRNV0UwBlSiLWItlJ+kdjX0V5op8nxHbolLXSQR
LpGb/e8XYoOyE2QBxgfP2aFzTrW5KLV6LGqRyFimqBlEKQ1l1ClEwk3b96YUYHu67zMw7UlyKuU4
RfiFzo35iguwHhwZnOEpy34bFGI+qrSWuCV9OAogI9b98YC9yp3GFPbpnU2sceq5Ozwwfa6cAuTl
YFUgbbX5mRkUY/+mLy0H0qsa/bFzR7F+/2yR1+vGuhIVlZggTq4nAxZBizWyb5Wt45bPREDbaMe3
tThElIoX++IdtCnIC/OZw6srlFABqXYheMN7+UGwX2fuqCwwAGUQ1SUdCVASbYF8/IWi3+fthBDE
XXwKj4/WeJZOODg3Hval58TIdoud3Uq49LEzRK5XdUfBo7p9W9FykLyRASe9X/e40Xf+U4BeISU3
neE5pOxlszRHbFGRENnNn3TG5z6LD77jfIIM9Aq+piDaOiLLl0qfS2ua19QAdeAq+VKNnNX2CDrC
g2/FP4yIEuQcZuj4+Aes+zurEIDwSfYb7RTbJP3pdoJ0Zw3gqIl/wTnAWxRKofxr4w9ylrFRKojJ
IpLDP9Zlq7JnNRwWIBiq492Ty5vSMOX5CXaf+E8d+tMj6NuiwBb7Ehv1KYMwa5c8RlV+0HNaqxr4
SQKUdIMFZsG5c1A/qCXx1nP1IIe+bp/xxxjnid+0BWcXNYcEohIBiyc/+aPJKpvN8Lh7d41Vow7V
wu6g088mViGvx+6Y96wuiYBkKIoTVZ0XoiKia2hDbvd8VTAmxMb39vs32k2itvQJ2qpnzoXjscQj
HQv7yR5LwNXOc+Q6Oj3911YG/yY8dgzcj4PCEMMZMkSgOn7ei0wNQwKzXbv+ObZNA9Le1ePIKYjf
b5Mt+53V17TjVZ1btNsskO0YctA/GROLt5s4fSVSHzLOJu+Qr/VlwVLoBqxKr6T9vS2DrvF6dX/2
OdgouEsru3j0W96kRCLbW74wAt8izCbQ9wwewOxa8w0qrQko45QmQNy/lFV8iK0gkkz4klcsqMPQ
3nYZzjikOvP5czpIhhPLDdvEqvAkfoeoaT6+GbionlkNspPrbhNDc+xmFDUG8pYUoqNf0WNQ38rM
W4gGUoyepYeeE6HfcsFpxeXocWmGIbx1/tEKAs1cTsq0R0pdf61opczPpBJLbI99jB1zJaZQtUkD
iQAxHF0h7q7kJwHGJUpT0IgJFmiMUp/4A9qvztm+cO7GBxo2vtBk/hB8htUQOKEgItGl6hCA5+Hu
raceg5ykZaeuy+eqDAjmeuknttXwpzr7IhSSs7NJRGuBLR0EmuGEml6PtlR2w9LlbtQwJoNYsTNC
Mf8+o76K2cJ3fnAncDRacTSnn6QB8UMOcywtu0jlzGbIjoWQU0jpIOmuU3i47cwafx5CebaiIBx4
eXqZYLmjbqPfMd1HDb6dPLk2ssHPKDe9R40I3RaXkHCErGAv8XszObfnJJElksYPJzafGxcnBLei
TQn/JBtTm7FTeCv3EHiA/Xq33b7OW2ehYfgrWCRyzOH06jyvPkc0qaBynfT6kUeEePdzkhosWymj
/p1njJnoAO2F4rpPt4i7uUrXr6wBfzFsuuK3IChTw9Jirq3ycjqCnr0YIx3puMwXnA6PWJ4gyb3Q
UcbYjIJXL6QuxfMRVCGOecmC5EqHUJDH9A9fNOhm1+OQ7fexh9FZRuZSZbrXTbSX9VkpCxS+kXrk
xOTabruD/ydBbNl2yHzgsk6Opun7gkHYiSzN/Lc7CCvFWF6kDFbpeUyv+AMch/CTu+CYv6Z6n1sA
q0gdhCtAD15jl4kYQ4ydOHaeYNtIKyubPt59HcpQSXqyHvHvwL0kF3XJH4J1d6Q+tv15O4BDSsG7
I9eK6GQN91b6PMoOAmmZ02K20oLCC67g7k9p4C7Lq5yxBM/p78HYpBZPSfH6ODoRLBrVN1D95g2m
Lzg9OPsHV7e5z5kxqQdZ2FttOKL/2QZ4tOoSV2z1IErkMD8S386SWF3XaBqwo0cKVLE8S6XamisC
z1f1xEJ6jZXuJuK/mZckfMGBlX15el5P6DUBRRJQ3oz5HQC/HBMnPb96zb7/LvfljgYKrixoHZLK
flJrCJlAw7zSfztjKt+lp66lFCmqCjuddlAJHDth50YtvI5eJ+wgjrQHgEkHDGAJq8s7QM/UBIGY
r4o/LZC1Br6x/9h5wlQpUu+OhfGx9AKoHr2ykiHSzVi1Bu7V+YBPsRU4qIFyzaITK1DE4h4AIVb7
XkYmH/fBacrL/5fDLwgMXBLNj72J8y/LwrKSp8EZ5Sh+m/o/CBwp6G1atENiIv0ovMmUSgAmXsiw
Bg0puhOUGAf2E8NELhmduBxHFhUXUcNho0bWpzilxZ1HUbLfBTT4Q6IdKlaTk5RM4JWkePuCCyN5
wwo6MFKf0zBvjcFIftAclDdTR4W9nSUrZMi5FyoE7xDoXeRE+X6TvzsP/ufqfUSQTAQIdEa8Df/Z
NX9xNHzD10WvYqr4cpiYV5hQxWmSpl+GzYu76WtLXMr6l9rzKAkp3strc5Ig4cWYIxuJff0bcSbI
RqWhTPDcRKW7matcLW5buxSwlVDfr/N3mzOMUh2h0aJqfWTC6T1TXPumn6czccHkUVu9xL76glxs
eaPrLGYL2Y4SmHA2qebFq31KYfgHr2V4wTGs2KD9uIgg6onV8apUFRzo2N63g2fOI+eh8IannPWP
ebYoszD+FgEEwVteUIrEDuOyI2x78QHBvkFWT74cg0/bmA8oeVJW4NtGWB/o8meVhGqF+IW37p+h
DLSni+ZT5EdQwSSONzVgvKveXuMdDsFZ+McRTIiv6RmUWwsVUI43LB8NveTruQK+lGiOk91ToBvK
MHDFbsfWZ58uBXKU3/uQ0rteV3BHp/tw6NO5qzCfI2YfWLgNdGCOFq6BkZehbrFdhXZgj4D/0all
K0hA1/vAw09Hy5TSCpcuU/hQ7egvGhjR3Lw6xHPW51H2lbGveutuB+Pff8VLZHLh7eSU8Mw43MjW
mtazaSzmdEFfeShSH4b0lzvH0VMP5F/nZyHE+DOOMtxmLECSdDiqBYNfyDIYbizyAg0nalRJr69Z
rqraRZD+Eb1nygZj+NfSHX7VL2nkrjKCuNWGza5teyofmdE9/7/A/GaDsu2g/rFxWkCi2nMxPivP
SUhxO7TxDRuSYI0/SRgQTZlfzJPEnB66RYDEL6z0FzI2clBuv54+LT1Y9eJ5fnX2oLuRCz511yvh
Q6rXwbbMBPdcHrvp9IXIFlZmgbjBh/wbrgmcVjK+Y6pOk3zT61dhMvJKDbWHaZz2XTlaqQL9u0tu
VPjibUIzUvQ18a0wYpuJraUUfHeaUpVcbY8tl9Zfb3w5UXD+r+DSC9ljqwwoYkcfA55jYNMut8qc
oCEtitG3QvC17pn/Cj/w65F3dU0t0sY0Yt0kQBKP+nmCITfC7GbnlKEojp9aMt0m6e2ghvoUg47/
GNwyE8VfnwzEFZiRZ26HqPng6HonCNfyYxav4TvsF4C0XG4twyMypL5G/7RUI/b2KVr4k4Yd4Ili
AsDy/otJ3DR/Jjnadmfzc83cEMAiREuseataJh4OmBv3M8s5KPUMSwWPNeUL/Sjqg0zwUB6iQ5xr
r3jT97eagEbN2hKhJ5v/FI9gcdVf/iKjKpyujInvYKjXJ1IUAVs9bHZ40x6S6GSx5WYfgWl0t7KP
My+Q9kHzITCGpKe8Ha7Tw+CsVvqoZghNYbtr+kcUPxeV8r2elgOVO5XU8hq+guoB+hB7TpQWNlHy
OEvEIZDuS3M7sfY9GoGPribEOuB8Ltzmq2ze0JU8isyg5gvMI4EUcMDkYFYIOkUFIo8UP6DVnEfe
G6QNYnQVf2Dy7bsgJ8ggTNIc/9uiMCZ3+KkoyUF3B3rWXJ1bRvudNqqdV6gbGRxj3lPiLUzBmZAd
uoBzA2KyGfIZ4dGG0a9g4NtZTBNHA5YXYjJyk20TVvXhkzzUHOsEHQIb0vmAVR3/gz+4OlXLHs/2
DOL+HKfwrrfK3EVJ5R8NBOvKpY09mdt9/7o37t1Jt51WmCQwyUzYZXmL8CyKT7mRsqcrImk8hQLT
aZGdL3gNTm9lQlNidwrtA1v+ambtG0SwhENehezhHQ01Zbs5zoLZpXp47KJSyoQzmNX31h04hVdS
O/elBrXaUKsvjT8xRNhPqxv3+TjXPPxq17XaE2ZKauELstA3srq+UXm8bNyUaSlFs0KqbXAaZ5nv
drvYurDql4WTd9tLQE+xmDqmMIH6K65hg7+fFoKGjACQN8PaV782qkwqz2dflPbQ6oweXZggRMoC
xk4hnL3/iV9NxS//BwM03coVgqmeYByM8t4xX5DLciOksoynHVNtF6SvJ88Ym4ENhikTspTpZLMw
0UtJBqq+fdzCv1DPX0Yd92bcC1f7D2Rz2Um/zKcOLJVFPfssMPTJEWIOPptQbt1ed7aRh8f67MXK
9cfXhp9ORYHZqEdZKJw9BEJwle3Cbt/Y1CpwLE05HsLya/k/uphA/F6cilGYvei3wlg6qezhGtp+
qSJK1Ue3e+FKcAceCfSNs/ru8AFK/8apYMVoRoO47N8LErrl+QDnh1n7LNgnZpqgtnfZQa32h1+o
QVHgER88kKUKGSqPlGtTd77+7ZnFCWRnAWuBjr+LGaG6y5OVmRqtyi0/H5pliFeWJm9uAJj0XR45
ye8vwLLOKrQ78BoioIpLnnOu85ThejCz81uwwVYGDt9HDHNDjsETF0jVey5viXfOCuvuTIKXBs/2
L79cK1vYHs2/eB+As0Crv/1W98QRr15jBWHsnDb6l/UnO8+aDtvBn1k4Z/Amgr+MOHHDDlZEMI8/
ovR5Xu1ScvCt9767kAvcxhtfdMjj/tOWQrnsJEgHFe1/u8pgJRPON2r3ZJexzYM4BbJ5CkRsVH9Y
8r5qm4ACZY+t1vqAPheK0/EqYbg9HO7Lf3/7/CRNv4fIdJvHSbF8oD71TxBWfwtE9blKfTFDnvnt
HuHl7RaWnp0GhiLDNmlMwwGBvr88SYZBNU7ZnLRHAtZ6s9EaKueLYMZvXXEkgPYx561zjnSs8/am
jcT1Dpj/wNYGMzr+2llzMregbCuh82tGyJ11/z6YSa35knCQuBJzr7ZXYC0LNliWhV5FpTP+DsAX
Rfg7IZKSvU/WV2DLnb370ZyVNXHvvUwfEFLZofTSlj31uE1cMYkgJ2wDuz+sL0OWG7qNpUkkMFou
rEGpwBMRfErP1A42GUT+kXU9GKDzAglHJSEM9kkuPNDZ87bfCringyW7wvfkBR0Fwgt4HdUPl4mi
eOXktlibiIuWlY1jh0DLch1vP6UvgGMzpwnVIcDhOj5c6jvcLay9uEaNvg4lKWVSt+rUbcnJmRT1
Labt4/3jNZcdBqpLYTEfkbRQYWfLo33xMXNW+wZSbgUmReu+N77rgodo9AiJRs4iqchmujF1GEeE
B5B9/sU/cPb4iVXXSVCyu+D0+oxWhSZO/x6zexWhV+Inp4mlbzNBwHWoXDuRsX6awcDk3PnWVB80
pgtew/xJH4Cxy9nYRsGokpbf3a/rVRwo8NStFtrX0FWHvvv3+bOVRfJM4J69lDXYDxnJrZXVHVnf
DK61SzlY6p4SNozJjBBX/g0UGSZC66bYtoel+CJQnaTcPNJbUHE+zmxVEwcDPJL1KNVBmnQuZRvr
yrPbFCZiDpBtAYu1/fT9b9/WVcuTdgYVMkPiF6XaaPRUMv55VQIylZ6vs9Mm+Rqr32LBNRwLGsZh
BOpDMjwcQ6fZOKnE9nBz8+sL43I4/q16GmYR2j4hiO5Os5ZsWw8YR7mOdwm6JVqPEXe8GWlqHe0j
tiz6+rwPh5LGCP4Rm6yERg1LSAU/+f3zqvfma8lbjO+mHpDEx3cgXWMJ6KxlRosac24U9A6sJLNc
PYI0hLJxt59axftk+CBRTjqCKnEKqtJR0hWPL8Vn2aYTqwKncGXdpwQHXFKtm/u/ehqYe5mN+Ga4
KmUqWegpafilQrh7OSZMDpTF0V8rckIqIIfAOSpJsDnSw53O8Vfzlp+vwgrLJ8gmQUTWEAIWTUcU
NOuYeQ8xT2ydLNSFYs4m4w5y4y6u6xk/4s3UKdiI9M/2O3TO1PGbhHs91ownw5//hauHILqpkTq/
vql8SwN7uag89gf1c0sJm6UdpNZ24HJFbTdD7TmZ3ErmNqBhJqoUY32W9wUQm0U9z/hj+kr4peE6
G8RK6MhUwyr73sS5gIr5Z5vVkImZpLqMBCv4kZgTZ9ffWyu6mU7lTt1h6nkrUyE9iuBPyZu+onCi
hlMhfZv9fuYePiSYRVi9xEDDvGeoNoQGQvpB7Pb2d1wOJWb9Eq+QUQfC8Wgsw8erjPKBd7Yu71Ue
Up5BK0ZeNe6nSQX41m/8BKqzdiE7KcY2RxbEhV0uySDCLZSvHdJ22lo+Epbth9Lz1vFOd3Hb7mkN
Kq5N73UmbIiUKmaZMB3zj6k24995sd9p3htESqmN+o9jLjKwdmOpYHkEo+YMu0qDD0l3/aCZtDtz
ovSFmpXDkv4ZGpLLZ/jfZ9jC+r3ja7KazmwMvXvWwO4i3cZ9/VebdxCI7BRFPfMQTh6OkGMXLqHn
3XJrfRh26I8WJPfMyuHFvQjQZm9r50DQpAhM/EqTI7D+OF90fVSuklRSaa9cw1HNHQQRQqD34g1U
i3dZx2q9CiNJt81GwDK7qqvuerselbeIDV1dj1SOz8uUP2LBpAvPuGuGC28zUHY+19hg8VpUSwJ3
4k3smgVXEzSmBqIRg5B+jfVizHPaIEtuQFLYRJnXMpwyvgwst1rZtGwSmFkiAoTnD6z8/uEQWyE2
dAnFERpTt0INjPNad/jKqPu/vgAoIiOW182sbAxhn1lzaQ1nlW78Ss2gbONN9B1BaG9/QgaaSGnA
6rxHK5B60n+zoeEuh1D+DYE0Z0vd/eWkDe3d5EXne78G3b99fTeYsKlLUCEm3q8I5AKSzOlCEp+C
Ll7UbRqqIS9AJBiXavvZtCu+MA2VwB1XGvwnN4ZpERV9phdctGv3yfUaBUjQM/HBmwQGfsasQJb7
GgZULVkEhhC58Ao2nXKsY+ddqv7C0WIUACRzTDIdrJmER/CoPFwr/XYssh66VAlsL0Y13r3Faf+V
ZG87ZbRQrS+p8U9gSdN/S3jqpt+AxuNCheowPHdJ9Zx0zchpN3//TzHJFYI4QhS/0DEK9f/5op7p
LjxRpULfAx7Jcy9b7OHxP5aFaFzPdhjXJ2Uutzx1Nvijl2gDXRXy4S5DVK1ADmNeNBj9C9LWg1Zr
5MBpCZ5Vw5EhL1AhcSbp1t9Jljif53iMnPaLFNcv0eE16qynMzi0AfmL5w0MHfY3Rmd0YluPDWo1
irIWhP5XaEw3QkFhqsISv2F7gHK32B2oqSpV0UXDEt9hGOQ/1CI2rsl1/WC3m/pTG5iiLZCA2Hpw
ay7z0sMAwn2j3+CUtHqLqEM4vzRjZCNqWLCkI3j8tcev8xbxcB1P0rH5VKs6oSlJfxQ8nLJc4pLl
bzPOKBml2mR385+eO3CogUmXg5GMJCoBTwvTB0NbDG/aU+uQpsDz4APOYoSJuNVOQ3ENaeIsEaaE
4MzD6/4IQb/y5dNnTq8lK65CpNdsOn2aPFNm7rvWNlH0Hd71vdemG+KLkO1grrTx/JZfWrqbf8Wu
K2J3vgxH0TUn6RRwli7LzGQTTZL8w9qxBG9WExDTPdgZ7LSa7GZMXHjmVOXk6aenVeGDDb8V7AoE
j3/hAcIiyDqBQlZR09TpA+kRD/7Blcb2NHmaKXTZNAgojqoibfnVCBOluWSXVFI/XC04F9ax7XOs
bbcvg/VA51/j00/uQnQn9ujA6kd3Uf9pay/rXYc3ga+YPeyQxJDwDcrhBLli2nddxf+bRzqlKPA8
42L9F3NmQprUTQGcbhmxFRk8V+EaUmAnXakLAGdHUacCJtR+sswvs9ten/3lnV2gQmhnr+aKj9Bl
fOgZDwG9Apd9S8JpKeqJuJuYBWyvjt4QPBAKO93J0lc2rxfJbV0Z4grai18kuyx2rbFurI/8nNmt
ara2/+m4FEDhA0yuEy1i0nucln607FVkBUnMToUd0IUobJO6G9gwgLK6Q7uo5XRLlU7UwNwcAr6s
GsAke/mvsyYLAzS2O8Rn1ald7ak8dskXntS1k6D6BtcDj20Hk38ZBvPfELfGT4+KO1XqUvDtkZ8H
4fU0oYCXD/XvoZPSA2hfA2Iy34MoOZceOPuLmwHa8UXGGII9LJLZRXTa3bX6iHkbb8rSGW9sBa4x
GlSmxqzDhX8uuNEmpkxChigXyP1OGcVWO+2TvRwZfsSx90AgZPYCwEHXQ1sn+aZcMl8SzLLcMzn4
5660ok9xiS46ghyH1pAH46iEmsf6jcPJR1EayfFEElAo4iGDeP3CiGNJfaWhNoaQkrpeKjh1GnHG
N1QY9REXzdKWXpkrIwxdA2435S+pVGlyxZugcacdlGUHT1ENs0Nx5+FFF0hIjJghLk0vowp1jxqg
vpmGAwVHfbsXwkEcJVNm0z1FgzqGT3/Cw/QelxQHn7V9ayg/OdZFzJnW7earEmBN9DpbIhojfggs
+8dY5LP9bHn4H4KYGQQBRjW8n1x5QCUPhM/6gDqjpYVkhfs3PReoWHrILUpgEmwT8XXm8l9Lzi3x
0b6GpJiLbQBcTDDHnLUXNKjXmg3CZKdSTia0pdNfSFmU14nUPcrjcIFwVZQgbxAzQRqVnpCGKXT2
Hg2xuMWnk98Uc2udYFiHsyH3mLlxUz3pxlGIhkU8WrHKvIcYhcKr1SYUfKyvlfOSC43SpV547uty
pOgZjZv7isLaD0jHu40FHmmjcmn2Vb3qa26vqna65GNiyTEUd2q+iw6RzOoD6/gWsvGjsn9lgLrZ
3eic0XUBcKIPCIvBSN8N+lyMt0qsMJM60MBJ1hEMVx0/XddxM5/M8Q5nl+fg2br55BIpVHNjtlcy
yeW3s/fiJI/lKxUGmYOaS/Gm27AalMQaKgiRSLj1hULJdF6yYYZuJRN0NB8QG+35ztr5hqR6twPk
Sw5hKlVCDX9hMrbO/AnZ4t2jQxpcLhGed9qRwVUqFvLY0oCWvLr3p81ImywBMhOxtfXuA+Zt4bLz
wHFFlOGxNasm+Or+8E7JMPMUxXZcPwH13ULXVZ0bL+UhQf82Vqwcj8IeSM8Z+jOEspqiQQyeErG0
mlyYcLx50AqhUnMQ9w9g7K2EszUxZ4Q5aH8fWVfrGIE60yJQfpgwhlYfpEPNIKdRieh0h2bpfUxk
Xhz7Dj7XqGH1tqthuwvkQxdpA1bSGKBsy5LeHV2NWOBcwbKJuq2U0I9rLAc/QeSLxWKi42rKZaJP
kpra2QLlU5TYNfuwLeX49ikf5oXRM5SigZONtQFR/jol0CqyNB4rNerNSoJMTvZ8kcICtIuTxK9S
+dnayXhjHhwFEKHrgbLIqyaV+jE3FQfcuThweGOK2o2mvCQt2ofc/nEFn2HbBcVHv1XVpUylcP9f
iy6zx2/xDUFIQOFqfugJdYq2ivfZwmKUt+hP0BjgVhbz5KFFSRXViRlxUemCW6QMoqZv/7OPM+rG
QJNqxEYOMLK27ohJO0fP+o9PZ/gOiEFJcmtH/zri2gqM6gWnjCwkNMd9xgYDB0TeC79QyN3hbUTv
OoTi2kxpQ9lMxBbR99AXk971nh43IYAh9xpbcZDQ3lVja4jC/0RKetnaqG+YrD3WjwoFgoDHQ7D5
RxnUAR58W0icGPyhe6/uNalxESpKSYhA/4Zkth/JHpehIpVfnQs/b5xPp/y1IkGNT7ips+6uYsmN
5wP8ShD3dZRqbI1rZnzMRi8XzWM2t7EjJi8t7XLaJJA17iEL4ESUi+OcX7r2Fz8n+tkNQoIfShxe
+4wYGyvaa8buVdBOlX3PSbFkN855bwEtl1jsCVWc+YVSlFg86I220mGAkd9Vbg9M7BZtHpvVqjBD
srD1D3CgS8mUkxyo7x1fksu97LVfiK3NcjFeAvjlhPuzGqgS+oMbdRkc5a/QDJqe0j0CePcBIlAB
KcvSbD8NpnQJ30hvyKg2NPlFxz1wsDi9bO8WxKxzwpneX7lgutzi1sUog6rxUEVQHSY1RMMyt5/j
FWK3V/NW1J4eiF7Mvy74krrxocf1Aw6JIPQ9e5rnquiIGB9EPOJA4lKOUu6inLfWKNjof8Jl8eaf
TcUTjwx/NHYN/W4GFcygJ5RUqkG+9uFLAKE8SuT5A3olR96DZ8DB/PAZTsn9hdQKj+2aD756X1gd
zfwTjjGUHEAXUobjacMzcpOc38fgb42kGba4jFojuYggpPQGCarsm3I1BX9l0fm+HC1aQ0Cff1vF
fKwL/beeKHHMnslt5NeTPxgQNDV4PGHX8Yv9ZVP+OAjA/XgS3Cho9pvE6+NGHJovXPHrOtUSH/n5
vR+ihlonKebjs9PahND5cno5lh/Q7MfFf1BMvDu7gmysVTEdsHtPbSBTYU1rjv0pBttKR/cuskZY
IrZ8cg2EeVhmmfLYT4tTzw+gZpIbvuaBNvp/X6SHpyykYV/EZK2t67/x2tAEC8NtOw7BhSb3mYQi
kh2z+KlymXTCmonJ+PfjkHHTORB36UCHrhdwXYLuw4/E281x4xnC0OizBjjkyTgSxVa8XuJhjBt9
hmQMPnwO1ggLlZecMzxMmTyosSrl+M9WdXCyqPMGP6mtQMG/Ci8owCU0UcXZn7GA1wspUAwIQoSC
DojEcsMRTjfeZP+K1dQRAUKZDRsRwgxYUHLQeBtakDnoo2OeHEX+2LLiLXaKxFvkhuQ8I9KEO+tE
wuAHYjrufbElpCDmudYqAwFoWpHErmT5ztJJGQHk7Pdiu0mwXDbj/Gg403xU4o1ZBmUeTbvX9ACL
PnWOBsiAGvCb6TjnLx5vn1Ey0R1BkZneocVMgqjYHzUfvRt6WKh4mB6/4zry83cs/LNGX44/auKO
80/eozQGdX6WEC1WZb9+Y2D/tyeRy/1+bDPthl9V+jFxwubb6QjVF+CT12uJNd9zuHNekzCJg73U
c4P9dRyq3Ymk42vHeO5rCKuEK2SaJ0E48NnXocA+aNThgypTc5MosfGhzzn2UcYHRoDbpc+JG48J
SFgrvqgcqWFXWPWh6kceiuGpZLjvzHmm7ORmxxAArwYlJa6gGrTwfSElmIDslcxnE4xgm9VonfAU
wvYw+jUXLeEmIfZ27kF7kUGpHgT1tzs6Q/1roMLIwLhcIH8d+q6o1zpZ070c2iRiv9IUz46flIWr
H+1RKYwkV5SJDkbGO0Z3E/sj06HE5WtcxUhpGdZdMB61dxyp7aqqAXGDH+iU3ds3aD47VkzvVXhG
M/OAWBrxWKAspP++Lz86VngbTCo7mTGyszl7k+yLAfMOLyYFV2g9fzxHMLezPXlx2Flw+ikBmGJo
IGSvyD5WzIjLUjr5w4ucPbJ4TWqU6YaIOsGMRCoiR0dzPJzU0zQ6fbbNnEuwjcVuFxUPQP6O/2L+
Zyzct5Gt9i4Q1fLP+zBPxQ+LmAFWK+POjAQ/GE4KZG/PyJCq4FESCjWUKvDQUSsYiyFCLVamrmoo
7RfFicEoCtH96bKK8NfYUWSDZD7jvO76vRt1A21UEeVAxbKAFemsnvv0D1Prr4SxOnAUeUXG4YLY
iGAFKR4cQP4Lx86ctZPwK4SmOJHgXwe8Mv8oryEPo1/hfFi6TiC9SF9JQwcgawmMFXaI5OzzAbix
0VTnAFm65wGGpa8VZxO39ppjR2e8ycrgL3uNdt4KASlv+iqRnryR+v0r11uDPL2PaLwjE/AwZfg7
W/azCtNBKIU8ELiXUMVrWXJTy4+SOoljmZVT68YLSrNUW7MODbu4vZg+RV9oaRLrNESFpOB/Y9Qa
pq2eVAMgoWeIhLXkFAAW+tIIddWX4TNBUj2+f0X6Qx1vtwRPOQmhOcMeKDU7k8M/mt4+qsq/EPTl
Wn1InD9olVyvrnzwsFnjVHMgLOeuIc7hXzr+AVe0fP5E4b3nt1/ckd07TRaH9uq5B+T8IeWq3nF3
5tKjAFaxTN6aJVSBF4kXXPEKafVl0HrBAlqKEh/KgOUVDYgwUMpOKWkmOUeb5rN8JAsn3oEYPdYs
OxfQRw2HpU/VoCEVHlV70zTW983pLjF/ok2TI7CHk3gQsoiirKDMkqYfnzRO2eOiMj6W4tPC8Dky
69gLwdyE6B3L8Hr2JhiUkFCasr8pfmgEWBjjMJuXD6yxNtkOnsWgzUD8uwSr2QSv78KIrq1iMjyM
rDY5kPps4aTmhbaIECL4jetMEoG1xLEZ4nGzcoXAtsYQhyOh5leDbHiHzIYOYidd1ky3FwJsK8Hp
6HwoKB+ZPvNPLuEoB5r4JLoY9s+zLd0HR22reKCw4nZWdcAgVl7S5MbcPqQ8ONwKRZL9QJNsbvit
sPj6Bx8MKreuWxqTvjzfonrMiEG31f3w+n6nnhNDHOmDpyhjlW8BfovT32S7H7YeRHZMAiX3N/KJ
+7XQX7/D6amfmoOw//hSfBZcJdtd6elGMmZJBcMdy9k0ub4CfcPveqsb9nEtcauQG0Pr39GjEJIU
IG6MkZHAsVwpiwl4nbaLh5xFpg+HbGblc3COegjNTMUVnyyAVSO/IBaokXebQ+iz7Ol3guZx+ltR
R0miw4lnryXsfVo2pviPgwxduFiS/XHsJsHICpOFLktmet6g8VmgH1O/1ABD+qmuzT6mcu1o36f0
o2foTkzRnqMKQHOeynuWDDt46w5iLZDRwXf8FnJx/FM8+zVfF7aheA5QwdjEWQSTCs6gndaA5Qyw
7DTGcT19FusDFUH6sT58XDSbRkSnBpJrHKtFIfYCytMQTfe5hbF+mLuleG42KqsgvaCVQ+yt9/tp
ImHnKkCT7S8nEL3GmbnBG4vVQVL60dzsC/M3CMoBTy9+dEr7/ghCxMzBHqAoapbeEd2xfXgiMxJK
pZsKH/9U1b9kutwUVnsVikFLTk3jaGFGhxY95pSptMa7AkJ408Nh9mAtmN56+jcC8+TDDepSShCc
sjvbzFJZholl8Ka3IE8FQj1UUSJtTOcH9nt0p1c30tPlGNY/3hxzDmnpq7wm6uPMaUkyHFJAnvXq
XaD6qsydivADFQ7Ne3f9+8fGWeIlBrcgQSP3Ro1e9RnT64Jo2tuO8WKjmjWun2pKAUbO01/HK28V
GlVaso8S6a7JG9y6VyhjYbc+dQflX5YJfknPA0IMZVSSdjlfZQuAkgvB1EUS0Gmjos9BYOTBUvYB
wnfwn81SJsNVIEQcOAfXiRFAfSR1tzK6vUqTH5MKa7ENzmIDXT4BkVebOhfKTduuZd4t/gwvBShV
+7ANsKmyx8wzSAfbGt4M6KpJNvHh4UDgdhwUWve0qcnUpMgzHPBAw63zaZeDhtJ6Cj3buqU0Aa4A
/PMMCMGCImfk/2vksnWZg97GSN9+jN+uOrlOiOsOodc/f0vmEzFhK8q5Av588SZ5xbp29HPd/M9T
pfy4+LCxA2H5r3hMWk6qhy4SkIEH/K0yVCi4YtT2naFymDYI205w3+0y2yc7o/rjEhA/X5PVd/Lz
nZsfceITw0IHkhkOlb+yAFUfQ118oEhCEN+/qmr8723Y/ny/bJEZu83mxSGwfBZgbJ79mzTMiugH
VZh5ZKP85c132Zo1JyCRT3no3gxqfSeY1G+daKC0gnV+OKgUy29o5R57htTaAnA6CnbPHh8N49ug
SB4zdoxNsu38Ddu4WZ8i8DtSzFlnC6oRejmg8+67Knm8NpE0++nqNYlDZsBK51KMO4oDqfovtGDQ
wue+fQ7dXpwD1BvLTLQXcWHPp3a21skUsAq7h4q6YPOMzm7hvHh9HjAoOLodNHCENHV4jE4ThnKT
cpclzd/Srsw3As7LktcwdIsgFvC24ArnqK02jQujCZhJXzexA7xQvV0wkwKBCCHXBoHAzc9T4KOQ
MkVXP7p0f+D75wtC2Hjv972tlRXYp0f5k0IpDMfd8VYefNu53JuHim/qthJu/apDLEOp8Qemn2CG
B457BTPPfPzJIlkS1ZKsx69dByurxZqQr0evpticXczW4usG0WYKaeQaCBemfL+3XV2UcPxq+HRg
0x2aHPGEgCusJ6Is05qWGxOmD8FvNte9HIztA9wW5LHl4xDLFin0spSl0kPdNeBcISG+zLLZMts6
TRJiPpX9dwpysukk7mwxEDswln6ezIP7uaN0kRZauswUcs+wFtgJw2RXprJ4+zft6GnaGj28/m4d
Nh/iCCTBBZ+0tjfG/TMVDDWhW1AXQa3Bk9oL13GhSXJNaHvodXQAf1Gb5tpL1O/FeTt585x2b/w0
UzXYfuIv1uGkRMmDVyMUMOONb+119Rm9sgVWRMWcQFL/e/8w3woIPSibN/RGGLoEVkk34iIxTabM
bZCmqi3w8UopdNghdNrN0BZbb5v4lH13wub2+vTkcx54Kq+zITLJLF1hF13vsBWzdZOsOoe+/e3x
dF4RU8+nC+I+Fgsb2/JvV4ymHJloYs5XG03dANDtfoZeEWp57yFZusr0nPA+SwrThuq/gbxvyIa0
TUBZoCX/cTTDREs9t01J9VBBHEDSMQ2yzQrV/xjVLDANOpiRoWekHZQ0KIPoOY08mwgIcuFDA13N
TE7loS66jG6FJtPIMc5B5s9lbAWWy8O+QijXzcPcOlK960UchMykzWFaf2J+gn/Wf3RkQmcK4fZh
oH2Glr1YlIN6tTncKVDWKn5f6GbasM9dPE6AlGcrUBKNw/FB+SjCf6G1+zbkxnX1vNl1xxbU1W9g
Vqrz5PsqSYy8mWhrbQgj9AHx55TsryKjNn0jTAqEgKRKwg59tvdycgvfwIeYQQsDkkkBRK9VWRHx
bRQeVKpxt8/OrFflva9YBrUcLRJ4R42DzEHz2od5cyKWdr4YUB4P47Mi+CqqRQgw6lVwfJjjp+W8
7385kRjiUN3fC/Nwyazv3j/uM6OiaNV+nxhC+gZ6MuAS/xovq0S1Aspp/i+Mol4BcW52yajFnsqB
iAneJ3JICAnZjoXZ4G2ZsIPTHKClkVLYUWAU8RBKazdmLvaL0Zwn8fTbbehbl9IH12W2SNRKt7H7
mGi26MFntpJzssqd1THA+yhYSO9wplkglqGr27I5MQ9k7TdlmuBRaWbW5FBS4PI71096mTjwjcfb
TtvFNv2U9TUB9VONuo1eNdpYwm0bgD8KVLvcXMuSizF+WuyzT4vjmMxjiF+r0izBgGckjz/Bb73g
QeCJLUDfwY6LSlR6rkkdcmq52VabeOjoe+tQoJ1QR5ZRrDKGPJ1dz0L1pqV8PNHq+4m7aSlIwddF
MqN2YDLxJ5KcqOItn1mlYfmeVCFrh8T9l9CIuPGv6e0VT+LSyVlcVrnqPE4z+80LiTHYnxu1krOO
BOCe1FesytWWUjouSxkXjavISfKFPJk5y+54ieq/ZlmZeXafJ2dwM4tjqTnG2IqKETnWRkFwdpnZ
P9Vir7jnPZ9w00maxYGsY5r4tdLPPBFelxU8YMGfiIvfPAiqUrpzru3nFovx92qEivP5xBtmGLUY
jlJWZDh8pjviHptvD7D3TLehsw9T4plmWPrRO7DqzIhzeoDTDL4g/GsR4h8ld2zatMOHqAUkj+Jv
u/TIm487Rb8rBFHZ2+jBQ1Nntb1VYcXno9ipGDACwpXPalp8bjK0TMssLtkN0nOSPMXlwkQXF5Sd
cPcsnX++kTWA5BeQKQQE6A6lRpvB3ujcQPgaXzt9JN6oWp1Gq1KqAtI4A5bPUhR/WZ9RLw0pb4vU
+2gDmEfdRIWb4PS7zUuBL1R3O3xlT1NzID6TpivB+HyxZiFCLaEd1X0NQ6QVZy17oRLUX58up4E9
GMOrOSKmO1UscyLxBz7sM2twDUFvBe/F1Zy54IfRX3tBTjw/oUUOZRVbf09Z53EhZOkHfzHNhbmz
CdwKkZQNRg83tlmP67g9woEt/BAmVTE2pb575PyppPrQpvkZu6y1zYU7u1bgbINWb+DDUpKPVmeU
cuDejEMnbTpJFVVcbfxb3mTKjFWGJWth/tZ3Tu8c5VZA2YBLmUBZNU5HPz5YjGWgKlTKXSNSqlCi
ubGxHUtvg12lqBcBBsRWMAhdq21SBbAf7NUF3OBzvP4hU3vKg9HQZ5hNfe8S+W+3G+PPQMVJWdBZ
lGfh2smqNuLo6zPicfh9eIVUkGwH81mfxG5LGRcYZuLU20sOgrPOH6sy69Bcc3i7RlrToGvhRprt
wKmuWbM1oC3M9Xx5EI84YlDwTjaDOTKqDghCgrcRlxz8WWwcIOzkfOf509gr9QbKn3DzjbZylMdn
jmmIOddcm3YxvWngZTwAhBoE9TY5UYzi7+bNdKyGNxhdsc/1K8idMgGWvbjVRzaT02k3Ipcop5+Y
LEReXQ/AndR00cjsYzzA1njM9JjMQBO0HDcLM2NSpv4ko4IRXu6r12ZBPgkBMaggjwjdVa+REyDK
eZIH7gdsEcg3G/S0mFAGC7H5ny3T0YYqfrxtyOOgtm+T4mwU2GYLbYQFdMDyC3PXvnwzitxblpic
TvXMek6qRV+EpJd/LXYwJUJk22eYXX6lrKkbFupwAe/aa6/sgrtQwj90jmTRyr51xI23LmprY/bU
MQOq/iI/ehL9Q8GfPgIG3J8XEtYubkaFnMdin8bDoMm13FqCXv88RFXJ1UwSJemdsQ8FRBhJRP+O
+Q/gSOLPT+7zN9w4WQatumGcPymQTPh9mhufODQaIWwv3l7mrtJhifBMCqRmqsqHAdC4s5PAV6mO
q1azWrmLiSSrMvwsCJxKfAShYIlIxqpIhSaDPMBCIJKdl267vTceAP2JCxkj2A8att2sKAL5rNRg
OiZqu8L2MsTqDSnVDHPh5NfKe0CGvB49En/ot/7PJgdyo9+5Rw2AZAU2rYGoYE17LHQxw2clWdod
CD++ONJIIw7r1xI3deZ3GX9+Gqk6xkjD0xdwAePzYRizHe6dk7qBt8vWt8x/MTY/8a2UvxQRLvHH
0UD5UYheemOE9Hj9YmGK/Ya/7WFn2unAaQjSf1frhm2v1j1dN985tDbCRGtFXLppiq15PemvGgg+
7g/bxkLlNquSwLUcH737Zp3C0YtmeV3EHkE6I12GMO5uPS2npMhUTkQGcCNfbvMcF/bX7BRly3Xy
H7e6ZYNnfU3WTocPITTSLd64eU5aLkulbYzsZiUNIJhl1iRIUra6I2Q7EHHyyTsjkcbNmsQtQ2Ll
sRt6eMg6UzPv50a3LfSjDVo4BRqZ6SlpgzFuMtMe/9YL7udmw/PNeCDi7i0U8/wgfsZN5Egsso83
f5/XD5jLayiDQGW8nDnZMPnbzImgvThyTcRUeurnpdvbouF78koMBBQ56D55Cw+itVy2F2QVKq26
PqARrysyJl8Epfb2+l37kI6fShw66dsr3IWyqPmWJ9SbozlR6dhbYA/iRgObsuLmEub9Vi6unzZJ
SUCIL9hr7WmBKiz/akJjHSQ5PQ+39ZolMrsl/3dC8DCnrDokUM7jfa8PymYSWFm4Or8KRQy49NPC
uHsY3qQnjjrIpZ7+MLMz4i/slD7gdY0DX86imFxRCco7LI7Bhhy0cOCr7m/Rg0egs1fiATz3/5P1
jwxVUarruyaH2w3X9traqsBmH9Hzew9fWwkXQ8NjRhHbbQflcvRppVYYkQSCI1l9zM/dAmII1ko2
iiuMPq/dCkgjECjc0pc6EeWZBzxh+N2+plcDW6WevBxJERCGGdYtsI2voHbgm0PnLp08JY/FqYUb
SiQxvlqvr2bZ/Zif7s4+6OPi4FhHyPBili5h/HSyxjOnMO1kgOLAmKjaF+5wtECfTr389w7C6N/8
N4gMS0aA6dWzfQNjeSVEJd+6Nl0X4zHOg+RCkhGOnStwQx2gj6rqqtsEAO4FRR/8KO8k1Hl9DPgX
sCLsCDhUYkRT5UT8t+dPYNcw2tFkfbisck1/fQMK/KsmuAYbMHJtGFyIQlhpVH+SUcsGF3PvXpqF
bbmCAe6Td1MfkJxbnVhsE0Z90JunqgrPpYkHdpOgGuXBKabgb6Y5dKE8T22lBk1b95k3LXeEvz+Y
NhJfG/mmGj1tcSdg8OXgFmkB1xRGBaYCXicslcSA8Uh2NCa1s2WcqwquX3J2/I0ZpNExZCeJx+PA
CbJLMeXAP7b2+WWhhnkKypAC/vnnv5R+fYjDBcj42WI0CwvFv75w4Sx70mb0BxiqpGwbolbknM55
olLuo8O9L6qS2K7NKHVfsj54ey6rDLbpjLdDmrnjJkP7+Y+SL/2r3CITt829LZhO09XV/b7b
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
