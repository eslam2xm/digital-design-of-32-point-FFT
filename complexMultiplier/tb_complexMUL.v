`timescale 1ns / 1ps


module tb_complexMUL(

    );
    
    parameter p_inputWidth                  = 8;
    parameter p_PointPosition               = 3;
    
    reg [p_inputWidth-1:0] inAr;
    reg [p_inputWidth-1:0] inAi;
    reg [p_inputWidth-1:0] inBr;
    reg [p_inputWidth-1:0] inBi;
    wire [2*p_inputWidth - p_PointPosition :0] o_ResR;
    wire [2*p_inputWidth - p_PointPosition :0] o_ResI;
    
    
    complexMUL  #(p_inputWidth,p_PointPosition) dut
                (inAr,inAi,inBr,inBi,o_ResR,o_ResI);
                
    initial begin
        inAr <= 2;
        inAi <= 10;
        inBr <= 5;
        inBi <= 24;
        
        #10
        
        inAr <= 17;
        inAi <= 32;
        inBr <= 27;
        inBi <= 51;
        
        
        forever begin
        
        #10
        inAr <= $urandom;
        inAi <= $urandom;
        inBr <= $urandom;
        inBi <= $urandom;
        
        end
        
        
        $stop;
        
    end
    
endmodule





