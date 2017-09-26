//se mudar o sw0 para "1" a velocidade que as luzes piscam irá mudar

module piscaleds(
input CLOCK_50, 
input [9:0] SW,
output [9:0]LEDR
);

reg [25:0] contador = 0;
reg l = 0;
assign LEDR[0] = l;
assign LEDR[1] = l;
assign LEDR[2] = l;
assign LEDR[3] = l;
assign LEDR[4] = l;
assign LEDR[5] = l;
assign LEDR[6] = l;
assign LEDR[7] = l;
assign LEDR[8] = l;
assign LEDR[9] = l;

always @(posedge CLOCK_50) begin
	contador = contador + 1;
	if(SW[0] == 1) begin
		if(contador == 50000000) begin
		contador = 0;
		l = ~l;
		end
	end
	if(SW[0] == 0) begin
		if(contador == 5000000) begin
		contador = 0;
		l = ~l; 
		end
	end
end

endmodule

