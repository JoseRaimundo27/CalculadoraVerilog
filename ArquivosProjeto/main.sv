module main(A,B,op,clk,rst,enable_1,enable_2,enable_3,HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
  input [17:0]A,B;
  input	[1:0]op;
  input enable_1,enable_2,enable_3;
  input clk,rst;
 
  
  //Para instanciação:
  wire [26:0] Sresult; // Resultado dos cálculos
  wire [3:0] num0, num1, num2, num3, num4, num5, num6, num7; // Resultado em bcd
  output wire [6:0]HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;  // Resultado em 7segmentos
  
 
  
  //Estados:
  reg [1:0]State, NextState;
 
  //Parametros dos estados:
  parameter chooseA = 2'b00, chooseOP = 2'b01, chooseB = 2'b10, result = 2'b11;
  
  //Registradores de escolha:
  reg[17:0] regA, regB;
  reg[1:0] regOP;
  
  
  
  //Always para definir os estados:
  always@(State)
    begin

      case(State)
      	chooseA: begin
          	regA = A;
				if(enable_1 == 0) // Os botões enables são ativos em baixo;
					NextState = chooseOP;   
				end
        
        chooseOP: begin
				regOP = op;
				if(enable_2 == 0) // Os botões enables são ativos em baixo;
					NextState = chooseB;
        end
      
      	chooseB: begin
          	regB = B;
				if(enable_3 == 0) // Os botões enables são ativos em baixo;
					NextState = result;
        
        end
		  
			result:
			if(rst)
				NextState = chooseA;
        // Não preciso zerar o valor de S nesse reset, isso já acontece no módulo calculadora.
        
     endcase
      
    end

	 //Always para atualizar clock e reset:
  always@(posedge clk)
    begin
		
		if(rst)
			begin
			State <= chooseA;
    
			end
		else  
        	State <= NextState;
        
     end 
	 
	 // Instancias:
	calculadora calc(.A(regA), .B(regB), .S(Sresult), .op(regOP),.clk(clk), .rst(rst));
	 
  bin2bcd bcd(.numero(Sresult),.num0(num0) , .num1(num1), .num2(num2), .num3(num3), .num4(num4), .num5(num5), .num6(num6), .num7(num7));
  
  C7SEG seg7(.num0(num0) , .num1(num1), .num2(num2), .num3(num3), .num4(num4), .num5(num5), .num6(num6), .num7(num7), .HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2), .HEX3(HEX3), .HEX4(HEX4),.HEX5(HEX5),.HEX6(HEX6), .HEX7(HEX7));
  
// perceba que os valores de rst são os mesmos no módulo main e no modulo calculadora*
endmodule
