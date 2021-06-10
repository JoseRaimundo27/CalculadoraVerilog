module bin2bcd (numero,num0,num1,num2,num3,num4,num5,num6,num7); 
    input [26:0]numero;      
      output reg[3:0] num0, num1, num2, num3, num4, num5, num6, num7;
    reg [26:0]aux;
 
    always@(numero)begin
		
			num7= numero/10000000; //Salva o dígito
			aux = numero%10000000; //Pega o resto
			
			num6 = aux/1000000; //Salva o dígito
			aux = aux%1000000; //Pega o resto
			
			num5 = aux/100000; //Salva o dígito
			aux= aux%100000;  //Pega o resto
			
			num4 = aux/10000; //Salva o dígito
			aux= aux%10000;  //Pega o resto
			
			num3 = aux/1000; //Salva o dígito
			aux= aux%1000;  //Pega o resto
			
			num2 = aux/100; //Salva o dígito 
			aux= aux%100;  //Pega o resto
			
			num1 = aux/10; //Salva o dígito
			aux= aux%10;  //Pega o resto
			
			num0 = aux; //Salva o dígito
		
    end
endmodule