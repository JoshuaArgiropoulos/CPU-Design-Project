module NOT(
  input wire [31:0] R1,
  output wire [31:0] R2
);
	
	integer i;

	for (i = 0; i <= 31; i = i + 1) begin
    assign R2[i] = !R1[i];
	end
endmodule
