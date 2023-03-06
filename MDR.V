module MDR(input [31:0] inputD, input clr, input clk, input enable, output [31:0] outputQ);
   reg[31:0] tmp;
	always @(posedge clk) begin
      if (clr == 1) tmp <= 0;
       else if (enable == 1)  tmp <= inputD;
      
   end
	assign outputQ = tmp;
endmodule
