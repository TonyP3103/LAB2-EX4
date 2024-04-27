module wrapper (
	input logic [2:0] SW,
	input logic [1:0] KEY,
	input logic CLOCK_50,
	output logic [1:0] LEDR);
	
	logic [3:0] data;
	logic [2:0] length,new_length;
	logic new_data,shift,display,load_out;
	
	decoder decoder1 (.in(SW),.data(data),.length(length));
	
	down_counter down_counter1 (.length(length),.rst(KEY[1]),.clk(CLOCK_50),.shift(shift),.load(load_out),.new_length(new_length));
	
	data_reg data_reg1 (.data(data),.rst(KEY[1]),.clk(CLOCK_50),.shift(shift),.load(load_out),.new_data(new_data));
	
	FSM FSM1 (.CLOCK_50(CLOCK_50),.rst(KEY[1]),.load_in(KEY[0]),.new_length(new_length),.shift(shift),.display(display),.load_out(load_out));
	
	
	assign LEDR[0] = display & !new_data;	//dot
	assign LEDR[1] = display & new_data;  //dash
	
endmodule 