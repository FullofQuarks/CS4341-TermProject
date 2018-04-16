module shift #(parameter MSB=8) (clk, clr, data, so, oflow);
    input clk,  clr, data;
    output [7:0] so;
    output oflow;
    
    reg [7:0] tmp;
    always @(posedge clk or posedge clr)
    begin
        if (clr)
           tmp <= 8'b00000000;
        else
           tmp <= {data, tmp[6:1]};
    end
    assign so = tmp;
    assign oflow = tmp[0];
endmodule

// module shifttestbench;
// reg clk;
// reg clr;
// reg si;
// reg data;
// wire [7:0] so;
// wire oflow;

// shift shft(.clk(clk), .clr(clr), .data(data), .so(so), .oflow(oflow));
// initial begin
// 	clk = 0;
// 	clr = 0;
// 	data = 1'b1;
// 	#5 $display("Data in: %0b out:%0b Clock:%0b", data, so, clk);
// 	clr = 1;
// 	#5 $display("Data in: %0b out:%0b Clock:%0b", data, so, clk);
// 	clr = 0;
// 	#5 $display("Data in: %0b out:%0b Clock:%0b Oflow:%0b", data, so, clk, oflow);
// 	#5 $display("Data in: %0b out:%0b Clock:%0b Oflow:%0b", data, so, clk, oflow);
// 	#5 $display("Data in: %0b out:%0b Clock:%0b Oflow:%0b", data, so, clk, oflow);
// 	#5 $display("Data in: %0b out:%0b Clock:%0b Oflow:%0b", data, so, clk, oflow);
// 	#5 $display("Data in: %0b out:%0b Clock:%0b Oflow:%0b", data, so, clk, oflow);
// 	#5 $display("Data in: %0b out:%0b Clock:%0b Oflow:%0b", data, so, clk, oflow);
// 	#5 $display("Data in: %0b out:%0b Clock:%0b Oflow:%0b", data, so, clk, oflow);
// 	#5 $display("Data in: %0b out:%0b Clock:%0b Oflow:%0b", data, so, clk, oflow);
// 	#5 $display("Data in: %0b out:%0b Clock:%0b Oflow:%0b", data, so, clk, oflow);
// 	#5 $display("Data in: %0b out:%0b Clock:%0b Oflow:%0b", data, so, clk, oflow);
// 	#5 $display("Data in: %0b out:%0b Clock:%0b Oflow:%0b", data, so, clk, oflow);
// 	#5 $display("Data in: %0b out:%0b Clock:%0b Oflow:%0b", data, so, clk, oflow);
// 	#5 $display("Data in: %0b out:%0b Clock:%0b Oflow:%0b", data, so, clk, oflow);
// 	#5 $display("Data in: %0b out:%0b Clock:%0b Oflow:%0b", data, so, clk, oflow);
// 	#5 $display("Data in: %0b out:%0b Clock:%0b Oflow:%0b", data, so, clk, oflow);
// 	#5 $display("Data in: %0b out:%0b Clock:%0b Oflow:%0b", data, so, clk, oflow);
// 	#5 $display("Data in: %0b out:%0b Clock:%0b Oflow:%0b", data, so, clk, oflow);
// 	#5 $display("Data in: %0b out:%0b Clock:%0b Oflow:%0b", data, so, clk, oflow);
// 	$finish;
// end

// always #5 clk = ~clk;
// endmodule
