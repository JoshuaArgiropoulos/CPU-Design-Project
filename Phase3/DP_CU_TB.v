`timescale 1ns/10ps

module DP_CU_TB;
	wire CONFFOut;//MD_Read, Gra, Grb, Grc, Rin, Rout, BAout, WriteRAM, ReadRAM, CONFFOut;
  
	//wire [31:0] enable, busSelect;
 
	//wire [4:0] Control_Signals;
	reg [31:0] InPortData;
	
	reg clk, clr, Stop;
 
    wire [31:0] TrueBusMuxOut, OutputUnit, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, mdr, zhi, zlo, pc, ir, busSel;
	 

	datapath DUT(clk, clr, Stop,InPortData, TrueBusMuxOut, OutputUnit, r0, r1, r2, r3, 
	r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, mdr, zhi, zlo, pc, ir, busSel, CONFFOut);
  


initial begin
		clk = 0;
		//clr = 1;
		//#40
		//clr = 0;
		forever #10 clk = ~clk;
end

initial begin
		clr = 1;
		#40
		clr = 0;
end


always @(posedge clk) begin

end

endmodule


