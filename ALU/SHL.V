module SHL(
  input wire [31:0] operand, // The operand to be shifted
  input wire [4:0] shift_amount, // The amount by which to shift the operand
  output reg [31:0] result // The result of the shift operation
);

  // Perform the shift left operation
  always @(*) begin
    // Use the bit-wise shift left operator to shift the operand to the left by shift_amount positions
    result = operand << shift_amount;
  end

endmodule
