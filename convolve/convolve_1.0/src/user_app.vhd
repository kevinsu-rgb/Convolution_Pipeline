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
    signal flip_kernel : std_logic_vector(C_KERNEL_SIZE * C_KERNEL_WIDTH - 1 downto 0);

    signal s_buf_full : std_logic_vector(0 downto 0);
    signal s_buf_empty : std_logic_vector(0 downto 0);
    signal s_buf_out : window(0 to C_KERNEL_SIZE - 1);
    signal s_window : std_logic_vector(C_KERNEL_SIZE * C_SIGNAL_WIDTH - 1 downto 0);

    signal valid_out : std_logic_vector(0 downto 0);
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
            rd_en => ram1_wr_ready AND (NOT s_buf_empty(0)),
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
            rd_en => '1',
            input => mmap_kernel_data,
            output => k_buf_out,
            full => k_buf_full(0),
            empty => k_buf_empty(0)
        );

    s_window <= vectorize(s_buf_out, C_KERNEL_SIZE, C_SIGNAL_WIDTH);

    CONV : entity work.mult_add_tree(unsigned_arch)
        generic map (
            num_inputs => C_KERNEL_SIZE,
            input1_width => C_SIGNAL_WIDTH,
            input2_width => C_KERNEL_WIDTH
        )
        port map (
            clk => clk,
            rst => rst,
            en => ram1_wr_ready,
            input1 => s_window,
            input2 => flip_kernel,
            output => pipeline_out
        );

    DELAY : entity work.delay
        generic map (
            CYCLES => clog2(C_KERNEL_SIZE)+1,
            WIDTH => 1,
            RESET_VALUE => ""
        )
        port map (
            clk => clk,
            rst => rst,
            en => ram1_wr_ready,  -- Enable when buffer has data
            input(0) => ram1_wr_ready AND (NOT s_buf_empty(0)),            -- Constant '1' feeds through delay
            output => valid_out
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

            go           => go,
            clear        => mmap_clear,
            sw_rst       => mmap_sw_rst,
            signal_size  => mmap_signal_size,
            kernel_data  => mmap_kernel_data,
            kernel_load  => mmap_kernel_load,
            kernel_ready => mmap_kernel_ready,
            done         => done
            );

    -- RAM0 control.
    ram0_rd_go    <= go;
    ram0_rd_rd_en <= (not s_buf_full(0) and ram1_wr_ready);
    ram0_rd_size  <= std_logic_vector(unsigned(mmap_signal_size) + to_unsigned(2 * (C_KERNEL_SIZE - 1), C_RAM0_RD_SIZE_WIDTH));
    ram0_rd_addr  <= (others => '0');

    -- RAM1 control.
    ram1_wr_go    <= go;
    ram1_wr_size  <= std_logic_vector(unsigned(mmap_signal_size) + to_unsigned(C_KERNEL_SIZE - 1, C_RAM0_RD_SIZE_WIDTH));
    ram1_wr_data  <= pipeline_out(C_SIGNAL_WIDTH - 1 downto 0) when (pipeline_out(C_SIGNAL_WIDTH + C_KERNEL_WIDTH + clog2(C_KERNEL_SIZE) - 1 downto C_SIGNAL_WIDTH) = clip_check) else all_1s;
    ram1_wr_valid <= valid_out(0) and ram1_wr_ready;
    ram1_wr_addr  <= (others => '0');

    mmap_kernel_ready <= k_buf_full(0);
    done <= ram1_wr_done;
    
    U_REVERSE_KERNEL : process(k_buf_out)
        variable rev_array : window(0 to C_KERNEL_SIZE - 1);
        begin
            for i in C_KERNEL_SIZE-1 downto 0 loop
                rev_array(i) := k_buf_out(C_KERNEL_SIZE-(i+1));
            end loop;
            flip_kernel <= vectorize(rev_array, C_KERNEL_SIZE, C_KERNEL_WIDTH);
        end process;
    end default;
