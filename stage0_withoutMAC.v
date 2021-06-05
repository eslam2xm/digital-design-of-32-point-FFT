`timescale 1ns / 1ps
/***************************************************************************
* This module implements the firs stage of butterfly diagram.
* This stage is the simplest one because it just add/sub 2 inputs.
* We dont have to use sharedComplexMUL.v because here the input is real ..
and integer which means that we dont have any decimal point and imaginary part ..
would be discarded, so we are using adders/subtractors here to provide better ..
utilization and performance.
****************************************************************************/
module stage0_withoutMAC#(parameter p_inputWidth = 8,
                          parameter p_PointPosition = 0
                          )
                          (
                          input CLK,RST,
                         ///// input signedS \\\\\
                          input signed [p_inputWidth-1 : 0] i_x0,
                          input signed [p_inputWidth-1 : 0] i_x1,
                          input signed [p_inputWidth-1 : 0] i_x2,
                          input signed [p_inputWidth-1 : 0] i_x3,
                          input signed [p_inputWidth-1 : 0] i_x4,
                          input signed [p_inputWidth-1 : 0] i_x5,
                          input signed [p_inputWidth-1 : 0] i_x6,
                          input signed [p_inputWidth-1 : 0] i_x7,
                          input signed [p_inputWidth-1 : 0] i_x8,
                          input signed [p_inputWidth-1 : 0] i_x9,
                          input signed [p_inputWidth-1 : 0] i_x10,
                          input signed [p_inputWidth-1 : 0] i_x11,
                          input signed [p_inputWidth-1 : 0] i_x12,
                          input signed [p_inputWidth-1 : 0] i_x13,
                          input signed [p_inputWidth-1 : 0] i_x14,
                          input signed [p_inputWidth-1 : 0] i_x15,
                          input signed [p_inputWidth-1 : 0] i_x16,
                          input signed [p_inputWidth-1 : 0] i_x17,
                          input signed [p_inputWidth-1 : 0] i_x18,
                          input signed [p_inputWidth-1 : 0] i_x19,
                          input signed [p_inputWidth-1 : 0] i_x20,
                          input signed [p_inputWidth-1 : 0] i_x21,
                          input signed [p_inputWidth-1 : 0] i_x22,
                          input signed [p_inputWidth-1 : 0] i_x23,
                          input signed [p_inputWidth-1 : 0] i_x24,
                          input signed [p_inputWidth-1 : 0] i_x25,
                          input signed [p_inputWidth-1 : 0] i_x26,
                          input signed [p_inputWidth-1 : 0] i_x27,
                          input signed [p_inputWidth-1 : 0] i_x28,
                          input signed [p_inputWidth-1 : 0] i_x29,
                          input signed [p_inputWidth-1 : 0] i_x30,
                          input signed [p_inputWidth-1 : 0] i_x31,
                          ///// OUTPUTS \\\\\
                          output signed [p_inputWidth : 0] o_a0,
                          output signed [p_inputWidth : 0] o_a1,
                          output signed [p_inputWidth : 0] o_a2,
                          output signed [p_inputWidth : 0] o_a3,
                          output signed [p_inputWidth : 0] o_a4,
                          output signed [p_inputWidth : 0] o_a5,
                          output signed [p_inputWidth : 0] o_a6,
                          output signed [p_inputWidth : 0] o_a7,
                          output signed [p_inputWidth : 0] o_a8,
                          output signed [p_inputWidth : 0] o_a9,
                          output signed [p_inputWidth : 0] o_a10,
                          output signed [p_inputWidth : 0] o_a11,
                          output signed [p_inputWidth : 0] o_a12,
                          output signed [p_inputWidth : 0] o_a13,
                          output signed [p_inputWidth : 0] o_a14,
                          output signed [p_inputWidth : 0] o_a15,
                          output signed [p_inputWidth : 0] o_a16,
                          output signed [p_inputWidth : 0] o_a17,
                          output signed [p_inputWidth : 0] o_a18,
                          output signed [p_inputWidth : 0] o_a19,
                          output signed [p_inputWidth : 0] o_a20,
                          output signed [p_inputWidth : 0] o_a21,
                          output signed [p_inputWidth : 0] o_a22,
                          output signed [p_inputWidth : 0] o_a23,
                          output signed [p_inputWidth : 0] o_a24,
                          output signed [p_inputWidth : 0] o_a25,
                          output signed [p_inputWidth : 0] o_a26,
                          output signed [p_inputWidth : 0] o_a27,
                          output signed [p_inputWidth : 0] o_a28,
                          output signed [p_inputWidth : 0] o_a29,
                          output signed [p_inputWidth : 0] o_a30,
                          output signed [p_inputWidth : 0] o_a31
                  );
                  
                  assign o_a0 = i_x0 + i_x1 ;
                  assign o_a1 = i_x0 - i_x1 ;
                  
                  assign o_a2 = i_x2 + i_x3 ;
                  assign o_a3 = i_x2 - i_x3 ;
                  
                  assign o_a4 = i_x4 + i_x5 ;
                  assign o_a5 = i_x4 - i_x5 ;
                  
                  assign o_a6 = i_x6 + i_x7 ;
                  assign o_a7 = i_x6 - i_x7 ;
                  
                  assign o_a8 = i_x8 + i_x9 ;
                  assign o_a9 = i_x8 - i_x9 ;
                  
                  assign o_a10 = i_x10 + i_x11 ;
                  assign o_a11 = i_x10 - i_x11 ;
                  
                  assign o_a12 = i_x12 + i_x13 ;
                  assign o_a13 = i_x12 - i_x13 ;
                  
                  assign o_a14 = i_x14 + i_x15 ;
                  assign o_a15 = i_x14 - i_x15 ;
                  
                  assign o_a16 = i_x16 + i_x17 ;
                  assign o_a17 = i_x16 - i_x17 ;
                  
                  assign o_a18 = i_x18 + i_x19 ;
                  assign o_a19 = i_x18 - i_x19 ;
                  
                  assign o_a20 = i_x20 + i_x21 ;
                  assign o_a21 = i_x20 - i_x21 ;
                  
                  assign o_a22 = i_x22 + i_x23 ;
                  assign o_a23 = i_x22 - i_x23 ;
                  
                  assign o_a24 = i_x24 + i_x25 ;
                  assign o_a25 = i_x24 - i_x25 ;
                  
                  assign o_a26 = i_x26 + i_x27 ;
                  assign o_a27 = i_x26 - i_x27 ;
                  
                  assign o_a28 = i_x28 + i_x29 ;
                  assign o_a29 = i_x28 - i_x29 ;
                  
                  assign o_a30 = i_x30 + i_x31 ;
                  assign o_a31 = i_x30 - i_x31 ;
                  
endmodule
