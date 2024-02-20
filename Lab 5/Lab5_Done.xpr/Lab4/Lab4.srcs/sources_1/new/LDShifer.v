`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2024 02:22:25 PM
// Design Name: 
// Module Name: LEDShifer
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


module LED_Shifter(
    input ShR,
    input ShL,
    input MisR,
    input MisL,
    input [15:0] take_in,    
    output [15:0] code
    );
    
    //Adding a led for player 2 (RIGHT)
    wire [5:0]  split;    
    assign split[0] = ShR;
    assign split[5:1] = take_in[4:0];
    
    //Adding a led for player 1 (LEFT)
    wire [5:0]  lsplit;
    assign lsplit[5] = ShL;
    assign lsplit[4:0] = take_in[15:11];
    
    
    
    
    wire [5:0] rsplit;
    wire [5:0]  rlsplit;
    
    mux right(.sel(MisR), .i0(split), .i1(rsplit), .j(code[6:0])); 
    mux left(.sel(MisL), .i0(lsplit), .i1(rlsplit), .j(code[15:10]));
    //Removing a led for player 1 (LEFT)
    
    assign rlsplit[0] = ~MisL;
    assign rlsplit[5:1] = take_in[14:10];
        
    //REMOVING a led for player 2 (RIGHT)
    assign rsplit[5] = ~MisR;
    assign rsplit[4:0] = take_in[5:1];
       
    
endmodule
