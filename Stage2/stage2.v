`timescale 1ns / 1ps
/*
 there are 32 Inputs from b0 to b31 
there are four different  widdle values at this stage
there are 32 outputs from c0 to c31 
*/

module Stage2 #(    parameter p_inputBits=16,
                    parameter p_outputBits=20,
                    parameter p_widdleBits=16,
                    parameter p_PointPosition=3,
                    parameter p_realBits = 8

            )
            (   
                
                ///// clock and reset ///////
                input   CLK,
                input   RST,
                //// inputs to the stage //////////
                input signed  [p_inputBits-1:0]  i_b0  ,
                input signed  [p_inputBits-1:0]  i_b1  ,
                input signed  [p_inputBits-1:0]  i_b2  ,
                input signed  [p_inputBits-1:0]  i_b3  ,
                input signed  [p_inputBits-1:0]  i_b4  ,
                input signed  [p_inputBits-1:0]  i_b5  ,
                input signed  [p_inputBits-1:0]  i_b6  ,
                input signed  [p_inputBits-1:0]  i_b7  ,
                input signed  [p_inputBits-1:0]  i_b8  ,
                input signed  [p_inputBits-1:0]  i_b9  ,
                input signed  [p_inputBits-1:0]  i_b10  ,
                input signed  [p_inputBits-1:0]  i_b11  ,
                input signed  [p_inputBits-1:0]  i_b12  ,
                input signed  [p_inputBits-1:0]  i_b13  ,
                input signed  [p_inputBits-1:0]  i_b14  ,
                input signed  [p_inputBits-1:0]  i_b15  ,
                input signed  [p_inputBits-1:0]  i_b16  ,
                input signed  [p_inputBits-1:0]  i_b17  ,
                input signed  [p_inputBits-1:0]  i_b18  ,
                input signed  [p_inputBits-1:0]  i_b19  ,
                input signed  [p_inputBits-1:0]  i_b20  ,
                input signed  [p_inputBits-1:0]  i_b21  ,
                input signed  [p_inputBits-1:0]  i_b22  ,
                input signed  [p_inputBits-1:0]  i_b23  ,
                input signed  [p_inputBits-1:0]  i_b24  ,
                input signed  [p_inputBits-1:0]  i_b25  ,
                input signed  [p_inputBits-1:0]  i_b26  ,
                input signed  [p_inputBits-1:0]  i_b27  ,
                input signed  [p_inputBits-1:0]  i_b28  ,
                input signed  [p_inputBits-1:0]  i_b29  ,
                input signed  [p_inputBits-1:0]  i_b30  ,
                input signed  [p_inputBits-1:0]  i_b31  ,
                ////////// Widdle at the stage ///////
                input signed  [p_widdleBits-1:0]  i_w08,
                input signed  [p_widdleBits-1:0]  i_w18,
                input signed  [p_widdleBits-1:0]  i_w28,
                input signed  [p_widdleBits-1:0]  i_w38,
                ////// Outputs from the stage ///////
                output signed [p_outputBits-1:0]  o_c0  ,
                output signed [p_outputBits-1:0]  o_c1  ,
                output signed [p_outputBits-1:0]  o_c2  ,
                output signed [p_outputBits-1:0]  o_c3  ,
                output signed [p_outputBits-1:0]  o_c4  ,
                output signed [p_outputBits-1:0]  o_c5  ,
                output signed [p_outputBits-1:0]  o_c6  ,
                output signed [p_outputBits-1:0]  o_c7  ,
                output signed [p_outputBits-1:0]  o_c8  ,
                output signed [p_outputBits-1:0]  o_c9  ,
                output signed [p_outputBits-1:0]  o_c10  ,
                output signed [p_outputBits-1:0]  o_c11  ,
                output signed [p_outputBits-1:0]  o_c12  ,
                output signed [p_outputBits-1:0]  o_c13  ,
                output signed [p_outputBits-1:0]  o_c14  ,
                output signed [p_outputBits-1:0]  o_c15  ,
                output signed [p_outputBits-1:0]  o_c16  ,
                output signed [p_outputBits-1:0]  o_c17  ,
                output signed [p_outputBits-1:0]  o_c18  ,
                output signed [p_outputBits-1:0]  o_c19  ,
                output signed [p_outputBits-1:0]  o_c20  ,
                output signed [p_outputBits-1:0]  o_c21  ,
                output signed [p_outputBits-1:0]  o_c22  ,
                output signed [p_outputBits-1:0]  o_c23  ,
                output signed [p_outputBits-1:0]  o_c24  ,
                output signed [p_outputBits-1:0]  o_c25  ,
                output signed [p_outputBits-1:0]  o_c26  ,
                output signed [p_outputBits-1:0]  o_c27  ,
                output signed [p_outputBits-1:0]  o_c28  ,
                output signed [p_outputBits-1:0]  o_c29  ,
                output signed [p_outputBits-1:0]  o_c30  ,
                output signed [p_outputBits-1:0]  o_c31  
            );


wire [2* (2*p_realBits - p_PointPosition) + 1 : 0]   w_c0,w_c1,w_c2,w_c3,w_c4,w_c5,w_c6,w_c7,w_c8,w_c9,
                                                    w_c10,w_c11,w_c12,w_c13,w_c14,w_c15,w_c16,w_c17,w_c18,w_c19,
                                                    w_c20,w_c21,w_c22,w_c23,w_c24,w_c25,w_c26,w_c27,w_c28,w_c29,w_c30,w_c31;



//////// remove 4 bits from the real part  and 4 bits from the img part of the Mac outputs as they are unneeded /////
assign o_c0 = {w_c0[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c0[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c1 = {w_c1[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c1[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c2 = {w_c2[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c2[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c3 = {w_c3[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c3[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c4 = {w_c4[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c4[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c5 = {w_c5[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c5[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c6 = {w_c6[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c6[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c7 = {w_c7[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c7[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c8 = {w_c8[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c8[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c9 = {w_c9[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c9[((2*p_realBits - p_PointPosition) + 1-5):0]};

assign o_c10 = {w_c10[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c10[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c11 = {w_c11[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c11[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c12 = {w_c12[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c12[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c13 = {w_c13[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c13[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c14 = {w_c14[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c14[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c15 = {w_c15[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c15[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c16 = {w_c16[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c16[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c17 = {w_c17[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c17[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c18 = {w_c18[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c18[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c19 = {w_c19[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c19[((2*p_realBits - p_PointPosition) + 1-5):0]};

assign o_c20 = {w_c20[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c20[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c21 = {w_c21[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c21[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c22 = {w_c22[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c22[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c23 = {w_c23[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c23[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c24 = {w_c24[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c24[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c25 = {w_c25[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c25[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c26 = {w_c26[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c26[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c27 = {w_c27[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c27[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c28 = {w_c28[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c28[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c29 = {w_c29[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c29[((2*p_realBits - p_PointPosition) + 1-5):0]};

assign o_c30 = {w_c30[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c30[((2*p_realBits - p_PointPosition) + 1-5):0]};
assign o_c31 = {w_c31[(2* (2*p_realBits - p_PointPosition) + 1-4):((2*p_realBits - p_PointPosition) + 1)],w_c31[((2*p_realBits - p_PointPosition) + 1-5):0]};







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
        .o_r1_p(w_c0),
        .o_r1_m(w_c4),
        .o_r2_p(w_c1),
        .o_r2_m(w_c5),
        .o_r3_p(w_c2),
        .o_r3_m(w_c6),
        .o_r4_p(w_c3),
        .o_r4_m(w_c7)
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
        .o_r1_p(w_c8),
        .o_r1_m(w_c12),
        .o_r2_p(w_c9),
        .o_r2_m(w_c13),
        .o_r3_p(w_c10),
        .o_r3_m(w_c14),
        .o_r4_p(w_c11),
        .o_r4_m(w_c15)
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
        .o_r1_p(w_c16),
        .o_r1_m(w_c20),
        .o_r2_p(w_c17),
        .o_r2_m(w_c21),
        .o_r3_p(w_c18),
        .o_r3_m(w_c22),
        .o_r4_p(w_c19),
        .o_r4_m(w_c23)
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
        .o_r1_p(w_c24),
        .o_r1_m(w_c28),
        .o_r2_p(w_c25),
        .o_r2_m(w_c29),
        .o_r3_p(w_c26),
        .o_r3_m(w_c30),
        .o_r4_p(w_c27),
        .o_r4_m(w_c31)
);

endmodule