`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// AY 17/18 Sem-2 EE2026 Project
// Project Name     : Audio Effects
// Module Name      : AUDIO_FX_TOP
// Team No.         : Wednesday Group 17
// Student Names    : James Arista Yaputra, Matthew Alexander
// Matric No.       : A0170761H(James) , A0170903L(Matthew)
// Description      : EE2026 Real-time Audio Effects FPGA Design Project
//                    Features included
//                    - Audio delay + pitch shift
//                    - Musical instrument + octave selector
//
//                    Extra features
//                    - Play "Do Re Mi" - The Sound of Music
//                    - 5-second Audio Recorder
// 
// Work Distribution: James Arista Yaputra -> Musical Instrument + improvement
//                    Matthew Alexander    -> Audio Delay + improvement
//////////////////////////////////////////////////////////////////////////////////

module AUDIO_FX_TOP(
    input CLK,            // 100MHz FPGA clock
    input [6:0] sw,       // Switches for musical notes
    input [4:0] state,    // Switches to select features

    input  J_MIC3_Pin3,   // PmodMIC3 audio input data (serial)
    output J_MIC3_Pin1,   // PmodMIC3 chip select, 20kHz sampling clock
    output J_MIC3_Pin4,   // PmodMIC3 serial clock (generated by module SPI.v)

    output J_DA2_Pin1,    // PmodDA2 sampling clock (generated by module DA2RefComp.vhd)
    output J_DA2_Pin2,    // PmodDA2 Data_A, 12-bit speaker output (generated by module DA2RefComp.vhd)
    output J_DA2_Pin3,    // PmodDA2 Data_B, not used (generated by module DA2RefComp.vhd)
    output J_DA2_Pin4,    // PmodDA2 serial clock, 50MHz clock
    output [11:0] led     // LED Array
    );


    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //Clock Divider Module: Generate necessary clocks from 100MHz FPGA CLK
    wire clk_10k;
    wire clk_20k;
    wire clk_50M;    
    wire clk_2;
    wire [11:0] MIC_in;
    
    clock_gen cg (CLK, clk_10k, clk_20k, clk_50M);
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //SPI Module: Converting serial data into a 12-bit parallel register
    SPI u1 (CLK, clk_20k, J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, MIC_in);


    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //Real-time Audio Effect Features  
    wire [11:0] speaker_out1, speaker_out2, speaker_out3, speaker_out4;
    reg  [11:0] speaker_out;

    doremi u4(sw, state[4], clk_20k, speaker_out1);             // Musical Instrument + octave selector (musical instrument improvement)
                                                                // state[4] switch to select octave
                                                                
    play_song u6(state[4], clk_20k, speaker_out2);              // Play "Do Re Mi" - The Sound of Music (extra feature)
                                                                // state[4] switch to stop and start song
                                                                
    twoD_register u7(state[4], clk_20k, clk_20k, MIC_in, speaker_out3);   // Audio delay
    
    
    record u5(clk_20k, state[4], MIC_in, speaker_out4);         // Record audio (delay improvement)
                                                                // state[4] switch to start and stop recording
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Always block for feature selection
    always @ (state[0], state[1], state[2]) begin
      if (state[0])                       // Musical Instrument + improvement
          speaker_out <= speaker_out1;
          
      else if (state[1])                  // Play Song
          speaker_out <= speaker_out2;
          
      else if (state[2])                  // Delay + pitch shift
          speaker_out <= speaker_out3;
          
      else if (state[3])                  // Record audio
          speaker_out <= speaker_out4;
          
      else if (state == 5'b00000)         // Real-time signal
          speaker_out <= MIC_in;
    end
    
    // Assigning speaker_out 12-bit value to LED array for visualization of audio
    assign led = speaker_out;


    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //DAC Module: Digital-to-Analog Conversion     
    DA2RefComp u2(clk_50M, clk_20k, speaker_out, ,1'b0, J_DA2_Pin2, J_DA2_Pin3, J_DA2_Pin4, J_DA2_Pin1);
   
endmodule
