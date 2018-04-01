`timescale 1ns / 1ps

// Musical Instrument
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
        
        // To induce smoother sound
        speaker = 0;
        
        // Volume is determined by the difference in value between pulse k and pulse k + 1
        speaker <= (COUNT == 0) ? speaker + 750: speaker;
    end 
endmodule




// Play Do Re Mi
module play_song(
    input ON,
    input CLK,
    output reg [11:0] speaker = 0
    );
    reg [5:0] COUNT = 0;
    reg [22:0] TIMER = 0;
    
    always @ (posedge CLK) begin
        TIMER <= (ON == 0 || TIMER == 725000 ) ? 0 : TIMER + 1;
        
        if (ON && TIMER < 15000)                    
            COUNT <= (COUNT == 37) ? 0 : COUNT + 1; // DO
        else if (ON && TIMER < 20000)
            COUNT <= (COUNT == 33) ? 0 : COUNT + 1; // RE
        else if (ON && TIMER < 35000)
            COUNT <= (COUNT == 29) ? 0 : COUNT + 1; // MI
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
        else if (ON && TIMER < 160000)
            COUNT <= (COUNT == 27) ? 0 : COUNT + 1; // FA
        
        else if (ON && TIMER < 175000)
            COUNT <= (COUNT == 29) ? 0 : COUNT + 1; // MI
        else if (ON && TIMER < 180000)
            COUNT <= (COUNT == 27) ? 0 : COUNT + 1; // FA
        else if (ON && TIMER < 195000)
            COUNT <= (COUNT == 24) ? 0 : COUNT + 1; // SOL
        else if (ON && TIMER < 200000)
            COUNT <= (COUNT == 29) ? 0 : COUNT + 1; // MI
        else if (ON && TIMER < 210000)
            COUNT <= (COUNT == 24) ? 0 : COUNT + 1; // SOL
        else if (ON && TIMER < 220000)
            COUNT <= (COUNT == 29) ? 0 : COUNT + 1; // MI
        else if (ON && TIMER < 240000)
            COUNT <= (COUNT == 24) ? 0 : COUNT + 1; // SOL
        
        else if (ON && TIMER < 255000)
            COUNT <= (COUNT == 27) ? 0 : COUNT + 1; // FA
        else if (ON && TIMER < 260000)
            COUNT <= (COUNT == 24) ? 0 : COUNT + 1; // SOL
        else if (ON && TIMER < 265000)
            COUNT <= (COUNT == 21) ? 0 : COUNT + 1; // LA
        else if (ON && TIMER < 270000)
            COUNT <= (COUNT == 21) ? 0 : COUNT + 1; // LA
        else if (ON && TIMER < 275000)
            COUNT <= (COUNT == 24) ? 0 : COUNT + 1; // SOL
        else if (ON && TIMER < 280000)
            COUNT <= (COUNT == 27) ? 0 : COUNT + 1; // FA
        else if (ON && TIMER < 320000)
            COUNT <= (COUNT == 21) ? 0 : COUNT + 1; // LA
                  
        else if (ON && TIMER < 335000)
            COUNT <= (COUNT == 24) ? 0 : COUNT + 1; // SOL
        else if (ON && TIMER < 340000)
            COUNT <= (COUNT == 37) ? 0 : COUNT + 1; // DO
        else if (ON && TIMER < 345000)
            COUNT <= (COUNT == 33) ? 0 : COUNT + 1; // RE
        else if (ON && TIMER < 350000)
            COUNT <= (COUNT == 29) ? 0 : COUNT + 1; // MI
        else if (ON && TIMER < 355000)
            COUNT <= (COUNT == 27) ? 0 : COUNT + 1; // FA
        else if (ON && TIMER < 360000)
            COUNT <= (COUNT == 24) ? 0 : COUNT + 1; // SOL
        else if (ON && TIMER < 400000)
            COUNT <= (COUNT == 21) ? 0 : COUNT + 1; // LA

        else if (ON && TIMER < 415000)
            COUNT <= (COUNT == 21) ? 0 : COUNT + 1; // LA
        else if (ON && TIMER < 420000)
            COUNT <= (COUNT == 33) ? 0 : COUNT + 1; // RE
        else if (ON && TIMER < 425000)
            COUNT <= (COUNT == 29) ? 0 : COUNT + 1; // MI
        else if (ON && TIMER < 430000)
            COUNT <= (COUNT == 27) ? 0 : COUNT + 1; // FA
        else if (ON && TIMER < 435000)
            COUNT <= (COUNT == 24) ? 0 : COUNT + 1; // SOL
        else if (ON && TIMER < 440000)
            COUNT <= (COUNT == 21) ? 0 : COUNT + 1; // LA
        else if (ON && TIMER < 480000)
            COUNT <= (COUNT == 19) ? 0 : COUNT + 1; // TI

        else if (ON && TIMER < 495000)
            COUNT <= (COUNT == 19) ? 0 : COUNT + 1; // TI
        else if (ON && TIMER < 500000)
            COUNT <= (COUNT == 29) ? 0 : COUNT + 1; // MI
        else if (ON && TIMER < 505000)
            COUNT <= (COUNT == 27) ? 0 : COUNT + 1; // FA
        else if (ON && TIMER < 510000)
            COUNT <= (COUNT == 24) ? 0 : COUNT + 1; // SOL
        else if (ON && TIMER < 515000)
            COUNT <= (COUNT == 21) ? 0 : COUNT + 1; // LA
        else if (ON && TIMER < 520000)
            COUNT <= (COUNT == 19) ? 0 : COUNT + 1; // TI
        else if (ON && TIMER < 560000)
            COUNT <= (COUNT == 18) ? 0 : COUNT + 1; // DO^

        else if (ON && TIMER < 565000)
            COUNT <= (COUNT == 18) ? 0 : COUNT + 1; // DO^
        else if (ON && TIMER < 570000)
            COUNT <= (COUNT == 19) ? 0 : COUNT + 1; // TI
        else if (ON && TIMER < 580000)
            COUNT <= (COUNT == 21) ? 0 : COUNT + 1; // LA
        else if (ON && TIMER < 590000)
            COUNT <= (COUNT == 27) ? 0 : COUNT + 1; // FA
        else if (ON && TIMER < 600000)
            COUNT <= (COUNT == 19) ? 0 : COUNT + 1; // TI
        else if (ON && TIMER < 610000)
            COUNT <= (COUNT == 24) ? 0 : COUNT + 1; // SOL
        else if (ON && TIMER < 620000)
            COUNT <= (COUNT == 18) ? 0 : COUNT + 1; // DO^
        else if (ON && TIMER < 630000)
            COUNT <= (COUNT == 24) ? 0 : COUNT + 1; // SOL
        else if (ON && TIMER < 640000)
            COUNT <= (COUNT == 29) ? 0 : COUNT + 1; // MI
        else if (ON && TIMER < 650000)
            COUNT <= (COUNT == 37) ? 0 : COUNT + 1; // DO

        else if (ON && TIMER < 655000)
            COUNT <= (COUNT == 37) ? 0 : COUNT + 1; // DO
        else if (ON && TIMER < 660000)
            COUNT <= (COUNT == 33) ? 0 : COUNT + 1; // RE
        else if (ON && TIMER < 665000)
            COUNT <= (COUNT == 29) ? 0 : COUNT + 1; // MI
        else if (ON && TIMER < 670000)
            COUNT <= (COUNT == 27) ? 0 : COUNT + 1; // FA
        else if (ON && TIMER < 675000)
            COUNT <= (COUNT == 24) ? 0 : COUNT + 1; // SOL
        else if (ON && TIMER < 680000)
            COUNT <= (COUNT == 21) ? 0 : COUNT + 1; // LA
        else if (ON && TIMER < 685000)
            COUNT <= (COUNT == 19) ? 0 : COUNT + 1; // TI 
        else if (ON && TIMER < 695000)
            COUNT <= (COUNT == 18) ? 0 : COUNT + 1; // DO^
        else if (ON && TIMER < 705000)
            COUNT <= (COUNT == 24) ? 0 : COUNT + 1; // SOL
        else if (ON && TIMER < 715000)
            COUNT <= (COUNT == 18) ? 0 : COUNT + 1; // DO^
 
        speaker = 0;
        
        // Volume is determined by the difference in value between pulse k and pulse k + 1
        speaker <= (COUNT == 0) ? speaker + 750: speaker;
    end
endmodule     