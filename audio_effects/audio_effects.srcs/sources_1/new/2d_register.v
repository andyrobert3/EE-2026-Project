`timescale 1ns / 1ps

// 1-second delay
module twoD_register(
        input ON,
        input clk_write,
        input clk_read,
        input [11:0] data_in,
        output reg [11:0] data_out
    );
    
    // Distance between j and i determines time delay
    // Instead of reading 20 thousand spaces behind writing,
    // reading is put 1 space in front of writing in a 20 000 space
    // circular buffer to create a distance of 20 000 spaces with
    // minimal memory usage
    
    reg [11:0] memory [0:20000];
    
    reg [14:0] i = 0;
    reg [14:0] j = 1;
    reg a = 0;
    
    always @ (ON) begin
        if (ON)
            a <= 1;
        else
            a <= 0;
    end
    
    always @ (posedge clk_write) begin
        memory[i] <= data_in;
        i <= (i == 20000) ? 0: i + 1;
    end
    
    always @ (posedge clk_read) begin
        data_out <= memory[j];
        j <= (j == 20000) ? 0: j + a;
    end        
endmodule




// Record 5-second audio
module record(
        input clk,
        input ON,
        input [11:0] data_in,
        output reg [11:0] data_out
    );
    
    // Distance between j and i determines time delay
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