module ADD(
  input wire [31:0] R1,
  input wire [31:0] R2,
	input wire carryIn,
  output wire [31:0] R3,
	output wire carryOut
);
	
	wire tempCout;

	genvar i;
	generate
		for (i = 0; i < 32; i = i + 1) begin : bit_loop
      //The logic for the sum is equal to the (carry XOR (R1 XOR R2)) = R3
      assign R3[i] = R1[i] ^ R2[i] ^ carryIn;
      
      //This is the logic for the carry out.
      
      //Carry out is equal to (R1R2) OR (R1CarryIn) OR (R2CarryIn)
      
      assign tempCout = (R1[i] & R2[i]) | (R1[i] & carryIn) | (R2[i] & carryIn);
      if (i == 31) {
      //If this is the last interation of the loop. The program stores the temp carry to the carry out output.
        assign carryOut = tempCout;
      }
		end
	endgenerate
endmodule
