library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.user_pkg.all;

entity fifo_buffer is
    generic(
        width       : positive := 128;
        data_width  : positive := 16
    );
    port(
        clk     : in std_logic;
        rst     : in std_logic;
        wr_en   : in std_logic;
        rd_en   : in std_logic;
        input   : in std_logic_vector(data_width - 1 downto 0);
        output  : out window(0 to width - 1);
        full    : out std_logic;
        empty   : out std_logic
    );
end fifo_buffer;

architecture behavioral of fifo_buffer is
    signal regs : window(0 to width - 1);
    signal count : natural range 0 to width := 0;

begin
    process(clk, rst)
    begin
        if (rst = '1') then
            count <= 0;
            for i in 0 to width - 1 loop
                regs(i) <= (others => '0');
            end loop;

        elsif (rising_edge(clk)) then

            --add new data if not full
            if (wr_en = '1' and count < width) then
                regs(width - 1) <= input; --swap to regs(0) <= input for other way (3 2 1)
                count <= count + 1;

                --slide data
                for i in 0 to width - 2 loop
                    regs(i) <= regs(i + 1); --swap to regs(i + 1) <= regs(i) for other way (3 2 1)
                end loop;
            end if;

            --read
            if (rd_en = '1' and count > 0) then
                if (wr_en = '0') then
                    count <= count - 1;
                end if;
            end if;

        end if;
    end process;

    output <= regs;
    full <= '1' when (count = width) else '0';
    empty <= '1' when (count < width) else '0';

end behavioral;