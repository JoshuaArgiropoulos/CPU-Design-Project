module Register64bit(clk, clr, enable, D, Q);

	input [63:0] D;
	input clk, clr, enable;
	reg [63:0] ra;
	
	output [63:0] Q;
	
	always @(posedge clk) begin
		if(clr)
			ra <= 64'b0;
		else if(enable)
			ra <= D;
	end		
	assign Q = ra;
	
endmodule
