`timescale 1ns/10ps
module DP_SPECIAL_TB;

reg clk, clr, MD_Read, Gra, Grb, Grc, Rin, Rout, BAout, WriteRAM, ReadRAM;//, IncPC;
reg [31:0] enable, busSelect, inPort;
reg [4:0] Control_Signals;
wire [31:0] busMuxOut, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, mdr, zhi, zlo, pc, ir;//, hi, lo, temp;
wire CONFFOut;

parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010,
			 T0 = 4'b0011, T1 = 4'b0100, T2 = 4'b0101, T3 = 4'b0110, T4 = 4'b0111, T5 = 4'b1000, T6 = 4'b1001, T7 = 4'b1010;
reg [3:0] Present_state = Default;

	 

datapath DUT(clk, clr, MD_Read, Gra, Grb, Grc, Rin, Rout, BAout, WriteRAM, ReadRAM, enable, busSelect, inPort, Control_Signals, busMuxOut, 
OutputUnit, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, mdr, zhi, zlo, pc, ir, CONFFOut);//, hi, lo, temp); 



initial begin

clk = 0;
forever #10 clk = ~clk;

end

always @(posedge clk) begin
	case(Present_state)
		Default : Present_state = Reg_load1a;
		Reg_load1a :#30 Present_state = Reg_load1b;
		Reg_load1b :#30 Present_state = T0;
		T0 :#30 Present_state = T1;
		T1 :#30 Present_state = T2;
		T2 :#30 Present_state = T3;
	endcase
end

always @(Present_state) begin

	case(Present_state)
	
	
		Default: begin
								busSelect <= 32'b0;
								enable <= 32'b0;
								MD_Read <= 0;
								Control_Signals <= 4'b0;
								inPort <= 32'd0;
								clr <= 0;
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
							 
								#0  enable[20] <= 1; busSelect[22] <= 1;//put initial PC value for correct ram
								//inPort <= 32'd15; //mfhi
								inPort <= 32'd16; //mflo
								#40 enable[20] <= 0; busSelect[22] <= 0; 
								
		end
		Reg_load1b: begin//must comment out for ld1
								#0; inPort <= 32'd5; busSelect[22] <= 1; //preload regs
								enable[16] <= 1;//HI
								enable[17] <= 1;//LO
								#40; busSelect[22] <= 0; 
								enable[16] <= 0;//HI
								//enable[17] <= 0;//LO
		end
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
								#0  busSelect[21] <= 1; enable[24] <= 1; //puts instruction from MRD into the IR
								#40 busSelect[21] <= 0; enable[24] <= 0;
		end
		T3: begin
								#0 Gra <= 1; Rin <= 1;
								busSelect[16] <= 1;
								//busSelect[17] <= 1;
								#40 Gra <= 0; Rin <= 0;
								busSelect[16] <= 0;//HI
								//busSelect[17] <= 0;//LO
		
		end
	endcase
end
endmodule
