`timescale 1ns / 1ps
/*
* This compinational module takes 2 complex numbers and outputs their complex product
* The two inputs are formated as fixed point numbers with a number of decimal points equal to p_PointPosition
* The input width is specified by p_inputWidth
* 
* Module Equation:
*     o_ResR + i o_ResI = ( inAr + i inAi ) * ( inBr + i inBi )
*     
* The results's width is calculated as follows:
*     -The result has the same number of decimal points as the inputs (p_PointPosition)
*     -The length of integer bits is equal to double (due to multiplication) the input integer
*      length ( p_inputWidth - p_PointPosition) plus one (due to the addition for complex numbers)
* 
*/


module complexMUL #(    parameter p_inputWidth          = 8,
                        parameter p_PointPosition       = 3
                   )
                    (
                    input  signed [p_inputWidth-1 :0]  inAr,
                    input  signed [p_inputWidth-1 :0]  inAi,
                    input  signed [p_inputWidth-1 :0]  inBr,
                    input  signed [p_inputWidth-1 :0]  inBi,
                    output signed [2*p_inputWidth - p_PointPosition :0] o_ResR,
                    output signed [2*p_inputWidth - p_PointPosition :0] o_ResI
                    );
                    
    //These wires are the result of the multiplication without removing any..
    //..bits for approximations
    wire signed [ 2 * p_inputWidth : 0] RealResult, ImagResult;
    wire signed [ 2 * p_inputWidth - 1 : 0] R1, R2, I1, I2;
    
    assign R1 = inAr * inBr;
    assign R2 = inAi * inBi;
    assign I1 = inAr * inBi;
    assign I2 = inAi * inBr;
    
    //Adding and using sign extend for 1 bit
    assign RealResult = {R1[2 * p_inputWidth - 1], R1} - {R2[2 * p_inputWidth - 1], R2};
    assign ImagResult = {I1[2 * p_inputWidth - 1], I1} + {I2[2 * p_inputWidth - 1], I2};
    
    
    // Generate block to handle the p_PointPosition=0 case
    generate
    
        if(p_PointPosition != 0 ) begin
            //Removing bits left and right to fit the width we want
            //The integer width is simply the output width needed without the point position
            //For the decimal part we discard from the right what is not longer than the speicified output point position
            assign o_ResR = {RealResult [2 * p_inputWidth : 2*p_PointPosition], 
                             RealResult [2* p_PointPosition - 1 : p_PointPosition]};
                             
            assign o_ResI = {ImagResult [2 * p_inputWidth : 2*p_PointPosition], 
                             ImagResult [2* p_PointPosition - 1 : p_PointPosition]};
                             
         end
         else begin
            // if there is no decimal bits then just output the value without removing bits
            assign o_ResR = RealResult [2 * p_inputWidth : 0];
                             
            assign o_ResI = ImagResult [2 * p_inputWidth : 0];
         
         end
     
     endgenerate
    
endmodule








