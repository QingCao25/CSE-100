`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2024 12:17:44 AM
// Design Name: 
// Module Name: counter5bit_test
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


module counter5bit_test();


// registers to hold values for the inputs to your top level
    reg [4:0] Din;
    reg clk, UD, CE, LD;
// wires to see the values of the outputs of your top level
    wire [4:0] Q;
    wire UTC, DTC;
// create one instance of your top level
// and attach it to the registers and wires created above
    countUD5L UUT (
     .clk(clk),
     .Din(Din),
     .UD(UD),
     .LD(LD),
     .CE(CE),
     .Q(Q),
     .UTC(UTC),
     .DTC(DTC)
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
	
// here is where the values for the registers are provided
// time must be advanced after every change
   initial
   begin
	 // add your test vectors here
	 // to set the signal foo (declared as a register above) to a value use
	 // foo = constant;
         // example:   foo = 1'b0;
	 // always advance time by multiples of 100ns
	 //start by setting initial values
     Din = 4'b0;
     UD = 1'b0;
     CE = 1'b0;
     LD = 1'b0;
     // you will need to add more tests ....
     #100;
     UD = 1'b0;
//     CE = 1'b1;
     #100;
//     UD = 1'b0;
     CE = 1'b1;
    end
    
endmodule
