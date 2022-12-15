`timescale 1ns/1ns
module Divider( clk, dataA, dataB, Signal, dataOut, reset);
input clk ;
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output reg [63:0] dataOut ;
reg [5:0]	counter ;
reg [63:0] temp  ;
parameter DIVU = 6'b011011;
parameter OUT = 6'b111111;


always@( Signal )
begin
	if ( Signal == DIVU )
	 begin
	counter = 0 ;
end
end
always@( posedge clk or reset )
begin
        if ( reset )
        		temp = 64'd0;
        else
		begin
			if ( Signal )
			begin
			if ( counter < 32 )  
				begin
				counter = counter + 1 ;
				if (counter == 1 ) 
					temp = temp + dataA ;
				temp = temp << 1 ; 
				temp[63:32] = temp[63:32] - dataB ;
				if ( temp[63] != 1 )
					temp = temp + 1 ;
							
				else 
					temp[63:32] = temp[63:32] + dataB ;				
				end 
			
				if( counter == 32 )
					dataOut = temp ;					
			end
        end


end

endmodule
