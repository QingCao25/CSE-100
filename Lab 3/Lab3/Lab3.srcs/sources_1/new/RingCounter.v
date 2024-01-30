`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2024 11:37:18 PM
// Design Name: 
// Module Name: RingCounter
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


module RingCounter(
    input clk,
    input Advance,
    output [3:0] Q
    );
    
    FDRE #(.INIT(1'b1)) ff_00 (.C(clk), .CE(Advance), .D(Q[3]), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) ff_01 (.C(clk), .CE(Advance), .D(Q[0]), .Q(Q[1]));
    FDRE #(.INIT(1'b0)) ff_02 (.C(clk), .CE(Advance), .D(Q[1]), .Q(Q[2]));
    FDRE #(.INIT(1'b0)) ff_03 (.C(clk), .CE(Advance), .D(Q[2]), .Q(Q[3]));
    
endmodule
