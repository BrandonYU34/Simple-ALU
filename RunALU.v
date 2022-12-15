`timescale 1ns/1ns
module RunALU( out, CarryOut, inputA, inputB, CarryIn, SignalIn, Less ) ;
	input inputA, inputB, CarryIn, Less ;
	input [5:0] SignalIn ;
	output out, CarryOut ;

	parameter AND = 6'b100100 ; // AND : 36
	parameter OR = 6'b100101 ;//OR : 37
	parameter ADD = 6'b100000 ; // ADD : 37
	parameter SUB = 6'b100010 ; // SUB : 34
	parameter SLT = 6'b101010 ; // SLT : 42
	
	wire binvert, sum ;
	//看要不要做減法(是否為sub or slt )
	assign binvert = ( SignalIn == SUB ) ? 1'b0 : ( SignalIn == SLT ) ? 1'b0 : 1'b1 ;
	//如果binvert是1，就把b做exclusive_or + 1
	wire BIn ;
	assign BIn = ( binvert == 0 ) ? inputB ^ binvert + 1'b1 : inputB ;
	//做FA(可做減法或加法)
	FA fa( .cout(CarryOut), .sum(sum), .inputA(inputA), .inputB(BIn), .c(CarryIn) ) ;
	wire output0, output1, output2 ;
	assign output0 = inputA & inputB ;
	assign output1 = inputA | inputB ;
	assign output2 = sum ;
	assign out = ( SignalIn == AND ) ? output0 :
				 ( SignalIn == OR ) ? output1 :
				 ( SignalIn == SLT ) ? 1'b0 : output2 ;
endmodule