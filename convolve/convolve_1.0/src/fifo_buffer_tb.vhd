library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.user_pkg.all;

entity fifo_buffer_tb is
end fifo_buffer_tb;

architecture tb of fifo_buffer_tb is

    constant WIDTH      : positive := 128;
    constant DATA_WIDTH : positive := 16;

    signal clk     : std_logic := '0';
    signal rst     : std_logic := '0';
    signal wr_en   : std_logic := '0';
    signal rd_en   : std_logic := '0';
    signal input   : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
    signal output  : window(0 to WIDTH-1);
    signal full    : std_logic;
    signal empty   : std_logic;

    constant CLK_PERIOD : time := 10 ns;

begin

    DUT: entity work.fifo_buffer
        generic map(
            width      => WIDTH,
            data_width => DATA_WIDTH
        )
        port map(
            clk    => clk,
            rst    => rst,
            wr_en  => wr_en,
            rd_en  => rd_en,
            input  => input,
            output => output,
            full   => full,
            empty  => empty
        );

    clk <= not clk after CLK_PERIOD/2;

    process
    begin

        report "reset";
        rst <= '1';
        wait for 3*CLK_PERIOD;
        rst <= '0';
        wait for CLK_PERIOD;

        report "writing width values";
        for i in 0 to WIDTH - 1 loop
            wr_en <= '1';
            input <= std_logic_vector(to_unsigned(i, DATA_WIDTH));
            wait for CLK_PERIOD;
        end loop;
        wr_en <= '0';
        wait for 5*CLK_PERIOD;

        report "write and read";
        for i in WIDTH - 1 to WIDTH * 2 - 1 loop
            rd_en <= '1';
            wr_en <= '0';
            wait for CLK_PERIOD;
            wr_en <= '1';
            rd_en <= '0';
            input <= std_logic_vector(to_unsigned(i, DATA_WIDTH));
            wait for CLK_PERIOD;
        end loop;
        wr_en <= '0';
        rd_en <= '0';

        wait for 20 ns;
        report "finished simulation";
        wait;
    end process;

end tb;
