module SHR(
  input wire [31:0] operand, // The operand to be shifted
  input wire [4:0] shift_amount, // The amount by which to shift the operand, 5 bits wide
  output reg [31:0] result // The result of the shift operation
);

  // Perform the shift by dividing the operand by 2 raised to the power of the shift amount
  
  always @(*) begin
    result = operand >> shift_amount;
  end

endmodule
