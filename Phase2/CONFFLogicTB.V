module CONFFLogicTB();

  // Inputs
  reg enable, reg [31:0] IRIn, reg [31:0] BusMuxIn, reg clk;

  // Outputs 
  wire [31:0] ControlUnitOut
 
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
    IRIn <=32'b10100101000011110000000011111111;
    BusMuxIn <= 32'b11111111111100001111000011110101;
    #100
    enable <=1;
  end
  
endmodule
