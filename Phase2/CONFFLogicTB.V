`timescale 1ns/10ps
module CONFFLogicTB();

  // Inputs
  reg enable;
  reg [31:0] IRIn;
  reg [31:0] BusMuxIn;
  reg clk;

  // Outputs 
  wire [31:0] ControlUnitOut;
 
  CONFFLogic  CONFFLogic_test(
    .enable(enable),
    .IRIn(IRIn),
    .BusMuxIn(BusMuxIn),
    .ControlUnitOut(ControlUnitOut)
  );

  // Clock generation
  always #10 clk = ~clk;

  initial begin
    clk <= 0;
    enable <= 0;
    
	 //test case 1--- Bit 0 is high and BusNor is high 
	 #100
	 IRIn <=32'b0000_0000_0000_0000_000__00__000_0000_0000;
	 BusMuxIn <= 32'b0000_0000_0000_0000_0000_0000_0000_0000;
	 enable <=1;
	 #20
	 enable <= 0;
	 //Test case 2--- Bit 1 is High and BusNor low
	 #100
	 IRIn <=32'b_0000_0000_000__01__000_0000_0000_0000_0000;
	 BusMuxIn <= 32'b1000_0000_0000_0000_0000_0000_0000_0000;
	 enable <=1;
	 #20
	 enable <= 0;
	 //Test case 3--- 32 bit is Low and Bit 2 is high
	 #100
	IRIn <=32'b_0000_0000_000__10__000_0000_0000_0000_0000;
	 BusMuxIn <= 32'b0000_0000_0000_0000_0000_0000_0000_0001;
	 enable <=1;
	 #20
	 enable <= 0;
	 //Test case 4---- 32 bit is high and Bit 3 is high
	 #100
	 IRIn <=32'b_0000_0000_000_11_000_0000_0000_0000_0000;
	 BusMuxIn <= 32'b1000_0000_0000_0000_0000_0000_0000_0000;
	 enable <=1;
	 #20
	 enable <= 0;
	 //test case 5---- dont branch----- 31 is high and bit 3 is low 
	 #100
	 IRIn <=32'b_0000_0000_000__00__000_0000_0000_0000_0000;
	 BusMuxIn <= 32'b0000_0000_0000_0000_0000_0000_0000_0001;
	 enable <=1;
	 #20
	 enable <= 0;
	 
  end
  
endmodule
