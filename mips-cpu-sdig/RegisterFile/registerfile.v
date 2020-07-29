module registerfile
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=4)
(
	input clk, rst,
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] addr_a, addr_b, addr_wr,
	output [(DATA_WIDTH-1):0] q_a, q_b
);

	integer i;
	reg [DATA_WIDTH-1:0] memoria[2**ADDR_WIDTH-1:0];
	reg [(ADDR_WIDTH-1):0] read_addrA, read_addrB; 

	initial begin
		for(i = 0; i < 15; i = i + 1)
			memoria[i] = 0;
		//Iniciando um valor auxiliar na memória para, somado com o offset,
		// selecionar os endereços da memória de dados de F000 a F3E7	
		memoria[15] = 32'h73E8;	
	end
	
	always @ (posedge clk or posedge rst) begin
		if(rst) begin
			for(i = 0; i < 16; i = i  + 1)
				memoria[i] = 0;
				
			memoria[15] = 32'h73E8;	
		end
		else begin
			memoria[addr_wr] <= data;
			read_addrA = addr_a;	
			read_addrB = addr_b;	
		end			
	end
	
	assign q_a = memoria[read_addrA];
	assign q_b = memoria[read_addrB];
		
endmodule


