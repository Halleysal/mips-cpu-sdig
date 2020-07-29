module extend(
	input [15:0] in,
	output reg [31:0] out
);

	always @* begin
		if (in[15]) begin
			out = {16'b1111111111111111, in};
		end
		else begin
			out = {16'h0000, in};
		end
	end
	
endmodule
