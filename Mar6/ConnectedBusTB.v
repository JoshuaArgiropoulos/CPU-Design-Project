`timescale 1ns/10ps
module ConnectedBusTB;


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
							CSignExtended;
							
wire [31:0] BusMuxOut;
							
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
							BusMuxOut);
							
							


initial begin
	//clk = 0;
	EncodeIn <= 1;
	
	BusMuxInR0 <= 32'b00000000001011000011000000000011;
	//forever #10 clk = ~clk;
	
		
end

endmodule
