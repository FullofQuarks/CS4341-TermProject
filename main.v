/**
* Main.v - Homework #1 - Problem 3.34
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
    wire AorNotB;

    SimpleNot simpleNot(B, notB);
    SimpleOr simpleOr(A, notB, AorNotB);

    initial begin
        forever begin
            #5 clock = 0 ;A=0;B=0;
            #5 clock = 1 ;A=0;B=1;
            #5 clock = 0 ;A=1;B=0;
            #5 clock = 1 ;A=1;B=1;
        end
    end

    initial begin
        #1
        #5 $display("Clock: %b | A: %b | B: %b | notB: %b | AorNotB: %b", clock, A, B, notB, AorNotB);
        #5 $display("Clock: %b | A: %b | B: %b | notB: %b | AorNotB: %b", clock, A, B, notB, AorNotB);
        #5 $display("Clock: %b | A: %b | B: %b | notB: %b | AorNotB: %b", clock, A, B, notB, AorNotB);
        #5 $display("Clock: %b | A: %b | B: %b | notB: %b | AorNotB: %b", clock, A, B, notB, AorNotB);
        $finish;
    end
endmodule