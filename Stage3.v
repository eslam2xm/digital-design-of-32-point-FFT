`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2021 12:43:10 PM
// Design Name: 
// Module Name: Stage3
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


module Stage3 #(    parameter p_inputBits=16,
                    parameter p_outputBits=20,
                    parameter p_widdleBits=4
            )
            (   
                
                ///// clock and reset ///////
                input   CLK,
                input   RST,
                //// inputs to the stage //////////
                input   [p_inputBits-1:0]  i_c0  ,
                input   [p_inputBits-1:0]  i_c1  ,
                input   [p_inputBits-1:0]  i_c2  ,
                input   [p_inputBits-1:0]  i_c3  ,
                input   [p_inputBits-1:0]  i_c4  ,
                input   [p_inputBits-1:0]  i_c5  ,
                input   [p_inputBits-1:0]  i_c6  ,
                input   [p_inputBits-1:0]  i_c7  ,
                input   [p_inputBits-1:0]  i_c8  ,
                input   [p_inputBits-1:0]  i_c9  ,
                input   [p_inputBits-1:0]  i_c10  ,
                input   [p_inputBits-1:0]  i_c11  ,
                input   [p_inputBits-1:0]  i_c12  ,
                input   [p_inputBits-1:0]  i_c13  ,
                input   [p_inputBits-1:0]  i_c14  ,
                input   [p_inputBits-1:0]  i_c15  ,
                input   [p_inputBits-1:0]  i_c16  ,
                input   [p_inputBits-1:0]  i_c17  ,
                input   [p_inputBits-1:0]  i_c18  ,
                input   [p_inputBits-1:0]  i_c19  ,
                input   [p_inputBits-1:0]  i_c20  ,
                input   [p_inputBits-1:0]  i_c21  ,
                input   [p_inputBits-1:0]  i_c22  ,
                input   [p_inputBits-1:0]  i_c23  ,
                input   [p_inputBits-1:0]  i_c24  ,
                input   [p_inputBits-1:0]  i_c25  ,
                input   [p_inputBits-1:0]  i_c26  ,
                input   [p_inputBits-1:0]  i_c27  ,
                input   [p_inputBits-1:0]  i_c28  ,
                input   [p_inputBits-1:0]  i_c29  ,
                input   [p_inputBits-1:0]  i_c30  ,
                input   [p_inputBits-1:0]  i_c31  ,
                ////// Outputs from the stage ///////
                output  [p_outputBits-1:0]  o_d0  ,
                output  [p_outputBits-1:0]  o_d1  ,
                output  [p_outputBits-1:0]  o_d2  ,
                output  [p_outputBits-1:0]  o_d3  ,
                output  [p_outputBits-1:0]  o_d4  ,
                output  [p_outputBits-1:0]  o_d5  ,
                output  [p_outputBits-1:0]  o_d6  ,
                output  [p_outputBits-1:0]  o_d7  ,
                output  [p_outputBits-1:0]  o_d8  ,
                output  [p_outputBits-1:0]  o_d9  ,
                output  [p_outputBits-1:0]  o_d10  ,
                output  [p_outputBits-1:0]  o_d11  ,
                output  [p_outputBits-1:0]  o_d12  ,
                output  [p_outputBits-1:0]  o_d13  ,
                output  [p_outputBits-1:0]  o_d14  ,
                output  [p_outputBits-1:0]  o_d15  ,
                output  [p_outputBits-1:0]  o_d16  ,
                output  [p_outputBits-1:0]  o_d17  ,
                output  [p_outputBits-1:0]  o_d18  ,
                output  [p_outputBits-1:0]  o_d19  ,
                output  [p_outputBits-1:0]  o_d20  ,
                output  [p_outputBits-1:0]  o_d21  ,
                output  [p_outputBits-1:0]  o_d22  ,
                output  [p_outputBits-1:0]  o_d23  ,
                output  [p_outputBits-1:0]  o_d24  ,
                output  [p_outputBits-1:0]  o_d25  ,
                output  [p_outputBits-1:0]  o_d26  ,
                output  [p_outputBits-1:0]  o_d27  ,
                output  [p_outputBits-1:0]  o_d28  ,
                output  [p_outputBits-1:0]  o_d29  ,
                output  [p_outputBits-1:0]  o_d30  ,
                output  [p_outputBits-1:0]  o_d31  
            );
            
    // Widdles in the stage Real | Imag //
    parameter [p_widdleBits:0] p_W0_16 = 4'b0001 , // 1
                               p_W1_16 = 4'b1000 , // 0.924 + 0.383 J
                               p_W2_16 = 4'b1000 , // 0.707 + 0.707 J
                               p_W3_16 = 4'b1000 , // 0.383 + 0.924 J
                               p_W4_16 = 4'b0000 , // J
                               p_W5_16 = 4'b1000 , // -0.383 + 0.924 J
                               p_W6_16 = 4'b1000 , // -0.707 + 0.707 J
                               p_W7_16 = 4'b1000 ; // -0.924 + 0.383 J
            
 
MAC  #(  .p_inputMacBits(p_inputBits),
            .p_outputMacBits(p_outputBits),
            .p_widdleMacBits(p_widdleBits)  
            )
mac0 (   .CLK(CLK),
        .RST(RST),
        // Input 1
        .MAca0(i_c0),
        .MAca1(i_c1),
        .MAca2(i_c2),
        .MAca3(i_c3),
        // Input 2
        .MAcb0(i_c8),
        .MAcb1(i_c9),
        .MAcb2(i_c10),
        .MAcb3(i_c11),
        // Widdles
        .MAcc0(p_W0_16), 
        .MAcc1(p_W1_16),
        .MAcc2(p_W2_16),
        .MAcc3(p_W3_16),
        // Outputs
        .MAcOut0(o_d0),
        .MAcOut1(o_d8),
        .MAcOut2(o_d1),
        .MAcOut3(o_d9),
        .MAcOut4(o_d2),
        .MAcOut5(o_d10),
        .MAcOut6(o_d3),
        .MAcOut7(o_d11)
);

MAC  #(  .p_inputMacBits(p_inputBits),
            .p_outputMacBits(p_outputBits),
            .p_widdleMacBits(p_widdleBits)  
            )

mac1 (   .CLK(CLK),
        .RST(RST),
        // Input 1
        .MAca0(i_c4),
        .MAca1(i_c5),
        .MAca2(i_c6),
        .MAca3(i_c7),
        // Input 2
        .MAcb0(i_c12),
        .MAcb1(i_c13),
        .MAcb2(i_c14),
        .MAcb3(i_c15),
        // Widdles
        .MAcc0(p_W4_16), 
        .MAcc1(p_W5_16),
        .MAcc2(p_W6_16),
        .MAcc3(p_W7_16),
        // Outputs
        .MAcOut0(o_d4),
        .MAcOut1(o_d12),
        .MAcOut2(o_d5),
        .MAcOut3(o_d13),
        .MAcOut4(o_d6),
        .MAcOut5(o_d14),
        .MAcOut6(o_d7),
        .MAcOut7(o_d15)
);


MAC  #(  .p_inputMacBits(p_inputBits),
            .p_outputMacBits(p_outputBits),
            .p_widdleMacBits(p_widdleBits)  
            )

mac2 (   .CLK(CLK),
        .RST(RST),
        // Input 1
        .MAca0(i_c16),
        .MAca1(i_c17),
        .MAca2(i_c18),
        .MAca3(i_c19),
        // Input 2
        .MAcb0(i_c24),
        .MAcb1(i_c25),
        .MAcb2(i_c26),
        .MAcb3(i_c27),
        // Widdles
        .MAcc0(p_W0_16), 
        .MAcc1(p_W1_16),
        .MAcc2(p_W2_16),
        .MAcc3(p_W3_16),
        // Outputs 
        .MAcOut0(o_d16),
        .MAcOut1(o_d24),
        .MAcOut2(o_d17),
        .MAcOut3(o_d25),
        .MAcOut4(o_d18),
        .MAcOut5(o_d26),
        .MAcOut6(o_d19),
        .MAcOut7(o_d27)
);


MAC  #(  .p_inputMacBits(p_inputBits),
            .p_outputMacBits(p_outputBits),
            .p_widdleMacBits(p_widdleBits)  
            )

mac3 (   .CLK(CLK),
        .RST(RST),
        // Input 1
        .MAca0(i_c20),
        .MAca1(i_c21),
        .MAca2(i_c22),
        .MAca3(i_c23),
        // Input 2
        .MAcb0(i_c28),
        .MAcb1(i_c29),
        .MAcb2(i_c30),
        .MAcb3(i_c31),
        // Widdles
        .MAcc0(p_W4_16), 
        .MAcc1(p_W5_16),
        .MAcc2(p_W6_16),
        .MAcc3(p_W7_16),
        // Outputs
        .MAcOut0(o_d20),
        .MAcOut1(o_d28),
        .MAcOut2(o_d21),
        .MAcOut3(o_d29),
        .MAcOut4(o_d22),
        .MAcOut5(o_d30),
        .MAcOut6(o_d23),
        .MAcOut7(o_d31)
);
            
endmodule
