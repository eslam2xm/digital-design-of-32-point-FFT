`timescale 1ns / 1ps
/*
 there are 32 Inputs from a0 to a31 
there are 2 different  widdle values at this stage
there are 32 outputs from b0 to b31 
*/

module Stage1 #(    parameter p_inputBits=9,
                    parameter p_outputBits=16,
                    parameter p_widdleBits=4

            )
            (   
                ///// clock and reset ///////
                input   CLK,
                input   RST,
                //// inputs to the stage //////////
                input   [p_inputBits-1:0]  i_a0  ,
                input   [p_inputBits-1:0]  i_a1  ,
                input   [p_inputBits-1:0]  i_a2  ,
                input   [p_inputBits-1:0]  i_a3  ,
                input   [p_inputBits-1:0]  i_a4  ,
                input   [p_inputBits-1:0]  i_a5  ,
                input   [p_inputBits-1:0]  i_a6  ,
                input   [p_inputBits-1:0]  i_a7  ,
                input   [p_inputBits-1:0]  i_a8  ,
                input   [p_inputBits-1:0]  i_a9  ,
                input   [p_inputBits-1:0]  i_a10  ,
                input   [p_inputBits-1:0]  i_a11  ,
                input   [p_inputBits-1:0]  i_a12  ,
                input   [p_inputBits-1:0]  i_a13  ,
                input   [p_inputBits-1:0]  i_a14  ,
                input   [p_inputBits-1:0]  i_a15  ,
                input   [p_inputBits-1:0]  i_a16  ,
                input   [p_inputBits-1:0]  i_a17  ,
                input   [p_inputBits-1:0]  i_a18  ,
                input   [p_inputBits-1:0]  i_a19  ,
                input   [p_inputBits-1:0]  i_a20  ,
                input   [p_inputBits-1:0]  i_a21  ,
                input   [p_inputBits-1:0]  i_a22  ,
                input   [p_inputBits-1:0]  i_a23  ,
                input   [p_inputBits-1:0]  i_a24  ,
                input   [p_inputBits-1:0]  i_a25  ,
                input   [p_inputBits-1:0]  i_a26  ,
                input   [p_inputBits-1:0]  i_a27  ,
                input   [p_inputBits-1:0]  i_a28  ,
                input   [p_inputBits-1:0]  i_a29  ,
                input   [p_inputBits-1:0]  i_a30  ,
                input   [p_inputBits-1:0]  i_a31  ,

                ////////// Widdle at the stage ///////
                input   [p_widdleBits-1:0]  i_w04,
                input   [p_widdleBits-1:0]  i_w14,
                ////// Outputs from the stage ///////
                
                output  [p_outputBits-1:0]  o_b0  ,
                output  [p_outputBits-1:0]  o_b1  ,
                output  [p_outputBits-1:0]  o_b2  ,
                output  [p_outputBits-1:0]  o_b3  ,
                output  [p_outputBits-1:0]  o_b4  ,
                output  [p_outputBits-1:0]  o_b5  ,
                output  [p_outputBits-1:0]  o_b6  ,
                output  [p_outputBits-1:0]  o_b7  ,
                output  [p_outputBits-1:0]  o_b8  ,
                output  [p_outputBits-1:0]  o_b9  ,
                output  [p_outputBits-1:0]  o_b10  ,
                output  [p_outputBits-1:0]  o_b11  ,
                output  [p_outputBits-1:0]  o_b12  ,
                output  [p_outputBits-1:0]  o_b13  ,
                output  [p_outputBits-1:0]  o_c14  ,
                output  [p_outputBits-1:0]  o_b15  ,
                output  [p_outputBits-1:0]  o_b16  ,
                output  [p_outputBits-1:0]  o_b17  ,
                output  [p_outputBits-1:0]  o_b18  ,
                output  [p_outputBits-1:0]  o_b19  ,
                output  [p_outputBits-1:0]  o_b20  ,
                output  [p_outputBits-1:0]  o_b21  ,
                output  [p_outputBits-1:0]  o_b22  ,
                output  [p_outputBits-1:0]  o_b23  ,
                output  [p_outputBits-1:0]  o_b24  ,
                output  [p_outputBits-1:0]  o_b25  ,
                output  [p_outputBits-1:0]  o_b26  ,
                output  [p_outputBits-1:0]  o_b27  ,
                output  [p_outputBits-1:0]  o_b28  ,
                output  [p_outputBits-1:0]  o_b29  ,
                output  [p_outputBits-1:0]  o_b30  ,
                output  [p_outputBits-1:0]  o_b31  
            );


MAC  #(  .p_inputMacBits(p_inputBits),
            .p_outputMacBits(p_outputBits),
            .p_widdleMacBits(p_widdleBits)  
            )
mac0 (   .CLK(CLK),
        .RST(RST),

        .MAca0(i_a0),
        .MAca1(i_a1),
        .MAca2(i_a4),
        .MAca3(i_a5),

        .MAcb0(i_a2),
        .MAcb1(i_a3),
        .MAcb2(i_a6),
        .MAcb3(i_a7),

        .MAcc0(i_w04), 
        .MAcc1(i_w14),
        .MAcc2(i_w04),
        .MAcc3(i_w14),

        .MAcOut0(o_b0),
        .MAcOut1(o_b2),
        .MAcOut2(o_b1),
        .MAcOut3(o_b3),
        .MAcOut4(o_b4),
        .MAcOut5(o_b6),
        .MAcOut6(o_b5),
        .MAcOut7(o_b7)
);

MAC  #(  .p_inputMacBits(p_inputBits),
            .p_outputMacBits(p_outputBits),
            .p_widdleMacBits(p_widdleBits)  
            )
mac1 (   .CLK(CLK),
        .RST(RST),

        .MAca0(i_a8),
        .MAca1(i_a9),
        .MAca2(i_a12),
        .MAca3(i_a13),

        .MAcb0(i_a10),
        .MAcb1(i_a11),
        .MAcb2(i_a14),
        .MAcb3(i_a15),

        .MAcc0(i_w04), 
        .MAcc1(i_w14),
        .MAcc2(i_w04),
        .MAcc3(i_w14),

        .MAcOut0(o_b8),
        .MAcOut1(o_b10),
        .MAcOut2(o_b9),
        .MAcOut3(o_b11),
        .MAcOut4(o_b12),
        .MAcOut5(o_b14),
        .MAcOut6(o_b13),
        .MAcOut7(o_b15)
);

MAC  #(  .p_inputMacBits(p_inputBits),
            .p_outputMacBits(p_outputBits),
            .p_widdleMacBits(p_widdleBits)  
            )
mac2 (   .CLK(CLK),
        .RST(RST),

        .MAca0(i_a16),
        .MAca1(i_a17),
        .MAca2(i_a20),
        .MAca3(i_a21),

        .MAcb0(i_a18),
        .MAcb1(i_a19),
        .MAcb2(i_a22),
        .MAcb3(i_a23),

        .MAcc0(i_w04), 
        .MAcc1(i_w14),
        .MAcc2(i_w04),
        .MAcc3(i_w14),

        .MAcOut0(o_b16),
        .MAcOut1(o_b18),
        .MAcOut2(o_b17),
        .MAcOut3(o_b19),
        .MAcOut4(o_b20),
        .MAcOut5(o_b22),
        .MAcOut6(o_b21),
        .MAcOut7(o_b23)
);

MAC  #(  .p_inputMacBits(p_inputBits),
            .p_outputMacBits(p_outputBits),
            .p_widdleMacBits(p_widdleBits)  
            )
mac3 (   .CLK(CLK),
        .RST(RST),

        .MAca0(i_a24),
        .MAca1(i_a25),
        .MAca2(i_a28),
        .MAca3(i_a29),

        .MAcb0(i_a26),
        .MAcb1(i_a27),
        .MAcb2(i_a30),
        .MAcb3(i_a31),

        .MAcc0(i_w04), 
        .MAcc1(i_w14),
        .MAcc2(i_w04),
        .MAcc3(i_w14),

        .MAcOut0(o_b24),
        .MAcOut1(o_b26),
        .MAcOut2(o_b25),
        .MAcOut3(o_b27),
        .MAcOut4(o_b28),
        .MAcOut5(o_b30),
        .MAcOut6(o_b29),
        .MAcOut7(o_b31)
);

endmodule