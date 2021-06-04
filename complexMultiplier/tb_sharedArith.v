`timescale 1ns / 1ps


module tb_sharedArith();

    parameter p_inputWidth          = 8;
    parameter p_PointPosition       = 6;
    localparam p_mulOutputWidth = 2*p_inputWidth - p_PointPosition + 1;


    // CLK period   
    parameter clk_period_ns_50 = 2;
    parameter clk_period_ns_10 = 10;
    
    
    // Inputs
	reg CLK, CLK5;
	reg RST;
	reg [2 * p_inputWidth - 1 : 0] i_m1,i_m2,i_m3,i_m4,i_n1,i_n2,i_n3,i_n4,i_l1,i_l2,i_l3,i_l4;

	// Outputs
	wire [2* (2*p_inputWidth - p_PointPosition) + 1:0] o_r1_p,o_r1_m,o_r2_p,o_r2_m,o_r3_p,o_r3_m,o_r4_p,o_r4_m;
	
	// 10MHz Reg
	wire [2* (2*p_inputWidth - p_PointPosition) + 1:0] out1_p, out1_m, out2_p, out2_m, out3_p, out3_m, out4_p, out4_m;
	
	
	// First Output Register
    Register #(2* p_mulOutputWidth ) reg1_p
              ( .i_data( o_r1_p ), 
                .i_load(1'b1), .CLK(CLK), .o_data(out1_p));
              
    Register #(2* p_mulOutputWidth ) reg1_m
              ( .i_data( o_r1_m ), 
                .i_load(1'b1), .CLK(CLK), .o_data(out1_m));
                
    // 2nd Output Register
    Register #(2* p_mulOutputWidth ) reg2_p
              ( .i_data( o_r2_p ), 
                .i_load(1'b1), .CLK(CLK), .o_data(out2_p));
              
    Register #(2* p_mulOutputWidth ) reg2_m
              ( .i_data( o_r2_m ), 
                .i_load(1'b1), .CLK(CLK), .o_data(out2_m));
                
    // 3rd Output Register
    Register #(2* p_mulOutputWidth ) reg3_p
              ( .i_data( o_r3_p ), 
                .i_load(1'b1), .CLK(CLK), .o_data(out3_p));
              
    Register #(2* p_mulOutputWidth ) reg3_m
              ( .i_data( o_r3_m ), 
                .i_load(1'b1), .CLK(CLK), .o_data(out3_m));
                
    // 4th Output Register
    Register #(2* p_mulOutputWidth ) reg4_p
              ( .i_data( o_r4_p ), 
                .i_load(1'b1), .CLK(CLK), .o_data(out4_p));
              
    Register #(2* p_mulOutputWidth ) reg4_m
              ( .i_data( o_r4_m ), 
                .i_load(1'b1), .CLK(CLK), .o_data(out4_m));
                
	// Driving Clock 50M
    initial begin
        CLK5 = 1;
        forever #(clk_period_ns_50 / 2) CLK5 <= !CLK5;
    end
    
    // Driving Clock 10M
    initial begin
        CLK = 1;
        forever #(clk_period_ns_10 / 2) CLK <= !CLK;
    end

	// Instantiate the Unit Under Test (UUT)
	sharedComplexMUL #(p_inputWidth,p_PointPosition) uut (
		.CLK(CLK5), 
		.RST(RST), 
		.i_m1(i_m1), 
		.i_m2(i_m2), 
		.i_m3(i_m3), 
		.i_m4(i_m4), 
		.i_n1(i_n1), 
		.i_n2(i_n2), 
		.i_n3(i_n3), 
		.i_n4(i_n4), 
		.i_l1(i_l1), 
		.i_l2(i_l2), 
		.i_l3(i_l3), 
		.i_l4(i_l4), 
		.o_r1_p(o_r1_p), 
		.o_r1_m(o_r1_m), 
		.o_r2_p(o_r2_p), 
		.o_r2_m(o_r2_m), 
		.o_r3_p(o_r3_p), 
		.o_r3_m(o_r3_m), 
		.o_r4_p(o_r4_p), 
		.o_r4_m(o_r4_m)
	);
	
	always @(posedge CLK) begin
        i_m1 <= $urandom;
        i_m2 <= $urandom;
        i_m3 <= $urandom;
        i_m4 <= $urandom;
        
        i_n1 <= $urandom;
        i_n2 <= $urandom;
        i_n3 <= $urandom;
        i_n4 <= $urandom;
        
        i_l1 <= $urandom;
        i_l2 <= $urandom;
        i_l3 <= $urandom;
        i_l4 <= $urandom;

    end
	
	
	initial begin
		// Initialize Inputs
		RST = 1;
		
		#(clk_period_ns_10 * 3)
		RST = 0;
		
		
    end
    
    
    
	
	
endmodule
