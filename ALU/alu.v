module alu(
	input [31:0] a, b,
	input [1:0] s,
	output [31:0] out  
	);

	reg [31:0] result;
	assign out = result;
	
	always @(a or b or s) begin
		case(s)
			2'b00: result <= a + b;
			2'b01: result <= a - b;
			2'b10: result <= a & b;
			2'b11: result <= a | b;
		endcase
	end

endmodule

