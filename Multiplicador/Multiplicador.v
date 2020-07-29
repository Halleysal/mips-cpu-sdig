module Multiplicador (Idle, Done, St, Clk, Produto, Multiplicador, Multiplicando);
input [15:0] Multiplicador;
input [15:0] Multiplicando;
input Clk, St;
output [31:0] Produto;
output Idle, Done;

wire Load, Sh, Ad, K, M;
wire [15:0]Soma;

assign M = Produto[0];

Control Control (Idle, Done, St, Load, Sh, Ad, Clk, K, M);
Counter Counter (Load, Clk, K);
Adder Adder (Soma[15:0], Multiplicando[15:0],  Produto[31:16]);
Acc Acc (Produto[31:0], {Soma[15:0], Multiplicador[15:0]}, Load, Sh, Ad, Clk);

endmodule
