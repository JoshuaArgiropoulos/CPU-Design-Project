module Datapath (
    input clk,
    input clr,
    input enable,
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
    wire [31:0] ALUResult;
    
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
    Register R15(clk, clr, enable, R[15]);

    // Instantiate ALU module
    ALU alu_inst(R[IR[20:16]], BusMuxOut, IR[5:0], ALUResult);

    ConnectedBus BusInst(inPort, R[0], R[1], R[2], R[3], R[4], R[5], R[6], R[7], R[8], R[9], R[10], R[11], R[12], R[13], R[14], R[15], Hi, Lo, Hi, Lo, PC, IR, inPort, SignExtended, BusMuxOut, EncodeOut);
    
    MDMux MDMux_inst(BusMuxOut, inPort, enable, MDMuxOutput);
    
    MDR MdrReg(MuxReg.outputQ, clr, clk, enable);
    
    // Output the result of ALU to outPort
    assign outPort = ALUResult;

endmodule
