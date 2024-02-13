`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2024 03:46:44 AM
// Design Name: 
// Module Name: mux_16
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


module mux_16(
    input [15:0] a,
    input [15:0] b,
    input sel,
    input [15:0] out
    );
    
    assign out[0] = ~sel&a[0] | sel&b[0];
    assign out[1] = ~sel&a[1] | sel&b[1];
    assign out[2] = ~sel&a[2] | sel&b[2];
    assign out[3] = ~sel&a[3] | sel&b[3];
    assign out[4] = ~sel&a[4] | sel&b[4];
    assign out[5] = ~sel&a[5] | sel&b[5];
    assign out[6] = ~sel&a[6] | sel&b[6];
    assign out[7] = ~sel&a[7] | sel&b[7];
    assign out[8] = ~sel&a[8] | sel&b[8];
    assign out[9] = ~sel&a[9] | sel&b[9];
    assign out[10] = ~sel&a[10] | sel&b[10];
    assign out[11] = ~sel&a[11] | sel&b[11];
    assign out[12] = ~sel&a[12] | sel&b[12];
    assign out[13] = ~sel&a[13] | sel&b[13];
    assign out[14] = ~sel&a[14] | sel&b[14];
    assign out[15] = ~sel&a[15] | sel&b[15];

endmodule
