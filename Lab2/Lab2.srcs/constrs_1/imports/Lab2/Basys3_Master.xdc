## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property PaCKaGE_PIN W5 [get_ports clkin]							
	set_property IOSTaNDaRD LVCMOS33 [get_ports clkin]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clkin]
 
## Switches
set_property PaCKaGE_PIN V17 [get_ports {sw[0]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {sw[0]}]
set_property PaCKaGE_PIN V16 [get_ports {sw[1]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {sw[1]}]
set_property PaCKaGE_PIN W16 [get_ports {sw[2]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {sw[2]}]
set_property PaCKaGE_PIN W17 [get_ports {sw[3]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {sw[3]}]
set_property PaCKaGE_PIN W15 [get_ports {sw[4]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {sw[4]}]
set_property PaCKaGE_PIN V15 [get_ports {sw[5]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {sw[5]}]
set_property PaCKaGE_PIN W14 [get_ports {sw[6]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {sw[6]}]
set_property PaCKaGE_PIN W13 [get_ports {sw[7]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {sw[7]}]
set_property PaCKaGE_PIN V2 [get_ports {sw[8]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {sw[8]}]
set_property PaCKaGE_PIN T3 [get_ports {sw[9]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {sw[9]}]
set_property PaCKaGE_PIN T2 [get_ports {sw[10]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {sw[10]}]
set_property PaCKaGE_PIN R3 [get_ports {sw[11]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {sw[11]}]
set_property PaCKaGE_PIN W2 [get_ports {sw[12]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {sw[12]}]
set_property PaCKaGE_PIN U1 [get_ports {sw[13]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {sw[13]}]
set_property PaCKaGE_PIN T1 [get_ports {sw[14]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {sw[14]}]
set_property PaCKaGE_PIN R2 [get_ports {sw[15]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {sw[15]}]
 

## LEDs
set_property PaCKaGE_PIN U16 [get_ports {led[0]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {led[0]}]
set_property PaCKaGE_PIN E19 [get_ports {led[1]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {led[1]}]
set_property PaCKaGE_PIN U19 [get_ports {led[2]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {led[2]}]
set_property PaCKaGE_PIN V19 [get_ports {led[3]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {led[3]}]
set_property PaCKaGE_PIN W18 [get_ports {led[4]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {led[4]}]
set_property PaCKaGE_PIN U15 [get_ports {led[5]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {led[5]}]
set_property PaCKaGE_PIN U14 [get_ports {led[6]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {led[6]}]
set_property PaCKaGE_PIN V14 [get_ports {led[7]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {led[7]}]
set_property PaCKaGE_PIN V13 [get_ports {led[8]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {led[8]}]
set_property PaCKaGE_PIN V3 [get_ports {led[9]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {led[9]}]
set_property PaCKaGE_PIN W3 [get_ports {led[10]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {led[10]}]
set_property PaCKaGE_PIN U3 [get_ports {led[11]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {led[11]}]
set_property PaCKaGE_PIN P3 [get_ports {led[12]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {led[12]}]
set_property PaCKaGE_PIN N3 [get_ports {led[13]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {led[13]}]
set_property PaCKaGE_PIN P1 [get_ports {led[14]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {led[14]}]
set_property PaCKaGE_PIN L1 [get_ports {led[15]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {led[15]}]
	
	
##7 segment display
set_property PaCKaGE_PIN W7 [get_ports {seg[0]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {seg[0]}]
set_property PaCKaGE_PIN W6 [get_ports {seg[1]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {seg[1]}]
set_property PaCKaGE_PIN U8 [get_ports {seg[2]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {seg[2]}]
set_property PaCKaGE_PIN V8 [get_ports {seg[3]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {seg[3]}]
set_property PaCKaGE_PIN U5 [get_ports {seg[4]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {seg[4]}]
set_property PaCKaGE_PIN V5 [get_ports {seg[5]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {seg[5]}]
set_property PaCKaGE_PIN U7 [get_ports {seg[6]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {seg[6]}]

set_property PaCKaGE_PIN V7 [get_ports dp]							
	set_property IOSTaNDaRD LVCMOS33 [get_ports dp]

set_property PaCKaGE_PIN U2 [get_ports {an[0]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {an[0]}]
set_property PaCKaGE_PIN U4 [get_ports {an[1]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {an[1]}]
set_property PaCKaGE_PIN V4 [get_ports {an[2]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {an[2]}]
set_property PaCKaGE_PIN W4 [get_ports {an[3]}]					
	set_property IOSTaNDaRD LVCMOS33 [get_ports {an[3]}]


##Buttons
#set_property PaCKaGE_PIN U18 [get_ports btnC]						
	#set_property IOSTaNDaRD LVCMOS33 [get_ports btnC]
set_property PaCKaGE_PIN T18 [get_ports btnU]						
	set_property IOSTaNDaRD LVCMOS33 [get_ports btnU]
#set_property PaCKaGE_PIN W19 [get_ports btnL]						
	#set_property IOSTaNDaRD LVCMOS33 [get_ports btnL]
set_property PaCKaGE_PIN T17 [get_ports btnR]						
	set_property IOSTaNDaRD LVCMOS33 [get_ports btnR]
#set_property PaCKaGE_PIN U17 [get_ports btnD]						
	#set_property IOSTaNDaRD LVCMOS33 [get_ports btnD]
 


##Pmod Header Ja
##Sch name = Ja1
#set_property PaCKaGE_PIN J1 [get_ports {Ja[0]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {Ja[0]}]
##Sch name = Ja2
#set_property PaCKaGE_PIN L2 [get_ports {Ja[1]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {Ja[1]}]
##Sch name = Ja3
#set_property PaCKaGE_PIN J2 [get_ports {Ja[2]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {Ja[2]}]
##Sch name = Ja4
#set_property PaCKaGE_PIN G2 [get_ports {Ja[3]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {Ja[3]}]
##Sch name = Ja7
#set_property PaCKaGE_PIN H1 [get_ports {Ja[4]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {Ja[4]}]
##Sch name = Ja8
#set_property PaCKaGE_PIN K2 [get_ports {Ja[5]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {Ja[5]}]
##Sch name = Ja9
#set_property PaCKaGE_PIN H2 [get_ports {Ja[6]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {Ja[6]}]
##Sch name = Ja10
#set_property PaCKaGE_PIN G3 [get_ports {Ja[7]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {Ja[7]}]



##Pmod Header JB
##Sch name = JB1
#set_property PaCKaGE_PIN a14 [get_ports {JB[0]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JB[0]}]
##Sch name = JB2
#set_property PaCKaGE_PIN a16 [get_ports {JB[1]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JB[1]}]
##Sch name = JB3
#set_property PaCKaGE_PIN B15 [get_ports {JB[2]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JB[2]}]
##Sch name = JB4
#set_property PaCKaGE_PIN B16 [get_ports {JB[3]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JB[3]}]
##Sch name = JB7
#set_property PaCKaGE_PIN a15 [get_ports {JB[4]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JB[4]}]
##Sch name = JB8
#set_property PaCKaGE_PIN a17 [get_ports {JB[5]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JB[5]}]
##Sch name = JB9
#set_property PaCKaGE_PIN C15 [get_ports {JB[6]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JB[6]}]
##Sch name = JB10 
#set_property PaCKaGE_PIN C16 [get_ports {JB[7]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JB[7]}]
 


##Pmod Header JC
##Sch name = JC1
#set_property PaCKaGE_PIN K17 [get_ports {JC[0]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JC[0]}]
##Sch name = JC2
#set_property PaCKaGE_PIN M18 [get_ports {JC[1]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JC[1]}]
##Sch name = JC3
#set_property PaCKaGE_PIN N17 [get_ports {JC[2]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JC[2]}]
##Sch name = JC4
#set_property PaCKaGE_PIN P18 [get_ports {JC[3]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JC[3]}]
##Sch name = JC7
#set_property PaCKaGE_PIN L17 [get_ports {JC[4]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JC[4]}]
##Sch name = JC8
#set_property PaCKaGE_PIN M19 [get_ports {JC[5]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JC[5]}]
##Sch name = JC9
#set_property PaCKaGE_PIN P17 [get_ports {JC[6]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JC[6]}]
##Sch name = JC10
#set_property PaCKaGE_PIN R18 [get_ports {JC[7]}]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JC[7]}]


##Pmod Header JXaDC
##Sch name = Xa1_P
#set_property PaCKaGE_PIN J3 [get_ports {JXaDC[0]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JXaDC[0]}]
##Sch name = Xa2_P
#set_property PaCKaGE_PIN L3 [get_ports {JXaDC[1]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JXaDC[1]}]
##Sch name = Xa3_P
#set_property PaCKaGE_PIN M2 [get_ports {JXaDC[2]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JXaDC[2]}]
##Sch name = Xa4_P
#set_property PaCKaGE_PIN N2 [get_ports {JXaDC[3]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JXaDC[3]}]
##Sch name = Xa1_N
#set_property PaCKaGE_PIN K3 [get_ports {JXaDC[4]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JXaDC[4]}]
##Sch name = Xa2_N
#set_property PaCKaGE_PIN M3 [get_ports {JXaDC[5]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JXaDC[5]}]
##Sch name = Xa3_N
#set_property PaCKaGE_PIN M1 [get_ports {JXaDC[6]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JXaDC[6]}]
##Sch name = Xa4_N
#set_property PaCKaGE_PIN N1 [get_ports {JXaDC[7]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {JXaDC[7]}]



##VGa Connector
#set_property PaCKaGE_PIN G19 [get_ports {vgaRed[0]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {vgaRed[0]}]
#set_property PaCKaGE_PIN H19 [get_ports {vgaRed[1]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {vgaRed[1]}]
#set_property PaCKaGE_PIN J19 [get_ports {vgaRed[2]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {vgaRed[2]}]
#set_property PaCKaGE_PIN N19 [get_ports {vgaRed[3]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {vgaRed[3]}]
#set_property PaCKaGE_PIN N18 [get_ports {vgaBlue[0]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {vgaBlue[0]}]
#set_property PaCKaGE_PIN L18 [get_ports {vgaBlue[1]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {vgaBlue[1]}]
#set_property PaCKaGE_PIN K18 [get_ports {vgaBlue[2]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {vgaBlue[2]}]
#set_property PaCKaGE_PIN J18 [get_ports {vgaBlue[3]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {vgaBlue[3]}]
#set_property PaCKaGE_PIN J17 [get_ports {vgaGreen[0]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {vgaGreen[0]}]
#set_property PaCKaGE_PIN H17 [get_ports {vgaGreen[1]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {vgaGreen[1]}]
#set_property PaCKaGE_PIN G17 [get_ports {vgaGreen[2]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {vgaGreen[2]}]
#set_property PaCKaGE_PIN D17 [get_ports {vgaGreen[3]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {vgaGreen[3]}]
#set_property PaCKaGE_PIN P19 [get_ports Hsync]						
	#set_property IOSTaNDaRD LVCMOS33 [get_ports Hsync]
#set_property PaCKaGE_PIN R19 [get_ports Vsync]						
	#set_property IOSTaNDaRD LVCMOS33 [get_ports Vsync]


##USB-RS232 Interface
#set_property PaCKaGE_PIN B18 [get_ports RsRx]						
	#set_property IOSTaNDaRD LVCMOS33 [get_ports RsRx]
#set_property PaCKaGE_PIN a18 [get_ports RsTx]						
	#set_property IOSTaNDaRD LVCMOS33 [get_ports RsTx]


##USB HID (PS/2)
#set_property PaCKaGE_PIN C17 [get_ports PS2Clk]						
	#set_property IOSTaNDaRD LVCMOS33 [get_ports PS2Clk]
	#set_property PULLUP true [get_ports PS2Clk]
#set_property PaCKaGE_PIN B17 [get_ports PS2Data]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports PS2Data]	
	#set_property PULLUP true [get_ports PS2Data]


##Quad SPI Flash
##Note that CCLK_0 cannot be placed in 7 series devices. You can access it using the
##STaRTUPE2 primitive.
#set_property PaCKaGE_PIN D18 [get_ports {QspiDB[0]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {QspiDB[0]}]
#set_property PaCKaGE_PIN D19 [get_ports {QspiDB[1]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {QspiDB[1]}]
#set_property PaCKaGE_PIN G18 [get_ports {QspiDB[2]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {QspiDB[2]}]
#set_property PaCKaGE_PIN F18 [get_ports {QspiDB[3]}]				
	#set_property IOSTaNDaRD LVCMOS33 [get_ports {QspiDB[3]}]
#set_property PaCKaGE_PIN K19 [get_ports QspiCSn]					
	#set_property IOSTaNDaRD LVCMOS33 [get_ports QspiCSn]

set_property BITSTREaM.GENERaL.COMPRESS TRUE [current_design]

