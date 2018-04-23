module shiftRight #(parameter MSB=8) (clk, clr, si, data, so, oflow);
    input clk,  clr, data;
    input [7:0] si;
    output [7:0] so;
    output oflow;
    
    reg [7:0] tmp;
    always @(posedge clk or posedge clr)
    begin
        if (clr)
           tmp <= 8'b00000000;
        else
		begin
		   bitOut <= tmp[0];
           tmp <= {data, si[7:1]};
		end
    end
    assign so = tmp;
    assign oflow = tmp[0];
endmodule

module shifttestbench;
reg clk;
reg clr;
reg data;
reg [7:0] si;
wire [7:0] so;
wire oflow;

shiftRight shft(.clk(clk), .clr(clr), .si(si), .data(data), .so(so), .oflow(oflow));
initial begin
 $dumpfile("shift.vcd");
 $dumpvars;
 clk = 0;
 clr = 0;
 data = 1'b1;
 si=8'b11110000;
 #5 $display("Data in: %0b out:%0b Clock:%0b", data, so, clk);
 clr = 1;
 #5 $display("Data in: %0b out:%0b Clock:%0b", data, so, clk);
 clr = 0;
 #5 $display("Serial In: %b Data in: %b out:%b Clock:%0b Oflow:%0b", si, data, so, clk, oflow);
 #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
 #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
 #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
 #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
 #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
  #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
 #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
 #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
  #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
 #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
 #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
  #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
 #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
 #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
  #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
 #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
 #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
  #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
 #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
 #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
	data = 1'b0;
 #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
 #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);
 #5 $display("Data in: %b out:%b Clock:%0b Oflow:%0b", data, so, clk, oflow);;
	 $finish;
 end

 always #5 clk = ~clk;
 endmodule
