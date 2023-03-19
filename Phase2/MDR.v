module MDR(input [31:0] Mdatain, BusMuxOut, 
			  input clr, clk, enable, read_signal, 
			  output [31:0] MDRdataout);
   wire[31:0] MDMux_out;
    MDMux mux(MDMux_out, BusMuxOut, Mdatain, read_signal);
    Register mdr_reg(clk, clr, enable, MDMux_out, MDRdataout);
endmodule
