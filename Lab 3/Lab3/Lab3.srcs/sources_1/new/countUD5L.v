`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2024 06:02:31 PM
// Design Name: 
// Module Name: countUD5L
// Project Name: 
// Target Devices: 
// Tool Versions: escription: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module countUD5L(
    input clk,
    input UD,
    input CE, 
    input LD,
    input [4:0] Din,
    
    output [4:0] Q,
    output UTC,
    output DTC
    );
    
    wire [4:0] B;

    FDRE #(.INIT(1'b0) ) ff_01 (.C(clk), .CE(1'b1), .D(B[4]), .Q(Q[4]));
    FDRE #(.INIT(1'b0) ) ff_02 (.C(clk), .CE(1'b1), .D(B[3]), .Q(Q[3]));
    FDRE #(.INIT(1'b0) ) ff_03 (.C(clk), .CE(1'b1), .D(B[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b0) ) ff_04 (.C(clk), .CE(1'b1), .D(B[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0) ) ff_05 (.C(clk), .CE(1'b1), .D(B[0]), .Q(Q[0]));
     
    assign B[0] = (LD & Din[0]) | (~LD & ~UD & CE & (CE ^ Q[0])) | (~LD & ~CE & UD & ~Q[0]) | (~LD & ~CE & ~UD & Q[0]);
    assign B[1] = (LD & Din[1]) | (~LD & ~UD & CE & (CE & Q[0] ^ Q[1])) | (~LD & ~CE & UD & (~Q[0] ^ Q[1])) | (~LD & ~CE & ~UD & Q[1]);
    assign B[2] = (LD & Din[2]) | (~LD & ~UD & CE & (CE & Q[0] & Q[1] ^ Q[2])) | (~LD & ~CE & UD & (~Q[0] & ~Q[1] ^ Q[2])) | (~LD & ~CE & ~UD & Q[2]);
    assign B[3] = (LD & Din[3]) | (~LD & ~UD & CE & (CE & Q[0] & Q[1] & Q[2] ^ Q[3])) | (~LD & ~CE & UD & (~Q[0] & ~Q[1] & ~Q[2] ^ Q[3])) | (~LD & ~CE & ~UD & Q[3]);
    assign B[4] = (LD & Din[4]) | (~LD & ~UD & CE & (CE & Q[0] & Q[1] & Q[2] & Q[3] ^ Q[4])) | (~LD & ~CE & UD & (~Q[0] & ~Q[1] & ~Q[2] & ~Q[3] ^ Q[4])) | (~LD & ~CE & ~UD & Q[4]);
    
//    assign B[4] = (~LD & (Q[4] ^ ((UD & ~CE & Q[3] & Q[2] & Q[1] & Q[0]) | (~UD & CE & ~Q[3] & ~Q[2] & ~Q[1] & ~Q[0]))) | (LD & Din[4]));
//    assign B[3] = (~LD & (Q[3] ^ ((UD & ~CE & Q[2] & Q[1] & Q[0]) | (~UD & CE & ~Q[2] & ~Q[1] & ~Q[0]))) | (LD & Din[3]));
//    assign B[2] = (~LD & (Q[2] ^ ((UD & ~CE & Q[1] & Q[0]) | (~UD & CE & ~Q[1] & ~Q[0]))) | (LD & Din[2]));
//    assign B[1] = (~LD & (Q[1] ^ ((UD & ~Q[0] & ~CE) | (~UD & CE & Q[0]))) | (LD & Din[1]));
//    assign B[0] = (~LD & ((~Q[0] & UD & ~CE) | (Q[0] & ~UD & CE)) | (LD & Din[0]));
    
//    assign B[0] = UD ^ B[0];  
    
    assign UTC = Q[4] & Q[3] & Q[2] & Q[1] & Q[0];
    assign DTC = ~Q[4] & ~Q[3] & ~Q[2] & ~Q[1] & ~Q[0];
endmodule
