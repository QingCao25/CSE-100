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
    
    FDRE #(.INIT(1'b0) ) ff_04 (.C(clk), .CE(CE), .D(Din[4]), .Q(Q[4]));
    FDRE #(.INIT(1'b0) ) ff_03 (.C(clk), .CE(CE), .D(Din[3]), .Q(Q[3]));
    FDRE #(.INIT(1'b0) ) ff_02 (.C(clk), .CE(CE), .D(Din[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b0) ) ff_01 (.C(clk), .CE(CE), .D(Din[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0) ) ff_00 (.C(clk), .CE(CE), .D(Din[0]), .Q(Q[0]));
    
    assign UTC = Q[4] & Q[3] & Q[2] & Q[1] & Q[0];
    assign DTC = ~Q[4] & ~Q[3] & ~Q[2] & ~Q[1] & ~Q[0];
endmodule
