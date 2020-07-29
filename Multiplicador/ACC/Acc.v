module Acc (Saidas, Entradas, Load, Sh, Ad, Clk);
output [31:0] Saidas;
input [31:0]Entradas;
input Load, Sh, Ad, Clk;

reg [31:0] aux;
assign Saidas = aux;

always @(posedge Clk) begin

		if (Load) begin
			aux <= {16'b0000000000000000, Entradas[15:0]};
		end
		if (Ad) begin
			aux <= {Entradas[31:16],aux[15:0]};
		end
		if (Sh) begin 
			aux <= {1'b0,aux[31:1]};
		end

end

endmodule
