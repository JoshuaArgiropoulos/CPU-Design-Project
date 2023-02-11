`timescale 1ns/10ps
module ConnectedBusTB;

reg clk = 0;
/*

reg enable = 1;
reg clr = 0;
reg  [31:0] D;
wire [31:0] Q;

always #10 clk = !clk;

Register reg_instance(clk, clr, enable, D, Q);*/

reg [31:0]				EncodeIn,
							BusMuxInR0,
							BusMuxInR1,
							BusMuxInR2,
							BusMuxInR3,
							BusMuxInR4,
							BusMuxInR5,
							BusMuxInR6,
							BusMuxInR7,
							BusMuxInR8,
							BusMuxInR9,
							BusMuxInR10,
							BusMuxInR11,
							BusMuxInR12,
							BusMuxInR13,
							BusMuxInR14,
							BusMuxInR15,
							BusMuxInHI,
							BusMuxInLO,
							BusMuxInZHI,
							BusMuxInZLO,
							BusMuxInPc,
							BusMuxInMDR,
							BusMuxInInPort,
							CSignExtended,
							BusMuxOut;
wire [4:0]				EncodeOut;

ConnectedBus cb_inst(EncodeIn,
							BusMuxInR0,
							BusMuxInR1,
							BusMuxInR2,
							BusMuxInR3,
							BusMuxInR4,
							BusMuxInR5,
							BusMuxInR6,
							BusMuxInR7,
							BusMuxInR8,
							BusMuxInR9,
							BusMuxInR10,
							BusMuxInR11,
							BusMuxInR12,
							BusMuxInR13,
							BusMuxInR14,
							BusMuxInR15,
							BusMuxInHI,
							BusMuxInLO,
							BusMuxInZHI,
							BusMuxInZLO,
							BusMuxInPc,
							BusMuxInMDR,
							BusMuxInInPort,
							CSignExtended,
							BusMuxOut,
							EncodeOut);
							// 
							
always #10 clk = !clk;

initial begin
	
	EncodeIn = 1;
	#10
	BusMuxInHI = 1;
	#10
	BusMuxInHI = 0;
	
end

endmodule
