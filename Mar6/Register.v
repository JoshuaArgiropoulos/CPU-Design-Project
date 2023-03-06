module Register(clk, clr, enable, D, Q);

	input [31:0] D;
	input clk, clr, enable;
	reg [31:0] ra;
	
	output [31:0] Q;
	
	always @(posedge clk) begin
		if(clr)
			ra <= 32'b0;
		else if(enable)
			ra <= D;
	end		
	assign Q = ra;
	
endmodule
