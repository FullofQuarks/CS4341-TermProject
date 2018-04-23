module shiftRight #(parameter MSB=8) (clk, clr, si, so, oflow);
    input clk,  clr;
    input [7:0] si;
    output [7:0] so;
    output oflow;
    
    reg bitOut;
    reg [7:0] tmp;
    always @(posedge clk or posedge clr)
    begin
        if (clr)
           tmp <= 8'b00000000;
        else
	begin
		tmp = si;
		bitOut <= tmp[0];
           	tmp <= {1'b0, tmp[7:1]};
	end
    end
    assign so = tmp;
    assign oflow = bitOut;
endmodule

module shiftLeft #(parameter MSB=8) (clk, clr, si, so, oflow);
input clk, clr;
input [7:0] si;
output [7:0] so;
output oflow;

reg bitOut;
reg [7:0] tmp;
always @(posedge clk or posedge clr)
begin
	if(clr)
		tmp <= 8'b00000000;
	else
	begin
		tmp = si;
		bitOut <= tmp[7];
		tmp <= {tmp[6:0], 1'b0};
	end
end
assign so = tmp;
assign oflow = bitOut;
endmodule

// module shifttestbench;
// reg clk;
// reg clr;
// reg data;
// reg [7:0] si;
// wire [7:0] so;
// wire oflow;
// 
// shiftRight shft(.clk(clk), .clr(clr), .si(si), .so(so), .oflow(oflow));
// initial begin
//  $dumpfile("shift.vcd");
//  $dumpvars;
//  clk = 0;
//  clr = 0;
//  si=8'b11110001;
//  #5 $display("Data in: %0b out:%0b Clock:%0b", data, so, clk);
//  clr = 1;
//  #5 $display("Data in: %0b out:%0b Clock:%0b", data, so, clk);
//  clr = 0;
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
//  #5 $display("Serial In: %b out:%b Clock:%0b Oflow:%0b", si, so, clk, oflow);
// 	 
//  $finish;
// 
//  end
// 
//  always #5 clk = ~clk;
//  endmodule
