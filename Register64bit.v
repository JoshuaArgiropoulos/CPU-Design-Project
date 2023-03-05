module Register64bit(clk, clr, enable, D, QH, QL);

	input [63:0] D;
	input clk, clr, enable;
	reg [63:0] ra;
	
	output [31:0] QH, QL;
	
	always @(posedge clk) begin
		if(clr)
			ra <= 64'b0;
		else if(enable)
			ra <= D;
	end		
	assign QH = ra[63:32];
	assign QL = ra[31:0];
	
endmodule
