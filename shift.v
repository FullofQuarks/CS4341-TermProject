module shift (clk, clr, si, so);
 input        clk, si, clr;
 output       so;
 reg    [7:0] tmp;
 always @(posedge clk or posedge clr)
 begin
    if (clr)
       tmp <= 8'b00000000;
    else
       tmp <= {si, tmp[6:0]};
 end
    assign so = tmp[7];
endmodule
