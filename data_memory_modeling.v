`timescale 1ns / 1ps

module DataMem(
    input clk,
    input MemRead,
    input MemWrite,
    input [5:0] addr,
    input [31:0] data_in,
    output reg [31:0] data_out
);

reg [31:0] mem [0:63]; 

initial begin   
    mem[0] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
    mem[1] = 32'b0000_0000_0000_0000_0000_0000_0000_0001;    
    mem[2] = 32'b0000_0000_0000_0000_0000_0000_0000_0011;    
    mem[3] = 32'b0000_0000_0000_0000_0000_0000_0000_01111;    
    mem[4] = 32'b0000_0000_0000_0000_0000_0000_0000_1111; 
    mem[5] = 32'b0000_0000_0000_0000_0000_0000_0001_1111; 
end


always @(*) begin
    if (MemRead)
        data_out = mem[addr]; 
 
end


always @(posedge clk) begin  
    if (MemWrite) 
        mem[addr] <= data_in;
end

endmodule
