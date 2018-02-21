module SimpleOr(x,y,xory);
	input x;
	input y;
	output xory;
	reg xory;
	always @(*) begin
	xory= x | y;
	end
endmodule


module SimpleAnd(x,y,xandy);
	input x;
	input y;
	output xandy;
	reg xandy;
	always @(*) begin
	xandy= x & y;
	end
endmodule

module SimpleXor(x,y,xxory);
	input x;
	input y;
	output xxory;
	reg xxory;
	always @(*) begin
	xxory= x ^ y;
	end
endmodule

module SimpleNot(x,notx);
	input x;
	output notx;
	reg notx;
	always @(*) begin
	notx= !x;
	end
endmodule


//=============================================
// Test Bench
//=============================================
module Test_Fsm1 ;
  reg clk;
  reg P;
  reg Q;

  
  wire pandq;
  wire porq;
  wire pxorq;
  wire notp;
  wire notq;
  
  
  //Original o (clk, rst, t);
  //Controller c(clk, rst, t, rdy, sel, go) ;
  //Counter d(clk, rst, sel, go, rdy) ;
  
  SimpleAnd simpleAnd(P,Q,pandq);
  SimpleOr  simplOr(P,Q,porq);
  SimpleXor simpleXor(P,Q,pxorq);
  SimpleNot simpleNotP(P,notp);
  SimpleNot simpleNotQ(Q,notq);
  
  
  // clock with period of 10 units and input stimuli
  initial begin
   

    forever
      begin
		#5 clk = 0 ;        
		#5 clk = 1 ;P=0;Q=0;
		#5 clk = 0 ;		
		#5 clk = 1 ;P=0;Q=1;
		#5 clk = 0 ;        
		#5 clk = 1 ;P=1;Q=0;
		#5 clk = 0 ;        
		#5 clk = 1 ;P=1;Q=1;
		
      end
    end

	
/*	
	
  //Display Forever
  initial begin
    #1
	$display("-+-+-+-------+-------+-------+-------+-------+");	
    $display("C|P|Q|P AND Q|P OR Q |NOT P  |NOT Q  |P XOR Q|");
	$display("-+-+-+-------+-------+-------+-------+-------+");
	forever
    begin
	#1 	$display("%b|%b|%b|%7b|%7b|%7b|%7b|%7b|",clk,P,Q,pandq,porq,notp,notq,pxorq);		
	end
 end
  

///Shutoff
initial begin
#49
$finish;
end  

*/
	
//Pretty Form

  initial begin
    #1
	$display("-+-+-+-------+-------+-------+-------+-------+");	
    $display("C|P|Q|P AND Q|P OR Q |NOT P  |NOT Q  |P XOR Q|");
	$display("-+-+-+-------+-------+-------+-------+-------+");
	#5 	$display("%b|%b|%b|%7b|%7b|%7b|%7b|%7b|",clk,P,Q,pandq,porq,notp,notq,pxorq);		
	#5 	$display("%b|%b|%b|%7b|%7b|%7b|%7b|%7b|",clk,P,Q,pandq,porq,notp,notq,pxorq);		
	$display("-+-+-+-------+-------+-------+-------+-------+");
	#5 	$display("%b|%b|%b|%7b|%7b|%7b|%7b|%7b|",clk,P,Q,pandq,porq,notp,notq,pxorq);		
	#5 	$display("%b|%b|%b|%7b|%7b|%7b|%7b|%7b|",clk,P,Q,pandq,porq,notp,notq,pxorq);		
	$display("-+-+-+-------+-------+-------+-------+-------+");	
	#5 	$display("%b|%b|%b|%7b|%7b|%7b|%7b|%7b|",clk,P,Q,pandq,porq,notp,notq,pxorq);		
	#5 	$display("%b|%b|%b|%7b|%7b|%7b|%7b|%7b|",clk,P,Q,pandq,porq,notp,notq,pxorq);		
	$display("-+-+-+-------+-------+-------+-------+-------+");	
	#5 	$display("%b|%b|%b|%7b|%7b|%7b|%7b|%7b|",clk,P,Q,pandq,porq,notp,notq,pxorq);		
	#5 	$display("%b|%b|%b|%7b|%7b|%7b|%7b|%7b|",clk,P,Q,pandq,porq,notp,notq,pxorq);		
	$display("-+-+-+-------+-------+-------+-------+-------+");	
	#5 	$display("%b|%b|%b|%7b|%7b|%7b|%7b|%7b|",clk,P,Q,pandq,porq,notp,notq,pxorq);		
	#5 	$display("%b|%b|%b|%7b|%7b|%7b|%7b|%7b|",clk,P,Q,pandq,porq,notp,notq,pxorq);		
	$display("-+-+-+-------+-------+-------+-------+-------+");	
	$finish;
  end
  
  
endmodule
