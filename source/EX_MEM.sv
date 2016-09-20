// interface 
`include "EX_MEM_if.vh"
`include "cpu_types_pkg.vh"

module EX_MEM ( 
	input logic CLK, nRST, 
	EX_MEM_if.ex_mem exmemif
); 

	import cpu_types_pkg::*; 
	

always_ff @(posedge CLK, negedge nRST) begin 
	if (!nRST) begin  
		exmemif.regDest_out <= '0; 
		exmemif.dREN_out <= '0;
		exmemif.dWEN_out <= '0;
		exmemif.dmemstore_out <= '0;  
		exmemif.regWr_out <= '0;
		exmemif.memToReg_out <= '0; 
		exmemif.halt_out <= '0;
		exmemif.portO_out <= '0;
		exmemif.luiValue_out <= '0; 
		exmemif.pc4_out <= '0; 
		exmemif.op_mem <= '0;
	end 
	else begin 
	
		if(exmemif.ihit || exmemif.dhit )  begin 
			exmemif.regDest_out <= exmemif.regDest_in; 
			exmemif.dREN_out <= exmemif.dREN_in; 
			exmemif.dWEN_out <= exmemif.dWEN_in;
			exmemif.dmemstore_out <= exmemif.dmemstore_in;  
			exmemif.regWr_out <= exmemif.regWr_in;
			exmemif.memToReg_out <= exmemif.memToReg_in; 
			exmemif.halt_out <= exmemif.halt_in;
			exmemif.portO_out <= exmemif.portO_in;
			exmemif.luiValue_out <= exmemif.luiValue_in;  
			exmemif.pc4_out <= exmemif.pc4_in; 
			exmemif.op_mem <= exmemif.op_ex;
		end   
	end
	
end

endmodule