`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2024 10:25:23 PM
// Design Name: 
// Module Name: sim_exer
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


module sim_exer();
    
   reg clkin, btnR, btnC;
   reg [15:0] sw;
   initial    // Clock process for clkin
    begin
	clkin = 1'b1;
        #20
        forever
        begin
            #50 clkin = ~clkin;
        end
    end     
   initial
   begin
         btnC = 1'b0;
         btnR = 1'b0;
         #100;
         btnR = 1'b1;
         sw = 16'd256;
         #50;
         btnR = 1'b0;
         #100;
         btnC = 1'b1;
         #50;
         btnC = 1'b0;
         #100;
         sw = {8{1'd1}};
         #100;
         btnC = 1'b1;   
    end
endmodule 
