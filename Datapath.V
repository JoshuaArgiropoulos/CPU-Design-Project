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

    // Register module instantiation for R0 to R15
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : REG_INST
            Register reg_inst(clk, clr, enable, R[i]);
        end
    endgenerate

    // Instantiate ALU module
    ALU ALU_inst(R[IR[25:21]], MDMuxOutput, IR[5:0]);

    ConnectedBus BusInst(inPort, R[0], R[1], R[2], R[3], R[4], R[5], R[6], R[7], R[8], R[9], R[10], R[11], R[12], R[13], R[14], R[15], Hi, Lo, PC, IR, inPort, SignExtended, BusMuxOut, EncodeOut);

    MDMux MDMux_inst(BusMuxOut, inPort, IR[0], MDMuxOutput);

    MDR MdrReg(MDMuxOutput, clr, clk, enable);

    // Connect the output of ALU to a wire
    wire [31:0] ALUOutput;
    assign ALUOutput = ALU_inst.result;

    // Connect the wire to the outPort output
    assign outPort = ALUOutput;

endmodule
