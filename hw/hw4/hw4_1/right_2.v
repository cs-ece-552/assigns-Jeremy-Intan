/*
    shift right 2 bit
*/
module right_2 (In, Op, Out);
    parameter   N = 16;
    
    input [N-1:0]  In;
    input Op;
    output [N-1:0] Out;
    
    assign Out[15:14] = Op ? 2'b0 : {2{In[15]}};
    assign Out[13:0] = In[15:2];
endmodule