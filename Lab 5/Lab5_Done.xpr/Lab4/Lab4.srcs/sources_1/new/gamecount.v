`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2024 04:43:15 PM
// Design Name: 
// Module Name: gamecount
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


module Game_Counter(
    input clk,
    input UD,
    input CE, 
    input LD,
    input [4:0] Din,
    
    output [4:0] Q
    );
    
    wire [4:0] B;

    FDRE #(.INIT(1'b1) ) ff_01 (.C(clk), .CE(CE | LD), .D(B[4]), .Q(Q[4]));
    FDRE #(.INIT(1'b1) ) ff_02 (.C(clk), .CE(CE | LD), .D(B[3]), .Q(Q[3]));
    FDRE #(.INIT(1'b1) ) ff_03 (.C(clk), .CE(CE | LD), .D(B[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b1) ) ff_04 (.C(clk), .CE(CE | LD), .D(B[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b1) ) ff_05 (.C(clk), .CE(CE | LD), .D(B[0]), .Q(Q[0]));

    assign B[0] = (LD & Din[0]) | (~LD & ~UD & (CE ^ Q[0])) | (~LD & UD & (CE ^ Q[0]));
    assign B[1] = (LD & Din[1]) | (~LD & ~UD & ((CE & Q[0]) ^ Q[1])) | (~LD & UD & (CE & ~Q[0] ^ Q[1]));
    assign B[2] = (LD & Din[2]) | (~LD & ~UD & ((CE & Q[0] & Q[1]) ^ Q[2])) | (~LD & UD & (CE & ~Q[0] & ~Q[1] ^ Q[2]));
    assign B[3] = (LD & Din[3]) | (~LD & ~UD & ((CE & Q[0] & Q[1] & Q[2]) ^ Q[3])) | (~LD & UD & (CE & ~Q[0] & ~Q[1] & ~Q[2] ^ Q[3]));
    assign B[4] = (LD & Din[4]) | (~LD & ~UD & ((CE & Q[0] & Q[1] & Q[2] & Q[3]) ^ Q[4])) | (~LD & UD & (CE & ~Q[0] & ~Q[1] & ~Q[2] & ~Q[3] ^ Q[4]));
    
endmodule
