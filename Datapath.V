module Datapath (
    input clk,
    input clr,
    input [31:0] enable,
    input [31:0] inPort,
    output [31:0] outPort
);
//LOOK TO FIX
    // Registers
    //reg [31:0] PC;
    //reg [31:0] IR;
    reg [31:0] R[15:0]; // fix size to 16

    // Additional registers
   // reg [31:0] Hi;
   // reg [31:0] Lo;

    // Wires
    wire [4:0] EncodeOut;
    wire [31:0] BusMuxOut;
    wire [31:0] SignExtended;
    wire [31:0] ALUResult;
    wire [31:0] MDMuxOutput;

    // Modules
    //LOOK TO FIX
    Register PC_inst(clk, clr, enable, PC, PC_Out);
    Register IR_inst(clk, clr, enable, IR, IR_Out);
    
    Register64bit Z_inst(clk, clr, enable, ALUout);
    
    Register HI_inst(clk, clr, enable, Z_inst[63:32]);
    Register LO_inst(clk, clr, enable, Z_inst[31:0]);
    Register Y_inst(clk, clr, enable, inPort[31:0]);
    Register MAR(clk, clr, enable, inPort);
   

    Register R0_inst(clk, clr, enable[0], R[0],R0_Out);
    Register R1_inst(clk, clr, enable[1], R[1],R1_Out);
    Register R2_inst(clk, clr, enable[2], R[2],R2_Out);
    Register R3_inst(clk, clr, enable[3], R[3],R3_Out);
    Register R4_inst(clk, clr, enable[4], R[4],R4_Out);
    Register R5_inst(clk, clr, enable[5], R[5],R5_Out);
    Register R6_inst(clk, clr, enable[6], R[6],R6_Out);
    Register R7_inst(clk, clr, enable[7], R[7],R7_Out);
    Register R8_inst(clk, clr, enable[8], R[8],R8_Out);
    Register R9_inst(clk, clr, enable[9], R[9],R9_Out);

    Register R10_inst(clk, clr, enable[10], R[10],R10_Out);
    Register R11_inst(clk, clr, enable[11], R[11],R11_Out);
    Register R12_inst(clk, clr, enable[12], R[12],R12_Out);
    Register R13_inst(clk, clr, enable[13], R[13],R13_Out);
    Register R14_inst(clk, clr, enable[14], R[14],R14_Out);
    Register R15_inst(clk, clr, enable[15], R[15],R15_Out);
    
    // Instantiate ALU module
    //LOOK TO FIX
    ALU ALU_inst(Y_inst, inPort, IR[5:0], ALUOut);

    ConnectedBus BusInst(inPort, R0_Out, R1_Out, R2_Out, R3_Out,R4_Out, R5_Out, R6_Out, R7_Out, R8_Out, R9_Out, R10_Out, R11_Out, R12_Out, R13_Out, R14_Out, R15_Out, Hi, Lo, PC, IR, inPort, SignExtended, BusMuxOut, EncodeOut);
//LOOK TO FIX
    MDMux MDMux_inst(BusMuxOut, inPort, IR[0], MDMuxOutput);

    MDR MdrReg(MDMuxOutput, clr, clk, enable, MDROut);

    
//LOOK TO FIX
    // Connect the output of ALU to a wire
    wire [31:0] ALUOutput;
    assign ALUOutput = ALU_inst.result;

    // Connect the wire to the outPort output
    assign outPort = ALUOutput;

endmodule
