module Ram256x32(Address, Din, Dout, RW,clk);
input [7:0] Address;
input [31:0]Din;
output [31:0]Dout;
input RW;
input clk;

wire[31:0] Dout0, Dout1, Dout2, Dout3, D0,D1,D2,D3;
wire [3:0]CS;

decoder2x4 a(Address[7:6],CS);

Ram64x8 z(Address[5:0], CS[0], Din[31:24], Dout0[31:24], RW,clk);
Ram64x8 b(Address[5:0], CS[0], Din[23:16], Dout0[23:16], RW,clk);
Ram64x8 c(Address[5:0], CS[0], Din[15:8], Dout0[15:8], RW,clk);
Ram64x8 d(Address[5:0], CS[0], Din[7:0], Dout0[7:0], RW,clk);

Ram64x8 e(Address[5:0], CS[1], Din[31:24], Dout1[31:24], RW,clk);
Ram64x8 f(Address[5:0], CS[1], Din[23:16], Dout1[23:16], RW,clk);
Ram64x8 g(Address[5:0], CS[1], Din[15:8], Dout1[15:8], RW,clk);
Ram64x8 h(Address[5:0], CS[1], Din[7:0], Dout1[7:0], RW,clk);

Ram64x8 i(Address[5:0], CS[2], Din[31:24], Dout2[31:24], RW,clk);
Ram64x8 j(Address[5:0], CS[2], Din[23:16], Dout2[23:16], RW,clk);
Ram64x8 k(Address[5:0], CS[2], Din[15:8], Dout2[15:8], RW,clk);
Ram64x8 l(Address[5:0], CS[2], Din[7:0], Dout2[7:0], RW,clk);

Ram64x8 m(Address[5:0], CS[3], Din[31:24], Dout3[31:24], RW,clk);
Ram64x8 n(Address[5:0], CS[3], Din[23:16], Dout3[23:16], RW,clk);
Ram64x8 o(Address[5:0], CS[3], Din[15:8], Dout3[15:8], RW,clk);
Ram64x8 p(Address[5:0], CS[3], Din[7:0], Dout3[7:0], RW,clk);

TriStateBuffer q(Dout0,D0,CS[0]);
TriStateBuffer qq(Dout1,D1,CS[1]);
TriStateBuffer qqq(Dout2,D2,CS[2]);
TriStateBuffer qqqq(Dout3,D3,CS[3]);

assign Dout = D0 | D1 | D2 | D3;


endmodule




module decoder2x4(Select, out);
input [1:0] Select;
output reg [3:0] out;
always @(*)
	begin 
		case(Select)
		2'b00: 
		out <= 4'b0001;
		2'b01: 
		out <= 4'b0010;
		2'b10: 
		out <= 4'b0100;
		2'b11: 
		out <= 4'b1000;
		endcase
	end
endmodule

module TriStateBuffer(In,Out,Enable);
input [31:0]In;
input Enable;
output reg [31:0]Out;

always @(*) begin
Out = Enable? In:32'b0; 
end

endmodule
