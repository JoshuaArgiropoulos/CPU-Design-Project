module Datapath (
    input clk,
    input reset,
    input [31:0] inPort,
    output [31:0] outPort
);

    // Registers
    reg [31:0] PC;
    reg [31:0] IR;
    reg [31:0] R[15];
    reg [31:0] Hi;
    reg [31:0] Lo;

    // Wires
    wire [4:0] EncodeOut;
    wire [31:0] BusMuxOut;
    wire [31:0] SignExtended;
    
    // Modules
    Register PC(clk, clr, enable, PC);
    Register IR(clk, clr, enable, IR);
  
    Register R0(clk, clr, enable, R[0]);
    Register R1(clk, clr, enable, R[1]);
    Register R2(clk, clr, enable, R[2]);
    Register R3(clk, clr, enable, R[3]);
    Register R4(clk, clr, enable, R[4]);
    Register R5(clk, clr, enable, R[5]);
    Register R6(clk, clr, enable, R[6]);
    Register R7(clk, clr, enable, R[7]);
    Register R8(clk, clr, enable, R[8]);
    Register R9(clk, clr, enable, R[9]);
  
    Register R10(clk, clr, enable, R[10]);
    Register R11(clk, clr, enable, R[11]);
    Register R12(clk, clr, enable, R[12]);
    Register R13(clk, clr, enable, R[13]);
    Register R14(clk, clr, enable, R[14]);
    Register R5(clk, clr, enable, R[15]);

  
  
  
  
  
    ConnectedBus BusInst(inPort, R[0], R[1], R[2], R[3], R[4], R[5], R[6], R[7], R[8], R[9], R[10], R[11], R[12], R[13], R[14], R[15], Hi, Lo, Hi, Lo, PC, IR, inPort, SignExtended, BusMuxOut, EncodeOut);
    
    MDMux MuxReg(.inputD(RegBus.out), .clr(reset), .clk(clk), .enable(IR[20]), .outputQ(R[IR[15:11]]));
    
    MDR MdrReg(clk, reset, MuxReg.out);
    
   addsub AddSub(clk, reset, MdrReg.out1, MdrReg.out2, IR[5], outPort);
    andOp AndOp(clk, reset, MdrReg.out1, MdrReg.out2, outPort);
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
    neg NegOp(clk, reset, MdrReg.out1, outPort);
    not NotOp(clk, reset, MdrReg.out1, outPort);

endmodule
