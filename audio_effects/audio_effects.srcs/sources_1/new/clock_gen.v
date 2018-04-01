`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2018 02:51:42 PM
// Design Name: 
// Module Name: clock_gen
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
    
    // 5000 ratio between 100M to 20K
    always @(posedge CLK) begin
        COUNT1 <= (COUNT == 4999) ? 0 : COUNT1 + 1;
        COUNT2 <= COUNT2 + 1;
        COUNT <= (COUNT == 2499) ? 0 : COUNT + 1;
        NEW_CLK_10K <= (COUNT1 == 0) ? ~NEW_CLK_10K : NEW_CLK_10K;
        NEW_CLK_20K <= (COUNT == 0) ? ~NEW_CLK_20K : NEW_CLK_20K;    
        NEW_CLK_50M <= COUNT2;
    end

endmodule
