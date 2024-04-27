module data_reg (
	input logic [3:0] data,
	input logic rst,clk,shift,load,
	output logic new_data);
	
logic [3:0] temp;

always_ff @(posedge clk or negedge rst) begin
	if (!rst)
		new_data = 1'b0;
	else if (load) 
			temp = data;
	else if (shift) begin
			new_data = temp[0];
			temp = temp >> 1;
							end
end 
endmodule  