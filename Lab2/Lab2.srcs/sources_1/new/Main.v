`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2024 01:03:12 AM
// Design Name: 
// Module Name: Main
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


module Main(
    input [15:0] sw,
    input btnU,
    input btnR,
    input clkin,
    output [6:0] seg,
    output [3:0] an,
    output [15:0] led,
    output dp
    );
    
    wire [7:0] AddSub8_Output;
    wire overflow;  
    AddSub8 hello (.A(sw[15:8]), .B(sw[7:0]), .sub(btnU), .S(AddSub8_Output), .ovfl(overflow));

    wire [6:0] left_seg, right_seg; 
    hex7seg left (.n(AddSub8_Output[7:4]), .seg(left_seg[6:0]));
    hex7seg right (.n(AddSub8_Output[3:0]), .seg(right_seg[6:0]));
    
    wire dig_sel; 
    Mux step6 (.x1(left_seg), .x2(right_seg), .sel(dig_sel), .y(seg));
    
    lab2_digsel digsel (.clkin(clkin), .greset(btnR), .digsel(dig_sel));
    assign an[3] = 1'b1;
    assign an[2] = 1'b1;
    assign an[1] = dig_sel;
    assign an[0] = ~dig_sel;
    assign dp = ~overflow; 
    
    
    assign led = sw;

    
endmodule
