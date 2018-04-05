module shift (clk, clr, si, so);
    input clk,  clr;
    input si;//[7:0];
    output so [7:0];
    
    reg [7:0] tmp;
    always @(posedge clk or posedge clr)
    begin
        if (clr)
           tmp <= 8'b00000000;
        else
           //tmp <= {si, tmp[6:0]};
            tmp = tmp >> 1;
    end
    assign so = tmp[0];
endmodule

module testbench;
reg clk;
reg clr;
reg si;
wire [7:0] so;

shift shft(.clk(clk), .clr(clr), .si(si), .so(so));

initial begin
	clk = 0;
	clr = 0;
	si = 1'b1;
	#5 $display("Serial in:%0b Clock:%0b", so, clk);
	clr = 1;
	#5 $display("Serial in:%0b Clock:%0b", so, clk);
	clr = 0;
	#5 $display("Serial in:%0b Clock:%0b", so, clk);
	#5 $display("Serial in:%0b Clock:%0b", so, clk);
	#5 $display("Serial in:%0b Clock:%0b", so, clk);
	#5 $display("Serial in:%0b Clock:%0b", so, clk);
	#5 $display("Serial in:%0b Clock:%0b", so, clk);
	#5 $display("Serial in:%0b Clock:%0b", so, clk);
	#5 $display("Serial in:%0b Clock:%0b", so, clk);
	#5 $display("Serial in:%0b Clock:%0b", so, clk);
	#5 $display("Serial in:%0b Clock:%0b", so, clk);
	$finish;
end

always #5 clk = ~clk;
endmodule
