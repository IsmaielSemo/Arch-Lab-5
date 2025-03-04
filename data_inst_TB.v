`timescale 1ns / 1ps


module data_inst_TB();
reg clk;
reg MemRead;
reg MemWrite;
reg [5:0] addr;
reg [31:0] data_in;
wire [31:0] data_out;
localparam clk_period = 10;

DataMem dut( clk, MemRead,MemWrite, addr, data_in, data_out);

  initial begin
         clk = 1'b0;
        forever #(clk_period/2) clk = ~clk;
end

initial begin
 clk = 0;
        MemRead = 0;
        MemWrite = 0;
        addr = 6'b0;
        data_in = 32'd0;
        
        #clk_period;


        addr = 6'b000001;       
        data_in = 32'd150;  
        MemWrite = 1;            
        MemRead = 0;             
        #clk_period;                      

      
        MemWrite = 0;             
        MemRead = 1;             
        addr = 6'b000001;         
        #clk_period;                      

        addr = 6'b000010;         
        data_in = 32'd100;   
        MemWrite = 1;             
        MemRead = 0;              
        #clk_period;                      

    
        MemWrite = 0;             
        MemRead = 1;         
        addr = 6'b000010;      
        #clk_period;                      
     

  
        addr = 6'b000000;        
        MemRead = 1;             
        #clk_period;                    

end

endmodule
