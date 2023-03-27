`timescale 1ns/10ps
module CU_TB;
wire MD_Read, Gra, Grb, Grc, Rin, Rout, BAout, WriteRAM, ReadRAM, run;

    wire [31:0] enable, busSelect;
 
    wire [4:0] Control_Signals;
 
 
    //input [31:0] TrueBusMuxOut, OutputUnit,
    //^ might be wrong
 
    reg [31:0] ir, InPortData;

    reg CONFFOut, clk, Reset, Stop;



ControlUnit ctrl(MD_Read, Gra, Grb, Grc, Rin, Rout, BAout, WriteRAM, ReadRAM, run, enable, 
busSelect, Control_Signals, ir, InPortData, CONFFOut, clk, Reset, Stop);


initial begin
		clk = 0;
		
		forever #10 clk = ~clk;
end

/*initial begin
		Reset = 1;
		#40
		Reset = 0;
end*/


always @(posedge clk) begin

 ir<= 08800002;
 
end

endmodule

