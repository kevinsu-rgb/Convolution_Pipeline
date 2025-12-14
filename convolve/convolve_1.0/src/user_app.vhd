-- Greg Stitt
-- University of Florida

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.config_pkg.all;
use work.user_pkg.all;
use ieee.math_real.all;
use work.math_custom.all;

entity user_app is
    port (
        clk : in std_logic;
        rst : in std_logic;

        -- Memory-map interface
        mmap_wr_en   : in  std_logic;
        mmap_wr_addr : in  std_logic_vector(MMAP_ADDR_RANGE);
        mmap_wr_data : in  std_logic_vector(MMAP_DATA_RANGE);
        mmap_rd_en   : in  std_logic;
        mmap_rd_addr : in  std_logic_vector(MMAP_ADDR_RANGE);
        mmap_rd_data : out std_logic_vector(MMAP_DATA_RANGE);

        -- DMA read interface for RAM 0
        ram0_rd_rd_en : out std_logic;
        ram0_rd_go    : out std_logic;
        ram0_rd_valid : in  std_logic;
        ram0_rd_data  : in  std_logic_vector(RAM0_RD_DATA_RANGE);
        ram0_rd_addr  : out std_logic_vector(RAM0_ADDR_RANGE);
        ram0_rd_size  : out std_logic_vector(RAM0_RD_SIZE_RANGE);
        ram0_rd_done  : in  std_logic;

        debug_ram0_rd_count      : in std_logic_vector(RAM0_RD_SIZE_RANGE);
        debug_ram0_rd_start_addr : in std_logic_vector(RAM0_ADDR_RANGE);
        debug_ram0_rd_addr       : in std_logic_vector(RAM0_ADDR_RANGE);
        debug_ram0_rd_size       : in std_logic_vector(C_RAM0_ADDR_WIDTH downto 0);
        debug_ram0_rd_prog_full  : in std_logic;
        debug_ram0_rd_empty      : in std_logic;

        -- DMA write interface for RAM 1 
        ram1_wr_ready : in  std_logic;
        ram1_wr_go    : out std_logic;
        ram1_wr_valid : out std_logic;
        ram1_wr_data  : out std_logic_vector(RAM1_WR_DATA_RANGE);
        ram1_wr_addr  : out std_logic_vector(RAM1_ADDR_RANGE);
        ram1_wr_size  : out std_logic_vector(RAM1_WR_SIZE_RANGE);
        ram1_wr_done  : in  std_logic
        );
end user_app;

