module rotateRight(value, count, result);

input [31:0] value;
input [4:0] count;
output [31:0] result;

reg [31:0] temp;

//assign result = value >> count;
//always @(*) begin
//assign result = {value[count-1:0], value[31:count]};
//end

always @(*) begin
    case(count)
      1: temp = {value[0], value[31:1]};
      2: temp = {value[1:0], value[31:2]};
      3: temp = {value[2:0], value[31:3]};
      4: temp = {value[3:0], value[31:4]};
      5: temp = {value[4:0], value[31:5]};
      6: temp = {value[5:0], value[31:6]};
      7: temp = {value[6:0], value[31:7]};
      8: temp = {value[7:0], value[31:8]};
      9: temp = {value[8:0], value[31:9]};
      10: temp = {value[9:0], value[31:10]};
      11: temp = {value[10:0], value[31:11]};
      12: temp = {value[11:0], value[31:12]};
      13: temp = {value[12:0], value[31:13]};
      14: temp = {value[13:0], value[31:14]};
      15: temp = {value[14:0], value[31:15]};
      16: temp = {value[15:0], value[31:16]};
      17: temp = {value[16:0], value[31:17]};
      18: temp = {value[17:0], value[31:18]};
      19: temp = {value[18:0], value[31:19]};
      20: temp = {value[19:0], value[31:20]};
      21: temp = {value[20:0], value[31:21]};
      22: temp = {value[21:0], value[31:22]};
      23: temp = {value[22:0], value[31:23]};
      24: temp = {value[23:0], value[31:24]};
      25: temp = {value[24:0], value[31:25]};
      26: temp = {value[25:0], value[31:26]};
      27: temp = {value[26:0], value[31:27]};
      28: temp = {value[27:0], value[31:28]};
      29: temp = {value[28:0], value[31:29]};
      30: temp = {value[29:0], value[31:30]};
      31: temp = {value[30:0], value[31]};
      32: temp = value;
      default: temp = 0; // handle invalid count values
		endcase
	end
	assign result = temp;

endmodule
