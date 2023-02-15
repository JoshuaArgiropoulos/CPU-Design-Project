module AND(
	input wire [31:0] R1,
	input wire [31:0] R2,
 	output wire [31:0] R3
);
	
	genvar i;
	generate

	    for (i = 0; i <= 31; i = i + 1) begin : loop
            	assign R3[i] = R1[i] & R2[i];
	    end
    endgenerate
endmodule
