// Code your testbench here
// or browse Examples
module teste2;
  reg [26:0] numero;
  wire [3:0] num0, num1, num2, num3, num4, num5, num6, num7;
  
  bin2bcd conv(.numero(numero), .num0(num0), .num1(num1), .num2(num2), .num3(num3), .num4(num4), .num5(num5), .num6(num6), .num7(num7));
  initial begin
    repeat(10)
      begin
        converter($random);
      end
  
  end
  task converter(input integer N); //Task para conversão
    begin
    	numero = N; // É passado um número aleatorio para numero
      	display;
    end
  
  endtask
 task display; //task para printar no console;
   #1 $display("bin :%d, bcd:%d %d %d %d %d %d %d ",
               numero, num7, num6, num5, num4, num3, num2, num1, num0);
  endtask

endmodule