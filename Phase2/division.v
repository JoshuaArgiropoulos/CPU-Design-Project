module division(dividend, divisor, quotient, remainder);
input [31:0] dividend, divisor;
output [31:0] quotient;
output [31:0] remainder;

  reg signed [31:0] divisor_reg;
  reg signed [31:0] quotient_reg;
  reg signed [32:0] remainder_reg;
  reg neg;
  integer i;

  always @(*) begin
  
    divisor_reg = divisor;
    quotient_reg = dividend;
    remainder_reg = 32'b0;
	 neg = 0;
	 
	 if(divisor_reg < 0 && quotient_reg < 0) begin
	 divisor_reg = -divisor_reg;
	 quotient_reg = -quotient_reg;
	 end
	 else if(divisor_reg < 0 && quotient_reg > 0) begin
	 divisor_reg = -divisor_reg;
	 neg = 1;
	 end
	 else if(divisor_reg > 0 && quotient_reg < 0) begin
	 quotient_reg = -quotient_reg;
	 neg = 1;
	 end
	 
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
		//$display("%b Less than zero, %d", quotient_reg, i);
		//$display("%d rem", remainder_reg, i);
		if(remainder_reg >= 0) begin quotient_reg = quotient_reg + 1;
		//$display("QR %b %d", quotient_reg, i);
		end
  end
  if(remainder_reg < 0) remainder_reg = remainder_reg + divisor_reg;
  if(neg) quotient_reg = -quotient_reg;
  
  end


	assign quotient = quotient_reg;
   assign remainder = remainder_reg;
endmodule
