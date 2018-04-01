`timescale 1ns / 1ps
// Clock divider for 3 new clocks

module clock_gen(
    input CLK,
    output reg NEW_CLK_10K,
    output reg NEW_CLK_20K,
    output reg NEW_CLK_50M
    );
    
    reg [20:0] COUNT = 0;
    reg [20:0] COUNT1 = 0;
    reg        COUNT2 = 0;
    
    initial begin
        NEW_CLK_50M = 0;
        NEW_CLK_20K = 0;
        NEW_CLK_10K = 0;
    end
    
    always @(posedge CLK) begin
        COUNT1 <= (COUNT == 4999) ? 0 : COUNT1 + 1;
        COUNT2 <= COUNT2 + 1;
        COUNT <= (COUNT == 2499) ? 0 : COUNT + 1;
        
        NEW_CLK_10K <= (COUNT1 == 0) ? ~NEW_CLK_10K : NEW_CLK_10K;
        NEW_CLK_20K <= (COUNT == 0) ? ~NEW_CLK_20K : NEW_CLK_20K;    
        NEW_CLK_50M <= COUNT2;
    end

endmodule
