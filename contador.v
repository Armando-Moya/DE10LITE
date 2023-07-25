module contador #(parameter BITS=4)
(
 input clk,
 input rst,
 input en,
 input clr,
 output reg [(BITS-1):0] Out
);


always@(posedge clk or negedge rst)
begin
	if(!rst)
	  Out <= {BITS{1'b0}};
	else if(en)
			if(!clr)
					Out <= Out + 1'b1;
			else
					Out <= {BITS{1'b0}};
end 


endmodule 