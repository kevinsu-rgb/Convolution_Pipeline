library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dram_rd is
    generic(
        ADDR_WIDTH       : positive := 15;
        SIZE_WIDTH       : positive := 17;
        OUTPUT_WIDTH     : positive := 16;
        DATA_IN_WIDTH    : positive := 32
    );
    port(
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
end dram_rd;

architecture Behavioral of dram_rd is

    component addr_gen
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
    end component;
    
    component fifo_generator_0
      PORT (
        rst : IN STD_LOGIC;
        wr_clk : IN STD_LOGIC;
        rd_clk : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        wr_en : IN STD_LOGIC;
        rd_en : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        full : OUT STD_LOGIC;
        empty : OUT STD_LOGIC;
        prog_full : OUT STD_LOGIC;
        wr_rst_busy : OUT STD_LOGIC;
        rd_rst_busy : OUT STD_LOGIC
      );
    end component;
    
    type state_type is (S_READY, S_WAIT_FOR_ACK, S_RESET_ACK);
    type state_type2 is (S_READY, S_SEND_ACK, S_RESET_ACK);
    
    signal state_src  : state_type;
    signal state_dest : state_type2;
    
    -- Metastability signals for addr_gen
    signal send_src_r : std_logic; -- Send from src
    signal ack_dest_r : std_logic; -- ack from dest

    signal send_src_in_dst_r : std_logic_vector(1 downto 0); -- signal from src in dest domain
    signal ack_dest_in_src_r : std_logic_vector(1 downto 0); -- signal from dest in src domain
    
    signal src_size_r          : std_logic_vector(SIZE_WIDTH-1 downto 0); -- Size register in src domain (User) 
    signal src_address_start_r  : std_logic_vector(ADDR_WIDTH-1 downto 0); -- Address_start register in src domain (User)
    signal src_go_r             : std_logic; -- Go signal from src (user) domain
    
    signal dest_size_r          : std_logic_vector(SIZE_WIDTH-1 downto 0); -- Size register in src domain (User) 
    signal dest_address_start_r  : std_logic_vector(ADDR_WIDTH-1 downto 0); -- Address_start register in src domain (User)
    signal dest_go_r             : std_logic; -- Go signal from src (user) domain
    
    signal word_size : std_logic_vector(SIZE_WIDTH-1 downto 0);
    
    -- Addr_gen signals
    signal addr_gen_en : std_logic;
    signal addr_done   : std_logic;
    
    -- Fifo Signals
    signal FIFO_Program_Full : std_logic;
    signal FIFO_wr_en : std_logic;
    signal FIFO_FULL  : std_logic;
    signal FIFO_empty : std_logic;
    signal FIFO_RST   : std_logic_vector(1 downto 0);
    signal FIFO_rd_en : std_logic;
    signal FIFO_wr_rst_busy : std_logic;
    signal FIFO_rd_rst_busy : std_logic;
    signal FIFO_Flipped_Data : std_logic_vector(DATA_IN_WIDTH-1 downto 0);
    
    -- Size counter signals
    signal counter_done : std_logic;
    
begin
    -- size conversion --
    process(size)
    begin
    if size(0) = '1' then
        -- size is odd
        word_size <= std_logic_vector((unsigned(size) srl 1) + 1);
    else
        -- size is even
        word_size <= std_logic_vector(unsigned(size) srl 1);
    end if;
    end process;
    
    -- Address Generator Code --
    addr_gen_en <= NOT FIFO_Program_Full AND dram_ready;
    
    -- Source Domain (user domain (user_clk))
    process(user_clk, user_rst)
    begin
        if (user_rst = '1') then
            state_src  <= S_READY;
            send_src_r <= '0';
            src_size_r <= (others => '0');
            src_address_start_r <= (others => '0');
            src_go_r <= '0';
        elsif (rising_edge(user_clk)) then          
            ack_dest_in_src_r(1) <= ack_dest_r;
            ack_dest_in_src_r(0) <= ack_dest_in_src_r(1);
            
            case state_src is
                when S_READY =>
                    if (go = '1') then
                        send_src_r <= '1';
                        state_src  <= S_WAIT_FOR_ACK;
                        src_size_r <= word_size;
                        src_address_start_r <= start_addr;
                        src_go_r <= go;
                    elsif(src_go_r /= go) then
                        src_go_r <= go;          
                        send_src_r <= '1';
                        state_src  <= S_WAIT_FOR_ACK;
                    end if;

                when S_WAIT_FOR_ACK =>
                    if (ack_dest_in_src_r(0) = '1') then
                        send_src_r <= '0';
                        state_src  <= S_RESET_ACK;
                    end if;

                when S_RESET_ACK =>
                    if (ack_dest_in_src_r(0) = '0') then
                        state_src <= S_READY;
                    end if;

                when others => null;
            end case;
        end if;
    end process;
    
    -- Destination Domain (DRAM)(dram_clk)
    process(dram_clk, dram_rst)
    begin
        if (dram_rst = '1') then
            state_dest <= S_READY;
            dest_size_r <= (others=>'0');
            dest_address_start_r <= (others=>'0');
            dest_go_r <= '0';
            ack_dest_r <= '0';
        elsif (rising_edge(dram_clk)) then
            send_src_in_dst_r(1) <= send_src_r;
            send_src_in_dst_r(0) <= send_src_in_dst_r(1);
            FIFO_RST(1) <= counter_done;
            FIFO_RST(0) <= FIFO_RST(1);

            case state_dest is
                when S_READY =>
                    -- if source is sending data, assert rcv (received)
                    if (send_src_in_dst_r(0) = '1') then
                        dest_size_r <= src_size_r;
                        dest_address_start_r <= src_address_start_r;
                        dest_go_r <= src_go_r;
                        state_dest <= S_SEND_ACK;
                    end if;

                when S_SEND_ACK =>
                    -- send ack unless it is delayed
                    -- if (delay_ack = '0') then
                        ack_dest_r <= '1';
                        state_dest <= S_RESET_ACK;
                    -- end if;

                when S_RESET_ACK =>
                    -- send ack unless it is delayed
                    if (send_src_in_dst_r(0) = '0') then
                        ack_dest_r <= '0';
                        state_dest <= S_READY;
                    end if;

                when others => null;
            end case;
        end if;
    end process;
    
    U_Addr_gen_0 : addr_gen port map(
        clk  => dram_clk,
        rst  => dram_rst,
        go   => dest_go_r,
        en   => addr_gen_en,
        size => dest_size_r,
        start_addr => dest_address_start_r,
        output_addr => dram_rd_addr,
        addr_valid => dram_rd_en,
        done => addr_done
    );
    
    
    -- FIFO code
    FIFO_wr_en <= dram_rd_valid AND NOT FIFO_FULL and NOT FIFO_wr_rst_busy;
    FIFO_rd_en <= rd_en AND NOT FIFO_empty AND NOT FIFO_rd_rst_busy;
    FIFO_Flipped_Data <= dram_rd_data(15 downto 0) & dram_rd_data(31 downto 16);
  
    U_fifo_generator_0 : fifo_generator_0 port map(
        rst => FIFO_RST(0),
        wr_clk => dram_clk,
        rd_clk => user_clk,
        din => FIFO_Flipped_Data, -- FIFO_Flipped_Data
        wr_en => FIFO_wr_en,
        rd_en => FIFO_rd_en,
        dout => data,
        full => FIFO_FULL,
        empty => FIFO_empty,
        prog_full => FIFO_Program_Full,
        wr_rst_busy => FIFO_wr_rst_busy,
        rd_rst_busy => FIFO_rd_rst_busy
    );
    
    -- Counter_Done for FIFO (Good for 1 cycle and needs reset (may need to modify))
    process(user_clk, user_rst)
        variable size_count : std_logic_vector(SIZE_WIDTH-1 downto 0);
        begin
        if(user_rst = '1') then
            size_count := (others=>'0');
            counter_done <= '0';
        elsif(rising_edge(user_clk)) then
            if (go = '1') then
                counter_done <= '0';
                size_count := (others=>'0');
            end if;
            
            if(FIFO_rd_en = '1') then
                size_count := std_logic_vector(unsigned(size_count) + 1);
                if(unsigned(size_count) = unsigned(size)) then
                    counter_done <= '1';
                end if;
            end if;
        end if;
    end process;
    
    -- Ouptut Assignments
    valid <= NOT FIFO_empty;
    done <= counter_done;
    

end Behavioral;
