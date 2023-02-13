module SHRA(
  input wire [31:0] operand, // The operand to be shifted
  input wire [4:0] shift_amount, // The amount by which to shift the operand
  output reg [31:0] result // The result of the shift operation
);

  reg [31:0] temp; // Temporary variable to store the result of the shift operation

  always @(*) begin
    // Check the sign of the operand
    
    if (operand >= 0) begin
      // If the operand is positive, perform a right shift
      
      temp = operand >> shift_amount;
    end else begin
      // If the operand is negative, perform an arithmetic right shift
      // by first incrementing the operand by 2^shift_amount - 1 and then shifting it to the right
      temp = (operand + (1 << shift_amount) - 1) >> shift_amount;
    end
    // Store the result of the shift operation in the output
    result = temp;
  end

endmodule
