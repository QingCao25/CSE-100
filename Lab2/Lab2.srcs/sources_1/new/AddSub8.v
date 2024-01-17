`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2024 01:28:52 AM
// Design Name: 
// Module Name: AddSub8
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


module AddSub8(
  input [7:0] A,
  input [7:0] B,
  input sub,
  output [7:0] S,
  output ovfl
  
  );  
  
    assign S  = (~sub & (A + B)) | (sub&(A - B));
    assign ovfl = (S[7] & A[7] & B[7]) | (~S[7] & ~A[7] & ~B[7]);
endmodule