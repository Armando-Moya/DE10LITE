module DIV #(parameter COUNTER_SIZE = 14)
(
input clk,rst,
input wire en,
output clkdiv
);

parameter COUNTER_MAX_COUNT=(2**COUNTER_SIZE)-1;
reg [COUNTER_SIZE-1:0] cont;

always@(posedge clk or negedge rst)
if(!rst)
  cont<={COUNTER_SIZE{1'b0}};
 else  
 begin 
 if(en)
 begin
 if(cont==COUNTER_MAX_COUNT)
    cont<={COUNTER_SIZE{1'b0}};
 else 
    cont<=cont+1'b1;
 end 
  end 
assign clkdiv=(cont==COUNTER_MAX_COUNT )? 1'b1:1'b0;
endmodule 
	