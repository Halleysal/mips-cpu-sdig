module Adder(Soma, OperandoA, OperandoB);

	input [15:0] OperandoA, OperandoB;
	output [15:0] Soma;

	assign Soma = OperandoA + OperandoB;

endmodule
