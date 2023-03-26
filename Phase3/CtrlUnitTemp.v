//code for control unit

//Memory Access
//ld
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
		addi3: begin
								#0 Grb <= 1; Rout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg //change BAout to Rout
								#40 Grb <= 0; Rout <= 0; enable[19] <= 0;
		end
		addi4: begin
								#0 busSelect[23] <=1; Control_Signals <= 4; enable[18] <= 1;//ori
								#40 busSelect[23] <=0; Control_Signals <= 0; enable[18] <= 0;
		end
		addi5: begin
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
		mul3: begin
								#0 Grb <= 1; Rout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg //change BAout to Rout
								#40 Grb <= 0; Rout <= 0; enable[19] <= 0;
		end
		mul4: begin
								#0 busSelect[23] <=1; Control_Signals <= 11; enable[18] <= 1;
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
		
//neg
		neg3: begin
								#0 Grb <= 1; Rout <= 1; Control_Signals <= 5; enable[18] <= 1;
								#40 Grb <= 0; Rout <= 0; Control_Signals <= 0; enable[18] <= 0;
		end
		neg4: begin
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
		in3: begin
								#0;
								#40;
		end
//halt
		in3: begin
								#0; // run=0 //idk what to do here
								#40;
		end