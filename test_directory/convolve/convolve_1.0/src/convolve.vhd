library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.user_pkg.all;

entity convolve is
    generic(
        width       : positive
    );
    port(
        clk     : in std_logic;
        rst     : in std_logic;
        input   : in std_logic_vector(width - 1 downto 0);
        output  : out std_logic_vector(width - 1 downto 0)
    );
end convolve;

architecture behavioral of convolve is

    component fifo_buffer
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
            output  : out std_logic_vector(data_width - 1 downto 0);
            full    : out std_logic;
            empty   : out std_logic
        );
    end component;

    component mult_add_tree
        generic(
            num_inputs   : positive;
            input1_width : positive;
            input2_width : positive
        );
        port (
            clk    : in  std_logic;
            rst    : in  std_logic;
            en     : in  std_logic;
            input1 : in  std_logic_vector(num_inputs*input1_width-1 downto 0);
            input2 : in  std_logic_vector(num_inputs*input2_width-1 downto 0);
            output : out std_logic_vector(input1_width+input2_width+clog2(num_inputs)-1 downto 0)
        );
    end component;

    component delay
        generic(CYCLES : natural;
                WIDTH  : positive;
                RESET_VALUE   : std_logic_vector := ""
        );
        port(clk    : in  std_logic;     
            rst    : in  std_logic := '0';
            en     : in  std_logic := '1';
            input  : in  std_logic_vector(WIDTH-1 downto 0);
            output : out std_logic_vector(WIDTH-1 downto 0)
        );
    end component;

begin

end behavioral;