`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 02:53:43 AM
// Design Name: 
// Module Name: LED_Shifter
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


module LED_Shifter(
    input [15:0] In,
    input LD,
    input Shift,
    input [15:0] Off,
    input clk,
    
    
    output [15:0] led,
    output lastLED
    );
    
    wire [15:0] b, out;
   
    assign b[0]= ~LD & In[0] | LD & 1; 
    FDRE #(.INIT(1'b0) ) ff_01 (.C(clk), .CE(Shift | LD), .D(b[0]), .Q(out[0]));
    assign b[1]= ~LD & In[1] | LD & out[0];
    FDRE #(.INIT(1'b0) ) ff_02 (.C(clk), .CE(Shift | LD), .D(b[1]), .Q(out[1]));
    assign b[2]= ~LD & In[2] | LD & out[1];
    FDRE #(.INIT(1'b0) ) ff_03 (.C(clk), .CE(Shift | LD), .D(b[2]), .Q(out[2]));
    assign b[3]= ~LD & In[3] | LD & out[2];
    FDRE #(.INIT(1'b0) ) ff_04 (.C(clk), .CE(Shift | LD), .D(b[3]), .Q(out[3]));
    assign b[4]= ~LD & In[4] | LD & out[3];
    FDRE #(.INIT(1'b0) ) ff_05 (.C(clk), .CE(Shift | LD), .D(b[4]), .Q(out[4]));
    assign b[5]= ~LD & In[5] | LD & out[4];
    FDRE #(.INIT(1'b0) ) ff_06 (.C(clk), .CE(Shift | LD), .D(b[5]), .Q(out[5]));
    assign b[6]= ~LD & In[6] | LD & out[5];
    FDRE #(.INIT(1'b0) ) ff_07 (.C(clk), .CE(Shift | LD), .D(b[6]), .Q(out[6]));
    assign b[7]= ~LD & In[7] | LD & out[6];
    FDRE #(.INIT(1'b0) ) ff_08 (.C(clk), .CE(Shift | LD), .D(b[7]), .Q(out[7]));
    assign b[8]= ~LD & In[8] | LD & out[7];
    FDRE #(.INIT(1'b0) ) ff_09 (.C(clk), .CE(Shift | LD), .D(b[8]), .Q(out[8]));
    assign b[9]= ~LD & In[9] | LD & out[8];
    FDRE #(.INIT(1'b0) ) ff_10 (.C(clk), .CE(Shift | LD), .D(b[9]), .Q(out[9]));
    assign b[10]= ~LD & In[10] | LD & out[9];
    FDRE #(.INIT(1'b0) ) ff_11 (.C(clk), .CE(Shift | LD), .D(b[10]), .Q(out[10]));
    assign b[11]= ~LD & In[11] | LD & out[10];
    FDRE #(.INIT(1'b0) ) ff_12 (.C(clk), .CE(Shift | LD), .D(b[11]), .Q(out[11]));
    assign b[12]= ~LD & In[12] | LD & out[11];
    FDRE #(.INIT(1'b0) ) ff_13 (.C(clk), .CE(Shift | LD), .D(b[12]), .Q(out[12]));
    assign b[13]= ~LD & In[13] | LD & out[12];
    FDRE #(.INIT(1'b0) ) ff_14 (.C(clk), .CE(Shift | LD), .D(b[13]), .Q(out[13]));
    assign b[14]= ~LD & In[14] | LD & out[13];
    FDRE #(.INIT(1'b0) ) ff_15 (.C(clk), .CE(Shift | LD), .D(b[14]), .Q(out[14]));
    assign b[15]= ~LD & In[15] | LD & out[14];
    FDRE #(.INIT(1'b0) ) ff_16 (.C(clk), .CE(Shift | LD), .D(b[15]), .Q(out[15]));
    
    assign led[0] = out[0] & Off[0];
    assign led[1] = out[1] & Off[1];
    assign led[2] = out[2] & Off[2];
    assign led[3] = out[3] & Off[3];
    assign led[4] = out[4] & Off[4];
    assign led[5] = out[5] & Off[5];
    assign led[6] = out[6] & Off[6];
    assign led[7] = out[7] & Off[7];
    assign led[8] = out[8] & Off[8];
    assign led[9] = out[9] & Off[9];
    assign led[10] = out[10] & Off[10];
    assign led[11] = out[11] & Off[11];
    assign led[12] = out[12] & Off[12];
    assign led[13] = out[13] & Off[13];
    assign led[14] = out[14] & Off[14];
    assign led[15] = out[15] & Off[15];
    assign lastLED = led[15];

        
endmodule
