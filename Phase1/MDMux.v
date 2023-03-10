module MDMux(output reg [31:0] out, input wire [31:0] input1, input2, input wire signal);

always@(*)begin
		if (signal == 1)
			out[31:0] <= input2[31:0];
		else 
			out[31:0] <= input1[31:0];
	end
 
endmodule
