`timescale 1ns/10ps
module DP_LD2_TB;

reg clk, clr, MD_Read, Gra, Grb, Grc, Rin, Rout, BAout, WriteRAM, ReadRAM;//, IncPC;
reg [31:0] enable, busSelect, inPort;
reg [4:0] Control_Signals;
wire [31:0] busMuxOut, r1, r2, r0, mdr, zhi, zlo, pc, ir;//, hi, lo, temp;
//wire [63:0] temp;

parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, /*Reg_load2a = 4'b0011, 
			 Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111, 
			 T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100, T6 = 4'b1101, T7 = 4'b1110;*/
			 T0 = 4'b0011, T1 = 4'b0100, T2 = 4'b0101, T3 = 4'b0110, T4 = 4'b0111, T5 = 4'b1000, T6 = 4'b1001, T7 = 4'b1010;
reg [3:0] Present_state = Default;

	 

datapath DUT(clk, clr, MD_Read, Gra, Grb, Grc, Rin, Rout, BAout, WriteRAM, ReadRAM, enable, busSelect, inPort, Control_Signals, busMuxOut, OutputUnit, r1, r2, r0, mdr, zhi, zlo, pc, ir, CONFFOut);//, hi, lo, temp); 



initial begin

clk = 0;
forever #10 clk = ~clk;

end

always @(posedge clk) begin
	case(Present_state)
		Default : Present_state = Reg_load1a;
		Reg_load1a :#30 Present_state = Reg_load1b;
		Reg_load1b :#30 Present_state = T0;
		//Reg_load1b :#30 Present_state = Reg_load2a;
		//Reg_load2a :#30 Present_state = Reg_load2b;
		//Reg_load2b :#30 Present_state = Reg_load3a;
		//Reg_load3a :#30 Present_state = Reg_load3b;
		//Reg_load3b :#30 Present_state = T0;
		T0 :#30 Present_state = T1;
		T1 :#30 Present_state = T2;
		T2 :#30 Present_state = T3;
		T3 :#30 Present_state = T4;
		T4 :#30 Present_state = T5;
		T5 :#30 Present_state = T6;
		T6 :#30 Present_state = T7;
	endcase
end

always @(Present_state) begin

	case(Present_state)
	
	
		Default: begin
								busSelect <= 32'b0;
								enable <= 32'b0;
								MD_Read <= 0;
								Control_Signals <= 4'b0;
								//MDataIn <= 32'h00000000;
								inPort <= 32'd0;
								clr <= 0;
								//enable[27] <= 0;
								Gra <= 0; 
								Grb <= 0;
								Grc <= 0;
								Rin <= 0;
								Rout <= 0;
								BAout <= 0;
								ReadRAM <= 0;
								WriteRAM <= 0;
								enable[20] <= 1;
								
		end
		Reg_load1a: begin
							 
								#0  enable[20] <= 1; inPort <= 32'd1; busSelect[22] <= 1;//put initial PC value for correct ram
								#40 enable[20] <= 0; busSelect[22] <= 1; 
								
		end
		Reg_load1b: begin
								#0 inPort <= 32'h5; busSelect[22] <= 1; enable[2] <= 1;//preload regs
								#40 busSelect[22] <= 0; enable[2] <= 0;
		end
		/*Reg_load2a: begin
								#0;
								#40;
		end
		Reg_load2b: begin
								#0;
								#40;
		end
		Reg_load3a: begin
								
								#0;
								#40;
		end
		Reg_load3b: begin
								#0;
								#40;
		end*/
		T0: begin
								#0 busSelect[20] <= 1;//PC
								enable[25] <= 1;//MAR
								Control_Signals <= 14; //IncPc
								enable[18] <= 1;//Zin
								#40 busSelect[20] <= 0;//PC
								enable[25] <= 0;//MAR
								Control_Signals <= 0;//IncPc
								enable[18] <= 0;//Zin
																
		end
		T1: begin
								#0 busSelect[19] <= 1;//zLowOut
								enable[20] <= 1;//pcIn
								enable[21] <= 1;//MDRin
								MD_Read <= 1;//read								
								ReadRAM <= 1;//allow reacding from ram
								#40 busSelect[19] <= 0;
								enable[20] <= 0;
								enable[21] <= 0; 
								MD_Read <= 0;
								ReadRAM <= 0;
		end
		T2: begin
								#0  busSelect[21] <= 1; enable[24] <= 1;//puts instruction from MRD into the IR
								#40 busSelect[21] <= 0; enable[24] <= 0;

		end
		T3: begin
								#0 Grb <= 1; BAout <= 1; Rout <= 1; enable[19] <= 1;//Puts preloaded reg into Yreg
								#40 Grb <= 0; BAout <= 0; Rout <= 0; enable[19] <= 0;
		end
		T4: begin
								#0 busSelect[23] <=1; Control_Signals <= 1; enable[18] <= 1;//adds preload reg with immidiate value, stores in Zlow
								#40 busSelect[23] <=0; Control_Signals <= 0; enable[18] <= 0;
		end
		T5: begin
								#0 busSelect[19] <= 1; enable[25] <= 1;//put Zlow into MAR
								#40 busSelect[19] <= 0; enable[25] <= 0;
		end
		T6: begin

								#0 MD_Read <= 1; ReadRAM <= 1; enable[21] <= 1;//reads data from addr location and puts into MRD
								#40  MD_Read <= 0; ReadRAM <= 0; enable[21] <= 0;
		end
		T7: begin

								#0 busSelect[21] <= 1; Gra <= 1; Rin <= 1;//enables destination reg and imputs desired value
								#40 busSelect[21] <= 0; Gra <= 0; Rin <= 0;
		end
	endcase
end
endmodule
