/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 2
    
    a 1-bit full adder
*/
module fullAdder_1b(A, B, C_in, S, C_out);
    input  A, B;
    input  C_in;
    output S;
    output C_out;

    wire AB_inv, BC_inv, AC_inv;
    xor3 get_s (.in1(A), .in2(B), .in3 (C_in), .out(S));
    nand2 get_AB (.in1(A), .in2(B), .out(AB_inv));
    nand2 get_BC (.in1(B), .in2(C_in), .out(BC_inv));
    nand2 get_AC (.in1(A), .in2(C_in), .out(AC_inv));
    nand3 get_cout (.in1(AB_inv), .in2(BC_inv), .in3(AC_inv), .out(C_out));
    
    // YOUR CODE HERE

endmodule
