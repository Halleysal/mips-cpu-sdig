module mux(
	input [31:0] a, b,
	input s,
	output [31:0] out
);

	assign out = (s) ? a : b;	
 
endmodule

