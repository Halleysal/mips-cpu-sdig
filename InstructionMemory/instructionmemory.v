module instructionmemory
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=10)
(	
	input clk,	
	input [(ADDR_WIDTH-1):0] addr,
	output reg [(DATA_WIDTH-1):0] q
);

	reg [DATA_WIDTH-1:0] memoria[2**ADDR_WIDTH-1:0];

	initial begin
		// Grupo 18, estamos considerando o valor maximo e começando de F000 a F3E7
		
		//Ocorrendo o Pipeline Hazard
		memoria[0] = 32'b010011_01111_00000_0111110000011000; //lw A da posição F000 da RAM para a 0 do RF
		memoria[1] = 32'b010011_01111_00001_0111110000011001; //lw B da posição 0001 da RAM para a 1 do RF
		memoria[2] = 32'b010011_01111_00010_0111110000011010; //lw C da posição 0002 da RAM para a 2 do RF
		memoria[3] = 32'b010011_01111_00011_0111110000011011; //lw D da posição 0003 da RAM para a 3 do RF
		
		memoria[4] = 32'b010010_00000_00001_00100_01010_110010;  //MUL A(RF[0])*B(RF[1]) e salva no RF[4]
		memoria[5] = 32'b010010_00010_00011_00101_01010_100000;	//ADD C(RF[2])+D(RF[3])	e salva no RF[5]	
		memoria[6] = 32'b010010_00100_00101_00110_01010_100010;	//SUB RF[4]-RF[5] e salva no RF[6]
		
		memoria[7] = 32'b010100_00000_00110_0111111111111111;	//sw RF[6] na RAM[F3E7]
		
		//Com Bolhas
		memoria[8]  = 32'b010011_01111_00000_0111110000011000; //lw A da posição F000 da RAM para a 0 do RF
		memoria[9]  = 32'b010011_01111_00001_0111110000011001; //lw B da posição F001 da RAM para a 1 do RF
		memoria[10] = 32'b010011_01111_00010_0111110000011010; //lw C da posição F002 da RAM para a 2 do RF
		memoria[11] = 32'b010011_01111_00011_0111110000011011; //lw D da posição F003 da RAM para a 3 do RF
		
		memoria[12] = 32'b010010_00000_00001_00100_01010_110010;  //MUL A(RF[0])*B(RF[1]) e salva no RF[4]
		
		memoria[13] = 32'b010011_01111_00000_0111110000011000; //Bolha

		memoria[14] = 32'b010010_00010_00011_00101_01010_100000;	//ADD C(RF[2])+D(RF[3])	e salva no RF[5]	
		
		memoria[15] = 32'b010011_01111_00000_0111110000011000; //Bolha
		memoria[16] = 32'b010011_01111_00000_0111110000011000; //Bolha

		memoria[17] = 32'b010010_00100_00101_00110_01010_100010;	//SUB RF[4]-RF[5] e salva no RF[6]
		
		memoria[18] = 32'b010011_01111_00000_0111110000011000; //Bolha
		memoria[19] = 32'b010011_01111_00000_0111110000011000; //Bolha
		
		memoria[20] = 32'b010100_00000_00110_0111111111111111;	//sw RF[6]
			
	end 

	always @(posedge clk) begin
		q = memoria[addr];
	end
	
endmodule
