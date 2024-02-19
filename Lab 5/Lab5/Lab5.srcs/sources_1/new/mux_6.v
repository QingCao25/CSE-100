`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2024 01:59:42 AM
// Design Name: 
// Module Name: mux_6
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


module mux_6(
    input [5:0] a,
    input [5:0] b,
    input sel,
    input [5:0] out
    );
    
//    assign out = ~sel&a | sel&b;
    assign out[0] = ~sel&a[0] | sel&b[0];
    assign out[1] = ~sel&a[1] | sel&b[1];
    assign out[2] = ~sel&a[2] | sel&b[2];
    assign out[3] = ~sel&a[3] | sel&b[3];
    assign out[4] = ~sel&a[4] | sel&b[4];
    assign out[5] = ~sel&a[5] | sel&b[5];

endmodule
