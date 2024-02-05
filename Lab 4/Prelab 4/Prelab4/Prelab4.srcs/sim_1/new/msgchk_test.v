`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2024 11:20:30 PM
// Design Name: 
// Module Name: msgchk_test
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


module msgchk_test;
    reg clk, s, d;
    wire e, p;

    msgchk UUT(
    .clk(clk),
    .s(s),
    .d(d),
    .e(e),
    .p(p)
    );
        
    initial    // Clock process for clkin
    begin
        s = 0;
        d = 0;
        clk = 1'b1;
        #20 clk = 1'b0;
        forever
        begin
            #40 clk = ~clk;
        end
    end 
    
    initial
    begin
    #2020;
    {s, d} = 2'b00; #40; // T1
    {s, d} = 2'b11; #40; // T2
    {s, d} = 2'b01; #40; // T3
    {s, d} = 2'b00; #40; // T4
    {s, d} = 2'b00; #40; // T5
    {s, d} = 2'b11; #40; // T6
    {s, d} = 2'b01; #40; // T7
    {s, d} = 2'b11; #40; // T8
    {s, d} = 2'b11; #40; // T9
    {s, d} = 2'b00; #40; // T10
    {s, d} = 2'b11; #40; // T11
    {s, d} = 2'b00; #40; // T12
    {s, d} = 2'b11; #40; // T13
    {s, d} = 2'b01; #40; // T14
    {s, d} = 2'b00; #40; // T15
    {s, d} = 2'b10; #40; // T16
    {s, d} = 2'b00; #40; // T17
    {s, d} = 2'b01; #40; // T18
    {s, d} = 2'b00; #40; // T19
    {s, d} = 2'b10; #40; // T20
    end

endmodule
