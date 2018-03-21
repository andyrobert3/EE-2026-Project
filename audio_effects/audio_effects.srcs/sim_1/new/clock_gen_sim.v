`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2018 03:04:07 PM
// Design Name: 
// Module Name: clock_gen_sim
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


module clock_gen_sim(

    );
    
    reg CLK = 0;
    wire CLK_20K, CLK_50M;
    
    always begin 
        CLK = ~CLK; #5;
    end    
    
    clock_gen dut0 (CLK, CLK_20K, CLK_50M);
    
endmodule
