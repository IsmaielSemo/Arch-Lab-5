`timescale 1ns / 1ps


module instr_memory_TB();
reg [5:0] addr;
wire [31:0] data_out;

InstMem dut( addr, data_out);

initial begin


addr = 6'b000000;
#10 
addr=6'b000001;
#10  
addr=6'b000010; 
#10   
addr=6'b000011;
#10    
addr=6'b000100; 
#10  
addr=6'b000101;

end  


endmodule
