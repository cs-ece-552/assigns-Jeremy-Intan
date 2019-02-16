/*
    shift right 8 bit
*/
module right_8 (In, Op, Out);
    parameter   N = 16;
    
    input [N-1:0]  In;
    input Op;
    output [N-1:0] Out;
    
    assign Out[15:8] = Op ? 8'b0 : {8{In[15]}};
    assign Out[7:0] = In[15:8];
endmodule