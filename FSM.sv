module FSM (
	input logic CLOCK_50,rst,load_in,
	input logic [2:0] new_length,
	output logic shift,display,load_out);
	
typedef enum bit [1:0] { IDLE = 2'b00,
							INPUT =2'b01,
							DISPLAY = 2'b10} state_t;
state_t state_reg,state_next;


							
always_ff @(posedge CLOCK_50 or negedge rst) begin
	if (!rst)
		state_reg <= IDLE;
	else 
		state_reg <= state_next;
end

always @* begin
	state_next = state_reg;
	
	case (state_reg)	
			IDLE: begin 
								if(load_in) begin 
														state_next 	= IDLE;
														shift 	  	= 1'b0;
														load_out		= 1'b0;
														display 		= 1'b0;
												end 
								else 			begin 
														state_next 	= INPUT;
														shift 	  	= 1'b0;
														load_out		= 1'b1;
														display 		= 1'b0;
												end
					end 
					
			INPUT: begin 
								if (new_length == 3'b000) begin 
																		state_next 	= IDLE;
																		shift 	  	= 1'b0;
																		load_out		= 1'b0;
																		display 		= 1'b0;
																end 																
								else if (k == 1'b0) begin
																		state_next = INPUT;
																		shift = 1'b0;
																		load_out = 1'b0;
																		display 		= 1'b0;
																		end
								else if (k == 1'b1) begin
																		state_next = DISPLAY;
																		shift  = 1'b1;
																		load_out = 1'b0;
																		display 		= 1'b0;
																		end
															end
												
			DISPLAY:	begin
								if (k == 1'b0) begin
																	state_next = DISPLAY;
																	shift		= 1'b0;
																	load_out = 1'b0;
																	display 		= 1'b1;
													end
								else if (k == 1'b1) begin
																	state_next = INPUT;
																	shift = 1'b0;
																	load_out = 1'b0;
																	display 		= 1'b0;
																	end
															end
											endcase
end



logic k;

int t=0;
always_ff @(posedge CLOCK_50) begin
	 t = t + 1;
	 k = 1'b0;
		if (t == 25000000) begin
			t = 0;
			k = 1'b1;
			end
end

endmodule