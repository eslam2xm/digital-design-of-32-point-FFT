`timescale 1ns / 1ps


module Register #(p_dataWidth = 16)(
    input [p_dataWidth - 1:0] i_data,
    input i_load,
    input CLK,
    output reg [p_dataWidth - 1:0] o_data
    );
    
    always@(posedge CLK)
    begin
        if(i_load)
            o_data <= i_data;
    end
    
endmodule

