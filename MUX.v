/*
`timescale 1ns/1ns
module MUX( out, ALU, Hi, Lo, Shifter, Signal );
	input [31:0] ALU, Hi, Lo, Shifter ;
	input [5:0] Signal ;
	output [31:0] out ;

	parameter AND = 6'b100100 ;  // AND  : 36
	parameter OR = 6'b100101 ;   // OR   : 37
	parameter ADD = 6'b100000 ;  // ADD  : 37
	parameter SUB = 6'b100010 ;  // SUB  : 34
	parameter SLT = 6'b101010 ;  // SLT  : 42
	parameter SLL = 6'b000000 ;  // SLL  : 0
	parameter DIVU = 6'b011011 ; // DIVU : 27
	parameter MFHI = 6'b010000;
	parameter MFLO = 6'b010010;
	
	assign out = ( Signal == AND ) ? ALU :
				 ( Signal == OR ) ? ALU :
				 ( Signal == ADD ) ? ALU :
				 ( Signal == SUB ) ? ALU :
				 ( Signal == SLT ) ? ALU :
				 ( Signal == MFHI ) ? Hi :
				 ( Signal == MFLO ) ? Lo :
				 ( Signal == SLL ) ? Shifter : 32'b0 ;
				 
endmodule
*/
`timescale 1ns/1ns
module MUX( ALUOut, HiOut, LoOut, Shifter, Signal, dataOut );
input [31:0] ALUOut ;
input [31:0] HiOut ;
input [31:0] LoOut ;
input [31:0] Shifter ;
input [5:0] Signal ;
output [31:0] dataOut ;


reg [31:0] temp ;

parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;

parameter SLL = 6'b000000;

parameter DIVU= 6'b011011;
parameter MFHI= 6'b010000;
parameter MFLO= 6'b010010;

always@( ALUOut or HiOut or LoOut or Shifter or Signal )
begin

	case ( Signal )
	AND:
	begin
		temp = ALUOut ;
	end
	OR:
	begin
		temp = ALUOut ;
	end
	ADD:
	begin
		temp = ALUOut ;
	end
	SUB:
	begin
		temp = ALUOut ;
	end
	SLT:
	begin
		temp = ALUOut ;
	end
	MFHI:
	begin
		temp = HiOut ;
	end
	MFLO:
	begin
		temp = LoOut ;
	end
	SLL:
	begin
		temp = Shifter ;
	end
	default: temp = 32'b0 ;	
	
	endcase
end
assign dataOut = temp ;


endmodule