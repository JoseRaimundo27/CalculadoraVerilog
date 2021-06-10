module C7SEG(num0, num1, num2, num3, num4, num5, num6, num7,HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
  input[3:0] num0, num1, num2, num3, num4, num5, num6, num7; // Dígitos/bcd
  
  //Cada HEX é um display
  output reg [6:0]HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
  
  //Criando parametros do display 7segmentos
  parameter zero=7'b1000000 , um = 7'b1111001, dois = 7'b0100100, tres = 7'b0110000,quatro = 7'b0011001, cinco = 7'b0010010, seis =  7'b0000010, sete =  7'b1111000, oito =  7'b0000000, nove =  7'b0010000;
  always@(num0,num1,num2,num3,num4,num5,num6,num7)
    begin
	 //Passando digito1 para o display1
      case(num0)
      	0: HEX0 = zero;
			1: HEX0 = um;
			2: HEX0 = dois;
			3: HEX0 = tres;
			4: HEX0 = quatro;
			5: HEX0 = cinco;
			6: HEX0 = seis;
			7: HEX0 = sete;
			8: HEX0 = oito;
			9: HEX0 = nove;
        default: HEX0 = zero;
      endcase
		
		//Passando digito2 para o display2
      case(num1)
      	0: HEX1 = zero;
			1: HEX1 = um;
			2: HEX1 = dois;
			3: HEX1 = tres;
			4: HEX1 = quatro;
			5: HEX1 = cinco;
			6: HEX1 = seis;
			7: HEX1 = sete;
			8: HEX1 = oito;
			9: HEX1 = nove;
          default: HEX1 = zero;
        endcase
      
		//Passando digito3 para o display3
      case(num2)
      	0: HEX2 = zero;
			1: HEX2 = um;
			2: HEX2 = dois;
			3: HEX2 = tres;
			4: HEX2 = quatro;
			5: HEX2 = cinco;
			6: HEX2 = seis;
			7: HEX2 = sete;
			8: HEX2 = oito;
			9: HEX2 = nove;
          default: HEX2 = zero;
        endcase
      
      //Passando digito4 para o display4
		case(num3)
      	0: HEX3 = zero;
			1: HEX3 = um;
			2: HEX3 = dois;
			3: HEX3 = tres;
			4: HEX3 = quatro;
			5: HEX3 = cinco;
			6: HEX3 = seis;
			7: HEX3 = sete;
			8: HEX3 = oito;
			9: HEX3 = nove;
          default: HEX3 = zero;
        endcase
      
    //Passando digito5 para o display5 
	  case(num4)
      	0: HEX4 = zero;
			1: HEX4 = um;
			2: HEX4 = dois;
			3: HEX4 = tres;
			4: HEX4 = quatro;
			5: HEX4 = cinco;
			6: HEX4 = seis;
			7: HEX4 = sete;
			8: HEX4 = oito;
			9: HEX4 = nove;
          default: HEX4 = zero;
        endcase
      
      //Passando digito6 para o display6
		case(num5)
      	0: HEX5 = zero;
			1: HEX5 = um;
			2: HEX5 = dois;
			3: HEX5 = tres;
			4: HEX5 = quatro;
			5: HEX5 = cinco;
			6: HEX5 = seis;
			7: HEX5 = sete;
			8: HEX5 = oito;
			9: HEX5 = nove;
          default: HEX5 = zero;
        endcase
      
      //Passando digito7 para o display7
		case(num6)
      	0: HEX6 = zero;
			1: HEX6 = um;
			2: HEX6 = dois;
			3: HEX6 = tres;
			4: HEX6 = quatro;
			5: HEX6 = cinco;
			6: HEX6 = seis;
			7: HEX6 = sete;
			8: HEX6 = oito;
			9: HEX6 = nove;
          default: HEX6 = zero;
        endcase
      
      //Passando digito8 para o display8
		case(num7)
      	0: HEX7 = zero;
			1: HEX7 = um;
			2: HEX7 = dois;
			3: HEX7 = tres;
			4: HEX7 = quatro;
			5: HEX7 = cinco;
			6: HEX7 = seis;
			7: HEX7 = sete;
			8: HEX7 = oito;
			9: HEX7 = nove;
          default: HEX7 = zero;
        endcase
      
      
    end
      endmodule   
      