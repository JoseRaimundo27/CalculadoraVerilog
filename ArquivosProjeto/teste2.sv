// Code your testbench here
// or browse Examples
module teste2;
  reg [3:0] num0, num1, num2, num3, num4, num5, num6, num7;
  wire [6:0]HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;

  C7SEG seg7(.num0(num0) , .num1(num1), .num2(num2), .num3(num3), .num4(num4), .num5(num5), .num6(num6), .num7(num7), .HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2), .HEX3(HEX3), .HEX4(HEX4),.HEX5(HEX5),.HEX6(HEX6), .HEX7(HEX7));


initial begin
  repeat(10)
    begin
      converter(5,3,4,2,1,4,5,6);
    end

end
task converter(input integer n0, input integer n1, input integer n2, input integer n3, input integer n4, input integer n5, input integer n6, input integer n7); //Task para conversão
  begin
    num0 = n0;
    num1 = n1;
    num2 = n2;
    num3 = n3;
    num4 = n4;
    num5 = n5;
    num6 = n6;
    num7 = n7;
    display;
  end

endtask
task display; //task para printar no console;
  #1 $display("bcd :%d %d %d %d %d %d %d %d E display:%d %d %d %d %d %d %d %d ",num0, num1, num2, num3, num4, num5, num6, num7, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
endtask

endmodule