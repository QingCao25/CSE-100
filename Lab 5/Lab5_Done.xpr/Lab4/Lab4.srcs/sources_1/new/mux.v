`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2024 09:49:17 AM
// Design Name: 
// Module Name: mux
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


module mux(
    input sel,
    input [5:0]i0,
    input [5:0]i1,
    output [5:0]j 
    );
    //6 bit bus fo shifter
    assign j[0] = ~sel&i0[0] | sel&i1[0] ;
    assign j[1] = ~sel&i0[1] | sel&i1[1] ;
    assign j[2] = ~sel&i0[2] | sel&i1[2] ;
    assign j[3] = ~sel&i0[3] | sel&i1[3] ;
    assign j[4] = ~sel&i0[4] | sel&i1[4] ;
    assign j[5] = ~sel&i0[5] | sel&i1[5] ;
    
endmodule
