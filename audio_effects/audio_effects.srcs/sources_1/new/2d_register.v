`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2018 11:49:18 AM
// Design Name: 
// Module Name: 2d_register
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

module twoD_register(
        input clk_write,
        input clk_read,
        input [11:0] data_in,
        output reg [11:0] data_out
    );
    
    // distance between j and i determines time delay
    // pitch is determined by clock
    reg [11:0] memory [0:20000];
    
    reg [14:0] i = 0;
    reg [14:0] j = 1;
    
    always @ (posedge clk_write) begin
        memory[i] <= data_in;
        i <= (i == 20000) ? 0: i + 1;
    end
    
    always @ (posedge clk_read) begin
        data_out <= memory[j];
        j <= (j == 20000) ? 0: j + 1;
    end
        
endmodule

module record(
        input clk,
        input ON,
        input [11:0] data_in,
        output reg [11:0] data_out
    );
    
    // distance between j and i determines time delay
    // pitch is determined by clock
    reg [11:0] memory [0:100000];
    
    reg [17:0] i = 0;
    reg [17:0] j = 0;
    
    always @ (posedge clk) begin
        if (ON == 1) begin
        // begin recording
            j <= 0;
            memory[i] <= data_in;
            i <= (i == 100000) ? i: i + 1;
        end else begin
        // play the recorded tune
            i <= 0;
            data_out <= memory[j];
            j <= (j == 100000) ? 0: j + 1;
        end
    end 
endmodule