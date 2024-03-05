`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 02:08:15 AM
// Design Name: 
// Module Name: slug_sim
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


module slug_sim();
    reg [14:0] h, v, frame, half_frame;
    reg btnR, btnL, clk;
    
    wire slug;

   Slug UUT (
   .h(h), 
   .v(v), 
   .frame(frame),
   .half_frame(half_frame),
   .btnR(btnR),
   .btnL(btnL),
   .clk(clk)
   
   );
   
   // Clock parameters
   parameter PERIOD = 10;
   parameter real DUTY_CYCLE = 0.5;
   parameter OFFSET = 2;

       initial
       begin
              clk = 1'b0;
          #OFFSET
              clk = 1'b1;
      forever
         begin
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = ~clk;
         end
       end
       
       
  initial
  begin
  btnR = 0;
  btnL = 0;
  frame = 0;
  half_frame = 0;
  h = 15'd0;
  v = 15'd0;
  #100;
  
  
  btnL = 1;
  
 
  
  
  end
       
       


endmodule
