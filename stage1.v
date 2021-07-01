`timescale 1ns / 1ps
/*
 there are 32 Inputs from a0 to a31 
there are 2 different  widdle values at this stage
there are 32 outputs from b0 to b31 
*/

module Stage1 #(    parameter p_inputBits=9,
                    parameter p_outputBits=20,
                    parameter p_widdleBits=18,
                    parameter p_PointPosition=0,
                    parameter p_realBits = 9
            )
            (   
                ///// clock and reset ///////
                input   CLK,
                input   RST,
                //// inputs to the stage //////////
                input signed  [p_inputBits-1:0]  i_a0  ,
                input signed  [p_inputBits-1:0]  i_a1  ,
                input signed  [p_inputBits-1:0]  i_a2  ,
                input signed  [p_inputBits-1:0]  i_a3  ,
                input signed  [p_inputBits-1:0]  i_a4  ,
                input signed  [p_inputBits-1:0]  i_a5  ,
                input signed  [p_inputBits-1:0]  i_a6  ,
                input signed  [p_inputBits-1:0]  i_a7  ,
                input signed  [p_inputBits-1:0]  i_a8  ,
                input signed  [p_inputBits-1:0]  i_a9  ,
                input signed  [p_inputBits-1:0]  i_a10  ,
                input signed  [p_inputBits-1:0]  i_a11  ,
                input signed  [p_inputBits-1:0]  i_a12  ,
                input signed  [p_inputBits-1:0]  i_a13  ,
                input signed  [p_inputBits-1:0]  i_a14  ,
                input signed  [p_inputBits-1:0]  i_a15  ,
                input signed  [p_inputBits-1:0]  i_a16  ,
                input signed  [p_inputBits-1:0]  i_a17  ,
                input signed  [p_inputBits-1:0]  i_a18  ,
                input signed  [p_inputBits-1:0]  i_a19  ,
                input signed  [p_inputBits-1:0]  i_a20  ,
                input signed  [p_inputBits-1:0]  i_a21  ,
                input signed  [p_inputBits-1:0]  i_a22  ,
                input signed  [p_inputBits-1:0]  i_a23  ,
                input signed  [p_inputBits-1:0]  i_a24  ,
                input signed  [p_inputBits-1:0]  i_a25  ,
                input signed  [p_inputBits-1:0]  i_a26  ,
                input signed  [p_inputBits-1:0]  i_a27  ,
                input signed  [p_inputBits-1:0]  i_a28  ,
                input signed  [p_inputBits-1:0]  i_a29  ,
                input signed  [p_inputBits-1:0]  i_a30  ,
                input signed  [p_inputBits-1:0]  i_a31  ,

                ////////// Widdle at the stage ///////
                input signed  [p_widdleBits-1:0]  i_w04,
                input signed  [p_widdleBits-1:0]  i_w14,
                ////// Outputs from the stage ///////
                
                output signed [p_outputBits-1:0]  o_b0  ,
                output signed [p_outputBits-1:0]  o_b1  ,
                output signed [p_outputBits-1:0]  o_b2  ,
                output signed [p_outputBits-1:0]  o_b3  ,
                output signed [p_outputBits-1:0]  o_b4  ,
                output signed [p_outputBits-1:0]  o_b5  ,
                output signed [p_outputBits-1:0]  o_b6  ,
                output signed [p_outputBits-1:0]  o_b7  ,
                output signed [p_outputBits-1:0]  o_b8  ,
                output signed [p_outputBits-1:0]  o_b9  ,
                output signed [p_outputBits-1:0]  o_b10  ,
                output signed [p_outputBits-1:0]  o_b11  ,
                output signed [p_outputBits-1:0]  o_b12  ,
                output signed [p_outputBits-1:0]  o_b13  ,
                output signed [p_outputBits-1:0]  o_b14  ,
                output signed [p_outputBits-1:0]  o_b15  ,
                output signed [p_outputBits-1:0]  o_b16  ,
                output signed [p_outputBits-1:0]  o_b17  ,
                output signed [p_outputBits-1:0]  o_b18  ,
                output signed [p_outputBits-1:0]  o_b19  ,
                output signed [p_outputBits-1:0]  o_b20  ,
                output signed [p_outputBits-1:0]  o_b21  ,
                output signed [p_outputBits-1:0]  o_b22  ,
                output signed [p_outputBits-1:0]  o_b23  ,
                output signed [p_outputBits-1:0]  o_b24  ,
                output signed [p_outputBits-1:0]  o_b25  ,
                output signed [p_outputBits-1:0]  o_b26  ,
                output signed [p_outputBits-1:0]  o_b27  ,
                output signed [p_outputBits-1:0]  o_b28  ,
                output signed [p_outputBits-1:0]  o_b29  ,
                output signed [p_outputBits-1:0]  o_b30  ,
                output signed [p_outputBits-1:0]  o_b31  
            );



//input
// adding imaginary part = 0 as input is 8 bits integer (real)only

wire [2*p_inputBits - 1 : 0] w_x0,w_x1,w_x2,w_x3,w_x4,w_x5,w_x6,w_x7,w_x8,w_x9,
                              w_x10,w_x11,w_x12,w_x13,w_x14,w_x15,w_x16,w_x17,w_x18,w_x19,
                              w_x20,w_x21,w_x22,w_x23,w_x24,w_x25,w_x26,w_x27,w_x28,w_x29,w_x30,w_x31;
assign w_x0 =  {i_a0  , {(p_inputBits){1'b0}} };
assign w_x1 =  {i_a1  , {(p_inputBits){1'b0}} };
assign w_x2 =  {i_a2  , {(p_inputBits){1'b0}} };
assign w_x3 =  {i_a3  , {(p_inputBits){1'b0}} };

assign w_x4 =  {i_a4  , {(p_inputBits){1'b0}} };
assign w_x5 =  {i_a5  , {(p_inputBits){1'b0}} };
assign w_x6 =  {i_a6  , {(p_inputBits){1'b0}} };
assign w_x7 =  {i_a7  , {(p_inputBits){1'b0}} };

assign w_x8 =  {i_a8  , {(p_inputBits){1'b0}} };
assign w_x9 =  {i_a9  , {(p_inputBits){1'b0}} };
assign w_x10 = {i_a10 , {(p_inputBits){1'b0}} };
assign w_x11 = {i_a11 , {(p_inputBits){1'b0}} };

assign w_x12 = {i_a12 , {(p_inputBits){1'b0}} };
assign w_x13 = {i_a13 , {(p_inputBits){1'b0}} };
assign w_x14 = {i_a14 , {(p_inputBits){1'b0}} };
assign w_x15 = {i_a15 , {(p_inputBits){1'b0}} };

assign w_x16 = {i_a16 , {(p_inputBits){1'b0}} };
assign w_x17 = {i_a17 , {(p_inputBits){1'b0}} };
assign w_x18 = {i_a18 , {(p_inputBits){1'b0}} };
assign w_x19 = {i_a19 , {(p_inputBits){1'b0}} };

assign w_x20 = {i_a20 , {(p_inputBits){1'b0}} };
assign w_x21 = {i_a21 , {(p_inputBits){1'b0}} };
assign w_x22 = {i_a22 , {(p_inputBits){1'b0}} };
assign w_x23 = {i_a23 , {(p_inputBits){1'b0}} };

assign w_x24 = {i_a24 , {(p_inputBits){1'b0}} };
assign w_x25 = {i_a25 , {(p_inputBits){1'b0}} };
assign w_x26 = {i_a26 , {(p_inputBits){1'b0}} };
assign w_x27 = {i_a27 , {(p_inputBits){1'b0}} };

assign w_x28 = {i_a28 , {(p_inputBits){1'b0}} };
assign w_x29 = {i_a29 , {(p_inputBits){1'b0}} };
assign w_x30 = {i_a30 , {(p_inputBits){1'b0}} };
assign w_x31 = {i_a31 , {(p_inputBits){1'b0}} };


//output
//creating a wire with length equivalent to the output of the SharedComplexMUL
//then this wire will be assigned to the output of this stage taking only the useful part of bits
//      2*(2*9-0)+1 = 37 bits
wire [2* (2*p_realBits - p_PointPosition) + 1 : 0]   w_b0,w_b1,w_b2,w_b3,w_b4,w_b5,w_b6,w_b7,w_b8,w_b9,
                                                    w_b10,w_b11,w_b12,w_b13,w_b14,w_b15,w_b16,w_b17,w_b18,w_b19,
                                                    w_b20,w_b21,w_b22,w_b23,w_b24,w_b25,w_b26,w_b27,w_b28,w_b29,w_b30,w_b31;
//assigning output extracting the real and imaginary parts
// w_b0[28:19 , 9:0 ]
assign o_b0 = { w_b0[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b0[p_inputBits : 0]   };
assign o_b1 = { w_b1[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b1[p_inputBits : 0]   };
assign o_b2 = { w_b2[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b2[p_inputBits : 0]   };
assign o_b3 = { w_b3[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b3[p_inputBits : 0]   };

assign o_b4 =  { w_b4[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b4[p_inputBits : 0]   };
assign o_b5 =  { w_b5[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b5[p_inputBits : 0]   };
assign o_b6 =  { w_b6[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b6[p_inputBits : 0]   };
assign o_b7 =  { w_b7[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b7[p_inputBits : 0]   };

assign o_b8 =  { w_b8[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b8[p_inputBits : 0]   };
assign o_b9 =  { w_b9[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b9[p_inputBits : 0]   };
assign o_b10 = { w_b10[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b10[p_inputBits : 0]  };
assign o_b11 = { w_b11[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b11[p_inputBits : 0]  };

assign o_b12 = { w_b12[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b12[p_inputBits : 0]  };
assign o_b13 = { w_b13[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b13[p_inputBits : 0]  };
assign o_b14 = { w_b14[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b14[p_inputBits : 0]  };
assign o_b15 = { w_b15[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b15[p_inputBits : 0]  };

assign o_b16 = { w_b16[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b16[p_inputBits : 0]  };
assign o_b17 = { w_b17[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b17[p_inputBits : 0]  };
assign o_b18 = { w_b18[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b18[p_inputBits : 0]  };
assign o_b19 = { w_b19[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b19[p_inputBits : 0]  };

assign o_b20 = { w_b20[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b20[p_inputBits : 0]  };
assign o_b21 = { w_b21[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b21[p_inputBits : 0]  };
assign o_b22 = { w_b22[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b22[p_inputBits : 0]  };
assign o_b23 = { w_b23[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b23[p_inputBits : 0]  };

assign o_b24 = { w_b24[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b24[p_inputBits : 0]  };
assign o_b25 = { w_b25[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b25[p_inputBits : 0]  };
assign o_b26 = { w_b26[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b26[p_inputBits : 0]  };
assign o_b27 = { w_b27[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b27[p_inputBits : 0]  };

assign o_b28 = { w_b28[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b28[p_inputBits : 0]  };
assign o_b29 = { w_b29[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b29[p_inputBits : 0]  };
assign o_b30 = { w_b30[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b30[p_inputBits : 0]  };
assign o_b31 = { w_b31[2* (2*p_inputBits) - p_inputBits + 1 : (2*p_inputBits) + 1] , w_b31[p_inputBits : 0]  };



//MAC blocks instantiation

sharedComplexMUL  #(  .p_inputWidth(p_realBits),
            .p_PointPosition(p_PointPosition)  
            )
mac0 (    .CLK(CLK),
        .RST(RST),

        .i_m1(w_x0),
        .i_m2(w_x1),
        .i_m3(w_x4),
        .i_m4(w_x5),

        .i_n1(w_x2),
        .i_n2(w_x3),
        .i_n3(w_x6),
        .i_n4(w_x7),

        .i_l1(i_w04), 
        .i_l2(i_w14),
        .i_l3(i_w04),
        .i_l4(i_w14),

        .o_r1_p(w_b0),
        .o_r1_m(w_b2),
        .o_r2_p(w_b1),
        .o_r2_m(w_b3),
        .o_r3_p(w_b4),
        .o_r3_m(w_b6),
        .o_r4_p(w_b5),
        .o_r4_m(w_b7)

);

sharedComplexMUL  #(  .p_inputWidth(p_realBits),
            .p_PointPosition(p_PointPosition)  
            )
mac1 (    .CLK(CLK),
        .RST(RST),

        .i_m1(w_x8),
        .i_m2(w_x9),
        .i_m3(w_x12),
        .i_m4(w_x13),

        .i_n1(w_x10),
        .i_n2(w_x11),
        .i_n3(w_x14),
        .i_n4(w_x15),

        .i_l1(i_w04), 
        .i_l2(i_w14),
        .i_l3(i_w04),
        .i_l4(i_w14),

        .o_r1_p(w_b8),
        .o_r1_m(w_b10),
        .o_r2_p(w_b9),
        .o_r2_m(w_b11),
        .o_r3_p(w_b12),
        .o_r3_m(w_b14),
        .o_r4_p(w_b13),
        .o_r4_m(w_b15)
);

sharedComplexMUL  #(  .p_inputWidth(p_realBits),
            .p_PointPosition(p_PointPosition)  
            )
mac2 (    .CLK(CLK),
        .RST(RST),

        .i_m1(w_x16),
        .i_m2(w_x17),
        .i_m3(w_x20),
        .i_m4(w_x21),

        .i_n1(w_x18),
        .i_n2(w_x19),
        .i_n3(w_x22),
        .i_n4(w_x23),

        .i_l1(i_w04), 
        .i_l2(i_w14),
        .i_l3(i_w04),
        .i_l4(i_w14),

        .o_r1_p(w_b16),
        .o_r1_m(w_b18),
        .o_r2_p(w_b17),
        .o_r2_m(w_b19),
        .o_r3_p(w_b20),
        .o_r3_m(w_b22),
        .o_r4_p(w_b21),
        .o_r4_m(w_b23)
);

sharedComplexMUL  #(  .p_inputWidth(p_realBits),
            .p_PointPosition(p_PointPosition)  
            )
mac3 (    .CLK(CLK),
        .RST(RST),

        .i_m1(w_x24),
        .i_m2(w_x25),
        .i_m3(w_x28),
        .i_m4(w_x29),

        .i_n1(w_x26),
        .i_n2(w_x27),
        .i_n3(w_x30),
        .i_n4(w_x31),

        .i_l1(i_w04), 
        .i_l2(i_w14),
        .i_l3(i_w04),
        .i_l4(i_w14),

        .o_r1_p(w_b24),
        .o_r1_m(w_b26),
        .o_r2_p(w_b25),
        .o_r2_m(w_b27),
        .o_r3_p(w_b28),
        .o_r3_m(w_b30),
        .o_r4_p(w_b29),
        .o_r4_m(w_b31)
);

endmodule

