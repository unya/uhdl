// DSPCTL --- DISPATCH CONTROL

module DSPCTL(clk, reset, state_fetch, irdisp, funct, ir, dmask, dmapbenb, dispwr, dc);

   input clk;
   input reset;

   input state_fetch;

   input [3:0] funct;
   input [48:0] ir;
   input irdisp;
   output [6:0] dmask;
   output [9:0] dc;
   output dispwr;
   output dmapbenb;

   ////////////////////////////////////////////////////////////////////////////////

   reg [9:0] dc;
   wire nc_dmask;

   ////////////////////////////////////////////////////////////////////////////////

   assign dmapbenb = ir[8] | ir[9];
   assign dispwr = irdisp & funct[2];

   always @(posedge clk)
     if (reset)
       dc <= 0;
     else
       if (state_fetch && irdisp)
         dc <= ir[41:32];

   part_32x8prom i_DMASK(.clk(~clk), .addr({1'b0, 1'b0, ir[7], ir[6], ir[5]}), .q({nc_dmask, dmask[6:0]}));

endmodule
