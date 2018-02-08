/**
* Main.v - Homework #1 - Problem 3.34a
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

    wire notB;
    wire notC;
    wire AorNotB;
    wire AorNotBAndNotC;
    wire CorD;
    wire result1;

    SimpleNot simpleNot1a(B, notB);
    SimpleOr simpleOr1a(A, notB, AorNotB);
    SimpleNot simpleNot2a(C, notC);
    SimpleAnd simpleAnd1a(AorNotB, notC, AorNotBAndNotC);
    SimpleOr simpleOr2a(C, D, CorD);
    SimpleAnd simpleAnd2a(AorNotBAndNotC, CorD, result1);

    wire notCD;
    wire BC;
    wire BCD;
    wire notCDorBCD;
    wire notD;
    wire CnotD;
    wire notCDorBCDorCnotD;
    wire notA;
    wire notAorB;
    wire result2;

    SimpleNot simpleNot1b(C, notC);
    SimpleAnd simpleAnd1b(notC, D, notCD);
    SimpleAnd simpleAnd2b(B, C, BC);
    SimpleAnd simpleAnd3b(BC, D, BCD);
    SimpleOr simpleOr1b(notCD, BCD, notCDorBCD);
    SimpleNot simpleNot2b(D, notD);
    SimpleAnd simpleAnd4b(C, notD, CnotD);
    SimpleOr simpleOr2b(notCDorBCD, CnotD, notCDorBCDorCnotD);
    SimpleNot simpleNot5b(A, notA);
    SimpleOr simpleOr3b(notA, B, notAorB);
    SimpleAnd simpleAnd6b(notCDorBCDorCnotD, notAorB, result2);

    wire AB;
    wire ABorC;
    wire ABorCD;
    wire notBC;
    wire ABorCDornotBC;
    wire result3;

    SimpleAnd simpleAnd1c(A, B, AB);
    SimpleOr simpleOr1c(AB, C, ABorC);
    SimpleAnd simpleAnd2c(ABorC, D, ABorCD);
    SimpleNot simpleNot1c(B, notB);
    SimpleAnd simpleAnd3c(notB, C, notBC);
    SimpleOr simpleOr2c(ABorCD, notBC, result3);

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
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Out_1: %b | Out_2: %b | Out_3: %b", clock, A, B, C, D, result1, result2, result3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Out_1: %b | Out_2: %b | Out_3: %b", clock, A, B, C, D, result1, result2, result3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Out_1: %b | Out_2: %b | Out_3: %b", clock, A, B, C, D, result1, result2, result3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Out_1: %b | Out_2: %b | Out_3: %b", clock, A, B, C, D, result1, result2, result3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Out_1: %b | Out_2: %b | Out_3: %b", clock, A, B, C, D, result1, result2, result3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Out_1: %b | Out_2: %b | Out_3: %b", clock, A, B, C, D, result1, result2, result3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Out_1: %b | Out_2: %b | Out_3: %b", clock, A, B, C, D, result1, result2, result3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Out_1: %b | Out_2: %b | Out_3: %b", clock, A, B, C, D, result1, result2, result3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Out_1: %b | Out_2: %b | Out_3: %b", clock, A, B, C, D, result1, result2, result3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Out_1: %b | Out_2: %b | Out_3: %b", clock, A, B, C, D, result1, result2, result3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Out_1: %b | Out_2: %b | Out_3: %b", clock, A, B, C, D, result1, result2, result3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Out_1: %b | Out_2: %b | Out_3: %b", clock, A, B, C, D, result1, result2, result3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Out_1: %b | Out_2: %b | Out_3: %b", clock, A, B, C, D, result1, result2, result3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Out_1: %b | Out_2: %b | Out_3: %b", clock, A, B, C, D, result1, result2, result3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Out_1: %b | Out_2: %b | Out_3: %b", clock, A, B, C, D, result1, result2, result3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Out_1: %b | Out_2: %b | Out_3: %b", clock, A, B, C, D, result1, result2, result3);
        $finish;
    end
endmodule