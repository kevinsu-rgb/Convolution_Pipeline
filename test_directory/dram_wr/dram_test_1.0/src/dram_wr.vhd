 ----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dram_wr is
    generic(
        ADDR_WIDTH       : positive := 15;
        SIZE_WIDTH       : positive := 17;
        OUTPUT_WIDTH     : positive := 32;
        DATA_IN_WIDTH    : positive := 16
    );
    port(
        dram_clk        : in  std_logic;
        user_clk        : in  std_logic;
        dram_rst        : in  std_logic;
        user_rst        : in  std_logic;
        go              : in  std_logic;
        wr_en           : in  std_logic;
        start_addr      : in  std_logic_vector (14 downto 0);
        size            : in  std_logic_vector (16 downto 0);
        data            : in  std_logic_vector (15 downto 0);
        done            : out std_logic;
        ready           : out std_logic;
        dram_ready      : in  std_logic;
        dram_wr_en      : out std_logic;
        dram_wr_addr    : out std_logic_vector (14 downto 0);
        dram_wr_data    : out std_logic_vector (31 downto 0);
        dram_wr_pending : in  std_logic
    );
end dram_wr;

architecture Behavioral of dram_wr is

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
    
    component dram_wr_FIFO
      Port ( 
        rst : in STD_LOGIC;
        wr_clk : in STD_LOGIC;
        rd_clk : in STD_LOGIC;
        din : in STD_LOGIC_VECTOR ( 15 downto 0 );
        wr_en : in STD_LOGIC;
        rd_en : in STD_LOGIC;
        dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
        full : out STD_LOGIC;
        empty : out STD_LOGIC;
        wr_rst_busy : out STD_LOGIC;
        rd_rst_busy : out STD_LOGIC
      );
    end component;

    type state_type is (S_READY, S_WAIT_FOR_ACK, S_RESET_ACK);
    type state_type2 is (S_READY, S_SEND_ACK, S_RESET_ACK);
    type state_active_type is (IDLE, Active);

    signal state_src  : state_type;
    signal state_dest : state_type2;
    signal state_active : state_active_type;
    
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
    -- signal FIFO_Program_Full : std_logic;
    signal FIFO_wr_en : std_logic;
    signal FIFO_FULL  : std_logic;
    signal FIFO_empty : std_logic;
    signal FIFO_rd_en : std_logic;
    signal FIFO_wr_rst_busy : std_logic;
    signal FIFO_rd_rst_busy : std_logic;
    signal FIFO_Data : std_logic_vector(DATA_IN_WIDTH-1 downto 0);
    signal FIFO_FLIPPED_Data : std_logic_vector(OUTPUT_WIDTH-1 downto 0);

    
    -- Size counter signals
    signal counter_done : std_logic;
    
    signal dram_wr_pending_dest   : std_logic_vector(1 downto 0);
    signal empty_dest   : std_logic_vector(1 downto 0);
    signal dram_wr_pending_src : std_logic;
    signal empty_src : std_logic;
    
    signal odd_size_signal : std_logic;
    signal wait_done : std_logic;


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
            
            dram_wr_pending_dest(1) <= dram_wr_pending_src;
            dram_wr_pending_dest(0) <= dram_wr_pending_dest(1);
            
            empty_dest(1) <= empty_src;
            empty_dest(0) <= empty_dest(1);
            
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
            empty_src <= FIFO_empty;
            dram_wr_pending_src <= dram_wr_pending;
--            FIFO_RST(1) <= counter_done;
--             FIFO_RST(0) <= FIFO_RST(1);

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
    
    addr_gen_en <= NOT FIFO_empty AND dram_ready AND NOT FIFO_rd_rst_busy;
    -- FIFO_rd_en <=  NOT FIFO_empty AND dram_ready AND NOT FIFO_rd_rst_busy;
    dram_wr_en <= FIFO_rd_en;
    
    U_Addr_gen_0 : addr_gen port map(
        clk  => dram_clk,
        rst  => dram_rst,
        go   => dest_go_r,
        en   => addr_gen_en,
        size => dest_size_r,
        start_addr => dest_address_start_r,
        output_addr => dram_wr_addr,
        addr_valid => FIFO_rd_en,
        done => addr_done
    );
    
    U_fifo_generator_0 : dram_wr_FIFO port map(
        rst => user_rst,
        wr_clk => user_clk,
        rd_clk => dram_clk,
        din => FIFO_Data,
        wr_en => FIFO_wr_en,
        rd_en => FIFO_rd_en,
        dout => FIFO_FLIPPED_Data,
        full => FIFO_FULL,
        empty => FIFO_empty,
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
            odd_size_signal <= '0';
            state_active <= IDLE;
        elsif(rising_edge(user_clk)) then
            FIFO_Data <= data;    
            -- Check states
            case(state_active) is
                when IDLE =>
                    wait_done <= '0';
                    FIFO_wr_en <= '0';
                    ready <= '0';
                    if(go = '1') then
                        counter_done <= '0';
                        size_count := (others=>'0');
                        state_active <= Active;
                    end if;
                when Active =>
                    FIFO_wr_en <= wr_en AND NOT FIFO_FULL AND NOT FIFO_wr_rst_busy;
                    ready <= NOT FIFO_FULL;
                    
                    if(FIFO_wr_en = '1') then
                        size_count := std_logic_vector(unsigned(size_count) + 1);  
                    end if;
            
            if(unsigned(size) > 1) then
                if(dram_wr_pending_dest(0) = '1') then
                    wait_done <= '1';
                end if;
            else
                wait_done <= '1';
            end if;
            
            if(unsigned(size_count) = unsigned(size)+1) then
                if(empty_dest(0) = '1' AND dram_wr_pending_dest(0) = '0') then
                    counter_done <= '1';
                end if;
            elsif(unsigned(size_count) = unsigned(size) AND state_active = Active AND wait_done = '1') then
                if(empty_dest(0) = '1' AND dram_wr_pending_dest(0) = '0') then
                    counter_done <= '1';
                end if;
            end if;
            if(counter_done = '1') then
                state_active <= IDLE;
            end if;
            end case;
        end if;
    end process;
    
    done <= counter_done;
    
    dram_wr_data <= FIFO_FLIPPED_Data(15 downto 0) & FIFO_FLIPPED_Data(31 downto 16);



end Behavioral;
