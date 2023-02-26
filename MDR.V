module MDR(input [31:0] inputD, input clr, input clk, input enable, output [31:0] outputQ);
   always @(posedge clk) begin
      if (clr == 1) begin
         outputQ <= 0;
       else if (enable == 1) 
         outputQ <= inputD;
      end
   end
endmodule
