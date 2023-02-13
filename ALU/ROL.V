//rotate left (ROL) 
module ROL(
  input wire [31:0] operand, // The 32-bit operand to be rotated
  input wire [4:0] rotate_amount, // The number of bits to rotate
  output reg [31:0] result // The result of the rotation
);

  // Perform the rotation by concatenating two parts of the operand
  always @(*) begin
    // Calculate the first part of the result
    wire [31:0] first_part = operand[rotate_amount - 1:0];
    
    // Calculate the second part of the result
    wire [31:0] second_part = operand[31:rotate_amount];
    
    // Concatenate the two parts to get the final result
    result = {second_part, first_part};
  end

endmodule
