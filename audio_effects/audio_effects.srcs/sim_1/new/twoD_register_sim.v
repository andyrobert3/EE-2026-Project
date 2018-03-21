`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2018 12:13:07 PM
// Design Name: 
// Module Name: twoD_register_sim
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


module twoD_register_sim(

    );
    
    reg clk_write = 0;
    reg clk_read = 0;
    reg [7:0] data_in = 0;
    wire [7:0] data_out;
    
    always begin
        clk_write = ~clk_write;
        clk_read = ~clk_read;
        #20;     
    end
    
    always begin
        data_in <= (data_in == 255) ? 0: data_in + 1;
        #40;    // make 40*2 = 1 s
    end
    
    twoD_register dut (clk_write, clk_read, data_in, data_out);
    
endmodule
