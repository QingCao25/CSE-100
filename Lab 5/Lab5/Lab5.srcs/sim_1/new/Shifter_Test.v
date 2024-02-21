`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2024 03:02:30 PM
// Design Name: 
// Module Name: Shifter_Test
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


module Shifter_Test();
    reg LD, Shift, fumble, clk;
    reg [5:0] In;
    reg [5:0] Off;
    wire[5:0] led, lastLED;

    
    LED_Shifter_Right UUT(
    .In(In),
    .Shift(Shift),
    .fumble(fumble),
    .LD(LD),
    .Off(Off),
    .clk(clk),
    .led(led),
    .lastLED(lastLED)
    );
    
    // create an oscillating signal to impersonate the clock provided on the BASYS 3 board
    parameter PERIOD = 10;
    parameter real DUTY_CYCLE = 0.5;
    parameter OFFSET = 2;

    initial    // Clock process for clkin
    begin
        #OFFSET
		  clk = 1'b1;
        forever
        begin
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = ~clk;
        end
    end

endmodule
