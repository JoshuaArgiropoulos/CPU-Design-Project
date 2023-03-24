`timescale 1ns/10ps

module control_unit (

	output reg MD_Read, Gra, Grb, Grc, Rin, Rout, BAout, WriteRAM, ReadRAM,
  
	output [31:0] enable, busSelect, InPortData,
 
	output [4:0] Control_Signals
 
 
	input [31:0] TrueBusMuxOut, OutputUnit, 
 
	input wire [31:0] ir, 
	
	input wire CONFFOut, clk, Reset, Stop
  

parameter reset_state = 4’b0000, fetch0 = 4’b0001, fetch1 = 4’b0010, fetch2 = 4’b0011,
 
	add3 = 4’b0100, add4 = 4’b0101, add5 = 4’b0110, …;
	 
	 // finish
	 
 reg [3:0] present_state = reset_state; 
	 // adjust the bit pattern based on the number of states

	 
	 always @(posedge Clock, posedge Reset, posedge Stop) 
 
		 begin
	 if (Reset ==1’b1) present_state = reset_state;

	 if (Stop == 1'b1) present_state = **********HALT******;
		 
 
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
					
					 //Z In 
					 enable[18] <= 0;
					 //Zin <= 0;

				 end
				 
				 fetch1: begin
					 
			
					  //PCout 
					 busSelect[20] <= 0;
					 //PCout <= 0; 
					 //MAR IN
					 enable[25] <= 0;
					 //MAR_enable <= 0; 
			
					 //MDR 
					 enable[21] <= 1;
					 //MDR_enable <= 1; 
					 
					 //MD READ
					 MD_Read <= 1;
					 
					 //Z low 
					 busSelect[19] <= 1;
					 //ZLowout <= 1; 
		end 
		fetch2: begin
			
			 //MDR 
			enable[21] <= 0;
			 //MD READ
			 MD_Read <= 0;
			//Z low 
			busSelect[19] <= 0;
			
					
			//MDR out
			busSelect[21] <= 1;
			
			//IR enable 
			enable[24] <= 1;
			
			//PC enable 
			enable[20] <=1;
			
			//INC PC
			Control_Signals <= d'd14;
			
			
			// PC enable low 
			#30 enable[20] <= 0;
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
