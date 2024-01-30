`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2024 11:24:30 PM
// Design Name: 
// Module Name: Edge
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


module Edge(
    input clk,
    input in,
    input btnU,
    output out
    );
    
    wire [1:0] Q;
    FDRE #(.INIT(1'b0)) ff_01 (.C(clk), .CE(btnU), .D(in), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) ff_02 (.C(clk), .CE(btnU), .D(Q[0]), .Q(Q[1]));
    assign out = Q[0] & ~Q[1];
endmodule

