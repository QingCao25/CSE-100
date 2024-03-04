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
    input h, v,
    output energy
    );
    assign energy = (h > 40) & (h < 60) & (v > 40) & (v < 232);
    
endmodule
