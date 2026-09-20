`timescale 1ns/1ps

module tb;

    reg  [3:0] a;
    reg  [3:0] b;
    reg        op;
    wire [3:0] result;

    // Instantiate ALU
    alu uut (
        .a(a),
        .b(b),
        .op(op),
        .result(result)
    );

    initial begin

        $monitor("Time=%0t | op=%b | a=%b (%d) | b=%b (%d) | result=%b (%d)",
                 $time, op, a, a, b, b, result, result);

        // -------------------------
        // ADDITION TESTS
        // -------------------------

        op = 1'b0;
        a  = 4'b0011;
        b  = 4'b0010;
        #10;

        op = 1'b0;
        a  = 4'b0101;
        b  = 4'b0011;
        #10;

        op = 1'b0;
        a  = 4'b1111;
        b  = 4'b0001;
        #10;

        // -------------------------
        // SUBTRACTION TESTS
        // -------------------------

        op = 1'b1;
        a  = 4'b0101;
        b  = 4'b0011;
        #10;

        op = 1'b1;
        a  = 4'b1000;
        b  = 4'b0011;
        #10;

        op = 1'b1;
        a  = 4'b0011;
        b  = 4'b0101;
        #10;

        // -------------------------
        // CHANGE ONLY OP
        // Helps detect sensitivity-list issues
        // -------------------------

        a = 4'b0110;
        b = 4'b0010;

        op = 1'b0;   // 6 + 2 = 8
        #10;

        op = 1'b1;   // 6 - 2 = 4
        #10;

        op = 1'b0;   // 6 + 2 = 8
        #10;

        op = 1'b1;   // 6 - 2 = 4
        #10;

        $finish;
    end

endmodule