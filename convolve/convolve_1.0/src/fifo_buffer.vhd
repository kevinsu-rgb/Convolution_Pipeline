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
    signal regs : window(0 to width - 1) := (others => (others => '0'));
    signal count : natural range 0 to width := 0;
begin
    -- Combinational output - no extra delay
    output <= regs;
    
    -- Combinational flags
    empty <= '1' when count < width else '0';
    full  <= '1' when count = width and rd_en = '0' else '0';
    
    process(clk)
    begin
        if (rst = '1') then
            regs <= (others => (others => '0'));
            count <= 0;
        elsif (rising_edge(clk)) then
            -- Handle write
            if (wr_en = '1') then
                -- Shift data through pipeline
                for i in width-1 downto 1 loop
                    regs(i) <= regs(i-1);
                end loop;
                regs(0) <= input;
            end if;
            
            -- Update count
            if (wr_en = '1' and rd_en = '0') then
                if (count < width) then
                    count <= count + 1;
                end if;
            elsif (wr_en = '0' and rd_en = '1') then
                if (count > 0) then
                    count <= count - 1;
                end if;
            end if;
            -- If both wr_en and rd_en, count stays the same
            
        end if;
    end process;
    
end behavioral;