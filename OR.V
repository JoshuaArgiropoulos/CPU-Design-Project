module OR(
  input wire [31:0] R1,
  input wire [31:0] R2,
  output wire [31:0] R3
);
	
	integer i;
	
	for (i = 0; i <= 31; i = i + 1) begin
    assign R3[i] = R1[i] | R2[i];
	end
endmodule
