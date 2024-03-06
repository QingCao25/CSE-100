`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2024 04:59:00 PM
// Design Name: 
// Module Name: Energy
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


module Energy(
    input [14:0] h, v,
    input clk, btnU, frame, gameover, gamestart,
    output energy, no_energy
    );
    wire [14:0] currentval, topbar; 

    
    assign energy = ((h > 20) & (h < 40)) & ((v > topbar) & (v < 232));
    
   
    assign topbar = 40 + currentval; // allows the topbar to me shifted downwards based on if current val is >= 0
    countUD15L energycounter(.clk(clk),     
                            .UD(((topbar >= 40) & btnU)), 
                            .CE(((btnU & topbar < 232) | (~btnU & topbar > 40)) & frame & ~gameover & gamestart), 
                            .LD(10'b0), .Din(15'd0), .Q(currentval));

    FDRE #(.INIT(1'b0)) no_energy_Detect(.C(clk), .CE(topbar == 231), .R(topbar < 231), .D(1'b1), .Q(no_energy));
    
endmodule
