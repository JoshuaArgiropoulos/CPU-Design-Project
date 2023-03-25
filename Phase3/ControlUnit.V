`timescale 1ns/10ps

module control_unit (

	output reg MD_Read, Gra, Grb, Grc, Rin, Rout, BAout, WriteRAM, ReadRAM,
  
	output [31:0] enable, busSelect, InPortData,
 
	output [4:0] Control_Signals
 
 
	//input [31:0] TrueBusMuxOut, OutputUnit,
	//^ might be wrong
 
	input wire [31:0] ir, 
	
	input wire CONFFOut, clk, Reset, Stop
  

parameter Reset_state= 8'b00000000, fetch0 = 8'b00000001, fetch1 = 8'b00000010, fetch2= 8'b00000011,
			 add3 = 8'b00000100, add4= 8'b00000101, add5= 8'b00000110, sub3 = 8'b00000111, sub4 = 8'b00001000, sub5 = 8'b00001001,
			 mul3 = 8'b00001010, mul4 = 8'b00001011, mul5 = 8'b00001100, mul6 = 8'b00001101, div3 = 8'b00001110, div4 = 8'b00001111,
			 div5 = 8'b00010000, div6 = 8'b00010001, or3 = 8'b00010010, or4 = 8'b00010011, or5 = 8'b00010100, and3 = 8'b00010101, 
			 and4 = 8'b00010110, and5 = 8'b00010111, shl3 = 8'b00011000, shl4 = 8'b00011001, shl5 = 8'b00011010, shr3 = 8'b00011011,
			 shr4 = 8'b00011100, shr5 = 8'b00011101, rol3 = 8'b00011110, rol4 = 8'b00011111, rol5 = 8'b00100000, ror3 = 8'b00100001,
			 ror4 = 8'b00100010, ror5 = 8'b00100011, neg3 = 8'b00100100, neg4 = 8'b00100101, neg5 = 8'b00100110, not3 = 8'b00100111,
			 not4 = 8'b00101000, not5 = 8'b00101001, ld3 = 8'b00101010, ld4 = 8'b00101011, ld5 = 8'b00101100, ld6 = 8'b00101101, 
			 ld7 = 8'b00101110, ldi3 = 8'b00101111, ldi4 = 8'b00110000, ldi5 = 8'b00110001, st3 = 8'b00110010, st4 = 8'b00110011,
			 st5 = 8'b00110100, st6 = 8'b00110101, st7 = 8'b00110110, addi3 = 8'b00110111, addi4 = 8'b00111000, addi5 = 8'b00111001,
			 andi3 = 8'b00111010, andi4 = 8'b00111011, andi5 = 8'b00111100, ori3 = 8'b00111101, ori4 = 8'b00111110, ori5 = 8'b00111111,
			 br3 = 8'b01000000, br4 = 8'b01000001, br5 = 8'b01000010, br6 = 8'b01000011, br7 = 8'b11111111, jr3 = 8'b01000100, jal3 = 8'b01000101, 
			 jal4 = 8'b01000110, mfhi3 = 8'b01000111, mflo3 = 8'b01001000, in3 = 8'b01001001, out3 = 8'b01001010, nop3 = 8'b01001011, 
			 halt3 = 8'b01001100;
	
	 
 reg [3:0] present_state = reset_state; 
	 // adjust the bit pattern based on the number of states

	 
	 always @(posedge Clock, posedge Reset, posedge Stop) 
 
		 begin
	
			 if (Reset ==1’b1) present_state = reset_state;

			 if (Stop == 1'b1) present_state = //HALT CODE HERE
		 
		//IF STOP = 1, the program should call the halt code. Work in progress
		 
 
	 else case (present_state)
	 

		 reset_state : present_state = fetch0;

		 fetch0 : present_state = fetch1;

		 fetch1 : present_state = fetch2;

		 fetch2 : begin
 			@(posedge Clock);
			 
			 case (IR[31:27]) // inst. decoding based on the opcode to set the next state

				 5’b00011 : present_state = add3; // this is the add instruction
 ⁞
 
			 endcase

		 end

		 add3 : present_state = add4;

		 add4 : present_state = add5;
⁞
 
	 endcase

 end

	 always @(present_state) // do the job for each state

		 begin
 
			 case (present_state) // assert the required signals in each state

				 reset_state: begin
					 
					Run <= 1;
					 
					MD_Read <= 0;
					Gra <= 0;
					Grb <= 0;
					Grc <= 0;
					Rin <= 0;
					Rout <= 0;
					BAout <= 0;
					WriteRAM <= 0;
					ReadRAM <= 0;
					enable <= 0;
					busSelect <= 0;
					InPortData <= 0;
					Control_Signals <= 0;
					
					

 
 ⁞

				 end

				 fetch0: begin
					 
					 
					 //PCout 
					 
					 busSelect[20] <= 1;

					 //PCout <= 1; // see if you need to de-assert these signals
					 
					 //MAR IN
					 enable[25] <= 1;
					 //MARin <= 1;

					 //Inc PC
					 Control_Signals <= 4'd14;
					// IncPC <= 1;
					 
					 enable[18] <= 1;//Zin
					
					#15 busSelect[20] <= 0;
								
					 enable[25] <= 0;//MAR
								
					 //enable[27] <= 0;//incPC bit is bit 27
					
					 Control_Signals <= 0;
					
					 enable[18] <= 0;//Zin
											

				 end
				 
				 fetch1: begin
					 
			
					#10 busSelect[19] <= 1;//zLowOut
							
					 enable[20] <= 1;//pcIn
					 enable[21] <= 1;//MDRin
					 MD_Read <= 1;//read
					 ReadRAM <= 1;
								
					
					 #15 busSelect[19] <= 0;
					
					 busSelect[19] <= 0;
					
					 enable[20] <= 0;
					
					 ReadRAM <= 0;
		end 
		fetch2: begin
			
			//busSelect[21] <= 1;
								
			#10 enable[21] <= 0; MD_Read <= 0; 
			
			busSelect[21] <= 1; enable[24] <= 1;
			
			#15 busSelect[21] <= 0; enable[24] <= 0;
		end 
				 

				 add3: begin

					 Grb <= 1; Rout <= 1;

					 //Y IN
					 enable[19] <= 0;
					 //Yin <= 0;

				 end
⁞

			 endcase

		 end

	 endmodule 
