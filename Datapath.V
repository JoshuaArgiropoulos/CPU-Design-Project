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
    
    // Modules
    Register PC(clk, reset, PC);
    Register IR(clk, reset, IR);
  
    Register R0(clk, reset, R[0]);
    Register R1(clk, reset, R[1]);
    Register R2(clk, reset, R[2]);
    Register R3(clk, reset, R[3]);
    Register R4(clk, reset, R[4]);
    Register R5(clk, reset, R[5]);
    Register R6(clk, reset, R[6]);
    Register R7(clk, reset, R[7]);
    Register R8(clk, reset, R[8]);
    Register R9(clk, reset, R[9]);
  
    Register R10(clk, reset, R[10]);
    Register R11(clk, reset, R[11]);
    Register R12(clk, reset, R[12]);
    Register R13(clk, reset, R[13]);
    Register R14(clk, reset, R[14]);
    Register R5(clk, reset, R[15]);

  
  
  
  
  
    ConnectedBus RegBus(clk, reset, R, 16);
    MDMux MuxReg(clk, reset, RegBus.out, IR[20:16], IR[15:11]);
    MDR MdrReg(clk, reset, MuxReg.out);
    addsub AddSub(clk, reset, MdrReg.out1, MdrReg.out2, IR[5], outPort);
    andOp And(clk, reset, MdrReg.out1, MdrReg.out2, outPort);
    add Add(clk, reset, MdrReg.out1, MdrReg.out2, outPort);
    sub Sub(clk, reset, MdrReg.out1, MdrReg.out2, outPort);
    mul Mul(clk, reset, MdrReg.out1, MdrReg.out2, Hi, Lo);
    div Div(clk, reset, MdrReg.out1, MdrReg.out2, Hi, Lo);
    and And(clk, reset, MdrReg.out1, MdrReg.out2, outPort);
    or Or(clk, reset, MdrReg.out1, MdrReg.out2, outPort);
    shr Shr(clk, reset, MdrReg.out1, IR[10:6], outPort);
    shra Shra(clk, reset, MdrReg.out1, IR[10:6], outPort);
    shl Shl(clk, reset, MdrReg.out1, IR[10:6], outPort);
    ror Ror(clk, reset, MdrReg.out1, IR[10:6], outPort);
    rol Rol(clk, reset, MdrReg.out1, IR[10:6], outPort);
    neg Neg(clk, reset, MdrReg.out1, outPort);
    not Not(clk, reset, MdrReg.out1, outPort);

endmodule
