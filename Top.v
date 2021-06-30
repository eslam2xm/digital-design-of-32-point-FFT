`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2021 05:11:56 PM
// Design Name: 
// Module Name: Top
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


module Top #(
            parameter p_InputWidth = 8, 
            parameter p_OutputWidth = 32,
            parameter p_PointPosition = 3
           )
           (        
        input CLK_10,CLK_50,
        input RST,
        
                input signed [p_InputWidth-1 : 0] x0,
                input signed [p_InputWidth-1 : 0] x1,
                input signed [p_InputWidth-1 : 0] x2,
                input signed [p_InputWidth-1 : 0] x3,
                input signed [p_InputWidth-1 : 0] x4,
                input signed [p_InputWidth-1 : 0] x5,
                input signed [p_InputWidth-1 : 0] x6,
                input signed [p_InputWidth-1 : 0] x7,
                input signed [p_InputWidth-1 : 0] x8,
                input signed [p_InputWidth-1 : 0] x9,
                input signed [p_InputWidth-1 : 0] x10,
                input signed [p_InputWidth-1 : 0] x11,
                input signed [p_InputWidth-1 : 0] x12,
                input signed [p_InputWidth-1 : 0] x13,
                input signed [p_InputWidth-1 : 0] x14,
                input signed [p_InputWidth-1 : 0] x15,
                input signed [p_InputWidth-1 : 0] x16,
                input signed [p_InputWidth-1 : 0] x17,
                input signed [p_InputWidth-1 : 0] x18,
                input signed [p_InputWidth-1 : 0] x19,
                input signed [p_InputWidth-1 : 0] x20,
                input signed [p_InputWidth-1 : 0] x21,
                input signed [p_InputWidth-1 : 0] x22,
                input signed [p_InputWidth-1 : 0] x23,
                input signed [p_InputWidth-1 : 0] x24,
                input signed [p_InputWidth-1 : 0] x25,
                input signed [p_InputWidth-1 : 0] x26,
                input signed [p_InputWidth-1 : 0] x27,
                input signed [p_InputWidth-1 : 0] x28,
                input signed [p_InputWidth-1 : 0] x29,
                input signed [p_InputWidth-1 : 0] x30,
                input signed [p_InputWidth-1 : 0] x31,
                
                output signed  [p_OutputWidth-1:0]  X0  ,
                output signed  [p_OutputWidth-1:0]  X1  ,
                output signed  [p_OutputWidth-1:0]  X2  ,
                output signed  [p_OutputWidth-1:0]  X3  ,
                output signed  [p_OutputWidth-1:0]  X4  ,
                output signed  [p_OutputWidth-1:0]  X5  ,
                output signed  [p_OutputWidth-1:0]  X6  ,
                output signed  [p_OutputWidth-1:0]  X7  ,
                output signed  [p_OutputWidth-1:0]  X8  ,
                output signed  [p_OutputWidth-1:0]  X9  ,
                output signed  [p_OutputWidth-1:0]  X10  ,
                output signed  [p_OutputWidth-1:0]  X11  ,
                output signed  [p_OutputWidth-1:0]  X12  ,
                output signed  [p_OutputWidth-1:0]  X13  ,
                output signed  [p_OutputWidth-1:0]  X14  ,
                output signed  [p_OutputWidth-1:0]  X15  ,
                output signed  [p_OutputWidth-1:0]  X16  ,
                output signed  [p_OutputWidth-1:0]  X17  ,
                output signed  [p_OutputWidth-1:0]  X18  ,
                output signed  [p_OutputWidth-1:0]  X19  ,
                output signed  [p_OutputWidth-1:0]  X20  ,
                output signed  [p_OutputWidth-1:0]  X21  ,
                output signed  [p_OutputWidth-1:0]  X22  ,
                output signed  [p_OutputWidth-1:0]  X23  ,
                output signed  [p_OutputWidth-1:0]  X24  ,
                output signed  [p_OutputWidth-1:0]  X25  ,
                output signed  [p_OutputWidth-1:0]  X26  ,
                output signed  [p_OutputWidth-1:0]  X27  ,
                output signed  [p_OutputWidth-1:0]  X28  ,
                output signed  [p_OutputWidth-1:0]  X29  ,
                output signed  [p_OutputWidth-1:0]  X30  ,
                output signed  [p_OutputWidth-1:0]  X31  
        
    );
    
    // Stage 0
    wire signed [p_InputWidth-1:0]  i_x [31:0];
    wire signed [9-1:0]  o_a [31:0];
    // Stage 1
    wire signed [9-1:0] i_a [31:0];
    wire signed [20-1:0] o_b [31:0];
    // Stage 2
    wire signed [20-1:0]  i_b [31:0];
    wire signed [28-1:0] o_c [31:0];
    // Stage 3
    wire signed [28-1:0]  i_c [31:0];
    wire signed [30-1:0] o_d [31:0];
    //Stage 4
    wire signed [30-1:0]  i_d [31:0];
    wire signed [p_OutputWidth-1:0]  o_X[31:0];
    
    
 Register #(8) regI0 ( .i_data(x0), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[0]));   
 
 Register #(8) regI1 ( .i_data(x16), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[1]));
 
 Register #(8) regI2 ( .i_data(x8), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[2]));
 
 Register #(8) regI3 ( .i_data(x24), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[3]));   
 
 Register #(8) regI4 ( .i_data(x4), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[4]));
 
 Register #(8) regI5 ( .i_data(x20), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[5]));
 
 Register #(8) regI6 ( .i_data(x12), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[6]));               
    
 Register #(8) regI7 ( .i_data(x28), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[7]));   
 
 Register #(8) regI8 ( .i_data(x2), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[8]));
 
 Register #(8) regI9 ( .i_data(x18), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[9]));
 
 Register #(8) regI10 ( .i_data(x10), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[10]));
 
 Register #(8) regI11 ( .i_data(x26), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[11]));
 
 Register #(8) regI12 ( .i_data(x6), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[12]));
 
 Register #(8) regI13 ( .i_data(x22), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[13]));
 
 Register #(8) regI14 ( .i_data(x14), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[14]));
 
 Register #(8) regI15 ( .i_data(x30), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[15]));
 
 Register #(8) regI16 ( .i_data(x1), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[16]));
 
 Register #(8) regI17 ( .i_data(x17), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[17]));
 
 Register #(8) regI18 ( .i_data(x9), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[18]));
 
 Register #(8) regI19 ( .i_data(x25), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[19]));
 
 Register #(8) regI20 ( .i_data(x5), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[20]));
 
 Register #(8) regI21 ( .i_data(x21), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[21]));
 
 Register #(8) regI22 ( .i_data(x13), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[22]));
 
 Register #(8) regI23 ( .i_data(x29), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[23]));
 
 Register #(8) regI24 ( .i_data(x3), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[24]));
 
 Register #(8) regI25 ( .i_data(x19), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[25]));
 
 Register #(8) regI26 ( .i_data(x11), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[26]));
 
 Register #(8) regI27 ( .i_data(x27), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[27]));
 
 Register #(8) regI28 ( .i_data(x7), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[28])); 
 
 Register #(8) regI29 ( .i_data(x23), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[29]));
 
 Register #(8) regI30 ( .i_data(x15), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[30]));
 
 Register #(8) regI31 ( .i_data(x31), .i_load(1'b1), .CLK(CLK_10), .o_data(i_x[31]));
    
 stage0_withoutMAC #( .p_inputWidth(p_InputWidth),
                 .p_PointPosition (0)
                )
                Stage0
                (
                .CLK(CLK_50),
                .RST(RST),
                ///// input signedS \\\\\
                .i_x0(i_x[0]),
                .i_x1(i_x[1]),
                .i_x2(i_x[2]),
                .i_x3(i_x[3]),
                .i_x4(i_x[4]),
                .i_x5(i_x[5]),
                .i_x6(i_x[6]),
                .i_x7(i_x[7]),
                .i_x8(i_x[8]),
                .i_x9(i_x[9]),
                .i_x10(i_x[10]),
                .i_x11(i_x[11]),
                .i_x12(i_x[12]),
                .i_x13(i_x[13]),
                .i_x14(i_x[14]),
                .i_x15(i_x[15]),
                .i_x16(i_x[16]),
                .i_x17(i_x[17]),
                .i_x18(i_x[18]),
                .i_x19(i_x[19]),
                .i_x20(i_x[20]),
                .i_x21(i_x[21]),
                .i_x22(i_x[22]),
                .i_x23(i_x[23]),
                .i_x24(i_x[24]),
                .i_x25(i_x[25]),
                .i_x26(i_x[26]),
                .i_x27(i_x[27]),
                .i_x28(i_x[28]),
                .i_x29(i_x[29]),
                .i_x30(i_x[30]),
                .i_x31(i_x[31]),
                ///// OUTPUTS \\\\\
                .o_a0(o_a[0]),
                .o_a1(o_a[1]),
                .o_a2(o_a[2]),
                .o_a3(o_a[3]),
                .o_a4(o_a[4]),
                .o_a5(o_a[5]),
                .o_a6(o_a[6]),
                .o_a7(o_a[7]),
                .o_a8(o_a[8]),
                .o_a9(o_a[9]),
                .o_a10(o_a[10]),
                .o_a11(o_a[11]),
                .o_a12(o_a[12]),
                .o_a13(o_a[13]),
                .o_a14(o_a[14]),
                .o_a15(o_a[15]),
                .o_a16(o_a[16]),
                .o_a17(o_a[17]),
                .o_a18(o_a[18]),
                .o_a19(o_a[19]),
                .o_a20(o_a[20]),
                .o_a21(o_a[21]),
                .o_a22(o_a[22]),
                .o_a23(o_a[23]),
                .o_a24(o_a[24]),
                .o_a25(o_a[25]),
                .o_a26(o_a[26]),
                .o_a27(o_a[27]),
                .o_a28(o_a[28]),
                .o_a29(o_a[29]),
                .o_a30(o_a[30]),
                .o_a31(o_a[31])
                  );
                  
    generate 
        genvar i;
        for ( i =0 ; i < 32 ; i = i+1) 
            begin 
            Register #(9) reg01
              ( .i_data(o_a[i]), 
               .i_load(1'b1), 
               .CLK(CLK_10), 
               .o_data(i_a[i]));
            end
    endgenerate 
    
    Stage1 #( .p_inputBits(9),
                    .p_outputBits(20),
                    .p_widdleBits(18),
                    .p_PointPosition(0),
                    .p_realBits(9)
            )
            stage1
            (   
                ///// clock and reset ///////
                .CLK(CLK_50),
                .RST(RST),
                //// inputs to the stage //////////
                .i_a0(i_a[0]),
                .i_a1(i_a[1]),
                .i_a2(i_a[2]),
                .i_a3(i_a[3]),
                .i_a4(i_a[4]),
                .i_a5(i_a[5]),
                .i_a6(i_a[6]),
                .i_a7(i_a[7]),
                .i_a8(i_a[8]),
                .i_a9(i_a[9]),
                .i_a10(i_a[10]),
                .i_a11(i_a[11]),
                .i_a12(i_a[12]),
                .i_a13(i_a[13]),
                .i_a14(i_a[14]),
                .i_a15(i_a[15]),
                .i_a16(i_a[16]),
                .i_a17(i_a[17]),
                .i_a18(i_a[18]),
                .i_a19(i_a[19]),
                .i_a20(i_a[20]),
                .i_a21(i_a[21]),
                .i_a22(i_a[22]),
                .i_a23(i_a[23]),
                .i_a24(i_a[24]),
                .i_a25(i_a[25]),
                .i_a26(i_a[26]),
                .i_a27(i_a[27]),
                .i_a28(i_a[28]),
                .i_a29(i_a[29]),
                .i_a30(i_a[30]),
                .i_a31(i_a[31]),

                ////////// Widdle at the stage ///////
                .i_w04(18'h00200),
                .i_w14(18'h001FF),
                ////// Outputs from the stage ///////
                
                .o_b0(o_b[0]),
                .o_b1(o_b[1]),
                .o_b2(o_b[2]),
                .o_b3(o_b[3]),
                .o_b4(o_b[4]),
                .o_b5(o_b[5]),
                .o_b6(o_b[6]),
                .o_b7(o_b[7]),
                .o_b8(o_b[8]),
                .o_b9(o_b[9]),
                .o_b10(o_b[10]),
                .o_b11(o_b[11]),
                .o_b12(o_b[12]),
                .o_b13(o_b[13]),
                .o_b14(o_b[14]),
                .o_b15(o_b[15]),
                .o_b16(o_b[16]),
                .o_b17(o_b[17]),
                .o_b18(o_b[18]),
                .o_b19(o_b[19]),
                .o_b20(o_b[20]),
                .o_b21(o_b[21]),
                .o_b22(o_b[22]),
                .o_b23(o_b[23]),
                .o_b24(o_b[24]),
                .o_b25(o_b[25]),
                .o_b26(o_b[26]),
                .o_b27(o_b[27]),
                .o_b28(o_b[28]),
                .o_b29(o_b[29]),
                .o_b30(o_b[30]),
                .o_b31(o_b[31])
            );
  generate 
        genvar j;
        for ( j =0 ; j < 32 ; j = j+1) 
            begin 
            Register #(20) reg12
              ( .i_data(o_b[j]), 
               .i_load(1'b1), 
               .CLK(CLK_10), 
               .o_data(i_b[j]));
            end
    endgenerate  
    
  Stage2 #( .p_PointPosition    ( p_PointPosition),
            .p_realBits         (13),
            .p_numberOf_unneded_bits(10)
            )
            stage_2
            (   
                
                ///// clock and reset ///////
                .CLK(CLK_50),
                .RST(RST),
                //// inputs to the stage //////////
                .i_b0(i_b[0])  ,
                .i_b1(i_b[1])  ,
                .i_b2(i_b[2])  ,
                .i_b3(i_b[3])  ,
                .i_b4(i_b[4])  ,
                .i_b5(i_b[5])  ,
                .i_b6(i_b[6])  ,
                .i_b7(i_b[7])  ,
                .i_b8(i_b[8])  ,
                .i_b9(i_b[9])  ,
                .i_b10(i_b[10])  ,
                .i_b11(i_b[11])  ,
                .i_b12(i_b[12])  ,
                .i_b13(i_b[13])  ,
                .i_b14(i_b[14])  ,
                .i_b15(i_b[15])  ,
                .i_b16(i_b[16])  ,
                .i_b17(i_b[17])  ,
                .i_b18(i_b[18])  ,
                .i_b19(i_b[19])  ,
                .i_b20(i_b[20])  ,
                .i_b21(i_b[21])  ,
                .i_b22(i_b[22])  ,
                .i_b23(i_b[23])  ,
                .i_b24(i_b[24])  ,
                .i_b25(i_b[25])  ,
                .i_b26(i_b[26])  ,
                .i_b27(i_b[27])  ,
                .i_b28(i_b[28])  ,
                .i_b29(i_b[29])  ,
                .i_b30(i_b[30])  ,
                .i_b31(i_b[31])  ,
                ////// Outputs from the stage ///////
                .o_c0(o_c[0])  ,
                .o_c1(o_c[1])  ,
                .o_c2(o_c[2])  ,
                .o_c3(o_c[3])  ,
                .o_c4(o_c[4])  ,
                .o_c5(o_c[5])  ,
                .o_c6(o_c[6])  ,
                .o_c7(o_c[7])  ,
                .o_c8(o_c[8])  ,
                .o_c9(o_c[9])  ,
                .o_c10(o_c[10])  ,
                .o_c11(o_c[11])  ,
                .o_c12(o_c[12])  ,
                .o_c13(o_c[13])  ,
                .o_c14(o_c[14])  ,
                .o_c15(o_c[15])  ,
                .o_c16(o_c[16])  ,
                .o_c17(o_c[17])  ,
                .o_c18(o_c[18])  ,
                .o_c19(o_c[19])  ,
                .o_c20(o_c[20])  ,
                .o_c21(o_c[21])  ,
                .o_c22(o_c[22])  ,
                .o_c23(o_c[23])  ,
                .o_c24(o_c[24])  ,
                .o_c25(o_c[25])  ,
                .o_c26(o_c[26])  ,
                .o_c27(o_c[27])  ,
                .o_c28(o_c[28])  ,
                .o_c29(o_c[29])  ,
                .o_c30(o_c[30])  ,
                .o_c31(o_c[31])  
            );  
    
    generate 
        genvar k;
        for ( k =0 ; k < 32 ; k = k+1) 
            begin 
            Register #(28) reg23
              ( .i_data(o_c[k]), 
               .i_load(1'b1), 
               .CLK(CLK_10), 
               .o_data(i_c[k]));
            end
    endgenerate 
    
    Stage3 #(   .p_realBits        (14),
            .p_PointPosition    ( p_PointPosition),
            .p_numberOf_unneded_bits(10)
            )
            stage_3
            (   
                
                ///// clock and reset ///////
                .CLK(CLK_50),
                .RST(RST),
                //// inputs to the stage //////////
                .i_c0(i_c[0])  ,
                .i_c1(i_c[1])  ,
                .i_c2(i_c[2])  ,
                .i_c3(i_c[3])  ,
                .i_c4(i_c[4])  ,
                .i_c5(i_c[5])  ,
                .i_c6(i_c[6])  ,
                .i_c7(i_c[7])  ,
                .i_c8(i_c[8])  ,
                .i_c9(i_c[9])  ,
                .i_c10(i_c[10])  ,
                .i_c11(i_c[11])  ,
                .i_c12(i_c[12])  ,
                .i_c13(i_c[13])  ,
                .i_c14(i_c[14])  ,
                .i_c15(i_c[15])  ,
                .i_c16(i_c[16])  ,
                .i_c17(i_c[17])  ,
                .i_c18(i_c[18])  ,
                .i_c19(i_c[19])  ,
                .i_c20(i_c[20])  ,
                .i_c21(i_c[21])  ,
                .i_c22(i_c[22])  ,
                .i_c23(i_c[23])  ,
                .i_c24(i_c[24])  ,
                .i_c25(i_c[25])  ,
                .i_c26(i_c[26])  ,
                .i_c27(i_c[27])  ,
                .i_c28(i_c[28])  ,
                .i_c29(i_c[29])  ,
                .i_c30(i_c[30])  ,
                .i_c31(i_c[31])  ,
                ////// Outputs from the stage ///////
                .o_d0(o_d[0])  ,
                .o_d1(o_d[1])  ,
                .o_d2(o_d[2])  ,
                .o_d3(o_d[3])  ,
                .o_d4(o_d[4])  ,
                .o_d5(o_d[5])  ,
                .o_d6(o_d[6])  ,
                .o_d7(o_d[7])  ,
                .o_d8(o_d[8])  ,
                .o_d9(o_d[9])  ,
                .o_d10(o_d[10])  ,
                .o_d11(o_d[11])  ,
                .o_d12(o_d[12])  ,
                .o_d13(o_d[13])  ,
                .o_d14(o_d[14])  ,
                .o_d15(o_d[15])  ,
                .o_d16(o_d[16])  ,
                .o_d17(o_d[17])  ,
                .o_d18(o_d[18])  ,
                .o_d19(o_d[19])  ,
                .o_d20(o_d[20])  ,
                .o_d21(o_d[21])  ,
                .o_d22(o_d[22])  ,
                .o_d23(o_d[23])  ,
                .o_d24(o_d[24])  ,
                .o_d25(o_d[25])  ,
                .o_d26(o_d[26])  ,
                .o_d27(o_d[27])  ,
                .o_d28(o_d[28])  ,
                .o_d29(o_d[29])  ,
                .o_d30(o_d[30])  ,
                .o_d31(o_d[31])  
            );
            
    generate 
        genvar M;
        for ( M =0 ; M < 32 ; M = M+1) 
            begin 
            Register #(30) reg34
              ( .i_data(o_d[M]), 
               .i_load(1'b1), 
               .CLK(CLK_10), 
               .o_data(i_d[M]));
            end
    endgenerate 
            

            Stage4 #(   .p_realBits        (15),
            .p_PointPosition    ( p_PointPosition),
            .p_numberOf_unneded_bits(12)
            )
            stage_4
            (   
                
                ///// clock and reset ///////
                .CLK(CLK_50),
                .RST(RST),
                //// inputs to the stage //////////
                .i_d0(i_d[0])  ,
                .i_d1(i_d[1])  ,
                .i_d2(i_d[2])  ,
                .i_d3(i_d[3])  ,
                .i_d4(i_d[4])  ,
                .i_d5(i_d[5])  ,
                .i_d6(i_d[6])  ,
                .i_d7(i_d[7])  ,
                .i_d8(i_d[8])  ,
                .i_d9(i_d[9])  ,
                .i_d10(i_d[10])  ,
                .i_d11(i_d[11])  ,
                .i_d12(i_d[12])  ,
                .i_d13(i_d[13])  ,
                .i_d14(i_d[14])  ,
                .i_d15(i_d[15])  ,
                .i_d16(i_d[16])  ,
                .i_d17(i_d[17])  ,
                .i_d18(i_d[18])  ,
                .i_d19(i_d[19])  ,
                .i_d20(i_d[20])  ,
                .i_d21(i_d[21])  ,
                .i_d22(i_d[22])  ,
                .i_d23(i_d[23])  ,
                .i_d24(i_d[24])  ,
                .i_d25(i_d[25])  ,
                .i_d26(i_d[26])  ,
                .i_d27(i_d[27])  ,
                .i_d28(i_d[28])  ,
                .i_d29(i_d[29])  ,
                .i_d30(i_d[30])  ,
                .i_d31(i_d[31])  ,
                ////// Outputs from the stage ///////
                .o_X0(o_X[0])  ,
                .o_X1(o_X[1])  ,
                .o_X2(o_X[2])  ,
                .o_X3(o_X[3])  ,
                .o_X4(o_X[4])  ,
                .o_X5(o_X[5])  ,
                .o_X6(o_X[6])  ,
                .o_X7(o_X[7])  ,
                .o_X8(o_X[8])  ,
                .o_X9(o_X[9])  ,
                .o_X10(o_X[10])  ,
                .o_X11(o_X[11])  ,
                .o_X12(o_X[12])  ,
                .o_X13(o_X[13])  ,
                .o_X14(o_X[14])  ,
                .o_X15(o_X[15])  ,
                .o_X16(o_X[16])  ,
                .o_X17(o_X[17])  ,
                .o_X18(o_X[18])  ,
                .o_X19(o_X[19])  ,
                .o_X20(o_X[20])  ,
                .o_X21(o_X[21])  ,
                .o_X22(o_X[22])  ,
                .o_X23(o_X[23])  ,
                .o_X24(o_X[24])  ,
                .o_X25(o_X[25])  ,
                .o_X26(o_X[26])  ,
                .o_X27(o_X[27])  ,
                .o_X28(o_X[28])  ,
                .o_X29(o_X[29])  ,
                .o_X30(o_X[30])  ,
                .o_X31(o_X[31])  
            );
            
 Register #(32) regO0 ( .i_data(o_X[0]), .i_load(1'b1), .CLK(CLK_10), .o_data(X0));   
 
 Register #(32) regO1 ( .i_data(o_X[1]), .i_load(1'b1), .CLK(CLK_10), .o_data(X1));
 
 Register #(32) regO2 ( .i_data(o_X[2]), .i_load(1'b1), .CLK(CLK_10), .o_data(X2));
 
 Register #(32) regO3 ( .i_data(o_X[3]), .i_load(1'b1), .CLK(CLK_10), .o_data(X3));   
 
 Register #(32) regO4 ( .i_data(o_X[4]), .i_load(1'b1), .CLK(CLK_10), .o_data(X4));
 
 Register #(32) regO5 ( .i_data(o_X[5]), .i_load(1'b1), .CLK(CLK_10), .o_data(X5));
 
 Register #(32) regO6 ( .i_data(o_X[6]), .i_load(1'b1), .CLK(CLK_10), .o_data(X6));               
    
 Register #(32) regO7 ( .i_data(o_X[7]), .i_load(1'b1), .CLK(CLK_10), .o_data(X7));   
 
 Register #(32) regO8 ( .i_data(o_X[8]), .i_load(1'b1), .CLK(CLK_10), .o_data(X8));
 
 Register #(32) regO9 ( .i_data(o_X[9]), .i_load(1'b1), .CLK(CLK_10), .o_data(X9));
 
 Register #(32) regO10 ( .i_data(o_X[10]), .i_load(1'b1), .CLK(CLK_10), .o_data(X10));
 
 Register #(32) regO11 ( .i_data(o_X[11]), .i_load(1'b1), .CLK(CLK_10), .o_data(X11));
 
 Register #(32) regO12 ( .i_data(o_X[12]), .i_load(1'b1), .CLK(CLK_10), .o_data(X12));
 
 Register #(32) regO13 ( .i_data(o_X[13]), .i_load(1'b1), .CLK(CLK_10), .o_data(X13));
 
 Register #(32) regO14 ( .i_data(o_X[14]), .i_load(1'b1), .CLK(CLK_10), .o_data(X14));
 
 Register #(32) regO15 ( .i_data(o_X[15]), .i_load(1'b1), .CLK(CLK_10), .o_data(X15));
 
 Register #(32) regO16 ( .i_data(o_X[16]), .i_load(1'b1), .CLK(CLK_10), .o_data(X16));
 
 Register #(32) regO17 ( .i_data(o_X[17]), .i_load(1'b1), .CLK(CLK_10), .o_data(X17));
 
 Register #(32) regO18 ( .i_data(o_X[18]), .i_load(1'b1), .CLK(CLK_10), .o_data(X18));
 
 Register #(32) regO19 ( .i_data(o_X[19]), .i_load(1'b1), .CLK(CLK_10), .o_data(X19));
 
 Register #(32) regO20 ( .i_data(o_X[20]), .i_load(1'b1), .CLK(CLK_10), .o_data(X20));
 
 Register #(32) regO21 ( .i_data(o_X[21]), .i_load(1'b1), .CLK(CLK_10), .o_data(X21));
 
 Register #(32) regO22 ( .i_data(o_X[22]), .i_load(1'b1), .CLK(CLK_10), .o_data(X22));
 
 Register #(32) regO23 ( .i_data(o_X[23]), .i_load(1'b1), .CLK(CLK_10), .o_data(X23));
 
 Register #(32) regO24 ( .i_data(o_X[24]), .i_load(1'b1), .CLK(CLK_10), .o_data(X24));
 
Register #(32) regO25 ( .i_data(o_X[25]), .i_load(1'b1), .CLK(CLK_10), .o_data(X25));
 
 Register #(32) regO26 ( .i_data(o_X[26]), .i_load(1'b1), .CLK(CLK_10), .o_data(X26));
 
 Register #(32) regO27 ( .i_data(o_X[27]), .i_load(1'b1), .CLK(CLK_10), .o_data(X27));
 
 Register #(32) regO28 ( .i_data(o_X[28]), .i_load(1'b1), .CLK(CLK_10), .o_data(X28)); 
 
 Register #(32) regO29 ( .i_data(o_X[29]), .i_load(1'b1), .CLK(CLK_10), .o_data(X29));
 
 Register #(32) regO30 ( .i_data(o_X[30]), .i_load(1'b1), .CLK(CLK_10), .o_data(X30));
 
 Register #(32) regO31 ( .i_data(o_X[31]), .i_load(1'b1), .CLK(CLK_10), .o_data(X31));

endmodule
