module DIV(
  input wire [31:0] dividend, // The dividend
  input wire [31:0] divisor,  // The divisor
  output reg [31:0] quotient, // The result of the division
  output reg [31:0] remainder  // The remainder of the division
);

  reg [31:0] temp_dividend; // A temporary variable to store the dividend

  // Perform the division by subtracting the divisor from the temp_dividend
  // repeatedly until temp_dividend is less than the divisor
  always @(*) begin
    temp_dividend = dividend;
    quotient = 0;
    while (temp_dividend >= divisor) begin
      temp_dividend = temp_dividend - divisor;
      quotient = quotient + 1;
    end
    remainder = temp_dividend;
  end

endmodule
