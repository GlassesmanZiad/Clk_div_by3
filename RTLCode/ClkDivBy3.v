module ClkDivBy3 (input clk ,input rst,output clkout);
	
	reg [1:0] c1;
	reg [1:0] c2;

	wire cout1;
	wire cout2;

	always@(posedge clk or negedge rst) begin
		if(~rst)begin
			c1 <=0; c2 <=0;
		end else
		if (c1 != 2) c1 <= c1+1;
		else c1 <= 0;
	end

	always@(negedge clk or negedge rst) begin
		if(~rst)begin
			c1 <=0; c2 <=0;
		end else
		if (c2 != 2) c2 <= c2+1;
		else c2 <= 0;
	end	

	assign cout1 = c1[1];
	assign cout2 = c2[1];
	assign clkout = cout1|cout2;


endmodule
