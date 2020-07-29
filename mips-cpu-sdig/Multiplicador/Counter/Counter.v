module Counter (Load, Clk, K);
input Load, Clk;
output reg K;

reg[5:0] rCount;

	always @ (posedge Clk)
	begin
		if (Load)	
			begin
				rCount <= 5'b00000;
				K <= 0;
			end
		else
			begin
				rCount <= rCount + 1'b1;
			end
		if (rCount == 21)
			begin
				K <= 1;
				rCount <= 5'b00000;
			end
	end

endmodule
