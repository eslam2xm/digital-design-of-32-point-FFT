`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2021 12:43:10 PM
// Design Name: 
// Module Name: Stage4
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


module Stage4 #(    parameter p_inputBits=16,
                    parameter p_outputBits=20,
                    parameter p_widdleBits=4

            )
            (        
                ///// clock and reset ///////
                input   CLK,
                input   RST,
                //// inputs to the stage //////////
                input   [p_inputBits-1:0]  i_d0  ,
                input   [p_inputBits-1:0]  i_d1  ,
                input   [p_inputBits-1:0]  i_d2  ,
                input   [p_inputBits-1:0]  i_d3  ,
                input   [p_inputBits-1:0]  i_d4  ,
                input   [p_inputBits-1:0]  i_d5  ,
                input   [p_inputBits-1:0]  i_d6  ,
                input   [p_inputBits-1:0]  i_d7  ,
                input   [p_inputBits-1:0]  i_d8  ,
                input   [p_inputBits-1:0]  i_d9  ,
                input   [p_inputBits-1:0]  i_d10  ,
                input   [p_inputBits-1:0]  i_d11  ,
                input   [p_inputBits-1:0]  i_d12  ,
                input   [p_inputBits-1:0]  i_d13  ,
                input   [p_inputBits-1:0]  i_d14  ,
                input   [p_inputBits-1:0]  i_d15  ,
                input   [p_inputBits-1:0]  i_d16  ,
                input   [p_inputBits-1:0]  i_d17  ,
                input   [p_inputBits-1:0]  i_d18  ,
                input   [p_inputBits-1:0]  i_d19  ,
                input   [p_inputBits-1:0]  i_d20  ,
                input   [p_inputBits-1:0]  i_d21  ,
                input   [p_inputBits-1:0]  i_d22  ,
                input   [p_inputBits-1:0]  i_d23  ,
                input   [p_inputBits-1:0]  i_d24  ,
                input   [p_inputBits-1:0]  i_d25  ,
                input   [p_inputBits-1:0]  i_d26  ,
                input   [p_inputBits-1:0]  i_d27  ,
                input   [p_inputBits-1:0]  i_d28  ,
                input   [p_inputBits-1:0]  i_d29  ,
                input   [p_inputBits-1:0]  i_d30  ,
                input   [p_inputBits-1:0]  i_d31  ,
                ////// Outputs from the stage ///////
                output  [p_outputBits-1:0]  o_X0  ,
                output  [p_outputBits-1:0]  o_X1  ,
                output  [p_outputBits-1:0]  o_X2  ,
                output  [p_outputBits-1:0]  o_X3  ,
                output  [p_outputBits-1:0]  o_X4  ,
                output  [p_outputBits-1:0]  o_X5  ,
                output  [p_outputBits-1:0]  o_X6  ,
                output  [p_outputBits-1:0]  o_X7  ,
                output  [p_outputBits-1:0]  o_X8  ,
                output  [p_outputBits-1:0]  o_X9  ,
                output  [p_outputBits-1:0]  o_X10  ,
                output  [p_outputBits-1:0]  o_X11  ,
                output  [p_outputBits-1:0]  o_X12  ,
                output  [p_outputBits-1:0]  o_X13  ,
                output  [p_outputBits-1:0]  o_X14  ,
                output  [p_outputBits-1:0]  o_X15  ,
                output  [p_outputBits-1:0]  o_X16  ,
                output  [p_outputBits-1:0]  o_X17  ,
                output  [p_outputBits-1:0]  o_X18  ,
                output  [p_outputBits-1:0]  o_X19  ,
                output  [p_outputBits-1:0]  o_X20  ,
                output  [p_outputBits-1:0]  o_X21  ,
                output  [p_outputBits-1:0]  o_X22  ,
                output  [p_outputBits-1:0]  o_X23  ,
                output  [p_outputBits-1:0]  o_X24  ,
                output  [p_outputBits-1:0]  o_X25  ,
                output  [p_outputBits-1:0]  o_X26  ,
                output  [p_outputBits-1:0]  o_X27  ,
                output  [p_outputBits-1:0]  o_X28  ,
                output  [p_outputBits-1:0]  o_X29  ,
                output  [p_outputBits-1:0]  o_X30  ,
                output  [p_outputBits-1:0]  o_X31  
            );
            
    // Widdles in the stage Real | Imag // 
    parameter [p_widdleBits:0] p_W0_32 = 4'b0001 , // 1
                               p_W1_32 = 4'b0001 , // 0.981 + 0.195 J
                               p_W2_32 = 4'b1000 , // 0.924 + 0.383 J
                               p_W3_32 = 4'b0001 , // 0.831 + 0.556 J
                               p_W4_32 = 4'b1000 , // 0.707 + 0.707 J
                               p_W5_32 = 4'b0001 , // 0.556 + 0.831 J
                               p_W6_32 = 4'b1000 , // 0.383 + 0.924 J
                               p_W7_32 = 4'b0001 , // 0.195 + 0.981 J
                               p_W8_32 = 4'b0000 , // J
                               p_W9_32 = 4'b0001 , //  -0.195 + 0.981 J
                               p_W10_32 = 4'b1000 , // -0.383 + 0.924 J
                               p_W11_32 = 4'b0001 , // -0.556 + 0.831 J
                               p_W12_32 = 4'b1000 , // -0.707 + 0.707 J
                               p_W13_32 = 4'b0001 , // -0.831 + 0.556 J
                               p_W14_32 = 4'b1000 , // -0.924 + 0.383 J
                               p_W15_32 = 4'b0001 ; // -0.981 +0.195 J
                               
 
MAC  #(  .p_inputMacBits(p_inputBits),
            .p_outputMacBits(p_outputBits),
            .p_widdleMacBits(p_widdleBits)  
            )
mac0 (   .CLK(CLK),
        .RST(RST),
        // Input 1
        .MAca0(i_d0),
        .MAca1(i_d1),
        .MAca2(i_d2),
        .MAca3(i_d3),
        // Input 2
        .MAcb0(i_d16),
        .MAcb1(i_d17),
        .MAcb2(i_d18),
        .MAcb3(i_d19),
        // Widdles
        .MAcc0(p_W0_32), 
        .MAcc1(p_W1_32),
        .MAcc2(p_W2_32),
        .MAcc3(p_W3_32),
        // Outputs
        .MAcOut0(o_X0),
        .MAcOut1(o_X16),
        .MAcOut2(o_X1),
        .MAcOut3(o_X17),
        .MAcOut4(o_X2),
        .MAcOut5(o_X18),
        .MAcOut6(o_X3),
        .MAcOut7(o_X19)
);

MAC  #(  .p_inputMacBits(p_inputBits),
            .p_outputMacBits(p_outputBits),
            .p_widdleMacBits(p_widdleBits)  
            )

mac1 (   .CLK(CLK),
        .RST(RST),
        // Input 1
        .MAca0(i_d4),
        .MAca1(i_d5),
        .MAca2(i_d6),
        .MAca3(i_d7),
        // Input 2
        .MAcb0(i_d20),
        .MAcb1(i_d21),
        .MAcb2(i_d22),
        .MAcb3(i_d23),
        // Widdles
        .MAcc0(p_W4_32), 
        .MAcc1(p_W5_32),
        .MAcc2(p_W6_32),
        .MAcc3(p_W7_32),
        // Outputs
        .MAcOut0(o_X4),
        .MAcOut1(o_X20),
        .MAcOut2(o_X5),
        .MAcOut3(o_X21),
        .MAcOut4(o_X6),
        .MAcOut5(o_X22),
        .MAcOut6(o_X7),
        .MAcOut7(o_X23)
);


MAC  #(  .p_inputMacBits(p_inputBits),
            .p_outputMacBits(p_outputBits),
            .p_widdleMacBits(p_widdleBits)  
            )

mac2 (   .CLK(CLK),
        .RST(RST),
        // Input 1
        .MAca0(i_d8),
        .MAca1(i_d9),
        .MAca2(i_d10),
        .MAca3(i_d11),
        // Input 2
        .MAcb0(i_d24),
        .MAcb1(i_d25),
        .MAcb2(i_d26),
        .MAcb3(i_d27),
        // Widdles
        .MAcc0(p_W8_32), 
        .MAcc1(p_W9_32),
        .MAcc2(p_W10_32),
        .MAcc3(p_W11_32),
        // Outputs 
        .MAcOut0(o_X8),
        .MAcOut1(o_X24),
        .MAcOut2(o_X9),
        .MAcOut3(o_X25),
        .MAcOut4(o_X10),
        .MAcOut5(o_X26),
        .MAcOut6(o_X11),
        .MAcOut7(o_X27)
);


MAC  #(  .p_inputMacBits(p_inputBits),
            .p_outputMacBits(p_outputBits),
            .p_widdleMacBits(p_widdleBits)  
            )

mac3 (   .CLK(CLK),
        .RST(RST),
        // Input 1
        .MAca0(i_d12),
        .MAca1(i_d13),
        .MAca2(i_d14),
        .MAca3(i_d15),
        // Input 2
        .MAcb0(i_d28),
        .MAcb1(i_d29),
        .MAcb2(i_d30),
        .MAcb3(i_d31),
        // Widdles
        .MAcc0(p_W4_32), 
        .MAcc1(p_W5_32),
        .MAcc2(p_W6_32),
        .MAcc3(p_W7_32),
        // Outputs
        .MAcOut0(o_X12),
        .MAcOut1(o_X28),
        .MAcOut2(o_X13),
        .MAcOut3(o_X29),
        .MAcOut4(o_X14),
        .MAcOut5(o_X30),
        .MAcOut6(o_X15),
        .MAcOut7(o_X31)
);

                               
endmodule
