`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2018 12:49:30 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
    input CLK,
    output reg SLOW_CLOCK
    );
    
    initial begin
        SLOW_CLOCK = 0;
    end
    
    reg [25:0] COUNT = 0;
    
    always @(posedge CLK) begin
        COUNT <= (COUNT == 49999999) ? 0: COUNT + 1;
        SLOW_CLOCK <= (COUNT == 0) ? ~SLOW_CLOCK : SLOW_CLOCK;
    end
        
    
endmodule
