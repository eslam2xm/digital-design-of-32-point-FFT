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


module Stage4 #(    parameter p_realBits=15,
                    parameter p_inputBits = 2 * p_realBits,
                    parameter p_widdleBits=p_inputBits,
                    parameter p_PointPosition=3,
                    parameter p_numberOf_unneded_bits=10,
                    parameter p_outputBits = 32
            )
            (        
                ///// clock and reset ///////
                input   CLK,
                input   RST,
                //// inputs to the stage //////////
                input signed  [p_inputBits-1:0]  i_d0  ,
                input signed  [p_inputBits-1:0]  i_d1  ,
                input signed  [p_inputBits-1:0]  i_d2  ,
                input signed  [p_inputBits-1:0]  i_d3  ,
                input signed  [p_inputBits-1:0]  i_d4  ,
                input signed  [p_inputBits-1:0]  i_d5  ,
                input signed  [p_inputBits-1:0]  i_d6  ,
                input signed  [p_inputBits-1:0]  i_d7  ,
                input signed  [p_inputBits-1:0]  i_d8  ,
                input signed  [p_inputBits-1:0]  i_d9  ,
                input signed  [p_inputBits-1:0]  i_d10  ,
                input signed  [p_inputBits-1:0]  i_d11  ,
                input signed  [p_inputBits-1:0]  i_d12  ,
                input signed  [p_inputBits-1:0]  i_d13  ,
                input signed  [p_inputBits-1:0]  i_d14  ,
                input signed  [p_inputBits-1:0]  i_d15  ,
                input signed  [p_inputBits-1:0]  i_d16  ,
                input signed  [p_inputBits-1:0]  i_d17  ,
                input signed  [p_inputBits-1:0]  i_d18  ,
                input signed  [p_inputBits-1:0]  i_d19  ,
                input signed  [p_inputBits-1:0]  i_d20  ,
                input signed  [p_inputBits-1:0]  i_d21  ,
                input signed  [p_inputBits-1:0]  i_d22  ,
                input signed  [p_inputBits-1:0]  i_d23  ,
                input signed  [p_inputBits-1:0]  i_d24  ,
                input signed  [p_inputBits-1:0]  i_d25  ,
                input signed  [p_inputBits-1:0]  i_d26  ,
                input signed  [p_inputBits-1:0]  i_d27  ,
                input signed  [p_inputBits-1:0]  i_d28  ,
                input signed  [p_inputBits-1:0]  i_d29  ,
                input signed  [p_inputBits-1:0]  i_d30  ,
                input signed  [p_inputBits-1:0]  i_d31  ,
                ////// Outputs from the stage ///////
                output signed  [p_outputBits-1:0]  o_X0  ,
                output signed  [p_outputBits-1:0]  o_X1  ,
                output signed  [p_outputBits-1:0]  o_X2  ,
                output signed  [p_outputBits-1:0]  o_X3  ,
                output signed  [p_outputBits-1:0]  o_X4  ,
                output signed  [p_outputBits-1:0]  o_X5  ,
                output signed  [p_outputBits-1:0]  o_X6  ,
                output signed  [p_outputBits-1:0]  o_X7  ,
                output signed  [p_outputBits-1:0]  o_X8  ,
                output signed  [p_outputBits-1:0]  o_X9  ,
                output signed  [p_outputBits-1:0]  o_X10  ,
                output signed  [p_outputBits-1:0]  o_X11  ,
                output signed  [p_outputBits-1:0]  o_X12  ,
                output signed  [p_outputBits-1:0]  o_X13  ,
                output signed  [p_outputBits-1:0]  o_X14  ,
                output signed  [p_outputBits-1:0]  o_X15  ,
                output signed  [p_outputBits-1:0]  o_X16  ,
                output signed  [p_outputBits-1:0]  o_X17  ,
                output signed  [p_outputBits-1:0]  o_X18  ,
                output signed  [p_outputBits-1:0]  o_X19  ,
                output signed  [p_outputBits-1:0]  o_X20  ,
                output signed  [p_outputBits-1:0]  o_X21  ,
                output signed  [p_outputBits-1:0]  o_X22  ,
                output signed  [p_outputBits-1:0]  o_X23  ,
                output signed  [p_outputBits-1:0]  o_X24  ,
                output signed  [p_outputBits-1:0]  o_X25  ,
                output signed  [p_outputBits-1:0]  o_X26  ,
                output signed  [p_outputBits-1:0]  o_X27  ,
                output signed  [p_outputBits-1:0]  o_X28  ,
                output signed  [p_outputBits-1:0]  o_X29  ,
                output signed  [p_outputBits-1:0]  o_X30  ,
                output signed  [p_outputBits-1:0]  o_X31  
            );
            
    // Widdles in the stage Real | Imag // 
    localparam[p_widdleBits:0] p_W0_32 = 30'h00040000 , // 1
                               p_W1_32 = 30'h0003FFFE , // 0.981 - 0.195 J
                               p_W2_32 = 30'h0003FFFD , // 0.924 - 0.383 J
                               p_W3_32 = 30'h0003FFFC , // 0.831 - 0.556 J
                               p_W4_32 = 30'h00037FFA , // 0.707 - 0.707 J
                               p_W5_32 = 30'h00027FF9 , // 0.556 - 0.831 J
                               p_W6_32 = 30'h0001FFF9 , // 0.383 - 0.924 J
                               p_W7_32 = 30'h00017FF9 , // 0.195 - 0.981 J
                               p_W8_32 = 30'h00007FF8 , // - J
                               p_W9_32 = 30'h3FFF7FF9 , //  -0.195 + 0.981 J
                               p_W10_32 = 30'h3FFEFFF9 , // -0.383 + 0.924 J
                               p_W11_32 = 30'h3FFE7FF9 , // -0.556 + 0.831 J
                               p_W12_32 = 30'h3FFD7FFA , // -0.707 + 0.707 J
                               p_W13_32 = 30'h3FFCFFFC , // -0.831 + 0.556 J
                               p_W14_32 = 30'h3FFCFFFD , // -0.924 + 0.383 J
                               p_W15_32 = 30'h3FFCFFFE ; // -0.981 +0.195 J
                               
    wire [ 51 :0 ] w_X0,w_X1,w_X2,w_X3,w_X4,w_X5,w_X6,w_X7,
                                                 w_X8,w_X9,w_X10,w_X11,w_X12,w_X13,w_X14,w_X15,w_X16,
                                                 w_X17,w_X18,w_X19,w_X20,w_X21,w_X22,w_X23,w_X24,w_X25,w_X26,
                                                 w_X27,w_X28,w_X29,w_X30,w_X31;   
                               
 
