`timescale 1ns/10ps
module DP_AND_TB;

reg [31:0] enable, busSelect, inPort, MDataIn;
reg clk, clr, MD_Read;
reg [3:0] Control_Signals;
wire [31:0] busMuxOut, r1, r2, r3, mdr, zhi, zlo, pc, hi, lo, temp;
//wire [63:0] temp;

parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011, 
			 Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111, 
			 T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100; 
reg [3:0] Present_state = Default;

	 

datapath DUT(enable, busSelect, inPort, MDataIn, clk, clr, MD_Read, IncPC, Control_Signals, busMuxOut, r1, r2, r3, mdr, zhi, zlo, pc, hi, lo, temp); 

initial begin

clk = 0;
forever #10 clk = ~clk;

end

always @(posedge clk) begin
	case(Present_state)
		Default : Present_state = Reg_load1a;
		Reg_load1a :#40 Present_state = Reg_load1b;
		Reg_load1b :#40 Present_state = Reg_load2a;
		Reg_load2a :#40 Present_state = Reg_load2b;
		Reg_load2b :#40 Present_state = Reg_load3a;
		Reg_load3a :#40 Present_state = Reg_load3b;
		Reg_load3b :#40 Present_state = T0;
		T0 :#40 Present_state = T1;
		T1 :#40 Present_state = T2;
		T2 :#40 Present_state = T3;
		T3 :#40 Present_state = T4;
		T4 :#40 Present_state = T5;
	endcase
end

always @(Present_state) begin

	case(Present_state)
	
	
		Default: begin
								busSelect <= 32'b0;
								enable <= 32'b0;
								MD_Read <= 0;
								Control_Signals <= 4'b0;
								MDataIn <= 32'h00000000;
								inPort <= 32'd0;
								clr <= 0;
		end
		Reg_load1a: begin
								MDataIn <= 32'b0101;
								MD_Read = 0; enable[21] = 0;
								#10 MD_Read <= 1; enable[21] <= 1;
								//MDataIn <= 32'b0011;
								#15 MD_Read <= 0; enable[21] <= 0;				
		end
		Reg_load1b: begin
								#10 busSelect[21] <= 1; enable[2] <= 1;
								#15 busSelect[21] <= 0; enable[2] <= 0;
		end
		Reg_load2a: begin
								MDataIn <= 32'b0110;
								#10 MD_Read <= 1; enable[21] <= 1;
								//MDataIn <= 32'b0010;
								#15 MD_Read <= 0; enable[21] <= 0;	
		end
		Reg_load2b: begin
								#10 busSelect[21] <= 1; enable[3] <= 1;
								#15 busSelect[21] <= 0; enable[3] <= 0;
		end
		Reg_load3a: begin
								MDataIn <= 32'b0;
								#10 MD_Read <= 1; enable[21] <= 1;
								//MDataIn <= 32'b0;
								#15 MD_Read <= 0; enable[21] <= 0;	
		end
		Reg_load3b: begin
								#10 busSelect[21] <= 1; enable[1] <= 1;
								#15 busSelect[21] <= 0; enable[1] <= 0;
		end
		T0: begin
								busSelect[20] <= 1;//PC
								enable[25] <= 1;//MAR
								enable[28] <= 1;//incPC bit is bit 28
								enable[24] <= 1;//Zin
								//#40
								busSelect[20] <= 0;
								enable[25] <= 0;//MAR
								enable[28] <= 0;//incPC bit is bit 28
								enable[24] <= 0;//Zin
																
		end
		T1: begin
								busSelect[19] <= 1;
								enable[20] <= 1;
								MD_Read <= 1;
								enable[21] <= 1;
								MDataIn <= 32'h28918000;
								#40 busSelect[19] <= 0;
								busSelect[19] <= 0;
								enable[20] <= 0;
								MD_Read <= 0;
								enable[21] <= 0;
								/*MDataIn <= 32'h28918000;
								#15
								busSelect[19] <= 1;
								enable[20] <= 1;
								MD_Read <= 1;
								enable[21] <= 1;
								#15
								busSelect[19] <= 0;
								enable[20] <= 0;
								MD_Read <= 0;
								enable[21] <= 0;
								enable[28] <= 0;*/
		end
		T2: begin
								//busSelect[21] <= 1;
								//#15 busSelect[21] <= 1; enable[23] <= 1;
								//#15 busSelect[21] <= 0; enable[23] <= 0;
								
								
		end
		T3: begin
								busSelect[2] <= 1; enable[27] <= 1;
								#20 busSelect[2] <= 0; enable[27] <= 0;
		end
		T4: begin
								//#15 busSelect[2] <= 0; 
								//#15 enable[27] <= 0;
								busSelect[3] <=1;
								#20 Control_Signals <= 3;
								enable[24] <= 1; enable[18] <= 1; enable[19] <= 1;
								#20 enable[24] <= 0; enable[18] <= 0; enable[19] <= 0; busSelect[3] <=0; 
		end
		T5: begin
								busSelect[19] <= 1; enable[1] <= 1;
								#40 Control_Signals <= 0; busSelect[19] <= 0;
		end
	endcase
end
endmodule
