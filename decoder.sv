module decoder (
	input logic [2:0] in,
	output logic [3:0] data,
	output logic [2:0] length);
	
always_comb begin
	case (in)
		3'b000: begin 
							data = 4'b0010;
							length 	= 3'b010;
					end
		3'b001: begin 	
							data = 4'b0001;
							length 	= 3'b100;
					end
		3'b010: begin 
							data = 4'b0101;
							length 	= 3'b100;
					end
		3'b011: begin	
							data = 4'b0001;
							length  	= 3'b011;
					end
		3'b100: begin 
		
							data = 4'b000;
							length 	= 4'b001;
					end
		3'b101: begin 
							data = 4'b0100;
							length 	= 3'b100;
					end
		3'b110: begin 	
							data = 4'b0011;
							length 	= 3'b011;
					end
		3'b111: begin		
							data = 4'b0000;
							length 	= 3'b100;
					end
	endcase 
end 
endmodule 
				
			
			
					
					
		