sharedComplexMUL  #(  .p_inputWidth(p_realBits),
            .p_PointPosition(p_PointPosition)  
            )
mac0 (   .CLK(CLK),
        .RST(RST),
        // Input 1
        .i_m1(i_d0),
        .i_m2(i_d1),
        .i_m3(i_d2),
        .i_m4(i_d3),
        // Input 2
        .i_n1(i_d16),
        .i_n2(i_d17),
        .i_n3(i_d18),
        .i_n4(i_d19),
        // Widdles
        .i_l1(p_W0_32), 
        .i_l2(p_W1_32),
        .i_l3(p_W2_32),
        .i_l4(p_W3_32),
        // Outputs
        .o_r1_p(w_X0),
        .o_r1_m(w_X16),
        .o_r2_p(w_X1),
        .o_r2_m(w_X17),
        .o_r3_p(w_X2),
        .o_r3_m(w_X18),
        .o_r4_p(w_X3),
        .o_r4_m(w_X19)
);
sharedComplexMUL  #(  .p_inputWidth(p_realBits),
            .p_PointPosition(p_PointPosition)  
            )

mac1 (   .CLK(CLK),
        .RST(RST),
        // Input 1
        .i_m1(i_d4),
        .i_m2(i_d5),
        .i_m3(i_d6),
        .i_m4(i_d7),
        // Input 2
        .i_n1(i_d20),
        .i_n2(i_d21),
        .i_n3(i_d22),
        .i_n4(i_d23),
        // Widdles
        .i_l1(p_W4_32), 
        .i_l2(p_W5_32),
        .i_l3(p_W6_32),
        .i_l4(p_W7_32),
        // Outputs
        .o_r1_p(w_X4),
        .o_r1_m(w_X20),
        .o_r2_p(w_X5),
        .o_r2_m(w_X21),
        .o_r3_p(w_X6),
        .o_r3_m(w_X22),
        .o_r4_p(w_X7),
        .o_r4_m(w_X23)
);


