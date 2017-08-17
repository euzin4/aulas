module pisca_leds(
    input clk_in1,
    output led_out1
);

reg contador=0;

assign led_out1=contador;

always @(posedge clk_in1) begin
    contador=~contador;
end

endmodule


module testbench;
 wire led;
 reg clk=0;

 pisca_leds Leds1(clk,led);

 always #1 clk=~clk;

 initial begin
     $dumpvars;
     clk<=0;
     #500;
     $finish;
 end
 endmodule
