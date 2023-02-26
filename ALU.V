module ALU(
	output reg [63:0] Rc,
	input wire [31:0] Ra,
	input wire [31:0] Rb,
	input wire [4:0] opcode
);
  
  

  addsub AddSub(sign, Ra, Rb);
  andOp AndOp(Ra, Rb);
  add AddOp(clk, reset, MdrReg.out1, MdrReg.out2, outPort);
     
  sub SubOp(clk, reset, MdrReg.out1, MdrReg.out2, outPort);
    
  mul MulOp(clk, reset, MdrReg.out1, MdrReg.out2, Hi, Lo);
    
  div DivOp(clk, reset, MdrReg.out1, MdrReg.out2, Hi, Lo);
    
  and AndOp(clk, reset, MdrReg.out1, MdrReg.out2, outPort);
    
  or OrOp(clk, reset, MdrReg.out1, MdrReg.out2, outPort);
    
  shr ShrOp(clk, reset, MdrReg.out1, IR[10:6], outPort);
    
  shra ShraOp(clk, reset, MdrReg.out1, IR[10:6], outPort);
    
  shl ShlOp(clk, reset, MdrReg.out1, IR[10:6], outPort);
   
  ror RorOp(clk, reset, MdrReg.out1, IR[10:6], outPort);
    
  rol RolOp(clk, reset, MdrReg.out1, IR[10:6], outPort);
   
  neg NegOp(Ra);
    
  not NotOp(clk, reset, MdrReg.out1, outPort);
