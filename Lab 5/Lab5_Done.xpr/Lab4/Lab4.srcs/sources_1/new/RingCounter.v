`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 09:01:42 PM
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
    input Advance,
    input clk,
    output [3:0]Q
    );
    
    FDRE #(.INIT(1'b1)) FF_0 (.C(clk), .CE(Advance), .D(Q[3]), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) FF_1 (.C(clk), .CE(Advance), .D(Q[0]), .Q(Q[1]));
    FDRE #(.INIT(1'b0)) FF_2 (.C(clk), .CE(Advance), .D(Q[1]), .Q(Q[2]));
    FDRE #(.INIT(1'b0)) FF_3 (.C(clk), .CE(Advance), .D(Q[2]), .Q(Q[3])); 

    
    
endmodule

