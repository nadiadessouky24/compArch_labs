`define IDLE 2'b00
`define READING 2'b01
`define WRITING 2'b10

module DataCacheController(
    input rst,
    input clk,
    input MemRead,
    input MemWrite,
    input MsReady,
    input [4:0] index,
    input [2:0] tag,
    output reg stall,
    output reg fill,
    output reg update,
    output reg MsRead
    );
   
    reg [2:0] tags [0:31];
    reg valid_bits [0:31];
    reg [1:0] state;
    reg [1:0] next_state;
   
    integer i;
    initial begin
        state = `IDLE;
        stall = 0;
        fill = 0;
        update = 0;
        MsRead = 0;
        for(i=0; i<32; i=i+1) begin
         valid_bits[i] = 1'b0;
         tags[i] = 3'b0;
        end
    end
   
    wire hit = (valid_bits[index] == 1 && tags[index] == tag);
   
    always@(*) begin
        if(rst)
        begin
         next_state = `IDLE;
         update = 0;
         fill = 0;
         stall = 0;
         MsRead = 0;

         end
        else begin
            case(state)
                `IDLE: begin
                    fill = 1'b0;
                    if(MemRead) begin
                        update = 0;
                        if(hit) begin // hit
                            next_state = state;
                            stall = 1'b0;
                            MsRead = 1'b0;
                        end
                        else begin
                            stall = 1'b1;
                            MsRead = 1'b1;
                            next_state = `READING;
                        end
                    end
                    else if (MemWrite) begin
                        MsRead = 0;
                        stall = 1'b1;
                        if(hit) update = 1'b1;
                        else update = 0;
                        next_state = `WRITING;
                    end
                    else begin
                        next_state = state;
                        stall = 0;
                        update = 0;
                        MsRead = 0;
                    end
                 end
                `READING: begin
                    if(!MsReady) begin
                        next_state = state;
                        if(hit) update = 1'b1;
                        else update = 0;
                        fill = 0;
                        stall = 1;
                        MsRead = 1;
                    end
                    else begin
                        fill = 1'b1;
                        valid_bits[index] = 1'b1;
                        tags[index] = tag;
                        update = 0;
                        MsRead = 1'b0;
                        stall = 1'b1;
                        next_state = `IDLE;
                    end
                end
                `WRITING: begin
                    if(!MsReady)begin
                        next_state = state;
                        if(hit) update = 1'b1;
                        else update = 0;
                        fill = 0;
                        stall = 1;
                        MsRead = 0;
                    end
                    else begin
                        stall = 1'b1;
                        update = 1'b0;
                        next_state = `IDLE;
                        fill = 1'b0;
                        MsRead = 0;
                    end
                end
                default:begin
                next_state = `IDLE;
                update = 0;
                fill = 0;
                stall = 0;
                MsRead = 0;
               
               
               
               
                end
            endcase
        end
    end
   
    always@(posedge clk) begin
        state = next_state;
    end

endmodule
