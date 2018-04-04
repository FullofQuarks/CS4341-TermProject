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
	
	//DEFINE THE PARAMETERS
	input x;//Default to a wire
	output notx;
	reg notx;//specifically typecase to a register.
	
	
	//SET UP TIME CONDITION
	always @(*) begin
	
	//FINALLY, SOME WORKING CODE
	notx= !x;
	
	end //END TIME CONDITION
endmodule //END THE MODULE


module SimpleNand(x,y,xnandy);
	input x;
	input y;
	output xnandy;
	reg xnandy;
	always @(*) begin
	xnandy= !(x & y);
	end
endmodule

module CircuitXOR(A,B,AxorB);
	input A;
	input B;
	output AxorB;
	reg AxorB;

	wire t1;
	wire t2;
	
	wire t3;
	wire t4;

	wire t5;
	
	//First Column of Gates
	SimpleNand nand1(A,A,t1);//Not A
	SimpleNand nand2(B,B,t2);//Not B

	//Second Column of Gates
	SimpleNand nand3(t1,B,t3);//NOT A NAND B
	SimpleNand nand4(A,t2,t4);//A NAND NOT B
	
	//Third Column of Gates
	SimpleNand nand5(t3,t4,t5);
	
	always @(*) begin
	AxorB=t5;
	end
	
endmodule



//=============================================
// Test Bench
//=============================================
module Test_Bench ;
  reg clk;//These are only one bit.
  reg P;
  reg Q;

  
  wire pnandq;
  wire pxorq;
 
    
  SimpleNand simpleNand(P,Q,pnandq);
  CircuitXOR circuitXOR(P,Q,pxorq);

  
  
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
	$display("-+-+-+--------+-------+");	
    $display("C|P|Q|P NAND Q|P XOR Q|");
	$display("-+-+-+--------+-------+");
	forever
    begin
	#1 	$display("%b|%b|%b|%8b|%7b|",clk,P,Q,pnandq,pxorq);		
	end
 end
*/
initial begin
#1
	$display("-+-+-+--------+-------+");	
    $display("C|P|Q|P NAND Q|P XOR Q|");
	$display("-+-+-+--------+-------+");
 
  
	#1 	    $display("%b|%b|%b|%8b|%7b|",clk,P,Q,pnandq,pxorq);
	#10 	$display("%b|%b|%b|%8b|%7b|",clk,P,Q,pnandq,pxorq);
	#10 	$display("%b|%b|%b|%8b|%7b|",clk,P,Q,pnandq,pxorq);
	#10 	$display("%b|%b|%b|%8b|%7b|",clk,P,Q,pnandq,pxorq);
	#10 	$display("%b|%b|%b|%8b|%7b|",clk,P,Q,pnandq,pxorq);
	
	$display("-+-+-+--------+-------+");
end 

///Shutoff
initial begin
#49
$finish;
end  

 

  
endmodule
