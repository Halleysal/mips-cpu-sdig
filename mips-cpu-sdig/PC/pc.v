module pc(
	input clk, reset,
	output reg [9:0] count
);

	always @ (posedge clk or posedge reset)
	begin
		if (reset)
			count <= 0;
		else
			count <= count + 1;
	end

endmodule
