`timescale 1ns / 1ps


module tb_Stage2#(  parameter p_inputBits=20,
                    parameter p_outputBits=20,
                    parameter p_widdleBits=16,
                    parameter p_PointPosition=3,
                    parameter p_realBits = 10,
                    parameter p_numberOf_unneded_bits=4

            );

reg [p_inputBits-1:0]  i_b [31:0];
reg [p_widdleBits-1:0]  i_w[3:0];
reg CLK;
reg CLK5;
reg RST;

wire [p_outputBits-1:0]  o_c[31:0];

integer  CLK_period  = 2 ; 
integer  i;

initial begin
    CLK=1;
    forever begin
        #(5*CLK_period/2) CLK <= !CLK ;
    end
end

initial begin
    CLK5=1;
    forever begin
        #(CLK_period/2) CLK5 <= !CLK5 ;
    end
end

initial begin
    RST = 1 ;
    # (5*CLK_period*5) ;
    RST = 0 ;
   
   ////////test random variables with all twiddle values equal to one ///////////
    for ( i=0; i<32; i=i+1) begin
        i_b[i]=$urandom;
    end

    for ( i=0; i<4; i=i+1) begin
        i_w[i]=16'h0100;
    end
    #(5*CLK_period);
   ////////test random variables with the acual twiddle values ///////////

    for ( i=0; i<32; i=i+1) begin
        i_b[i]=$urandom;
    end
    i_w[0]=16'h0100;
    i_w[1]=16'h05fb;
    i_w[2]=16'h00ff;
    i_w[3]=16'hfbfb;
    #(5*CLK_period);
   ////////test large positive values ///////////

    for ( i=0; i<32; i=i+1) begin
        i_b[i]=16'h7f7f;
    end
    #(5*CLK_period);
   ////////test large negative values ///////////

    for ( i=0; i<32; i=i+1) begin
        i_b[i]=16'h8080;
    end

    #(5*CLK_period);
   ////////test large postive real  values and large negative img values ///////////

    for ( i=0; i<32; i=i+1) begin
        i_b[i]=16'h7f80;
    end

    #(5*CLK_period);
   ////////test large postive img   values and large negative real  values ///////////

    for ( i=0; i<32; i=i+1) begin
        i_b[i]=16'h807f;
    end


end








Stage2 #(   .p_inputBits        (p_inputBits),
            .p_outputBits       ( p_outputBits),
            .p_widdleBits       ( p_widdleBits),
            .p_PointPosition    ( p_PointPosition),
            .p_realBits         (p_realBits)
            )
            stage_2
            (   
                
                ///// clock and reset ///////
                .CLK(CLK5),
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
                ////////// Widdle at the stage ///////
                .i_w08(i_w[0]),
                .i_w18(i_w[1]),
                .i_w28(i_w[2]),
                .i_w38(i_w[3]),
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





endmodule