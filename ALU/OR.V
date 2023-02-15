`timescale 1ns / 1ps

module OR(
  input wire [31:0] R1,
  input wire [31:0] R2,
  output wire [31:0] R3
);

  wire [31:0] Ra;

  generate
    genvar i;
    for (i = 0; i <= 31; i = i + 1) begin
      assign Ra[i] = R1[i] | R2[i];
    end
  endgenerate

  assign R3 = Ra;

endmodule

