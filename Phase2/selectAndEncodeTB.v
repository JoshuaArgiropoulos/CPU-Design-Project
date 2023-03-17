`timescale 1ns/10ps
module selectAndEncodeTB;

	reg Gra, Grb, Grc, Rin, Rout, BAout;
	reg [31:0] IRout;
	wire [15:0] regsIn, regsOut;
	wire [31:0] CSE;
	
	selectAndEncode SAE(Gra, Grb, Grc, Rin, Rout, BAout, IRout, regsIn, regsOut, CSE);

	initial begin
		
		Gra <= 1;
		Grb <= 0;
		Grc <= 0;
		Rin <= 1;
		Rout <= 1;
		BAout <= 1;
		IRout <= 32'b00000000100000101010000010000000; //Op-Code Ra, Rb, Rc, C b00000 0001 0000 0000 000000010000000
	
	end
endmodule