sharedComplexMUL  #(  .p_inputWidth(p_realBits),
            .p_PointPosition(p_PointPosition)  
            )

mac2 (   .CLK(CLK),
        .RST(RST),
        // Input 1
        .i_m1(i_d8),
        .i_m2(i_d9),
        .i_m3(i_d10),
        .i_m4(i_d11),
        // Input 2
        .i_n1(i_d24),
        .i_n2(i_d25),
        .i_n3(i_d26),
        .i_n4(i_d27),
        // Widdles
        .i_l1(p_W8_32), 
        .i_l2(p_W9_32),
        .i_l3(p_W10_32),
        .i_l4(p_W11_32),
        // Outputs 
        .o_r1_p(w_X8),
        .o_r1_m(w_X24),
        .o_r2_p(w_X9),
        .o_r2_m(w_X25),
        .o_r3_p(w_X10),
        .o_r3_m(w_X26),
        .o_r4_p(w_X11),
        .o_r4_m(w_X27)
);


sharedComplexMUL  #(  .p_inputWidth(p_realBits),
            .p_PointPosition(p_PointPosition)  
            )

mac3 (   .CLK(CLK),
        .RST(RST),
        // Input 1
        .i_m1(i_d12),
        .i_m2(i_d13),
        .i_m3(i_d14),
        .i_m4(i_d15),
        // Input 2
        .i_n1(i_d28),
        .i_n2(i_d29),
        .i_n3(i_d30),
        .i_n4(i_d31),
        // Widdles
        .i_l1(p_W4_32), 
        .i_l2(p_W5_32),
        .i_l3(p_W6_32),
        .i_l4(p_W7_32),
        // Outputs
        .o_r1_p(w_X12),
        .o_r1_m(w_X28),
        .o_r2_p(w_X13),
        .o_r2_m(w_X29),
        .o_r3_p(w_X14),
        .o_r3_m(w_X30),
        .o_r4_p(w_X15),
        .o_r4_m(w_X31)
);

        assign o_X0 = {w_X0[43:28] , w_X0[15:0]},
           o_X1 = {w_X1[43:28] , w_X1[15:0]},
           o_X2 = {w_X2[43:28] , w_X2[15:0]},
           o_X3 = {w_X3[43:28] , w_X3[15:0]},
           o_X4 = {w_X4[43:28] , w_X4[15:0]},
           o_X5 = {w_X5[43:28] , w_X5[15:0]},
           o_X6 = {w_X6[43:28] , w_X6[15:0]},
           o_X7 = {w_X7[43:28] , w_X7[15:0]},
           o_X8 = {w_X8[43:28] , w_X8[15:0]},
           o_X9 = {w_X9[43:28] , w_X9[15:0]},
           o_X10 = {w_X10[43:28] , w_X10[15:0]},
           o_X11 = {w_X11[43:28] , w_X11[15:0]},
           o_X12 = {w_X12[43:28] , w_X12[15:0]},
           o_X13 = {w_X13[43:28] , w_X13[15:0]},
           o_X14 = {w_X14[43:28] , w_X14[15:0]},
           o_X15 = {w_X15[43:28] , w_X15[15:0]},
           o_X16 = {w_X16[43:28] , w_X16[15:0]},
           o_X17 = {w_X17[43:28] , w_X17[15:0]},
           o_X18 = {w_X18[43:28] , w_X18[15:0]},
           o_X19 = {w_X19[43:28] , w_X19[15:0]},
           o_X20 = {w_X20[43:28] , w_X20[15:0]},
           o_X21 = {w_X21[43:28] , w_X21[15:0]},
           o_X22 = {w_X22[43:28] , w_X22[15:0]},
           o_X23 = {w_X23[43:28] , w_X23[15:0]},
           o_X24 = {w_X24[43:28] , w_X24[15:0]},
           o_X25 = {w_X25[43:28] , w_X25[15:0]},
           o_X26 = {w_X26[43:28] , w_X26[15:0]},
           o_X27 = {w_X27[43:28] , w_X27[15:0]},
           o_X28 = {w_X28[43:28] , w_X28[15:0]},
           o_X29 = {w_X29[43:28] , w_X29[15:0]},
           o_X30 = {w_X30[43:28] , w_X30[15:0]},
           o_X31 = {w_X31[43:28] , w_X31[15:0]};
                               
endmodule
