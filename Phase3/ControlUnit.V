`timescale 1ns/10ps

module control_unit (

	output reg MD_Read, Gra, Grb, Grc, Rin, Rout, BAout, WriteRAM, ReadRAM,
  
	output [31:0] enable, busSelect, InPortData,
 
	output [4:0] Control_Signals
 
 
	//input [31:0] TrueBusMuxOut, OutputUnit,
	//^ might be wrong
 
	input wire [31:0] ir, 
	
	input wire CONFFOut, clk, Reset, Stop
  

parameter Reset_state= 9'b000000000, fetch0 = 9'b000000001, fetch1 = 9'b000000010, fetch2= 9'b000000011,
			
			
			 add3 = 9'b000000100, add4= 9'b000000101, add5= 9'b000000110, sub3 = 9'b000000111, sub4 = 9'b000001000, sub5 = 9'b000001001,
			 mul3 = 9'b000001010, mul4 = 9'b000001011, mul5 = 9'b000001100, mul6 = 9'b000001101, div3 = 9'b000001110, div4 = 9'b000001111,
			 div5 = 9'b000010000, div6 = 9'b000010001, or3 = 9'b000010010, or4 = 9'b000010011, or5 = 9'b000010100, and3 = 9'b000010101, 
			 and4 = 9'b000010110, and5 = 9'b000010111, shl3 = 9'b000011000, shl4 = 9'b000011001, shl5 = 9'b000011010, shr3 = 9'b000011011,
			 shr4 = 9'b000011100, shr5 = 9'b000011101, rol3 = 9'b000011110, rol4 = 9'b000011111, rol5 = 9'b000100000, ror3 = 9'b000100001,
			 ror4 = 9'b000100010, ror5 = 9'b000100011, neg3 = 9'b000100100, neg4 = 9'b000100101, neg5 = 9'b000100110, not3 = 9'b000100111,
			 not4 = 9'b000101000, not5 = 9'b000101001, ld3 = 9'b000101010, ld4 = 9'b000101011, ld5 = 9'b000101100, ld6 = 9'b000101101, 
			 ld7 = 9'b000101110, ldi3 = 9'b000101111, ldi4 = 9'b000110000, ldi5 = 9'b000110001, st3 = 9'b000110010, st4 = 9'b000110011,
			 st5 = 9'b000110100, st6 = 9'b000110101, addi3 = 9'b000110111, addi4 = 9'b000111000, addi5 = 9'b000111001,
			 andi3 = 9'b000111010, andi4 = 9'b000111011, andi5 = 9'b000111100, ori3 = 9'b000111101, ori4 = 9'b000111110, ori5 = 9'000111111,
			 br3 = 9'b001000000, br4 = 9'b001000001, br5 = 9'b001000010, br6 = 9'b001000011, br7 = 9'b011111111, jr3 = 9'b001000100, jal3 = 9'b001000101, 
			 jal4 = 9'b001000110, jal5 = 9'b000110110, mfhi3 = 9'b001000111, mflo3 = 9'b001001000, in3 = 9'b001001001, out3 = 9'b001001010, nop3 = 9'b001001011, 
			 halt3 = 9'b001001100, shra3 = 9'b100000000, shra4 = 9'b100000000, shra5 = 9'b100000000;
	

	reg		[8:0] Present_state = Reset_state;

always @(posedge Clock, posedge Reset, posedge Stop) 
	begin
		if (Reset == 1'b1) Present_state = Reset_state;
		if (Stop == 1'b1) Present_state = halt3;
		else case (Present_state)
			Reset_state		:	Present_state = fetch0;
			fetch0			:	Present_state = fetch1;
			fetch1			:	Present_state = fetch2;
			fetch2			:	begin	
										@(posedge Clock);
										case	(IR[31:27])
											5'b00011		:		Present_state=add3;	
											5'b00100		: 		Present_state=sub3;
											5'b01110		:		Present_state=mul3;
											5'b01111		:		Present_state=div3;
											5'b00101		:		Present_state=shr3;
											5'b00110		:		Present_state=shl3;
											5'b00111		:		Present_state=ror3;
											5'b01000		:		Present_state=rol3;
											5'b01001		:		Present_state=and3;
											5'b01010		:		Present_state=or3;
											5'b10000		:		Present_state=neg3;
											5'b10001		:		Present_state=not3;
											5'b00000		:		Present_state=ld3;
											5'b00001		:		Present_state=ldi3;
											5'b00010		:		Present_state=st3;
											5'b01011		:		Present_state=addi3;
											5'b01100		:		Present_state=andi3;
											5'b01101		:		Present_state=ori3;
											5'b10010		:		Present_state=br3;
											5'b10011		:		Present_state=jr3;
											5'b10100		:		Present_state=jal3;
											5'b10111		:		Present_state=mfhi3;
											5'b11000		:		Present_state=mflo3;
											5'b10101		:		Present_state=in3;
											5'b10110		:		Present_state=out3;
											5'b11001		:		Present_state=nop3;
											5'b11010		:		Present_state=halt3;
											5'b11111                :               Present_state=shra3;
										endcase
									end
			
			add3				: 	Present_state = add4;
			add4				:	Present_state = add5;
			add5 				:	Present_state = fetch0;
			
			addi3				: 	Present_state = addi4;
			addi4				:	Present_state = addi5;
			addi5 				:	Present_state = fetch0;
			
			sub3				: 	Present_state = sub4;
			sub4				: 	Present_state = sub5;
			sub5				:	Present_state = fetch0;
			
			mul3				: 	Present_state = mul4;
			mul4				: 	Present_state = mul5;
			mul5				: 	Present_state = mul6;
			mul6           :	Present_state = fetch0; 
			
			div3				: 	Present_state = div4;
			div4				: 	Present_state = div5;
			div5				: 	Present_state = div6;
			div6				:	Present_state = fetch0;
			
			or3				: 	Present_state = or4;
			or4				: 	Present_state = or5;
			or5				:	Present_state = fetch0;
			
			and3				: 	Present_state = and4;
			and4				: 	Present_state = and5;
			and5   			:	Present_state = fetch0;
			
			shl3				: 	Present_state = shl4;
			shl4				: 	Present_state = shl5;
			shl5 				:	Present_state = fetch0;
			
			shr3				: 	Present_state = shr4;
			shr4				: 	Present_state = shr5;
			shr5 				:	Present_state = fetch0;
			
			shra3				: 	Present_state = shra4;
			shra4				: 	Present_state = shra5;
			shra5 				:	Present_state = fetch0;
			
			rol3				: 	Present_state = rol4;
			rol4				: 	Present_state = rol5;
			rol5 				:	Present_state = fetch0;
			
			ror3				: 	Present_state = ror4;
			ror4				: 	Present_state = ror5;
			ror5 				:	Present_state = fetch0;
			
			neg3				: 	Present_state = neg4;
			neg4				: 	Present_state = fetch0;
			
			not3				: 	Present_state = not4;
			not4				: 	Present_state = fetch0;
			
			ld3				: 	Present_state = ld4;
			ld4				: 	Present_state = ld5;
			ld5				: 	Present_state = ld6;
			ld6				: 	Present_state = ld7;
			ld7				:  Present_state = fetch0;
			
			ldi3				: 	Present_state = ldi4;
			ldi4				: 	Present_state = ldi5;
			ldi5 				:	Present_state = fetch0;
			
			st3				: 	Present_state = st4;
			st4				: 	Present_state = st5;
			st5				: 	Present_state = st6;
			st6 				:	Present_state = fetch0;
			
			andi3				: 	Present_state = andi4;
			andi4				: 	Present_state = andi5;
			andi5 			:	Present_state = fetch0;
			
			ori3				: 	Present_state = ori4;
			ori4				: 	Present_state = ori5;
			ori5 				:	Present_state = fetch0;
			
			jal3				: 	Present_state = jal4;
			jal4 				:	Present_state = jal5;
			jal5                            :       Present_state = fetch0;
			
			jr3 				:	Present_state = fetch0;
			
			br3				: 	Present_state = br4;
			br4				: 	Present_state = br5;
			br5				: 	Present_state = br6;
			br6  				:	Present_state = fetch0;
			
			out3 				:	Present_state = fetch0;
			
			in3 				:	Present_state = fetch0;
			
			mflo3 			:	Present_state = fetch0;
			
			mfhi3 			:	Present_state = fetch0;
			
			nop3 				:	Present_state = fetch0;
			
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
				 

				 
				 ld3: begin
								
					 #0 Grb <= 1; BAout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg
					
					 #40 Grb <= 0; BAout <= 0; enable[19] <= 0;
		
				 end
		
				 ld4: begin
							
					 #0 busSelect[23] <=1; Control_Signals <= 1; enable[18] <= 1;//adds preload reg with immidiate value, stores in Zlow
								
					 #40 busSelect[23] <=0; Control_Signals <= 0; enable[18] <= 0;
		
				 end
		
				 ld5: begin
		
					 #0 busSelect[19] <= 1; enable[25] <= 1;//put Zlow into MAR
		
					 #40 busSelect[19] <= 0; enable[25] <= 0;
		
				 end
		
				 ld6: begin
					 #0 MD_Read <= 1; ReadRAM <= 1; enable[21] <= 1;//reads data from addr location and puts into MRD
			
					 #40  MD_Read <= 0; ReadRAM <= 0; enable[21] <= 0;
		
				 end
	
				 ld7: begin

				
					 #0 busSelect[21] <= 1; Gra <= 1; Rin <= 1;//enables destination reg and imputs desired value from MDR
					
					 #40 busSelect[21] <= 0; Gra <= 0; Rin <= 0;
		
				 end
		
//ldi
		ldi3: begin
								#0 Grb <= 1; BAout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg
								#40 Grb <= 0; BAout <= 0; enable[19] <= 0;
		end
		ldi4: begin
								#0 busSelect[23] <=1; Control_Signals <= 1; enable[18] <= 1;//adds preload reg with immidiate value, stores in Zlow
								#40 busSelect[23] <=0; Control_Signals <= 0; enable[18] <= 0;
		end
		ldi5: begin
								#0 busSelect[19] <= 1; Gra <= 1; Rin <= 1;//put Zlow into dest reg
								#40 busSelect[19] <= 0; Gra <= 0; Rin <= 0;
			end
			
//st
		st3: begin
								#0 Grb <= 1; BAout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg
								#40 Grb <= 0; BAout <= 0; enable[19] <= 0;
		end
		st4: begin
								#0 busSelect[23] <=1; Control_Signals <= 1; enable[18] <= 1;//adds preload reg with immidiate value, stores in Zlow
								#40 busSelect[23] <=0; Control_Signals <= 0; enable[18] <= 0;
		end
		st5: begin
								#0 busSelect[19] <= 1; enable[25] <= 1;//put Zlow into MAR
								#40 busSelect[19] <= 0; enable[25] <= 0;
		end
		st6: begin
								#0 Gra <= 1; BAout <= 1; Rout <= 1; WriteRAM <= 1; 
								#40 Gra <= 0; BAout <= 0; Rout <= 0; WriteRAM <= 0;
		end


//three param ALU
//add
		add3: begin
								#0 Grb <= 1; Rout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg //change BAout to Rout
								#40 Grb <= 0; Rout <= 0; enable[19] <= 0;
		end
		add4: begin
								#0 Grc <= 1; Rout <= 1; Control_Signals <= 1; enable[19] <= 1;
								#40 Grc <= 1; Rout <= 0; Control_Signals <= 0; enable[19] <= 0;
		end
		add5: begin
								#0 busSelect[19] <= 1; Gra <= 1; Rin <= 1;//put Zlow into dest reg
								#40 busSelect[19] <= 0; Gra <= 0; Rin <= 0;
		end
		
//sub
		sub3: begin
								#0 Grb <= 1; Rout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg //change BAout to Rout
								#40 Grb <= 0; Rout <= 0; enable[19] <= 0;
		end
		sub4: begin
								#0 Grc <= 1; Rout <= 1; Control_Signals <= 2; enable[19] <= 1;
								#40 Grc <= 1; Rout <= 0; Control_Signals <= 0; enable[19] <= 0;
		end
		sub5: begin
								#0 busSelect[19] <= 1; Gra <= 1; Rin <= 1;//put Zlow into dest reg
								#40 busSelect[19] <= 0; Gra <= 0; Rin <= 0;
		end

//and
		and3: begin
								#0 Grb <= 1; Rout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg //change BAout to Rout
								#40 Grb <= 0; Rout <= 0; enable[19] <= 0;
		end
		and4: begin
								#0 Grc <= 1; Rout <= 1; Control_Signals <= 3; enable[19] <= 1;
								#40 Grc <= 1; Rout <= 0; Control_Signals <= 0; enable[19] <= 0;
		end
		and5: begin
								#0 busSelect[19] <= 1; Gra <= 1; Rin <= 1;//put Zlow into dest reg
								#40 busSelect[19] <= 0; Gra <= 0; Rin <= 0;
		end
		
//or
		or3: begin
								#0 Grb <= 1; Rout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg //change BAout to Rout
								#40 Grb <= 0; Rout <= 0; enable[19] <= 0;
		end
		or4: begin
								#0 Grc <= 1; Rout <= 1; Control_Signals <= 4; enable[19] <= 1;
								#40 Grc <= 1; Rout <= 0; Control_Signals <= 0; enable[19] <= 0;
		end
		or5: begin
								#0 busSelect[19] <= 1; Gra <= 1; Rin <= 1;//put Zlow into dest reg
								#40 busSelect[19] <= 0; Gra <= 0; Rin <= 0;
		end
		
//shr
		shr3: begin
								#0 Grb <= 1; Rout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg //change BAout to Rout
								#40 Grb <= 0; Rout <= 0; enable[19] <= 0;
		end
		shr4: begin
								#0 Grc <= 1; Rout <= 1; Control_Signals <= 7; enable[19] <= 1;
								#40 Grc <= 1; Rout <= 0; Control_Signals <= 0; enable[19] <= 0;
		end
		shr5: begin
								#0 busSelect[19] <= 1; Gra <= 1; Rin <= 1;//put Zlow into dest reg
								#40 busSelect[19] <= 0; Gra <= 0; Rin <= 0;
		end
		
//shra
		shra3: begin
								#0 Grb <= 1; Rout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg //change BAout to Rout
								#40 Grb <= 0; Rout <= 0; enable[19] <= 0;
		end
		shra4: begin
								#0 Grc <= 1; Rout <= 1; Control_Signals <= 13; enable[19] <= 1;
								#40 Grc <= 1; Rout <= 0; Control_Signals <= 0; enable[19] <= 0;
		end
		shra5: begin
								#0 busSelect[19] <= 1; Gra <= 1; Rin <= 1;//put Zlow into dest reg
								#40 busSelect[19] <= 0; Gra <= 0; Rin <= 0;
		end
		
//shl
		shl3: begin
								#0 Grb <= 1; Rout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg //change BAout to Rout
								#40 Grb <= 0; Rout <= 0; enable[19] <= 0;
		end
		shl4: begin
								#0 Grc <= 1; Rout <= 1; Control_Signals <= 8; enable[19] <= 1;
								#40 Grc <= 1; Rout <= 0; Control_Signals <= 0; enable[19] <= 0;
		end
		shl5: begin
								#0 busSelect[19] <= 1; Gra <= 1; Rin <= 1;//put Zlow into dest reg
								#40 busSelect[19] <= 0; Gra <= 0; Rin <= 0;
		end
		
//ror
		ror3: begin
								#0 Grb <= 1; Rout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg //change BAout to Rout
								#40 Grb <= 0; Rout <= 0; enable[19] <= 0;
		end
		ror4: begin
								#0 Grc <= 1; Rout <= 1; Control_Signals <= 9; enable[19] <= 1;
								#40 Grc <= 1; Rout <= 0; Control_Signals <= 0; enable[19] <= 0;
		end
		ror5: begin
								#0 busSelect[19] <= 1; Gra <= 1; Rin <= 1;//put Zlow into dest reg
								#40 busSelect[19] <= 0; Gra <= 0; Rin <= 0;
		end
		
//rol
		rol3: begin
								#0 Grb <= 1; Rout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg //change BAout to Rout
								#40 Grb <= 0; Rout <= 0; enable[19] <= 0;
		end
		rol4: begin
								#0 Grc <= 1; Rout <= 1; Control_Signals <= 10; enable[19] <= 1;
								#40 Grc <= 1; Rout <= 0; Control_Signals <= 0; enable[19] <= 0;
		end
		rol5: begin
								#0 busSelect[19] <= 1; Gra <= 1; Rin <= 1;//put Zlow into dest reg
								#40 busSelect[19] <= 0; Gra <= 0; Rin <= 0;
		end
		
//addi
		addi3: begin
								#0 Grb <= 1; Rout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg //change BAout to Rout
								#40 Grb <= 0; Rout <= 0; enable[19] <= 0;
		end
		addi4: begin
								#0 busSelect[23] <=1; Control_Signals <= 1; enable[18] <= 1;//addi
								#40 busSelect[23] <=0; Control_Signals <= 0; enable[18] <= 0;
		end
		addi5: begin
								#0 busSelect[19] <= 1; Gra <= 1; Rin <= 1;//put Zlow into dest reg
								#40 busSelect[19] <= 0; Gra <= 0; Rin <= 0;
		end
		
//andi
		andi3: begin
								#0 Grb <= 1; Rout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg //change BAout to Rout
								#40 Grb <= 0; Rout <= 0; enable[19] <= 0;
		end
		andi4: begin
								#0 busSelect[23] <=1; Control_Signals <= 3; enable[18] <= 1;//andi
								#40 busSelect[23] <=0; Control_Signals <= 0; enable[18] <= 0;
		end
		andi5: begin
								#0 busSelect[19] <= 1; Gra <= 1; Rin <= 1;//put Zlow into dest reg
								#40 busSelect[19] <= 0; Gra <= 0; Rin <= 0;
		end
		
//ori
		ori3: begin
								#0 Grb <= 1; Rout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg //change BAout to Rout
								#40 Grb <= 0; Rout <= 0; enable[19] <= 0;
		end
		ori4: begin
								#0 busSelect[23] <=1; Control_Signals <= 4; enable[18] <= 1;//ori
								#40 busSelect[23] <=0; Control_Signals <= 0; enable[18] <= 0;
		end
		ori5: begin
								#0 busSelect[19] <= 1; Gra <= 1; Rin <= 1;//put Zlow into dest reg
								#40 busSelect[19] <= 0; Gra <= 0; Rin <= 0;
		end
		
		
//Two Param ALU
//mul
		mul3: begin
								#0 Grb <= 1; Rout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg //change BAout to Rout
								#40 Grb <= 0; Rout <= 0; enable[19] <= 0;
		end
		mul4: begin
								#0 busSelect[23] <=1; Control_Signals <= 12; enable[18] <= 1;//mul
								#40 busSelect[23] <=0; Control_Signals <= 0; enable[18] <= 0;
		end
		mul5: begin
								#0 busSelect[19] <= 1; enable[17] <= 1;//put Zlow into LO
								#40 busSelect[19] <= 0; enable[17] <= 0;
		end
		mul6: begin
								#0 busSelect[19] <= 1; enable[18] <= 1;//put Zlow into HI
								#40 busSelect[19] <= 0; enable[18] <= 0;
		end
		
//div
		div3: begin
								#0 Grb <= 1; Rout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg //change BAout to Rout
								#40 Grb <= 0; Rout <= 0; enable[19] <= 0;
		end
		div4: begin
								#0 busSelect[23] <=1; Control_Signals <= 11; enable[18] <= 1;
								#40 busSelect[23] <=0; Control_Signals <= 0; enable[18] <= 0;
		end
		div5: begin
								#0 busSelect[19] <= 1; enable[17] <= 1;//put Zlow into LO
								#40 busSelect[19] <= 0; enable[17] <= 0;
		end
		div6: begin
								#0 busSelect[19] <= 1; enable[18] <= 1;//put Zlow into HI
								#40 busSelect[19] <= 0; enable[18] <= 0;
		end
		
//neg
		neg3: begin
								#0 Grb <= 1; Rout <= 1; Control_Signals <= 5; enable[18] <= 1;
								#40 Grb <= 0; Rout <= 0; Control_Signals <= 0; enable[18] <= 0;
		end
		neg4: begin
								#0 busSelect[19] <= 1; Gra <= 1; Rin <= 1;//put Zlow into LO
								#40 busSelect[19] <= 0; Gra <= 0; Rin <= 0;
		end
//NOT
		not3: begin
								#0 Grb <= 1; Rout <= 1; Control_Signals <= 6; enable[18] <= 1;
								#40 Grb <= 0; Rout <= 0; Control_Signals <= 0; enable[18] <= 0;
		end
		not4: begin
								#0 busSelect[19] <= 1; Gra <= 1; Rin <= 1;//put Zlow into LO
								#40 busSelect[19] <= 0; Gra <= 0; Rin <= 0;
								
//Branch
		br3: begin
								#0 Gra <= 1; Rout <= 1; enable[27] <= 1;//Puts preloaded reg into CONFF
								#40 Gra <= 0; Rout <= 0; enable[27] <= 0;
		end
		br4: begin
								#0 busSelect[20] <=1; enable[19] <= 1;//PCout Yin
								#40 busSelect[20] <=0; enable[19] <= 0;
		end
		br5: begin
								#0 busSelect[23] <=1; Control_Signals <= 15; enable[18] <= 1;//adds CSE with PC??, stores in Zlow
								#40 busSelect[23] <=0; Control_Signals <= 0; enable[18] <= 0;
		end
		br6: begin
	
								if(CONFFOut)begin
								#0 busSelect[19] <= 1; enable[20] <= 1;//CSE -> PC
								end
								#40 busSelect[19] <= 0; enable[20] <= 0;
		end
		
//jump
//jr
		jr3: begin
								#0 busSelect[20] <= 1; Control_Signals <= 14; enable[18] <= 1;
								#40 busSelect[20] <= 0; Control_Signals <= 0; enable[18] <= 0;
		end
		
//jal
		jal3: begin
								#0 busSelect[20] <= 1; Control_Signals <= 14; enable[18] <= 1;
								#40 busSelect[20] <= 0; Control_Signals <= 0; enable[18] <= 0;
		end
		jal4: begin
								#0 busSelect[19] <= 1; enable[15] <= 1;
								#40 busSelect[19] <= 0; enable[15] <= 0;
		end
		jal5: begin
								#0 Gra <= 1; Rout <= 1; enable[20] <= 1;//put Zlow into MAR
								#40 Gra <= 0; Rout <= 0; enable[20] <= 0;
		end
		
//Special
		
//mfhi
		mfhi3: begin
								#0 Gra <= 1; Rin <= 1; busSelect[16] <= 1;
								#40 Gra <= 0; Rin <= 0; busSelect[16] <= 0;//HI
		
		end
		
//mflo
		mflo3: begin
								#0 Gra <= 1; Rin <= 1; busSelect[17] <= 1;
								#40 Gra <= 0; Rin <= 0; busSelect[17] <= 0;//LO
		
		end
		
//Control Sequence
//in
		in3: begin
								#0 Gra <= 1; busSelect[22] <= 1; Rin <= 1; //In
								#40 Gra <= 0; busSelect[22] <= 1; Rin <= 0; //In
		end
		
//out
		out3: begin
								#0 Gra <= 1; enable[28] <= 1;  <= 1; //Out
								#40 Gra <= 0; enable[28] <= 0;  <= 0; //Out
		end
		
//nop
		nop3: begin
								#0;
								#40;
		end
//halt
		halt3: begin
								#0 run <= 0;
								#40;
		end

			
			endcase

		 
		end

	 endmodule 
