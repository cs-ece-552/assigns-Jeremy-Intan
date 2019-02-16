/*
    CS/ECE 552 Spring '19
    Homework #4, Problem 1
    
    A barrel shifter module.  It is designed to shift a number via rotate
    left, shift left, shift right arithmetic, or shift right logical based
    on the Op() value that is passed in (2 bit number).  It uses these
    shifts to shift the value any number of bits between 0 and 15 bits.
 */
module barrelShifter (In, Cnt, Op, Out);

   // declare constant for size of inputs, outputs (N) and # bits to shift (C)
   
   parameter   N = 16;
   parameter   C = 4;
   parameter   O = 2;

   input [N-1:0]   In;
   input [C-1:0]   Cnt;
   input [O-1:0]   Op;
   output [N-1:0]  Out;

   /* YOUR CODE HERE */
   wire [N-1:0] barrel_1;
   wire [N-1:0] barrel_2;
   wire [N-1:0] barrel_4;
   
   wire [N-1:0] left_out_1;
   wire [N-1:0] left_out_2;
   wire [N-1:0] left_out_4;
   wire [N-1:0] left_out_8;

   wire [N-1:0] right_out_1;
   wire [N-1:0] right_out_2;
   wire [N-1:0] right_out_4;
   wire [N-1:0] right_out_8;
   
   left_1 LEFT_1(.In(In), .Op(Op[0]), .Out(left_out_1));
   left_2 LEFT_2(.In(barrel_1), .Op(Op[0]), .Out(left_out_2));
   left_4 LEFT_4(.In(barrel_2), .Op(Op[0]), .Out(left_out_4));
   left_8 LEFT_8(.In(barrel_4), .Op(Op[0]), .Out(left_out_8));
   
   right_1 RIGHT_1(.In(In), .Op(Op[0]), .Out(right_out_1));
   right_2 RIGHT_2(.In(barrel_1), .Op(Op[0]), .Out(right_out_2));
   right_4 RIGHT_4(.In(barrel_2), .Op(Op[0]), .Out(right_out_4));
   right_8 RIGHT_8(.In(barrel_4), .Op(Op[0]), .Out(right_out_8));
   
   assign barrel_1 = Cnt[0] ? (Op[1] ? right_out_1 : left_out_1) : In;
   assign barrel_2 = Cnt[1] ? (Op[1] ? right_out_2 : left_out_2) : barrel_1;
   assign barrel_4 = Cnt[2] ? (Op[1] ? right_out_4 : left_out_4) : barrel_2;
   assign Out = Cnt[3] ? (Op[1] ? right_out_8 : left_out_8) : barrel_4;
   
endmodule
