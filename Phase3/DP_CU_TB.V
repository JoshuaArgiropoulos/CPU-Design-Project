`timescale 1ns/10ps

module DP_CU_TB;
	reg MD_Read, Gra, Grb, Grc, Rin, Rout, BAout, WriteRAM, ReadRAM,
  
	wire [31:0] enable, busSelect, InPortData,
 
	wire [4:0] Control_Signals
 
 wire [31:0] ir, 
	
 wire CONFFOut, clk, clr, Stop

	datapath DUT(MD_Read, Gra, Grb, Grc, Rin, Rout, BAout, WriteRAM, ReadRAM, enable, busSelect, 
		     InPortData, Control_Signals, ir, CONFFOut, clk, clr, Stop);
  
);

initial
	begin
		clk = 0;
		Reset = 0;
end

always
		#10 clk <= ~clk;

endmodule



