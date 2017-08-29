module teste(
    input CLOCK_50,
    input [3:0] KEY,
    input [9:0] SW,
    output [7:0] LEDG,
    output [9:0] LEDR
);

reg [25:0] cont=0;
reg um = 0;
assign LEDR = um;
    always@(posedge CLOCK_50) begin
        cont = cont+1;
        if(cont == 0)begin
            um=~um;
        end
    end
endmodule
