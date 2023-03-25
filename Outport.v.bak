module Outport(input clr, clk, enable, input [31:0] BusMuxIn, output [31:0] OutputUnit);

	reg [31:0] ra;
	
	always @(posedge clk) begin
		if(clr)
			ra <= 32'b0;
		else if(enable)
			ra <= BusMuxIn;
	end		
	assign OutputUnit = ra;
	
endmodule
