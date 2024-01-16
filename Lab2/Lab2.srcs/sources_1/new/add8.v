`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2024 01:20:08 AM
// Design Name: 
// Module Name: add8
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


module add8(
  input [7:0] A,
  input [7:0] B,
  input Cin,
  output [7:0] S,
  output ovfl,
  output Cout
    );
    
    wire [7:0] carry;
    FA fa0 (.A(A[0]), .B(B[0]), .Cin(Cin), .S(S[0]), .Cout(carry[0]), .ovfl(ovfl));
    FA fa1 (.A(A[1]), .B(B[1]), .Cin(carry[0]), .S(S[1]), .Cout(carry[1]), .ovfl(ovfl));
    FA fa2 (.A(A[2]), .B(B[2]), .Cin(carry[1]), .S(S[2]), .Cout(carry[2]), .ovfl(ovfl));
    FA fa3 (.A(A[3]), .B(B[3]), .Cin(carry[2]), .S(S[3]), .Cout(carry[3]), .ovfl(ovfl));
    FA fa4 (.A(A[4]), .B(B[4]), .Cin(carry[3]), .S(S[4]), .Cout(carry[4]), .ovfl(ovfl));
    FA fa5 (.A(A[5]), .B(B[5]), .Cin(carry[4]), .S(S[5]), .Cout(carry[5]), .ovfl(ovfl));
    FA fa6 (.A(A[6]), .B(B[6]), .Cin(carry[5]), .S(S[6]), .Cout(carry[6]), .ovfl(ovfl));
    FA fa7 (.A(A[7]), .B(B[7]), .Cin(carry[6]), .S(S[7]), .Cout(Cout), .ovfl(ovfl));


endmodule
