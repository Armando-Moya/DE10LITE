module contador #(parameter BITS=4  )
(
 input clk,
 input rst,
 input en,
 input clr,
 output reg [BITS-1:0] Out


);

wire clk_buff;
DIV  #(.COUNTER_SIZE(26))
div(
.clk(clk),
.rst(rst),
.en(en),
.clkdiv(clk_buff)
   
);


always@(posedge clk_buff or negedge rst)
begin
	if(!rst)
	  Out <= {BITS{1'B0}};//4'b0000;
	else
		if(en)
			if(!clr)
					Out <= Out + 1'b1;
				else
					Out <= {BITS{1'b0}};

end 


endmodule 