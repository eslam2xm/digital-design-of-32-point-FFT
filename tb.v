`timescale 1ns / 1ps
module tb();
parameter inNumOfBits  = 8 ;
parameter outNumOfBits = 32;

reg [inNumOfBits-1 : 0] x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,
                        x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31;

wire [outNumOfBits-1 : 0] X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X18,X19,X20,
                        X21,X22,X23,X24,X25,X26,X27,X28,X29,X30,X31;

reg RST,CLK_10,CLK_50;



Top uut(
        .CLK_10(CLK_10),
        .CLK_50(CLK_50),       
        .RST(RST),
        .x0(x0),
        .x1(x1),
        .x2(x2),
        .x3(x3),
        .x4(x4),
        .x5(x5),
        .x6(x6),
        .x7(x7),
        .x8(x8),
        .x9(x9),
        .x10(x10),
        .x11(x11),
        .x12(x12),
        .x13(x13),
        .x14(x14),
        .x15(x15),
        .x16(x16),
        .x17(x17),
        .x18(x18),
        .x19(x19),
        .x20(x20),
        .x21(x21),
        .x22(x22),
        .x23(x23),
        .x24(x24),
        .x25(x25),
        .x26(x26),
        .x27(x27),
        .x28(x28),
        .x29(x29),
        .x30(x30),
        .x31(x31),

        .X0(X0),
        .X1(X1),
        .X2(X2),
        .X3(X3),
        .X4(X4),
        .X5(X5),
        .X6(X6),
        .X7(X7),
        .X8(X8),
        .X9(X9),
        .X10(X10),
        .X11(X11),
        .X12(X12),
        .X13(X13),
        .X14(X14),
        .X15(X15),
        .X16(X16),
        .X17(X17),
        .X18(X18),
        .X19(X19),
        .X20(X20),
        .X21(X21),
        .X22(X22),
        .X23(X23),
        .X24(X24),
        .X25(X25),
        .X26(X26),
        .X27(X27),
        .X28(X28),
        .X29(X29),
        .X30(X30),
        .X31(X31),
        );

//pipeline clock
always
begin
    CLK_10 = 0;
    #50;
    CLK_10 = 1;
end
//MAC clock
always
begin
    CLK_50 = 0;
    #10;
    CLK_50 = 1;
end

integer data_file, out_file;//file handles
// this block opens files for inputs and expected outputs
initial begin
  data_file = $fopen("input.txt", "r");
  if (data_file == 0) begin
    $display("data_file handle was NULL");
    $finish;
  end
  out_file = $fopen("output.txt", "r");
  if (out_file == 0) begin
    $display("data_file handle was NULL");
    $finish;
  end
end

reg [7:0] inputs [31 : 0];//capture file data input
integer i,f;//file handles
integer first = 1;//ignore first cycle for resseting
//this block gets input data from a file every cycle
always @(negedge CLK_10)
begin
    if(first == 0)
    begin
    for (i = 0; i<32; i = i+1)
    begin
        f = $fscanf(data_file,"%d\n",inputs[i]);
        $display("%0d",inputs[i]);
    end
    x0 = inputs[0];
    x1 = inputs[1];
    x2 = inputs[2];
    x3 = inputs[3];
    x4 = inputs[4];
    x5 = inputs[5];
    x6 = inputs[6];
    x7 = inputs[7];
    x8 = inputs[8];
    x9 = inputs[9];
    x10 = inputs[10];
    x11 = inputs[11];
    x12 = inputs[12];
    x13 = inputs[13];
    x14 = inputs[14];
    x15 = inputs[15];
    x16 = inputs[16];
    x17 = inputs[17];
    x18 = inputs[18];
    x19 = inputs[19];
    x20 = inputs[20];
    x21 = inputs[21];
    x22 = inputs[22];
    x23 = inputs[23];
    x24 = inputs[24];
    x25 = inputs[25];
    x26 = inputs[26];
    x27 = inputs[27];
    x28 = inputs[28];
    x29 = inputs[29];
    x30 = inputs[30];
    x31 = inputs[31];
    end
    first = 0;
end


event out_event;//event to trigger output block
//this block initializes uut and and resseting it 
initial begin
    RST = 1;
    x0 = 0;
    x1 = 0;
    x2 = 0;
    x3 = 0;
    x4 = 0;
    x5 = 0;
    x6 = 0;
    x7 = 0;
    x8 = 0;
    x9 = 0;
    x10 = 0;
    x11 = 0;
    x12 = 0;
    x13 = 0;
    x14 = 0;
    x15 = 0;
    x16 = 0;
    x17 = 0;
    x18 = 0;
    x19 = 0;
    x20 = 0;
    x21 = 0;
    x22 = 0;
    x23 = 0;
    x24 = 0;
    x25 = 0;
    x26 = 0;
    x27 = 0;
    x28 = 0;
    x29 = 0;
    x30 = 0;
    x31 = 0;
    #5;
    RST = 0;
    #5;
    RST = 1;
    
    @(posedge CLK_10);
    @(posedge CLK_10);
    @(posedge CLK_10);
    @(posedge CLK_10);
    ->out_event;
end

integer j,k,l;//index
reg [8*32:0] outputs [31 : 0];//this variable captures the data from the file

initial
begin
    @(out_event);
    for (j = 0; j<10; j=j+1)
    begin
        @(posedge CLK_10);
        for (k=0; k<32; k=k+1)
        begin
            l = $fscanf(out_file,"%s\n",outputs[k]);
            $display("Expected Value for %0d : %0s",k,outputs[k]);
        end
    end
    $finish;
end

endmodule
