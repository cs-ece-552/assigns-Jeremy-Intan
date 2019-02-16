/*
    shift left/rotate left 4 bit
 */
module left_4 (In, Op, Out);
    parameter   N = 16;
    
    input [N-1:0]  In;
    input Op;
    output [N-1:0] Out;
    
    assign Out[3:0] = Op ? 4'b0 : In[15:12];
    assign Out[15:4] = In[11:0];
endmodule