`timescale 1ns/10ps 

module control_TB;

reg [31:0] inst;
wire [31:0] ctrl;

control DUT(

.inst(inst),
.ctrl(ctrl)

);

initial begin

	inst = 32'b00000000000000000000000000000000;

	#100 inst = 32'b010011_11111_00000_0000000000000000;
	#100 inst = 32'b010010_00000_00001_00100_01010_110010;
	#100 inst = 32'b010100_00000_00110_1111110000101110;
	#100 inst = 32'b010010_00100_00101_00110_01010_100010;
	
end
	
initial #500 $stop;
	
endmodule
