module MDMux(input [31:0] BusMuxOut, input [31:0] Mdatain, input read, output [31:0] MDMuxOutput);
  reg[31:0] temp;
  always @(*) begin
      case (read)
         1'b0 : temp = BusMuxOut;
         1'b1 : temp = Mdatain;
      endcase
   end
	assign MDMuxOutput = temp;
endmodule
