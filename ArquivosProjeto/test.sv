module test;
  reg[7:0] A,B;
  reg [1:0]op;
  reg clk,rst;
  wire[26:0] S; 
  calculadora calc(.A(A),.B(B),.S(S),.clk(clk),.rst(rst), .op(op));

  initial begin
    repeat(10)begin
      somar($random, $random);
      display;end
    /*repeat(10)begin
      multiplicar($random, $random);
      display;end*/
    /*repeat(10)begin
      dividir($random, $random);
      display;end*/
    /*repeat(10)begin
      subtrair($random, $random);
      display;end*/

end
  task display; //task para printar no console;
    #1 $display("A:%d,B:%d ,S %d",
                A,B, S);
  endtask

  task toggle_clk;
    begin
      clk = 0;
      clk = 1;
    end
  endtask

  //Task para soma:
  task somar(input integer num1, input integer num2);
    begin
      A = num1;
      B = num2;
      op = 00;
      toggle_clk;
    end
  endtask

  //Task para subtrair:
   task subtrair(input integer num1, input integer num2);
    begin
      A = num1;
      B = num2;
      op = 01;
      toggle_clk;
    end
  endtask
  
  //Task para multiplicar:
   task multiplicar(input integer num1, input integer num2);
    begin
      A = num1;
      B = num2;
      op = 10;
      toggle_clk;
    end
  endtask
  
  //Task para dividir:
   task dividir(input integer num1, input integer num2);
    begin
      A = num1;
      B = num2;
      op = 11;
      toggle_clk;
    end
  endtask



endmodule