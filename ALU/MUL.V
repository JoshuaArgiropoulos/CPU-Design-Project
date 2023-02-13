module MUL(
  input wire [31:0] R1, // First operand
  input wire [31:0] R2, // Second operand
  output wire [63:0] R3 // Result of the multiplication, 64 bits wide
);

  // Loop over each bit of the second operand
  genvar i;
  generate
    for (i = 0; i < 32; i = i + 1) begin : bit_loop

      // If the current bit of the second operand is 1
      
      // R3 will be assigned the value of the first operand shifted to the left by i bits
      
      // Otherwise, R3 will be assigned the value of 64'b0 (all zeros)
      
      if (R2[i]) begin
        R3[i + 31:i] = R1 << i;
      end else begin
        R3[i + 31:i] = 64'b0;
      end
    end
  endgenerate
endmodule
