`timescale 1ns / 1ps
/*
 there are 32 Inputs from b0 to b31 
there are four different  widdle values at this stage
there are 32 outputs from c0 to c31 
*/

module Stage2 #(    parameter p_inputBits=16,
                    parameter p_outputBits=20,
                    parameter p_widdleBits=4

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

MAC  #(  .p_inputMacBits(p_inputBits),
            .p_outputMacBits(p_outputBits),
            .p_widdleMacBits(p_widdleBits)  
            )
mac0 (   .CLK(CLK),
        .RST(RST),
        .MAca0(i_b0),
        .MAca1(i_b1),
        .MAca2(i_b2),
        .MAca3(i_b3),
        .MAcb0(i_b4),
        .MAcb1(i_b5),
        .MAcb2(i_b6),
        .MAcb3(i_b7),
        .MAcc0(i_w08), 
        .MAcc1(i_w18),
        .MAcc2(i_w28),
        .MAcc3(i_w38),
        .MAcOut0(o_c0),
        .MAcOut1(o_c4),
        .MAcOut2(o_c1),
        .MAcOut3(o_c5),
        .MAcOut4(o_c2),
        .MAcOut5(o_c6),
        .MAcOut6(o_c3),
        .MAcOut7(o_c7)
);

MAC  #(  .p_inputMacBits(p_inputBits),
            .p_outputMacBits(p_outputBits),
            .p_widdleMacBits(p_widdleBits)  
            )

mac1 (   .CLK(CLK),
        .RST(RST),
        .MAca0(i_b8),
        .MAca1(i_b9),
        .MAca2(i_b10),
        .MAca3(i_b11),
        .MAcb0(i_b12),
        .MAcb1(i_b13),
        .MAcb2(i_b14),
        .MAcb3(i_b15),
        .MAcc0(i_w08), 
        .MAcc1(i_w18),
        .MAcc2(i_w28),
        .MAcc3(i_w38),
        .MAcOut0(o_c8),
        .MAcOut1(o_c12),
        .MAcOut2(o_c9),
        .MAcOut3(o_c13),
        .MAcOut4(o_c10),
        .MAcOut5(o_c14),
        .MAcOut6(o_c11),
        .MAcOut7(o_c15)
);


MAC  #(  .p_inputMacBits(p_inputBits),
            .p_outputMacBits(p_outputBits),
            .p_widdleMacBits(p_widdleBits)  
            )

mac2 (   .CLK(CLK),
        .RST(RST),
        .MAca0(i_b16),
        .MAca1(i_b17),
        .MAca2(i_b18),
        .MAca3(i_b19),
        .MAcb0(i_b20),
        .MAcb1(i_b21),
        .MAcb2(i_b22),
        .MAcb3(i_b23),
        .MAcc0(i_w08), 
        .MAcc1(i_w18),
        .MAcc2(i_w28),
        .MAcc3(i_w38),
        .MAcOut0(o_c16),
        .MAcOut1(o_c20),
        .MAcOut2(o_c17),
        .MAcOut3(o_c21),
        .MAcOut4(o_c18),
        .MAcOut5(o_c22),
        .MAcOut6(o_c19),
        .MAcOut7(o_c23)
);


MAC  #(  .p_inputMacBits(p_inputBits),
            .p_outputMacBits(p_outputBits),
            .p_widdleMacBits(p_widdleBits)  
            )

mac3 (   .CLK(CLK),
        .RST(RST),
        .MAca0(i_b24),
        .MAca1(i_b25),
        .MAca2(i_b26),
        .MAca3(i_b27),
        .MAcb0(i_b28),
        .MAcb1(i_b29),
        .MAcb2(i_b30),
        .MAcb3(i_b31),
        .MAcc0(i_w08), 
        .MAcc1(i_w18),
        .MAcc2(i_w28),
        .MAcc3(i_w38),
        .MAcOut0(o_c24),
        .MAcOut1(o_c28),
        .MAcOut2(o_c25),
        .MAcOut3(o_c29),
        .MAcOut4(o_c26),
        .MAcOut5(o_c30),
        .MAcOut6(o_c27),
        .MAcOut7(o_c31)
);

endmodule