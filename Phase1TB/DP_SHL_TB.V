`timescale 1ns/10ps
module DP_SHRA_TB;

reg [31:0] enable, busSelect, inPort, MDataIn;
reg clk, clr, MR_Read;
  reg [3:0] Control_Signals;
wire [31:0] busMuxOut;

parameter Default = 4'b0000, Reg_loadla = 4'b0001, Reg_loadlb = 4'b0010, Reg_load2a = 4'b0011, 
             Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, TO = 4'b0111, 
             Tl = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100; 
reg [3:0] Present_state = Default;

     

Datapath DUT(enable, busSelect, inPort, MDataIn, clk, clr, MD_Read, Control_Signals, busMuxOut); 

initial begin

Clock = 0;
            forever #10 Clock = ~ Clock;
        end

    always @(posedge Clock) // finite state machine; if clock rising-edge
        begin
            case (Present_state)
                Default : Present_state = Reg_load1a;
                Reg_load1a : Present_state = Reg_load1b;
                Reg_load1b : Present_state = Reg_load2a;
                Reg_load2a : Present_state = Reg_load2b;
                Reg_load2b : Present_state = Reg_load3a;
                Reg_load3a : Present_state = Reg_load3b;
                Reg_load3b : Present_state = T0;
                T0 : Present_state = T1;
                T1 : Present_state = T2;
                T2 : Present_state = T3;
                T3 : Present_state = T4;
                T4 : Present_state = T5;
            endcase
        end

    always @(Present_state) // do the required job in each state
        begin
            case (Present_state) // assert the required signals in each clock cycle
                Default: begin
                    
                  enable <= 32'h00000000;
                  budSelect <= 32'h00000000;
                  inPort <= 32'h00000000;
                  MDataIn<= 32'h00000000;
                  clr <= 0; 
                  MR_Read <= 0;
                  Control_Signal <= 4'b0000;
                  
                  busMuxOut <= 32'h00000000;
                  
                end
Reg_load1a: begin 
                    Mdatain <= 32'h00000001; // 0001
                    Read = 0; MDR_enable = 0;
                    #10 Read <= 1; MDR_enable <= 1;
                    #10 Read <= 0; MDR_enable <= 0;
                end
                Reg_load1b: begin 
                    #10 MDR_out <= 1; R3_enable <= 1;
                    #10 MDR_out <= 0; R3_enable <= 0; // initialize R3 with the value 1
                end
                Reg_load2a: begin
                    Mdatain <= 32'h00000002; // 0010
                    #10 Read <= 1; MDR_enable <= 1;
                    #10 Read <= 0; MDR_enable <= 0;
                end
                Reg_load2b: begin 
                    #10 MDR_out <= 1; R5_enable <= 1;
                    #10 MDR_out <= 0; R5_enable <= 0; // initialize R5 with the value 2
                end
                Reg_load3a: begin
                    Mdatain <= 32'h00000003; // 0011
                    #10 Read <= 1; MDR_enable <= 1;
                    #10 Read <= 0; MDR_enable <= 0;
                end
                Reg_load3b: begin 
                    #10 MDR_out <= 1; R1_enable <= 1;
                    #10 MDR_out <= 0; R1_enable <= 0; // initialize R0 with the value 3
                end 
                T0: begin
                    #10 PC_out <= 1; MAR_enable <= 1; IncPC <= 1; PC_enable <= 1;  //DOUBLE CHECK PC reg
					#10 PC_out <= 0; MAR_enable <= 0;
                end
                T1: begin
                    PC_out <= 0;
                    MDR_enable <= 1;
                    Read <= 1;
                    Mdatain <= 32'h489A8000; // opcode for shl R1, R3, R5
                end
                T2: begin
                    #10 MDR_out <= 1; IR_enable= 1; 
                    #10 MDR_out <= 0;
                end
                T3: begin
					#10 R3_out <= 1; Y_enable <= 1;
                    #10 R3_out <= 0; Y_enable <= 0;
                end
                T4: begin
                    #10 R5_out <= 1; 
                    opcode <= 5'b01001; // shl R3 by Y(R5) then store in Z
                    Z_enable <= 1; 
                    #10 R5_out <= 0;
                end
                T5: begin
				    Z_enable <= 0;
                    ZLow_out <= 1; 
                    #10 R1_enable <= 1;
					#10 ZLow_out <= 0; 
                    R1_enable <= 0;
                end
            endcase
        end
endmodule
