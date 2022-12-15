`timescale 1ns/1ns
module ALUControl( SignaltoALU, SignaltoMUX, SignaltoDIV, SignaltoSHT, Signal, clk ) ;
	
	input clk ;
	input [5:0] Signal ;
	output [5:0] SignaltoALU ;
	output [5:0] SignaltoSHT ;
	output [5:0] SignaltoDIV ;
	output [5:0] SignaltoMUX ;

	parameter AND = 6'b100100 ;  // AND  : 36
	parameter OR = 6'b100101 ;   // OR   : 37
	parameter ADD = 6'b100000 ;  // ADD  : 37
	parameter SUB = 6'b100010 ;  // SUB  : 34
	parameter SLT = 6'b101010 ;  // SLT  : 42
	
	parameter SLL = 6'b000000 ;  // SLL  : 0
	
	parameter DIVU = 6'b011011 ; // DIVU : 27
	parameter MFHI= 6'b010000;
	parameter MFLO= 6'b010010;
	
	reg [5:0] temp ;
	reg [6:0] counter ;

	always@( Signal )
	begin
	  if ( Signal == DIVU )
	  begin
		counter = 0 ;
	  end
	/*
	如果訊號改變成除法 就把counter歸0
	*/
	end

	always@( posedge clk )
	begin
	  temp = Signal ;
	  if ( Signal == DIVU )
	  begin
		counter = counter + 1 ;
		if ( counter == 32 )
		begin
		  temp = 6'b111111 ; // Open HiLo reg for Div
		  counter = 0 ;
		  
		end
	  end
	/*
	數32個clk然後開啟HiLo暫存器給除法器放值進去
	*/
	end

	assign SignaltoALU = temp ;
	assign SignaltoSHT = temp ;
	assign SignaltoDIV = temp ;
	assign SignaltoMUX = temp ;

endmodule
