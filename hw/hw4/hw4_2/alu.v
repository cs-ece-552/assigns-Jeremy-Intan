/*
    CS/ECE 552 Spring '19
    Homework #4, Problem 2

    A 16-bit ALU module.  It is designed to choose
    the correct operation to perform on 2 16-bit numbers from rotate
    left, shift left, shift right arithmetic, shift right logical, add,
    or, xor, & and.  Upon doing this, it should output the 16-bit result
    of the operation, as well as output a Zero bit and an Overflow
    (OFL) bit.
*/
module alu (A, B, Cin, Op, invA, invB, sign, Out, Zero, Ofl);

   // declare constant for size of inputs, outputs (N),
   // and operations (O)
   parameter    N = 16;
   parameter    O = 3;
   
   input [N-1:0] A;
   input [N-1:0] B;
   input         Cin;
   input [O-1:0] Op;
   input         invA;
   input         invB;
   input         sign;
   output [N-1:0] Out;
   output         Ofl;
   output         Zero;

   /* YOUR CODE HERE */
   
   wire [N-1:0] A_out;
   wire [N-1:0] B_out;
   wire [N-1:0] xor_out;
   wire [N-1:0] or_out;
   wire [N-1:0] and_out;
   wire [N-1:0] add_out;
   wire [N-1:0] barrel_out;
   wire Cout;
   
   always_comb@
      case(Op)
         3'b7: Out = xor_out;
         3'b6: Out = or_out;
         3'b5: Out = and_out;
         3'b4: Out = add_out;
         default : Out = barrel_out;
      endcase
      
   assign A_out = {N{invA}} ^ A;
   assign B_out = {N{invB}} ^ B;
   
   assign xor_out = A_out ^ B_out;
   assign or_out = A_out | B_out;
   assign and_out = A_out & B_out;
   
   assign Zero = ~(|Out);
   assign OFL = sign ? (A_out[15] & B_out[15] & ~Out[15]) | (~A_out[15] & ~B_out[15] & Out[15]) : Cout;
   
   rca_16b add_mod (.A(A_out), .B(B_out), .C_in(Cin), .S(add_out), .C_out(Cout));
   barrelShifter barrel_mod(.In(A_out), .Cnt(B_out[3:0]), .Op(Op[2:0]), .Out(barrel_out));
   
endmodule
