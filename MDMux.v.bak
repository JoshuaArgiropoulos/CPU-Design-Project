module MDMux(input [31:0] BusMuxOut, input [31:0] Mdatain, input Read, output [31:0] MDMuxOutput);
  always @(*) begin
      case (read)
         1'b0 : MDMuxOutput = BusMuxOut;
         1'b1 : MDMuxOutput = Mdatain;
      endcase
   end
endmodule