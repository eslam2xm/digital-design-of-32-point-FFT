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


module Stage3 #(    parameter p_realBits=14,
                    parameter p_inputBits = 2 * p_realBits,
                    parameter p_widdleBits=p_inputBits,
                    parameter p_PointPosition=3,
                    parameter p_numberOf_unneded_bits=10,
                    parameter p_outputBits = 2* (p_inputBits - p_PointPosition  ) - 2*p_numberOf_unneded_bits
            )
            (   
                
                ///// clock and reset ///////
                input   CLK,
                input   RST,
                //// inputs to the stage //////////
                input signed   [p_inputBits-1:0]  i_c0  ,
                input signed   [p_inputBits-1:0]  i_c1  ,
                input signed   [p_inputBits-1:0]  i_c2  ,
                input signed   [p_inputBits-1:0]  i_c3  ,
                input signed   [p_inputBits-1:0]  i_c4  ,
                input signed   [p_inputBits-1:0]  i_c5  ,
                input signed   [p_inputBits-1:0]  i_c6  ,
                input signed   [p_inputBits-1:0]  i_c7  ,
                input signed   [p_inputBits-1:0]  i_c8  ,
                input signed   [p_inputBits-1:0]  i_c9  ,
                input signed   [p_inputBits-1:0]  i_c10  ,
                input signed   [p_inputBits-1:0]  i_c11  ,
                input signed   [p_inputBits-1:0]  i_c12  ,
                input signed   [p_inputBits-1:0]  i_c13  ,
                input signed   [p_inputBits-1:0]  i_c14  ,
                input signed   [p_inputBits-1:0]  i_c15  ,
                input signed   [p_inputBits-1:0]  i_c16  ,
                input signed   [p_inputBits-1:0]  i_c17  ,
                input signed   [p_inputBits-1:0]  i_c18  ,
                input signed   [p_inputBits-1:0]  i_c19  ,
                input signed   [p_inputBits-1:0]  i_c20  ,
                input signed   [p_inputBits-1:0]  i_c21  ,
                input signed   [p_inputBits-1:0]  i_c22  ,
                input signed   [p_inputBits-1:0]  i_c23  ,
                input signed   [p_inputBits-1:0]  i_c24  ,
                input signed   [p_inputBits-1:0]  i_c25  ,
                input signed   [p_inputBits-1:0]  i_c26  ,
                input signed   [p_inputBits-1:0]  i_c27  ,
                input signed   [p_inputBits-1:0]  i_c28  ,
                input signed   [p_inputBits-1:0]  i_c29  ,
                input signed   [p_inputBits-1:0]  i_c30  ,
                input signed   [p_inputBits-1:0]  i_c31  ,
                ////// Outputs from the stage ///////
                 output signed   [p_outputBits-1:0]  o_d0  ,
                 output signed   [p_outputBits-1:0]  o_d1  ,
                 output signed   [p_outputBits-1:0]  o_d2  ,
                 output signed   [p_outputBits-1:0]  o_d3  ,
                 output signed   [p_outputBits-1:0]  o_d4  ,
                 output signed   [p_outputBits-1:0]  o_d5  ,
                 output signed   [p_outputBits-1:0]  o_d6  ,
                 output signed   [p_outputBits-1:0]  o_d7  ,
                 output signed   [p_outputBits-1:0]  o_d8  ,
                 output signed   [p_outputBits-1:0]  o_d9  ,
                 output signed   [p_outputBits-1:0]  o_d10  ,
                 output signed   [p_outputBits-1:0]  o_d11  ,
                 output signed   [p_outputBits-1:0]  o_d12  ,
                 output signed   [p_outputBits-1:0]  o_d13  ,
                 output signed   [p_outputBits-1:0]  o_d14  ,
                 output signed   [p_outputBits-1:0]  o_d15  ,
                 output signed   [p_outputBits-1:0]  o_d16  ,
                 output signed   [p_outputBits-1:0]  o_d17  ,
                 output signed   [p_outputBits-1:0]  o_d18  ,
                 output signed   [p_outputBits-1:0]  o_d19  ,
                 output signed   [p_outputBits-1:0]  o_d20  ,
                 output signed   [p_outputBits-1:0]  o_d21  ,
                 output signed   [p_outputBits-1:0]  o_d22  ,
                 output signed   [p_outputBits-1:0]  o_d23  ,
                 output signed   [p_outputBits-1:0]  o_d24  ,
                 output signed   [p_outputBits-1:0]  o_d25  ,
                 output signed   [p_outputBits-1:0]  o_d26  ,
                 output signed   [p_outputBits-1:0]  o_d27  ,
                 output signed   [p_outputBits-1:0]  o_d28  ,
                 output signed   [p_outputBits-1:0]  o_d29  ,
                 output signed   [p_outputBits-1:0]  o_d30  ,
                 output signed   [p_outputBits-1:0]  o_d31  
            );
            
    // Widdles in the stage Real | Imag //
    localparam [p_widdleBits-1:0] p_W0_16 = 28'h0020000 , // 1
                               p_W1_16 = 28'h001FFFD , // 0.924 - 0.383 J
                               p_W2_16 = 28'h001BFFA , // 0.707 - 0.707 J
                               p_W3_16 = 28'h000FFF9 , // 0.383 - 0.924 J
                               p_W4_16 = 28'h0003FF8 , // - J
                               p_W5_16 = 28'hFFF7FF9 , // -0.383 - 0.924 J
                               p_W6_16 = 28'hFFFBFFA , // -0.707 - 0.707 J
                               p_W7_16 = 28'hFFE7FFD ; // -0.924 - 0.383 J

  wire [2*(p_inputBits-p_PointPosition) - 1 :0 ] w_d0,w_d1,w_d2,w_d3,w_d4,w_d5,w_d6,w_d7,
                                                 w_d8,w_d9,w_d10,w_d11,w_d12,w_d13,w_d14,w_d15,w_d16,
                                                 w_d17,w_d18,w_d19,w_d20,w_d21,w_d22,w_d23,w_d24,w_d25,w_d26,
                                                 w_d27,w_d28,w_d29,w_d30,w_d31;          
 
