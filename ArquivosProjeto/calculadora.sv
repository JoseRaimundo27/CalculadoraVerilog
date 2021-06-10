module calculadora(S,A,B,op,clk,rst,HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
  input [7:0]A,B;
  input	[1:0]op;
  input clk,rst;
  output reg [26:0]S;
  
  //Para instanciação:
  wire [3:0] num0, num1, num2, num3, num4, num5, num6, num7;
  output wire [6:0]HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
  
  //Estados:
  reg [2:0]State;
 
  //Parametros dos estados
  parameter soma = 3'b000,
  subtracao = 3'b001,
  multiplicacao = 3'b010,
  divisao = 3'b011,
  zerado = 3'b100;

  
  
  
  //Always para definir os estados:
  always@(A,B,op,State)
    begin
      case(State)
        soma: begin
          S = A + B;
          if (S > 99999999) //Tratando numero maximo do display
            S = 0;
        end
        subtracao:begin
          if(A < B & S < 99999999)
            S = (B - A);
          else if(A < B & S > 99999999)
            S = 0;
          	
          else begin
            S = A - B;
          	if (S > 99999999)
            S = 0;
          end
        end
        multiplicacao:begin
          S = A*B;
          if (S > 99999999)
            S = 0;
        end
        divisao:begin
          S = A/B;
          if (S > 99999999)
            S = 0;
        end
		  zerado: begin
				S = 0;
		  end
		default: S = 0;
      endcase
    end

	 //Always para atualizar clock e reset:
  always@(posedge clk)
    begin
		
		if(rst)
			begin
			State <= zerado;
			end
			
		
      else  case(op)
          soma: State <= soma;
          subtracao: State <= subtracao;
          multiplicacao: State <= multiplicacao;
          divisao: State <= divisao;
          default: State <= soma;
        endcase 
    end 
	 
	 // Instancias:
  bin2bcd bcd(.numero(S),.num0(num0) , .num1(num1), .num2(num2), .num3(num3), .num4(num4), .num5(num5), .num6(num6), .num7(num7));
  
  C7SEG seg7(.num0(num0) , .num1(num1), .num2(num2), .num3(num3), .num4(num4), .num5(num5), .num6(num6), .num7(num7), .HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2), .HEX3(HEX3), .HEX4(HEX4),.HEX5(HEX5),.HEX6(HEX6), .HEX7(HEX7));
endmodule
