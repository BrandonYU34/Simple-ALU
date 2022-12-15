`timescale 1ns/1ns
module HiLo( clk, DivAns, HiOut, LoOut, reset,HiLo );
input clk ;
input reset ;
input [63:0] DivAns ;
output reg [31:0] HiOut ;
output reg [31:0] LoOut ;

output reg [63:0] HiLo ;


always@( posedge clk or reset )
begin
  if ( reset )
  begin
    HiLo = 64'b0 ;
    HiOut = 32'b0;
    LoOut = 32'b0;
  end

  else
  begin
    HiLo = DivAns ;

  end
HiOut = HiLo[31:0] ;
LoOut = HiLo[63:32] ;
end

endmodule
