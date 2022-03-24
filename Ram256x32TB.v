 `timescale 1ns / 1ps

module Ram256x32TB();

reg clk;
reg [7:0] addr;
reg RW;  //1=write 0 = read
reg [31:0]Din;
wire [31:0]Dout;


Ram256x32 Ram(addr,Din,Dout,RW,clk);

integer i = 0;


always #10 clk = ~clk;

initial begin
	{clk,RW,addr,Din} = 0;

	repeat (2) @ (posedge clk);

	for (i=0; i < 2**8; i = i+1) begin
		repeat (1) @(posedge clk) addr <= i; RW <= 1; Din <= $random;
	end

	#40 RW <=0;

	for (i=0; i < 64; i = i+1) begin
		repeat (1) @(posedge clk) addr <= i; 
	end
	
	#20;
	
	for (i=64; i < 128; i = i+1) begin
		repeat (1) @(posedge clk) addr <= i; 
	end
	
	#20;
	
	for (i=128; i < 192; i = i+1) begin
		repeat (1) @(posedge clk) addr <= i; 
	end	

	#20;
	
	for (i=192; i < 256; i = i+1) begin
		repeat (1) @(posedge clk) addr <= i; 
	end
	
	#200 $stop;

	end
endmodule