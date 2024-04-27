module down_counter (
	input logic [2:0] length,
	input logic rst,clk,shift,load,
	output logic [2:0] new_length);
	
	
always_ff @(posedge clk or negedge rst) begin
	if (!rst) 
			new_length = 4'b0000;
	else if (load) 
			new_length = length;
	else if (shift) 
			new_length = new_length - 1'b1;
	end 
endmodule 	