library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config_pkg.all;
use work.user_pkg.all;

entity addr_gen is
    generic(
        addr_width : positive := 15;
        SIZE_WIDTH : positive := 17
    );
    port(
        clk               : in std_logic;
        rst               : in std_logic;
        go                : in std_logic;
        en                : in std_logic;
        size              : in std_logic_vector(SIZE_WIDTH-1 downto 0); --how many addresses to generate
        start_addr        : in std_logic_vector(addr_width-1 downto 0);
        output_addr       : out std_logic_vector(addr_width-1 downto 0);
        addr_valid        : out std_logic;
        done              : out std_logic  
    );
end entity;

architecture behavioral of addr_gen is
    type state_t IS (IDLE_S, COUNT_S, FINISH_S);
    signal state_r, next_state : state_t;
    signal address_reg, next_address_reg :  std_logic_vector(addr_width - 1 downto 0);
    -- signal size_r : std_logic_vector(SIZE_WIDTH-1 downto 0);
begin

    output_addr <= address_reg;
    
    process(clk, rst)
        begin
        if(rst = '1') then
            address_reg <= (others => '0');
            state_r <= IDLE_S;
        elsif(rising_edge(clk)) then
            state_r <= next_state;
            address_reg <= next_address_reg;
        end if;
    end process;
    
    process(state_r, go, en, size, address_reg, start_addr)
        begin
        next_state <= state_r; 
        addr_valid <= '0';
        next_address_reg <= address_reg;
        done <= '0';
        
        case(state_r) is
            when IDLE_S =>
                if(go = '1') then
                    next_address_reg <= start_addr;
                    -- addr_valid <= '1'; -- it might be ok to delay addr_valid one cycle to account for ram latency
                    next_state <= COUNT_S;
                end if;
            when COUNT_S =>   
                if(en = '1') then
                    if(unsigned(address_reg) = unsigned(start_addr)+unsigned(size)-1) then
                        done <= '1';
                        addr_valid <= '1';
                        next_state <= FINISH_S;
                    else
                        addr_valid <= '1';
                        next_address_reg <= std_logic_vector(unsigned(address_reg) + 1);  
                    end if;
                end if;
            when FINISH_S =>
                done <= '1';
                if(go = '0') then
                    next_state <= IDLE_S;
                end if;   
        end case;   
    end process;
            

end behavioral;