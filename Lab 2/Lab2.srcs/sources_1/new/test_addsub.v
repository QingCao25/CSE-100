`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Martine
// 
// Create Date: 9/27/2022 09:26:52 PM
// Design Name: 
// Module Name: test_add
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_add( ); // no inputs/outputs, this is a wrapper


// registers to hold values for the inputs to your top level
    reg [15:0] sw;
    reg btnU, btnR, clkin;
// wires to see the values of the outputs of your top level
    wire [6:0] seg;
    wire [3:0] an;
    wire dp;
    wire [15:0] led;
    
// create one instance of your top level
// and attach it to the registers and wires created above
    Main UUT (
     .sw(sw),
     .btnU(btnU),
     .btnR(btnR), 
     .clkin(clkin),
     .seg(seg),
     .an(an),
     .led(led),
     .dp(dp)
    );
    
    
// create an oscillating signal to impersonate the clock provided on the BaSYS 3 board
    parameter PERIOD = 10;
    parameter real DUTY_CYCLE = 0.5;
    parameter OFFSET = 2;

    initial    // Clock process for clkin
    begin
        #OFFSET
		  clkin = 1'b1;
        forever
        begin
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clkin = ~clkin;
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
     sw = 16'h0507;
	 btnR=1'b0;
	 btnU=1'b0;
         // and advance time by 2000 to begin
	 #2000;
         // Then new values can be provided and time advance by 100
     sw = 16'h0102;

	 #100;
	

// you will need to add more tests ....
    btnU=1'b0;
    sw[15:8] = 8'b00101110;
    sw[7:0] = 8'b0000100;
    #100;
    btnU = 1'b1;
    #100;
    btnU=1'b0;
    sw[15:8] = 8'b11010010;
    sw[7:0] = 8'b11111100;
    #100;
    btnU=1'b1;
    #100;
    btnU=1'b0;
    sw[15:8] = 8'b00101110;
    sw[7:0] = 8'b01011010;
    #100;
    sw[15:8] = 8'b10000010;
    sw[7:0] = 8'b11111101;
    #100;
    
//    Overflow Cases
//    (Addition - two pos numbers resulting in neg) 01111110 + 00000011 = 10000001
//    (Addition - two neg numbers resulling in pos) 10000010 + 11111101 = 01111111
//    (Subtraction - subtract neg from pos resulting in a neg) 01111110 - 10000001 = 11111111
//    (Subtraction - subtract pos from neg resulting in a pos) 10000010 - 11111101 = 10000001
    
    
      
      
      
    end

endmodule
