module division(dividend, divisor, quotient, remainder);
input [31:0] dividend, divisor;
output [31:0] quotient;
output [31:0] remainder;

  reg signed [31:0] divisor_reg;
  reg signed [31:0] quotient_reg;
  reg signed [32:0] remainder_reg;
  integer i;

  always @(*) begin
  
    divisor_reg = divisor;
    quotient_reg = dividend;
    remainder_reg = 0;
    // Perform division
    for (i = 31; i >= 0; i = i - 1) begin
	 
		if(quotient_reg < 0) begin
		quotient_reg = quotient_reg << 1;
		remainder_reg = remainder_reg << 1;
		remainder_reg = remainder_reg + 1;
		end
		else begin
		quotient_reg = quotient_reg << 1;
		remainder_reg = remainder_reg << 1;
		end
		
		if(remainder_reg >= 0) remainder_reg = remainder_reg - divisor_reg;
		else remainder_reg = remainder_reg + divisor_reg;
		
		if(remainder_reg >= 0) quotient_reg = quotient_reg + 1;
  end
  if(remainder_reg < 0) remainder_reg = remainder_reg + divisor_reg;
  end
	assign quotient = quotient_reg;
   assign remainder = remainder_reg;
endmodule
