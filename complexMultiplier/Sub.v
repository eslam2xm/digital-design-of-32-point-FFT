`timescale 1ns / 1ps

//Outputs C = A - B

module Sub #(parameter p_inputWidth          = 8)
    (
     input   signed  [ p_inputWidth - 1 : 0 ] a,
     input   signed  [ p_inputWidth - 1 : 0 ] b,
     output  signed  [ p_inputWidth - 1 : 0 ]    c

    );
    
    assign c = a - b;
    
endmodule
