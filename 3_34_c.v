/**
* Main.v - Homework #1 - Problem 3.34c
* Software: iVerilog, http://iverilog.icarus.com/
* Jacob Greenway, James Dunlap, Nicholas Smith, Ian Llewellyn
*/

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

module SimpleNot(x,notx);
    input x;
    output notx;
    reg notx;
    always @(*) begin
    notx= !x;
    end
endmodule

module main;

    reg clock;
    reg A;
    reg B;
    reg C;
    reg D;

    wire AB;
    wire ABorC;
    wire ABorCD;
    wire notB;
    wire notBC;
    wire ABorCDornotBC;

    SimpleAnd simpleAnd1(A, B, AB);
    SimpleOr simpleOr1(AB, C, ABorC);
    SimpleAnd simpleAnd2(ABorC, D, ABorCD);
    SimpleNot simpleNot1(B, notB);
    SimpleAnd simpleAnd3(notB, C, notBC);
    SimpleOr simpleOr2(ABorCD, notBC, result);

    initial begin
        forever begin
            #5 clock=0; A=1; B=1; C=1; D=1;
            #5 clock=1; A=1; B=1; C=1; D=0;
            #5 clock=0; A=1; B=1; C=0; D=1;
            #5 clock=1; A=1; B=1; C=0; D=0;
            #5 clock=0; A=1; B=0; C=1; D=1;
            #5 clock=1; A=1; B=0; C=1; D=0;
            #5 clock=0; A=1; B=0; C=0; D=1;
            #5 clock=1; A=1; B=0; C=0; D=0;
            #5 clock=0; A=0; B=1; C=1; D=1;
            #5 clock=1; A=0; B=1; C=1; D=0;
            #5 clock=0; A=0; B=1; C=0; D=1;
            #5 clock=1; A=0; B=1; C=0; D=0;
            #5 clock=0; A=0; B=0; C=1; D=1;
            #5 clock=1; A=0; B=0; C=1; D=0;
            #5 clock=0; A=0; B=0; C=0; D=1;
            #5 clock=1; A=0; B=0; C=0; D=0;
        end
    end

    initial begin
        #1
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Result: %b", clock, A, B, C, D, result);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Result: %b", clock, A, B, C, D, result);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Result: %b", clock, A, B, C, D, result);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Result: %b", clock, A, B, C, D, result);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Result: %b", clock, A, B, C, D, result);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Result: %b", clock, A, B, C, D, result);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Result: %b", clock, A, B, C, D, result);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Result: %b", clock, A, B, C, D, result);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Result: %b", clock, A, B, C, D, result);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Result: %b", clock, A, B, C, D, result);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Result: %b", clock, A, B, C, D, result);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Result: %b", clock, A, B, C, D, result);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Result: %b", clock, A, B, C, D, result);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Result: %b", clock, A, B, C, D, result);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Result: %b", clock, A, B, C, D, result);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Result: %b", clock, A, B, C, D, result);
        $finish;
    end
endmodule