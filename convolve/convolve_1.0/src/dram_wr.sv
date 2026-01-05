`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2025 09:21:59 PM
// Design Name: 
// Module Name: dram_wr
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dram_wr
    #(parameter ADDR_WIDTH = 15,
        SIZE_WIDTH         = 17,
        OUTPUT_WIDTH       = 32,
        DATA_IN_WIDTH      = 16)
    (
        input logic                         dram_clk,
        input logic                         user_clk,
        input logic                         dram_rst,
        input logic                         user_rst,
        input logic                         go,
        input logic                         wr_en,
        input logic [ADDR_WIDTH-1:0]        start_addr,
        input logic [SIZE_WIDTH-1:0]        size,
        input logic [DATA_IN_WIDTH-1:0]     data,
        output logic                        done,
        output logic                        ready,
        input  logic                        dram_ready,      
        output logic                        dram_wr_en,
        output logic [ADDR_WIDTH-1:0]       dram_wr_addr,
        output logic [OUTPUT_WIDTH-1:0]     dram_wr_data,
        input logic                         dram_wr_pending
    );
    
    // Create state types and signals
    typedef enum {S_SRC_READY, S_SRC_WAIT_FOR_ACK, S_SRC_RESET_ACK} handshake_src_state_type;
    typedef enum {S_DEST_READY, S_DEST_SEND_ACK, S_DEST_RESET_ACK} handshake_dest_state_type;
    typedef enum {IDLE, ACTIVE} state_active_type;
    
    handshake_src_state_type    state_src;
    handshake_dest_state_type   state_dest;
    state_active_type           state_active;
    
    // Metastability signals for addr_gen
    logic send_src_r; // Send from src
    logic ack_dest_r; // ack from dest
    
    logic [1:0] send_src_in_dst_r;  // signal from src in dest domain
    logic [1:0] ack_dest_in_src_r; // signal from dest in src domain
    
    logic [SIZE_WIDTH-1:0] src_size_r;          // Size register in src domain (User) 
    logic [ADDR_WIDTH-1:0] src_address_start_r; // Address_start register in src domain (User)
    logic                  src_go_r;            // Go signal from src (user) domain
    
    logic [SIZE_WIDTH-1:0] dest_size_r;          // Size register in src domain (User) 
    logic [ADDR_WIDTH-1:0] dest_address_start_r; // Address_start register in src domain (User)
    logic                  dest_go_r;            // Go signal from src (user) domain
    logic [SIZE_WIDTH-1:0] word_size;

    // Addr_gen signals
    logic addr_gen_en;
    logic addr_done;
    
    // Fifo Signals
    // logic FIFO_Program_Full;
    logic                     FIFO_wr_en;
    logic                     FIFO_FULL;
    logic                     FIFO_empty;
    logic                     FIFO_rd_en;
    logic                     FIFO_wr_rst_busy;
    logic                     FIFO_rd_rst_busy;
    logic [DATA_IN_WIDTH-1:0] FIFO_Data;
    logic [OUTPUT_WIDTH-1:0]  FIFO_FLIPPED_Data;
    
    // Size counter signals
    logic       counter_done;
    logic [1:0] dram_wr_pending_dest;
    logic [1:0] empty_dest;
    logic       dram_wr_pending_src;
    logic       empty_src;
    logic       wait_done;
    logic [SIZE_WIDTH-1:0] size_count;

    
    // size conversion \\
    always@(size) begin
        if(size[0]) begin
            // size is odd
            word_size = (size >> 1)+1;
        end 
        else begin
            // size is even
            word_size = (size >> 1);
        end
    end;
    
    // Source Domain (user domain (user_clk)) \\
    always@(posedge(user_clk)) begin
        if(user_rst) begin
            state_src           <= S_SRC_READY;
            send_src_r          <= '0;
            src_size_r          <= '0;
            src_address_start_r <= '0;
            src_go_r            <= '0;
        end
        else begin
            ack_dest_in_src_r[1]    <= ack_dest_r;
            ack_dest_in_src_r[0]    <= ack_dest_in_src_r[1];
            
            dram_wr_pending_dest[1] <= dram_wr_pending; //dram_wr_pending_src;
            dram_wr_pending_dest[0] <= dram_wr_pending_dest[1];
            
            empty_dest[1] <= FIFO_empty; //empty_src;
            empty_dest[0] <= empty_dest[1];
            
            case(state_src)
                S_SRC_READY : begin
                    if(go) begin
                        send_src_r <= '1;
                        state_src  <= S_SRC_WAIT_FOR_ACK;
                        src_size_r <= word_size;
                        src_address_start_r <= start_addr;
                        src_go_r <= go;
                    end
                    else if(src_go_r != go) begin
                        src_go_r <= go;          
                        send_src_r <= '1;
                        state_src  <= S_SRC_WAIT_FOR_ACK;
                    end
                end
                S_SRC_WAIT_FOR_ACK : begin
                    if (ack_dest_in_src_r[0] == '1) begin
                        send_src_r <= '0;
                        state_src  <= S_SRC_RESET_ACK;
                    end
                end
                S_SRC_RESET_ACK : begin
                    if (ack_dest_in_src_r[0] == '0) begin
                        state_src <= S_SRC_READY;
                    end
                end
            endcase;
        end;
    end;
    
    // Destination Domain (DRAM)(dram_clk) \\
    always@(posedge(dram_clk)) begin
        if (dram_rst == '1) begin
            state_dest <= S_DEST_READY;
            dest_size_r <= '0;
            dest_address_start_r <= '0;
            dest_go_r <= '0;
            ack_dest_r <= '0;
        end
        else begin
            send_src_in_dst_r[1] <= send_src_r;
            send_src_in_dst_r[0] <= send_src_in_dst_r[1];
//            empty_src            <= FIFO_empty;
//            dram_wr_pending_src  <= dram_wr_pending;
            case(state_dest)
                S_DEST_READY : begin
                    // if source is sending data, assert rcv (received)
                    if (send_src_in_dst_r[0] == '1) begin
                        dest_size_r <= src_size_r;
                        dest_address_start_r <= src_address_start_r;
                        dest_go_r <= src_go_r;
                        state_dest <= S_DEST_SEND_ACK;
                    end
                end
                S_DEST_SEND_ACK : begin
                    ack_dest_r <= '1;
                    state_dest <= S_DEST_RESET_ACK;
                end
                S_DEST_RESET_ACK : begin
                    // send ack unless it is delayed
                    if (send_src_in_dst_r[0] == 1'b0) begin
                        ack_dest_r <= 1'b0;
                        state_dest <= S_DEST_READY;
                    end
                end
           endcase;
        end
    end; 
    
    assign addr_gen_en = ~FIFO_empty & dram_ready & ~FIFO_rd_rst_busy;
    // FIFO_rd_en <=  NOT FIFO_empty AND dram_ready AND NOT FIFO_rd_rst_busy;
    assign dram_wr_en = FIFO_rd_en;
    
    addr_gen U_Addr_gen_0 (
    .clk(dram_clk),
    .rst(dram_rst),
    .go(dest_go_r),
    .en(addr_gen_en),
    .size(dest_size_r),
    .start_addr(dest_address_start_r),
    .output_addr(dram_wr_addr),
    .addr_valid(FIFO_rd_en),
    .done(addr_done)
    );
    
    dram_wr_FIFO U_fifo_generator_0 (
    .rst(user_rst),
    .wr_clk(user_clk),
    .rd_clk(dram_clk),
    .din(FIFO_Data),
    .wr_en(FIFO_wr_en),
    .rd_en(FIFO_rd_en),
    .dout(FIFO_FLIPPED_Data),
    .full(FIFO_FULL),
    .empty(FIFO_empty),
    .wr_rst_busy(FIFO_wr_rst_busy),
    .rd_rst_busy(FIFO_rd_rst_busy)
    );
    
    //Counter_Done for FIFO (Good for 1 cycle and needs reset (may need to modify))
    always@(posedge(user_clk)) begin
        if(user_rst) begin
            size_count      <= '0;
            counter_done    <= 1'b0;
            state_active    <= IDLE;
        end
        else begin
        FIFO_Data <= data;

        case (state_active)

            IDLE: begin
                wait_done   <= 1'b0;
                FIFO_wr_en  <= 1'b0;
                ready       <= 1'b0;

                if (go) begin
                    counter_done <= 1'b0;
                    size_count   <= '0;
                    state_active <= ACTIVE;
                end
            end

            ACTIVE: begin
                FIFO_wr_en <= wr_en & ~FIFO_FULL & ~FIFO_wr_rst_busy;
                ready      <= ~FIFO_FULL;
                if (FIFO_wr_en && size_count < size) begin
                    size_count <= size_count + 1'b1;
                end
                if (size > 1) begin
                    if (dram_wr_pending_dest[0]) begin
                        wait_done <= 1'b1;
                    end
                end
                else begin
                    wait_done <= 1'b1;
                end
                

                if ((size_count == size) && wait_done) begin
                    if (empty_dest[0] && !dram_wr_pending_dest[0]) begin
                        counter_done <= 1'b1;
                    end
                end

                if (counter_done) begin
                    state_active <= IDLE;
                end
            end

            default: state_active <= IDLE;

        endcase
        end
    end;
    
    assign done = counter_done;
    
    assign dram_wr_data = {FIFO_FLIPPED_Data[15:0], FIFO_FLIPPED_Data[31:16]};
endmodule