architecture default of user_app is

    -- converts from input_array to std_logic_vector
    function vectorize(input        : window;
                        arraySize    : natural;
                        elementWidth : positive) return std_logic_vector is
        variable temp : std_logic_vector(arraySize*elementWidth-1 downto 0);
    begin
        for i in 0 to arraySize-1 loop
            temp((i+1)*elementWidth-1 downto i*elementWidth) := input(input'left+i);
        end loop;

        return temp;
    end function;

    signal go   : std_logic;
    signal size : std_logic_vector(RAM0_RD_SIZE_RANGE);
    signal done : std_logic;

    signal mmap_clear        : std_logic;
    signal mmap_sw_rst       : std_logic;
    signal mmap_signal_size  : std_logic_vector(RAM0_RD_SIZE_RANGE);
    signal mmap_kernel_data  : std_logic_vector(KERNEL_WIDTH_RANGE);
    signal mmap_kernel_load  : std_logic;
    signal mmap_kernel_ready : std_logic;

    signal k_buf_full : std_logic_vector(0 downto 0);
    signal k_buf_empty : std_logic_vector(0 downto 0);
    signal k_buf_out : window(0 to C_KERNEL_SIZE - 1);
    signal kernel : std_logic_vector(C_KERNEL_SIZE * C_KERNEL_WIDTH - 1 downto 0);
    signal flip_kernel : std_logic_vector(C_KERNEL_SIZE * C_KERNEL_WIDTH - 1 downto 0);

    signal s_buf_en : std_logic;
    signal s_buf_full : std_logic_vector(0 downto 0);
    signal s_buf_empty : std_logic_vector(0 downto 0);
    signal s_buf_out : window(0 to C_KERNEL_SIZE - 1);
    signal s_window : std_logic_vector(C_KERNEL_SIZE * C_SIGNAL_WIDTH - 1 downto 0);

    signal valid_out : std_logic_vector(0 downto 0);

    signal pipeline_en : std_logic;
    signal pipeline_out : std_logic_vector(C_SIGNAL_WIDTH + C_KERNEL_WIDTH + clog2(C_KERNEL_SIZE) - 1 downto 0) := (others => '0');

    signal clip_check : std_logic_vector(C_SIGNAL_WIDTH + C_KERNEL_WIDTH + clog2(C_KERNEL_SIZE) - 1 downto C_SIGNAL_WIDTH) := (others => '0');
    signal all_1s : std_logic_vector(C_SIGNAL_WIDTH - 1 downto 0) := (others => '1');

begin

    S_BUF : entity work.fifo_buffer
        generic map (
            width => C_KERNEL_SIZE,
            data_width => C_SIGNAL_WIDTH
        )
        port map (
            clk => clk,
            rst => mmap_clear,
            wr_en => ram0_rd_valid,
            rd_en => ram1_wr_ready,--from pipeline? (need to change)
            input => ram0_rd_data,
            output => s_buf_out,
            full => s_buf_full(0),
            empty => s_buf_empty(0)
        );

    K_BUF : entity work.fifo_buffer
        generic map (
            width => C_KERNEL_SIZE,
            data_width => C_KERNEL_WIDTH
        )
        port map (
            clk => clk,
            rst => mmap_clear,
            wr_en => mmap_kernel_load,
            rd_en => '0', --prevent sliding window
            input => mmap_kernel_data, --mmap_wr_data is 32bits
            output => k_buf_out,
            full => k_buf_full(0),
            empty => k_buf_empty(0)
        );

    s_window <= vectorize(s_buf_out, C_KERNEL_SIZE, C_SIGNAL_WIDTH);
    kernel <= vectorize(k_buf_out, C_KERNEL_SIZE, C_KERNEL_WIDTH);
    flip_kernel <= kernel; --kernel(kernel'reverse_range); --flip kernel for convolution

    CONV : entity work.mult_add_tree(unsigned_arch)
        generic map (
            num_inputs => C_KERNEL_SIZE,
            input1_width => C_SIGNAL_WIDTH,
            input2_width => C_KERNEL_WIDTH
        )
        port map (
            clk => clk,
            rst => rst,
            en => '1',
            input1 => s_window, --signal window
            input2 => flip_kernel, --kernel
            output => pipeline_out --need clamping logic to make 16bits
        );

    DELAY : entity work.delay
        generic map (
            CYCLES => clog2(C_KERNEL_SIZE)+1, --uhhhh it depends? (taken from mult_add_tree)
            WIDTH => 1,
            RESET_VALUE => ""
        )
        port map (
            clk => clk,
            rst => rst,
            en => s_buf_full(0), --same as rd_en for signal buffer (need to change)
            input => "1", --once (s_buf_full(0))the signal window is full the convolution should start and be valid
            output => valid_out --output is valid
        );

    U_MMAP : entity work.memory_map
        port map (
            clk => clk,
            rst => rst,

            wr_en   => mmap_wr_en,
            wr_addr => mmap_wr_addr,
            wr_data => mmap_wr_data,
            rd_en   => mmap_rd_en,
            rd_addr => mmap_rd_addr,
            rd_data => mmap_rd_data,

            -- circuit interface from software
            go           => go,
            clear        => mmap_clear,
            sw_rst       => mmap_sw_rst,
            signal_size  => mmap_signal_size,
            kernel_data  => mmap_kernel_data,
            kernel_load  => mmap_kernel_load,
            kernel_ready => mmap_kernel_ready,
            done         => done

            -- -- Debugging signals.
            -- debug_ram0_rd_count      => debug_ram0_rd_count,
            -- debug_ram0_rd_addr       => debug_ram0_rd_addr,
            -- debug_ram0_rd_start_addr => debug_ram0_rd_start_addr,
            -- debug_ram0_rd_size       => debug_ram0_rd_size,
            -- debug_ram0_rd_prog_full  => debug_ram0_rd_prog_full,
            -- debug_ram0_rd_empty      => debug_ram0_rd_empty
            );

    -- RAM0 control.
    ram0_rd_go    <= go;
    ram0_rd_rd_en <= not s_buf_full(0) and ram1_wr_ready;
    ram0_rd_size  <= std_logic_vector(unsigned(mmap_signal_size) + to_unsigned(2 * (C_KERNEL_SIZE - 1), C_RAM0_RD_SIZE_WIDTH)); --padded singal size = mmap_signal_size + 2 * (C_KERNEL_SIZE - 1)
    ram0_rd_addr <= (others => '0');

    -- RAM1 control.
    ram1_wr_go    <= go;
    ram1_wr_size  <= std_logic_vector(unsigned(mmap_signal_size) + to_unsigned(C_KERNEL_SIZE - 1, C_RAM0_RD_SIZE_WIDTH)); --number of outputs from convolution = mmap_signal_size + C_KERNEL_SIZE - 1
    ram1_wr_data  <= pipeline_out(C_SIGNAL_WIDTH - 1 downto 0) when (pipeline_out(C_SIGNAL_WIDTH + C_KERNEL_WIDTH + clog2(C_KERNEL_SIZE) - 1 downto C_SIGNAL_WIDTH) = clip_check) else all_1s; --need to check for saturation/clamping (check if bits above bit 16 are 1s)
    ram1_wr_valid <= valid_out(0) and ram1_wr_ready;
    ram1_wr_addr  <= (others => '0');

    s_buf_en <= s_buf_empty(0) and ram1_wr_ready;

    -- pipeline control
    pipeline_en <= s_buf_full(0) and ram1_wr_ready; --if the window(buffer) is full and ready

    mmap_kernel_ready <= k_buf_full(0);
    done <= ram1_wr_done;

end default;
