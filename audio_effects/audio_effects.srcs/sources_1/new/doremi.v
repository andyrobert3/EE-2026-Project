`timescale 1ns / 1ps

module doremi(
    input [6:0] notes,
    input CHANGE,
    input CLK,
    output reg [11:0] speaker = 0
    );
    
    reg [7:0] COUNT = 0;
    
    always @ (posedge CLK) begin
        
        if (notes[0] && CHANGE == 0)
            COUNT <= (COUNT == 74) ? 0 : COUNT + 1;
        else if (notes[1] && CHANGE == 0)
            COUNT <= (COUNT == 66) ? 0 : COUNT + 1;
        else if (notes[2] && CHANGE == 0)
            COUNT <= (COUNT == 58) ? 0 : COUNT + 1;
        else if (notes[3] && CHANGE == 0)           
            COUNT <= (COUNT == 54) ? 0 : COUNT + 1;
        else if (notes[4] && CHANGE == 0)
            COUNT <= (COUNT == 48) ? 0 : COUNT + 1;
        else if (notes[5] && CHANGE == 0)
            COUNT <= (COUNT == 42) ? 0 : COUNT + 1;
        else if (notes[6] && CHANGE == 0)
            COUNT <= (COUNT == 38) ? 0 : COUNT + 1;   
        else if (notes[0])
            COUNT = (COUNT == 37) ? 0 : COUNT + 1;
        else if (notes[1])
            COUNT <= (COUNT == 33) ? 0 : COUNT + 1;
        else if (notes[2])
            COUNT <= (COUNT == 29) ? 0 : COUNT + 1;
        else if (notes[3])           
            COUNT <= (COUNT == 27) ? 0 : COUNT + 1;
        else if (notes[4])
            COUNT <= (COUNT == 24) ? 0 : COUNT + 1;
        else if (notes[5])
            COUNT <= (COUNT == 21) ? 0 : COUNT + 1;
        else if (notes[6])
            COUNT <= (COUNT == 19) ? 0 : COUNT + 1;   
      
        speaker = 0;
        // volume is determined by the difference in value between pulse k and pulse k + 1
        speaker <= (COUNT == 0) ? speaker + 750: speaker;
    end 
endmodule

module play_song(
    input ON,
    input CLK,
    output reg [11:0] speaker = 0
    );
    reg [5:0] COUNT = 0;
    reg [21:0] TIMER = 0;
    
    always @ (posedge CLK) begin
        TIMER <= (ON == 0 || TIMER == 230000 ) ? 0 : TIMER + 1;
        
        if (ON && TIMER < 15000)                    
            COUNT <= (COUNT == 37) ? 0 : COUNT + 1; // DO
        else if (ON && TIMER < 20000)
            COUNT <= (COUNT == 33) ? 0 : COUNT + 1; // RE
        else if (ON && TIMER < 35000)
            COUNT <= (COUNT == 29) ? 0 : COUNT + 1;  // MI
        else if (ON && TIMER < 40000)       
            COUNT <= (COUNT == 37) ? 0 : COUNT + 1; // DO
        else if (ON && TIMER < 50000)
            COUNT <= (COUNT == 29) ? 0 : COUNT + 1; // MI
        else if (ON && TIMER < 60000)
            COUNT <= (COUNT == 37) ? 0 : COUNT + 1; // D0
        else if (ON && TIMER < 80000)
            COUNT <= (COUNT == 29) ? 0 : COUNT + 1; // MI
        else if (ON && TIMER < 95000)
            COUNT <= (COUNT == 33) ? 0 : COUNT + 1; // RE
        else if (ON && TIMER < 100000)
            COUNT <= (COUNT == 29) ? 0 : COUNT + 1; // MI
        else if (ON && TIMER < 105000)
            COUNT <= (COUNT == 27) ? 0 : COUNT + 1; // FA
        else if (ON && TIMER < 110000)
            COUNT <= (COUNT == 27) ? 0 : COUNT + 1; // FA
        else if (ON && TIMER < 115000)
            COUNT <= (COUNT == 29) ? 0 : COUNT + 1; // MI
        else if (ON && TIMER < 120000)
            COUNT <= (COUNT == 33) ? 0 : COUNT + 1; // RE
        else if (ON && TIMER < 140000)
            COUNT <= (COUNT == 27) ? 0 : COUNT + 1; // 
        else if (ON && TIMER < 155000)
            COUNT <= (COUNT == 29) ? 0 : COUNT + 1; // 
        else if (ON && TIMER < 160000)
            COUNT <= (COUNT == 27) ? 0 : COUNT + 1; // 
        else if (ON && TIMER < 175000)
            COUNT <= (COUNT == 24) ? 0 : COUNT + 1; //
        else if (ON && TIMER < 180000)
            COUNT <= (COUNT == 29) ? 0 : COUNT + 1;
        else if (ON && TIMER < 190000)
            COUNT <= (COUNT == 24) ? 0 : COUNT + 1;
        else if (ON && TIMER < 200000)
            COUNT <= (COUNT == 29) ? 0 : COUNT + 1;
        else if (ON && TIMER < 220000)
            COUNT <= (COUNT == 24) ? 0 : COUNT + 1;
        
        
        speaker = 0;
        // volume is determined by the difference in value between pulse k and pulse k + 1
        speaker <= (COUNT == 0) ? speaker + 750: speaker;
    end
endmodule     