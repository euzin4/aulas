
module test_clock;
  reg clk;  //aqui é atribuido a "variavel" clk do tipo reg

  always #1 clk = ~clk; //esse 1 é uma unidade de medida

  initial begin	//como se fosse o main
    $dumpvars(0, clk);	//como se chamasse uma funçao
    clk <= 0;   //aqui o clk é zerado
    #500;	//tempo de execução total
    $finish;
  end

endmodule


-------------------------------------------------



module pisca_leds(
    input clk_in1,
    output led_out1
);

assign led_out1=clk_in1;

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



---------------------------------------------------
