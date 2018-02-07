/**
* Main.v - Homework #1 - Problem 3.34b
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

    wire notC;
    wire notCD;
    wire BC;
    wire BCD;
    wire notCDorBCD;
    wire notD;
    wire CnotD;
    wire notCDorBCDorCnotD;
    wire notA;
    wire notAorB;
    wire result;

    SimpleNot simpleNot1(C, notC);
    SimpleAnd simpleAnd1(notC, D, notCD);
    SimpleAnd simpleAnd2(B, C, BC);
    SimpleAnd simpleAnd3(BC, D, BCD);
    SimpleOr simpleOr1(notCD, BCD, notCDorBCD);
    SimpleNot simpleNot2(D, notD);
    SimpleAnd simpleAnd4(C, notD, CnotD);
    SimpleOr simpleOr2(notCDorBCD, CnotD, notCDorBCDorCnotD);
    SimpleNot simpleNot5(A, notA);
    SimpleOr simpleOr3(notA, B, notAorB);
    SimpleAnd simpleAnd6(notCDorBCDorCnotD, notAorB, result);

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