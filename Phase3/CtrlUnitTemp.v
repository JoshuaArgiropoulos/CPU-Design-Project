//code for control unit

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