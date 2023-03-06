module MDR(input [31:0] Mdatain, BusMuxOut, input clr, clk, enable, output [31:0] Q);
   wire[31:0] MDMux_out;
    MDMux mux(MDMux_out, BusMuxOut, Mdatain, read_signal);
    Register mdr_reg(MDRdataout, MDMux_out, clk, clr, enable);
endmodule
