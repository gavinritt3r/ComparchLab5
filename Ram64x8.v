module Ram64x8 (Address, CS, Din, Dout, RW,clk);
input [5:0] Address;
input CS;
input RW;
input clk;
input [7:0] Din;
output [7:0] Dout;

reg [7:0] mem_array [63:0];

reg [7:0] mem_out; 

//write instruction
always@(posedge clk) begin
if (CS && RW) 
mem_array[Address] = Din;
end


//Read instruction
always@(posedge clk) begin
if (CS && ~RW)
mem_out = mem_array[Address];
end

assign Dout = mem_out;

endmodule