`timescale 1ns / 1ps

/*
* This module implements a time shared Multipler adder/sub
* it's designed to give take inputs every 5 CLK cycles
*
* The output format is as follows
*	o_r1_p = i_m1 + (i_n1 * i_l1)  -- o_resultOne_plus
*	o_r1_m = i_m1 - (i_n1 * i_l1)  -- o_resultOne_munus
*   for all inputs and output of 1,2,3,4
*/


module sharedComplexMUL
#(  parameter p_inputWidth          = 8,
    parameter p_PointPosition       = 3
 )
 (
    input CLK,
    input RST,
    
    input signed [2 * p_inputWidth - 1 : 0] i_m1,
    input signed [2 * p_inputWidth - 1 : 0] i_m2,
    input signed [2 * p_inputWidth - 1 : 0] i_m3,
    input signed [2 * p_inputWidth - 1 : 0] i_m4,

    input signed [2 * p_inputWidth - 1 : 0] i_n1,
    input signed [2 * p_inputWidth - 1 : 0] i_n2,
    input signed [2 * p_inputWidth - 1 : 0] i_n3,
    input signed [2 * p_inputWidth - 1 : 0] i_n4,
    
    input signed [2 * p_inputWidth - 1 : 0] i_l1,
    input signed [2 * p_inputWidth - 1 : 0] i_l2,
    input signed [2 * p_inputWidth - 1 : 0] i_l3,
    input signed [2 * p_inputWidth - 1 : 0] i_l4,
    
    output signed [2* (2*p_inputWidth - p_PointPosition) + 1 : 0] o_r1_p,
    output signed [2* (2*p_inputWidth - p_PointPosition) + 1 : 0] o_r1_m,
    
    output signed [2* (2*p_inputWidth - p_PointPosition) + 1 : 0] o_r2_p,
    output signed [2* (2*p_inputWidth - p_PointPosition) + 1 : 0] o_r2_m,
    
    output signed [2* (2*p_inputWidth - p_PointPosition) + 1 : 0] o_r3_p,
    output signed [2* (2*p_inputWidth - p_PointPosition) + 1 : 0] o_r3_m,
    
    output signed [2* (2*p_inputWidth - p_PointPosition) + 1 : 0] o_r4_p,
    output signed [2* (2*p_inputWidth - p_PointPosition) + 1 : 0] o_r4_m

    );
    
    localparam p_mulOutputWidth = 2*p_inputWidth - p_PointPosition + 1;
    
    
    reg  [3:0] r_Loads;
    
    //////////////////// Shared Arithmetics ////////////////////////////////
    
    // Complex Mult
    wire signed [p_mulOutputWidth - 1 : 0] w_MUL_r, w_MUL_i;
    
    reg signed [p_inputWidth-1:0] inAr;
    reg signed [p_inputWidth-1:0] inAi;
    reg signed [p_inputWidth-1:0] inBr;
    reg signed [p_inputWidth-1:0] inBi;
    
    complexMUL #(p_inputWidth, p_PointPosition) complexMUL
                (inAr,inAi,inBr,inBi,w_MUL_r,w_MUL_i);
                
    // Adder
    reg  signed [p_mulOutputWidth - 1 : 0 ]      add_real_a, add_imag_a;
    wire signed [p_mulOutputWidth - 1 : 0 ]      add_res_real, add_res_imag;
    
    Adder #( p_mulOutputWidth ) Adder_real (add_real_a, w_MUL_r, add_res_real);
    Adder #( p_mulOutputWidth ) Adder_imag (add_imag_a, w_MUL_i, add_res_imag);
    
    // Sub
    reg  signed [p_mulOutputWidth - 1 : 0 ]      sub_real_a, sub_imag_a;
    wire signed [p_mulOutputWidth - 1 : 0 ]      sub_res_real, sub_res_imag;
    
    Sub #( p_mulOutputWidth ) Sub_real (sub_real_a, w_MUL_r, sub_res_real);
    Sub #( p_mulOutputWidth ) Sub_imag (sub_imag_a, w_MUL_i, sub_res_imag);

    // First Output Register
    Register #(2* p_mulOutputWidth ) reg1_p
              ( .i_data( {add_res_real, add_res_imag} ), 
                .i_load(r_Loads[0]), .CLK(CLK), .o_data(o_r1_p));
              
    Register #(2* p_mulOutputWidth ) reg1_m
              ( .i_data( {sub_res_real, sub_res_imag} ), 
                .i_load(r_Loads[0]), .CLK(CLK), .o_data(o_r1_m));
              
        
    // Second Output Registers
    Register #(2* p_mulOutputWidth ) reg2_p
              ( .i_data( {add_res_real, add_res_imag} ), 
                .i_load(r_Loads[1]), .CLK(CLK), .o_data(o_r2_p));
              
    Register #(2* p_mulOutputWidth ) reg2_m
              ( .i_data( {sub_res_real, sub_res_imag} ), 
                .i_load(r_Loads[1]), .CLK(CLK), .o_data(o_r2_m));
              
    
    // Third Output Registers          
    Register #(2* p_mulOutputWidth ) reg3_p
              ( .i_data( {add_res_real, add_res_imag} ), 
                .i_load(r_Loads[2]), .CLK(CLK), .o_data(o_r3_p));
              
    Register #(2* p_mulOutputWidth ) reg3_m
              ( .i_data( {sub_res_real, sub_res_imag} ), 
                .i_load(r_Loads[2]), .CLK(CLK), .o_data(o_r3_m));
              
               
    // Forth Output Registers          
    Register #(2* p_mulOutputWidth ) reg4_p
              ( .i_data( {add_res_real, add_res_imag} ), 
                .i_load(r_Loads[3]), .CLK(CLK), .o_data(o_r4_p));
              
    Register #(2* p_mulOutputWidth ) reg4_m
              ( .i_data( {sub_res_real, sub_res_imag} ), 
                .i_load(r_Loads[3]), .CLK(CLK), .o_data(o_r4_m));
    
    // State Mapping 
    localparam [2:0]
    s_MUL1                       = 0,
    s_MUL2                       = 1,
    s_MUL3                       = 2,
    s_MUL4                       = 3,
    s_idle                       = 4;
    
    //Registers to hold current and next states
    reg [2:0] r_currentState, r_nextState;
    
    // current state logic. the current state updates at every CLK..
    // ..positive edge to the value stored in next state register
    always @(posedge CLK, posedge RST) 
    begin
        if (RST) begin
        // at RST keep it at s_idle so it goes to MUL1 after the reset is unset
            r_currentState <= s_idle;
        end
        else begin
            r_currentState <= r_nextState;
        end
    end 
    
    
    // next state transition logic. this sets the next state status combinationally so it's ready..
    //.. to be copied into current state register at the next positive clock edge
    always @(*)
    begin
        //default case for nextState is to stay the same if not changed
        r_nextState <= r_currentState;
        
        case(r_currentState)
            
            s_MUL1: begin
                r_nextState <= s_MUL2;
            end
            
            s_MUL2: begin
                r_nextState <= s_MUL3;
            end
            
            s_MUL3: begin
                r_nextState <= s_MUL4;
            end
            
            s_MUL4: begin
                r_nextState <= s_idle;
            end
            
            s_idle: begin
                r_nextState <= s_MUL1;
            end
            
            default: begin
                r_nextState <= s_idle;
            end   
                
        endcase
    end //end of always block
    
    
    // Output logic. Sets the outputs and controls the logic at every state
    always @(*)
    begin
        // Add Default OUTPUTS of FSM
        case(r_currentState)
        
            s_MUL1: begin
            
                //Splitting the input as real and imaginary and assigning it to the Multiplier
                inAr <= i_n1 [2 * p_inputWidth - 1 : p_inputWidth];
                inAi <= i_n1 [    p_inputWidth - 1 : 0];
                inBr <= i_l1 [2 * p_inputWidth - 1 : p_inputWidth];
                inBi <= i_l1 [    p_inputWidth - 1 : 0];
                
                //Puting the 1st input for Adder, using sign extend
                add_real_a <= { {(p_mulOutputWidth - p_inputWidth){i_m1[2 * p_inputWidth - 1]}}, //sign extend   
                                i_m1[2 * p_inputWidth - 1 : p_inputWidth]}; //most 8 bits
                                
                add_imag_a <= { {(p_mulOutputWidth - p_inputWidth){i_m1[    p_inputWidth - 1]}}, //sign extend   
                                i_m1[    p_inputWidth - 1 : 0]}; //least 8 bits
                
                //Puting the 1st input for Sub, using sign extend
                sub_real_a <= { {(p_mulOutputWidth - p_inputWidth){i_m1[2 * p_inputWidth - 1]}}, //sign extend   
                                i_m1[2 * p_inputWidth - 1 : p_inputWidth]}; //most 8 bits
                                
                sub_imag_a <= { {(p_mulOutputWidth - p_inputWidth){i_m1[    p_inputWidth - 1]}}, //sign extend   
                                i_m1[    p_inputWidth - 1 : 0]}; //least 8 bits
               
                //Load first regs
                r_Loads = 4'b0001;
            end
            
            s_MUL2: begin
            
                //Splitting the input as real and imaginary and assigning it to the Multiplier
                inAr <= i_n2 [2 * p_inputWidth - 1 : p_inputWidth];
                inAi <= i_n2 [    p_inputWidth - 1 : 0];
                inBr <= i_l2 [2 * p_inputWidth - 1 : p_inputWidth];
                inBi <= i_l2 [    p_inputWidth - 1 : 0];
                
                //Puting the 2nd input for Adder, using sign extend
                add_real_a <= { {(p_mulOutputWidth - p_inputWidth){i_m2[2 * p_inputWidth - 1]}}, //sign extend   
                                i_m2[2 * p_inputWidth - 1 : p_inputWidth]}; //most 8 bits
                                
                add_imag_a <= { {(p_mulOutputWidth - p_inputWidth){i_m2[    p_inputWidth - 1]}}, //sign extend   
                                i_m2[    p_inputWidth - 1 : 0]}; //least 8 bits
                
                //Puting the 2nd input for Sub, using sign extend
                sub_real_a <= { {(p_mulOutputWidth - p_inputWidth){i_m2[2 * p_inputWidth - 1]}}, //sign extend   
                                i_m2[2 * p_inputWidth - 1 : p_inputWidth]}; //most 8 bits
                                
                sub_imag_a <= { {(p_mulOutputWidth - p_inputWidth){i_m2[    p_inputWidth - 1]}}, //sign extend   
                                i_m2[    p_inputWidth - 1 : 0]}; //least 8 bits
                
                //Load 2nd regs
                r_Loads = 4'b0010;
            end
            
            s_MUL3: begin
            
                //Splitting the input as real and imaginary and assigning it to the Multiplier
                inAr <= i_n3 [2 * p_inputWidth - 1 : p_inputWidth];
                inAi <= i_n3 [    p_inputWidth - 1 : 0];
                inBr <= i_l3 [2 * p_inputWidth - 1 : p_inputWidth];
                inBi <= i_l3 [    p_inputWidth - 1 : 0];
                
                 //Puting the 3rd input for Adder, using sign extend
                add_real_a <= { {(p_mulOutputWidth - p_inputWidth){i_m3[2 * p_inputWidth - 1]}}, //sign extend   
                                i_m3[2 * p_inputWidth - 1 : p_inputWidth]}; //most 8 bits
                                
                add_imag_a <= { {(p_mulOutputWidth - p_inputWidth){i_m3[    p_inputWidth - 1]}}, //sign extend   
                                i_m3[    p_inputWidth - 1 : 0]}; //least 8 bits
                
                //Puting the 3rd input for Sub, using sign extend
                sub_real_a <= { {(p_mulOutputWidth - p_inputWidth){i_m3[2 * p_inputWidth - 1]}}, //sign extend   
                                i_m3[2 * p_inputWidth - 1 : p_inputWidth]}; //most 8 bits
                                
                sub_imag_a <= { {(p_mulOutputWidth - p_inputWidth){i_m3[    p_inputWidth - 1]}}, //sign extend   
                                i_m3[    p_inputWidth - 1 : 0]}; //least 8 bits
                
                //Load 3rd regs
                r_Loads = 4'b0100;
            end
            
            s_MUL4: begin
            
                //Splitting the input as real and imaginary and assigning it to the Multiplier
                inAr <= i_n4 [2 * p_inputWidth - 1 : p_inputWidth];
                inAi <= i_n4 [    p_inputWidth - 1 : 0];
                inBr <= i_l4 [2 * p_inputWidth - 1 : p_inputWidth];
                inBi <= i_l4 [    p_inputWidth - 1 : 0];
                
                //Puting the 4th input for Adder, using sign extend
                add_real_a <= { {(p_mulOutputWidth - p_inputWidth){i_m4[2 * p_inputWidth - 1]}}, //sign extend   
                                i_m4[2 * p_inputWidth - 1 : p_inputWidth]}; //most 8 bits
                                
                add_imag_a <= { {(p_mulOutputWidth - p_inputWidth){i_m4[    p_inputWidth - 1]}}, //sign extend   
                                i_m4[    p_inputWidth - 1 : 0]}; //least 8 bits
                
                //Puting the 4th input for Sub, using sign extend
                sub_real_a <= { {(p_mulOutputWidth - p_inputWidth){i_m4[2 * p_inputWidth - 1]}}, //sign extend   
                                i_m4[2 * p_inputWidth - 1 : p_inputWidth]}; //most 8 bits
                                
                sub_imag_a <= { {(p_mulOutputWidth - p_inputWidth){i_m4[    p_inputWidth - 1]}}, //sign extend   
                                i_m4[    p_inputWidth - 1 : 0]}; //least 8 bits
                
                //Load 4th regs
                r_Loads = 4'b1000;
            end
            
            s_idle: begin
            
                //Apply any input to avoid latches, the result isn't registered as all loads are zero
                inAr <= i_n4 [2 * p_inputWidth - 1 : p_inputWidth];
                inAi <= i_n4 [    p_inputWidth - 1 : 0];
                inBr <= i_l4 [2 * p_inputWidth - 1 : p_inputWidth];
                inBi <= i_l4 [    p_inputWidth - 1 : 0];
                add_real_a <= { {(p_mulOutputWidth - p_inputWidth){i_m4[2 * p_inputWidth - 1]}}, //sign extend   
                                i_m4[2 * p_inputWidth - 1 : p_inputWidth]}; //most 8 bits
                add_imag_a <= { {(p_mulOutputWidth - p_inputWidth){i_m4[    p_inputWidth - 1]}}, //sign extend   
                                i_m4[    p_inputWidth - 1 : 0]}; //least 8 bits
                sub_real_a <= { {(p_mulOutputWidth - p_inputWidth){i_m4[2 * p_inputWidth - 1]}}, //sign extend   
                                i_m4[2 * p_inputWidth - 1 : p_inputWidth]}; //most 8 bits
                sub_imag_a <= { {(p_mulOutputWidth - p_inputWidth){i_m4[    p_inputWidth - 1]}}, //sign extend   
                                i_m4[    p_inputWidth - 1 : 0]}; //least 8 bits
                
                //Don't load any register
                r_Loads = 4'b0000;
            end
            
            default: begin
            
                //Apply any input to avoid latches, the result isn't registered as all loads are zero
                inAr <= i_n4 [2 * p_inputWidth - 1 : p_inputWidth];
                inAi <= i_n4 [    p_inputWidth - 1 : 0];
                inBr <= i_l4 [2 * p_inputWidth - 1 : p_inputWidth];
                inBi <= i_l4 [    p_inputWidth - 1 : 0];
                add_real_a <= { {(p_mulOutputWidth - p_inputWidth){i_m4[2 * p_inputWidth - 1]}}, //sign extend   
                                i_m4[2 * p_inputWidth - 1 : p_inputWidth]}; //most 8 bits
                add_imag_a <= { {(p_mulOutputWidth - p_inputWidth){i_m4[    p_inputWidth - 1]}}, //sign extend   
                                i_m4[    p_inputWidth - 1 : 0]}; //least 8 bits
                sub_real_a <= { {(p_mulOutputWidth - p_inputWidth){i_m4[2 * p_inputWidth - 1]}}, //sign extend   
                                i_m4[2 * p_inputWidth - 1 : p_inputWidth]}; //most 8 bits
                sub_imag_a <= { {(p_mulOutputWidth - p_inputWidth){i_m4[    p_inputWidth - 1]}}, //sign extend   
                                i_m4[    p_inputWidth - 1 : 0]}; //least 8 bits
                
                //Don't load any register
                r_Loads = 4'b0000;
            end
        
        endcase
        
    end
    
    
endmodule






