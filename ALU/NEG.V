//performs the two's complement 
module NEG(
  input wire [31:0] operand, // The 32-bit operand to be negated
  output reg [31:0] result // The result of the opperation
);

  // Perform the negation by inverting all bits and adding 1
  always @(*) begin
    // Invert all bits of the operand
    wire [31:0] inverted = ~operand;
    
    // Add 1 to the inverted operand
    result = inverted + 1;
  end

endmodule
