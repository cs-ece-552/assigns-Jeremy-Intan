/*
    shift left/rotate left 2 bit
 */
module left_2 (In, Op, Out);
    parameter   N = 16;
    
    input [N-1:0]  In;
    input Op;
    output [N-1:0] Out;
    
    assign Out[1:0] = Op ? 2'b0 : In[15:14];
    assign Out[15:2] = In[13:0];
endmodule