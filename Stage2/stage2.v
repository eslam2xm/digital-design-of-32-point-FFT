`timescale 1ns / 1ps
/*
 there are 32 Inputs from b0 to b31 
there are four different  widdle values at this stage
there are 32 outputs from c0 to c31 
*/

module Stage2 #(    parameter p_inputBits=16,
                    parameter p_outputBits=28,
                    parameter p_widdleBits=16,
                    parameter p_PointPosition=3,
                    parameter p_realBits = 8

            )
            (   
                
                ///// clock and reset ///////
                input   CLK,
                input   RST,
                //// inputs to the stage //////////
                input   [p_inputBits-1:0]  i_b0  ,
                input   [p_inputBits-1:0]  i_b1  ,
                input   [p_inputBits-1:0]  i_b2  ,
                input   [p_inputBits-1:0]  i_b3  ,
                input   [p_inputBits-1:0]  i_b4  ,
                input   [p_inputBits-1:0]  i_b5  ,
                input   [p_inputBits-1:0]  i_b6  ,
                input   [p_inputBits-1:0]  i_b7  ,
                input   [p_inputBits-1:0]  i_b8  ,
                input   [p_inputBits-1:0]  i_b9  ,
                input   [p_inputBits-1:0]  i_b10  ,
                input   [p_inputBits-1:0]  i_b11  ,
                input   [p_inputBits-1:0]  i_b12  ,
                input   [p_inputBits-1:0]  i_b13  ,
                input   [p_inputBits-1:0]  i_b14  ,
                input   [p_inputBits-1:0]  i_b15  ,
                input   [p_inputBits-1:0]  i_b16  ,
                input   [p_inputBits-1:0]  i_b17  ,
                input   [p_inputBits-1:0]  i_b18  ,
                input   [p_inputBits-1:0]  i_b19  ,
                input   [p_inputBits-1:0]  i_b20  ,
                input   [p_inputBits-1:0]  i_b21  ,
                input   [p_inputBits-1:0]  i_b22  ,
                input   [p_inputBits-1:0]  i_b23  ,
                input   [p_inputBits-1:0]  i_b24  ,
                input   [p_inputBits-1:0]  i_b25  ,
                input   [p_inputBits-1:0]  i_b26  ,
                input   [p_inputBits-1:0]  i_b27  ,
                input   [p_inputBits-1:0]  i_b28  ,
                input   [p_inputBits-1:0]  i_b29  ,
                input   [p_inputBits-1:0]  i_b30  ,
                input   [p_inputBits-1:0]  i_b31  ,
                ////////// Widdle at the stage ///////
                input   [p_widdleBits-1:0]  i_w08,
                input   [p_widdleBits-1:0]  i_w18,
                input   [p_widdleBits-1:0]  i_w28,
                input   [p_widdleBits-1:0]  i_w38,
                ////// Outputs from the stage ///////
                output  [p_outputBits-1:0]  o_c0  ,
                output  [p_outputBits-1:0]  o_c1  ,
                output  [p_outputBits-1:0]  o_c2  ,
                output  [p_outputBits-1:0]  o_c3  ,
                output  [p_outputBits-1:0]  o_c4  ,
                output  [p_outputBits-1:0]  o_c5  ,
                output  [p_outputBits-1:0]  o_c6  ,
                output  [p_outputBits-1:0]  o_c7  ,
                output  [p_outputBits-1:0]  o_c8  ,
                output  [p_outputBits-1:0]  o_c9  ,
                output  [p_outputBits-1:0]  o_c10  ,
                output  [p_outputBits-1:0]  o_c11  ,
                output  [p_outputBits-1:0]  o_c12  ,
                output  [p_outputBits-1:0]  o_c13  ,
                output  [p_outputBits-1:0]  o_c14  ,
                output  [p_outputBits-1:0]  o_c15  ,
                output  [p_outputBits-1:0]  o_c16  ,
                output  [p_outputBits-1:0]  o_c17  ,
                output  [p_outputBits-1:0]  o_c18  ,
                output  [p_outputBits-1:0]  o_c19  ,
                output  [p_outputBits-1:0]  o_c20  ,
                output  [p_outputBits-1:0]  o_c21  ,
                output  [p_outputBits-1:0]  o_c22  ,
                output  [p_outputBits-1:0]  o_c23  ,
                output  [p_outputBits-1:0]  o_c24  ,
                output  [p_outputBits-1:0]  o_c25  ,
                output  [p_outputBits-1:0]  o_c26  ,
                output  [p_outputBits-1:0]  o_c27  ,
                output  [p_outputBits-1:0]  o_c28  ,
                output  [p_outputBits-1:0]  o_c29  ,
                output  [p_outputBits-1:0]  o_c30  ,
                output  [p_outputBits-1:0]  o_c31  
            );

sharedComplexMUL  #(  .p_inputWidth(p_realBits),
            .p_PointPosition(p_PointPosition)  
            )
mac0 (   .CLK(CLK),
        .RST(RST),
        .i_m1(i_b0),
        .i_m2(i_b1),
        .i_m3(i_b2),
        .i_m4(i_b3),
        .i_n1(i_b4),
        .i_n2(i_b5),
        .i_n3(i_b6),
        .i_n4(i_b7),
        .i_l1(i_w08), 
        .i_l2(i_w18),
        .i_l3(i_w28),
        .i_l4(i_w38),
        .o_r1_p(o_c0),
        .o_r1_m(o_c4),
        .o_r2_p(o_c1),
        .o_r2_m(o_c5),
        .o_r3_p(o_c2),
        .o_r3_m(o_c6),
        .o_r4_p(o_c3),
        .o_r4_m(o_c7)
);

sharedComplexMUL  #(  .p_inputWidth(p_realBits),
            .p_PointPosition(p_PointPosition)  
            )

mac1 (   .CLK(CLK),
        .RST(RST),
        .i_m1(i_b8),
        .i_m2(i_b9),
        .i_m3(i_b10),
        .i_m4(i_b11),
        .i_n1(i_b12),
        .i_n2(i_b13),
        .i_n3(i_b14),
        .i_n4(i_b15),
        .i_l1(i_w08), 
        .i_l2(i_w18),
        .i_l3(i_w28),
        .i_l4(i_w38),
        .o_r1_p(o_c8),
        .o_r1_m(o_c12),
        .o_r2_p(o_c9),
        .o_r2_m(o_c13),
        .o_r3_p(o_c10),
        .o_r3_m(o_c14),
        .o_r4_p(o_c11),
        .o_r4_m(o_c15)
);


sharedComplexMUL  #(  .p_inputWidth(p_realBits),
            .p_PointPosition(p_PointPosition)  
            )

mac2 (   .CLK(CLK),
        .RST(RST),
        .i_m1(i_b16),
        .i_m2(i_b17),
        .i_m3(i_b18),
        .i_m4(i_b19),
        .i_n1(i_b20),
        .i_n2(i_b21),
        .i_n3(i_b22),
        .i_n4(i_b23),
        .i_l1(i_w08), 
        .i_l2(i_w18),
        .i_l3(i_w28),
        .i_l4(i_w38),
        .o_r1_p(o_c16),
        .o_r1_m(o_c20),
        .o_r2_p(o_c17),
        .o_r2_m(o_c21),
        .o_r3_p(o_c18),
        .o_r3_m(o_c22),
        .o_r4_p(o_c19),
        .o_r4_m(o_c23)
);


sharedComplexMUL  #(  .p_inputWidth(p_realBits),
            .p_PointPosition(p_PointPosition)  
            )

mac3 (   .CLK(CLK),
        .RST(RST),
        .i_m1(i_b24),
        .i_m2(i_b25),
        .i_m3(i_b26),
        .i_m4(i_b27),
        .i_n1(i_b28),
        .i_n2(i_b29),
        .i_n3(i_b30),
        .i_n4(i_b31),
        .i_l1(i_w08), 
        .i_l2(i_w18),
        .i_l3(i_w28),
        .i_l4(i_w38),
        .o_r1_p(o_c24),
        .o_r1_m(o_c28),
        .o_r2_p(o_c25),
        .o_r2_m(o_c29),
        .o_r3_p(o_c26),
        .o_r3_m(o_c30),
        .o_r4_p(o_c27),
        .o_r4_m(o_c31)
);

endmodule