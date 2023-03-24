`timescale 1ns/10ps
 module control_unit (
 output reg clk, clr, MD_Read, Gra, Grb, Grc, Rin, Rout, BAout, WriteRAM, ReadRAM,
  
 output [31:0] enable, busSelect, InPortData,
 output [4:0] Control_Signals
 
  input [31:0] TrueBusMuxOut, OutputUnit, 
  input wire [31:0] ir, 
	 input wire CONFFOut, clk, externalReset, externalStop
  
parameter reset_state = 4’b0000, fetch0 = 4’b0001, fetch1 = 4’b0010, fetch2 = 4’b0011,
 add3 = 4’b0100, add4 = 4’b0101, add5 = 4’b0110, …;
 reg [3:0] present_state = reset_state; // adjust the bit pattern based on the number of states

  always @(posedge Clock, posedge Reset) // finite state machine; if clock or reset rising-edge
 begin
 if (Reset == 1’b1) present_state = reset_state;
 else case (present_state)
reset_state : present_state = fetch0;
fetch0 : present_state = fetch1;
fetch1 : present_state = fetch2;
fetch2 : begin
 case (IR[31:27]) // inst. decoding based on the opcode to set the next state
5’b00011 : present_state = add3; // this is the add instruction
 ⁞
 endcase
end
add3 : present_state = add4;
add4 : present_state = add5;
⁞
 endcase
 end
always @(present_state) // do the job for each state
begin
 case (present_state) // assert the required signals in each state
reset_state: begin
Gra <= 0; Grb <= 0; Grc <= 0; Yin <= 0; // initialize the signals
 ⁞
end
fetch0: begin
PCout <= 1; // see if you need to de-assert these signals
MARin <= 1;
IncPC <= 1;
Zin <= 0;
end
 add3: begin
 Grb <= 1; Rout <= 1;
Yin <= 0;
end
⁞
 endcase
end
endmodule 
