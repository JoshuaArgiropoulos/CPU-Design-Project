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
    reg [31:0] R[15:0]; // fix size to 16

    // Additional registers
    reg [31:0] Hi;
    reg [31:0] Lo;

    // Wires
    wire [4:0] EncodeOut;
    wire [31:0] BusMuxOut;
    wire [31:0] SignExtended;
    wire [31:0] ALUResult;
    wire [31:0] MDMuxOutput;

    // Modules
    Register PC_inst(clk, clr, enable, PC);
    Register IR_inst(clk, clr, enable, IR);
    
    Register HI_inst(clk, clr, enable, Z_inst);
    Register LO_inst(clk, clr, enable, Z_inst);
    Register Y_inst(clk, clr, enable, inPort);
    Register Z_inst(clk, clr, enable, ALUout);

    Register R0_inst(clk, clr, enable, R[0]);
    Register R1_inst(clk, clr, enable, R[1]);
    Register R2_inst(clk, clr, enable, R[2]);
    Register R3_inst(clk, clr, enable, R[3]);
    Register R4_inst(clk, clr, enable, R[4]);
    Register R5_inst(clk, clr, enable, R[5]);
    Register R6_inst(clk, clr, enable, R[6]);
    Register R7_inst(clk, clr, enable, R[7]);
    Register R8_inst(clk, clr, enable, R[8]);
    Register R9_inst(clk, clr, enable, R[9]);

    Register R10_inst(clk, clr, enable, R[10]);
    Register R11_inst(clk, clr, enable, R[11]);
    Register R12_inst(clk, clr, enable, R[12]);
    Register R13_inst(clk, clr, enable, R[13]);
    Register R14_inst(clk, clr, enable, R[14]);
    Register R15_inst(clk, clr, enable, R[15]);
    
    // Instantiate ALU module
    ALU ALU_inst(val;ue1, MDMuxOutput, IR[5:0], ALUOut);

    ConnectedBus BusInst(inPort, R[0], R[1], R[2], R[3], R[4], R[5], R[6], R[7], R[8], R[9], R[10], R[11], R[12], R[13], R[14], R[15], Hi, Lo, PC, IR, inPort, SignExtended, BusMuxOut, EncodeOut);

    MDMux MDMux_inst(BusMuxOut, inPort, IR[0], MDMuxOutput);

    MDR MdrReg(MDMuxOutput, clr, clk, enable, MDROut);

    // Connect the output of ALU to a wire
    wire [31:0] ALUOutput;
    assign ALUOutput = ALU_inst.result;

    // Connect the wire to the outPort output
    assign outPort = ALUOutput;

endmodule
