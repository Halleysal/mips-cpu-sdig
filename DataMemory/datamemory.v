module datamemory
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=10)
(	
	input clk, we, cs,
	input [(DATA_WIDTH-1):0] dataIn,	
	input [(ADDR_WIDTH-1):0] addr,
	output reg [(DATA_WIDTH-1):0] dataOut
);

	reg [DATA_WIDTH-1:0] memoria[0:(1<<ADDR_WIDTH)-1];

	initial begin
	
		memoria[0] = 32'b0000_0000_0000_0000_0000_0111_1101_0001; // Salva 2001 (A) na posiçaõ F000h
		memoria[1] = 32'b0000_0000_0000_0000_0000_1111_1010_0001; // Salva 4001 (B) na posiçaõ F001h
		memoria[2] = 32'b0000_0000_0000_0000_0001_0011_1000_1001; // Salva 5001 (C) na posiçaõ F002h
		memoria[3] = 32'b0000_0000_0000_0000_0000_1011_1011_1001; // Salva 3001 (D) na posiçaõ F003h
		
	end 

	always @(posedge clk) begin
		if(cs) begin
			if (we) memoria[addr] <= dataIn;
			else dataOut <= memoria[addr];
		end
		else dataOut <= 32'bz;
	end

endmodule


