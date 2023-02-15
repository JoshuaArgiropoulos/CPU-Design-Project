module ADD(
	input wire [31:0] R1,
	input wire [31:0] R2,
	input wire carryIn,
	output wire [31:0] R3,
	output wire carryOut
);
	
	reg tempCout;

	integer i;
	always @* begin
    	for (i = 0; i < 32; i = i + 1) begin
      //The logic for the sum is equal to the (carry XOR (R1 XOR R2)) = R3
      		R3[i] = R1[i] ^ R2[i] ^ carryIn;
      
      //This is the logic for the carry out.
      
      //Carry out is equal to (R1R2) OR (R1CarryIn) OR (R2CarryIn)
      
      		tempCout = (R1[i] & R2[i]) | (R1[i] & carryIn) | (R2[i] & carryIn);
		
     end
    carryOut = tempCout;
  end
endmodule

/*
Errors for code 1

main.v:18: error: R3[i] is not a valid l-value in main.
main.v:8:      : R3[i] is declared here as wire.
main.v:27: error: carryOut is not a valid l-value in main.
main.v:9:      : carryOut is declared here as wire.
2 error(s) during elaboration.
*/

/*input wire [31:0] R1,
    input wire [31:0] R2,
    input wire carryIn,
    output reg [31:0] R3,
    output reg carryOut
);
    
    reg tempCout;

    integer i;
    always @* begin
        for (i = 0; i < 32; i = i + 1) begin
            //The logic for the sum is equal to the (carry XOR (R1 XOR R2)) = R3
            R3[i] = R1[i] ^ R2[i] ^ carryIn;
        
            //This is the logic for the carry out.
            //Carry out is equal to (R1R2) OR (R1CarryIn) OR (R2CarryIn)
            tempCout = (R1[i] & R2[i]) | (R1[i] & carryIn) | (R2[i] & carryIn);
        end
        carryOut = tempCout;
    end
endmodule
*/