sharedComplexMUL  #(  .p_inputWidth(p_realBits),
            .p_PointPosition(p_PointPosition)  
            )
mac0 (   .CLK(CLK),
        .RST(RST),
        // Input 1
        .i_m1(i_c0),
        .i_m2(i_c1),
        .i_m3(i_c2),
        .i_m4(i_c3),
        // Input 2
        .i_n1(i_c8),
        .i_n2(i_c9),
        .i_n3(i_c10),
        .i_n4(i_c11),
        // Widdles
        .i_l1(p_W0_16), 
        .i_l2(p_W1_16),
        .i_l3(p_W2_16),
        .i_l4(p_W3_16),
        // Outputs
        .o_r1_p(w_d0),
        .o_r1_m(w_d8),
        .o_r2_p(w_d1),
        .o_r2_m(w_d9),
        .o_r3_p(w_d2),
        .o_r3_m(w_d10),
        .o_r4_p(w_d3),
        .o_r4_m(w_d11)
);

sharedComplexMUL  #(  .p_inputWidth(p_realBits),
            .p_PointPosition(p_PointPosition)  
            )

mac1 (   .CLK(CLK),
        .RST(RST),
        // Input 1
        .i_m1(i_c4),
        .i_m2(i_c5),
        .i_m3(i_c6),
        .i_m4(i_c7),
        // Input 2
        .i_n1(i_c12),
        .i_n2(i_c13),
        .i_n3(i_c14),
        .i_n4(i_c15),
        // Widdles
        .i_l1(p_W4_16), 
        .i_l2(p_W5_16),
        .i_l3(p_W6_16),
        .i_l4(p_W7_16),
        // Outputs
        .o_r1_p(w_d4),
        .o_r1_m(w_d12),
        .o_r2_p(w_d5),
        .o_r2_m(w_d13),
        .o_r3_p(w_d6),
        .o_r3_m(w_d14),
        .o_r4_p(w_d7),
        .o_r4_m(w_d15)
);


sharedComplexMUL  #(  .p_inputWidth(p_realBits),
            .p_PointPosition(p_PointPosition)  
            )

