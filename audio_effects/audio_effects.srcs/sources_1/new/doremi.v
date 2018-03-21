`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2018 02:29:12 PM
// Design Name: 
// Module Name: doremi
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


module doremi(
    input [6:0] notes,
    input CLK,
    output reg [11:0] speaker = 0
    );
    
    reg [20:0] COUNT = 0;
    
    always @ (posedge CLK) begin
        case(notes)
            notes[0]: COUNT <= (COUNT == 37) ? 0 : COUNT + 1;
            notes[1]: COUNT <= (COUNT == 33) ? 0 : COUNT + 1;
            notes[2]: COUNT <= (COUNT == 29) ? 0 : COUNT + 1;           
            notes[3]: COUNT <= (COUNT == 27) ? 0 : COUNT + 1;
            notes[4]: COUNT <= (COUNT == 24) ? 0 : COUNT + 1;
            notes[5]: COUNT <= (COUNT == 21) ? 0 : COUNT + 1;
            notes[6]: COUNT <= (COUNT == 19) ? 0 : COUNT + 1;    
            //default: COUNT <= COUNT;
        endcase

        speaker = 0;
        
        // volume is determined by the difference in value between pulse k and pulse k + 1
        speaker <= (COUNT == 0) ? speaker + 750: speaker;
    end 
    
        
endmodule