mac2 (   .CLK(CLK),
        .RST(RST),
        // Input 1
        .i_m1(i_c16),
        .i_m2(i_c17),
        .i_m3(i_c18),
        .i_m4(i_c19),
        // Input 2
        .i_n1(i_c24),
        .i_n2(i_c25),
        .i_n3(i_c26),
        .i_n4(i_c27),
        // Widdles
        .i_l1(p_W0_16), 
        .i_l2(p_W1_16),
        .i_l3(p_W2_16),
        .i_l4(p_W3_16),
        // Outputs 
        .o_r1_p(w_d16),
        .o_r1_m(w_d24),
        .o_r2_p(w_d17),
        .o_r2_m(w_d25),
        .o_r3_p(w_d18),
        .o_r3_m(w_d26),
        .o_r4_p(w_d19),
        .o_r4_m(w_d27)
);


sharedComplexMUL  #(  .p_inputWidth(p_realBits),
            .p_PointPosition(p_PointPosition)  
            ) 
mac3 (   .CLK(CLK),
        .RST(RST),
        // Input 1
        .i_m1(i_c20),
        .i_m2(i_c21),
        .i_m3(i_c22),
        .i_m4(i_c23),
        // Input 2
        .i_n1(i_c28),
        .i_n2(i_c29),
        .i_n3(i_c30),
        .i_n4(i_c31),
        // Widdles
        .i_l1(p_W4_16), 
        .i_l2(p_W5_16),
        .i_l3(p_W6_16),
        .i_l4(p_W7_16),
        // Outputs
        .o_r1_p(w_d20),
        .o_r1_m(w_d28),
        .o_r2_p(w_d21),
        .o_r2_m(w_d29),
        .o_r3_p(w_d22),
        .o_r3_m(w_d30),
        .o_r4_p(w_d23),
        .o_r4_m(w_d31)
);

   assign o_d0 = {w_d0[40:26] , w_d0[14:0]},
           o_d1 = {w_d1[40:26] , w_d1[14:0]},
           o_d2 = {w_d2[40:26] , w_d2[14:0]},
           o_d3 = {w_d3[40:26] , w_d3[14:0]},
           o_d4 = {w_d4[40:26] , w_d4[14:0]},
           o_d5 = {w_d5[40:26] , w_d5[14:0]},
           o_d6 = {w_d6[40:26] , w_d6[14:0]},
           o_d7 = {w_d7[40:26] , w_d7[14:0]},
           o_d8 = {w_d8[40:26] , w_d8[14:0]},
           o_d9 = {w_d9[40:26] , w_d9[14:0]},
           o_d10 = {w_d10[40:26] , w_d10[14:0]},
           o_d11 = {w_d11[40:26] , w_d11[14:0]},
           o_d12 = {w_d12[40:26] , w_d12[14:0]},
           o_d13 = {w_d13[40:26] , w_d13[14:0]},
           o_d14 = {w_d14[40:26] , w_d14[14:0]},
           o_d15 = {w_d15[40:26] , w_d15[14:0]},
           o_d16 = {w_d16[40:26] , w_d16[14:0]},
           o_d17 = {w_d17[40:26] , w_d17[14:0]},
           o_d18 = {w_d18[40:26] , w_d18[14:0]},
           o_d19 = {w_d19[40:26] , w_d19[14:0]},
           o_d20 = {w_d20[40:26] , w_d20[14:0]},
           o_d21 = {w_d21[40:26] , w_d21[14:0]},
           o_d22 = {w_d22[40:26] , w_d22[14:0]},
           o_d23 = {w_d23[40:26] , w_d23[14:0]},
           o_d24 = {w_d24[40:26] , w_d24[14:0]},
           o_d25 = {w_d25[40:26] , w_d25[14:0]},
           o_d26 = {w_d26[40:26] , w_d26[14:0]},
           o_d27 = {w_d27[40:26] , w_d27[14:0]},
           o_d28 = {w_d28[40:26] , w_d28[14:0]},
           o_d29 = {w_d29[40:26] , w_d29[14:0]},
           o_d30 = {w_d30[40:26] , w_d30[14:0]},
           o_d31 = {w_d31[40:26] , w_d31[14:0]};
           
            
endmodule
