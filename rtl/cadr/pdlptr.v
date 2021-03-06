// PDLPTR --- PDL INDEX AND POINTER

module PDLPTR(clk, reset, pidrive, ppdrive, pdlidx, pdlptr, state_alu, state_write, state_fetch, state_read, destpdlx, srcpdlidx, srcpdlptr, ob, destpdlp, pdlcnt, srcpdlpop);

   input clk;
   input reset;

   input state_alu;
   input state_fetch;
   input state_read;
   input state_write;

   input [31:0] ob;
   input destpdlp;
   input destpdlx;
   input pdlcnt;
   input srcpdlidx;
   input srcpdlpop;
   input srcpdlptr;
   output [9:0] pdlidx;
   output [9:0] pdlptr;
   output pidrive;
   output ppdrive;

   ////////////////////////////////////////////////////////////////////////////////

   reg [9:0] pdlidx;
   reg [9:0] pdlptr;

   ////////////////////////////////////////////////////////////////////////////////

   assign pidrive = srcpdlidx & (state_alu || state_write || state_fetch);
   assign ppdrive = srcpdlptr & (state_alu || state_write || state_fetch);

   always @(posedge clk)
     if (reset)
       pdlidx <= 0;
     else
       if (state_write && destpdlx)
         pdlidx <= ob[9:0];

   always @(posedge clk)
     if (reset)
       pdlptr <= 0;
     else
       if (state_read)
         begin
            if (~destpdlp && pdlcnt && ~srcpdlpop)
              pdlptr <= pdlptr + 10'd1;
         end
       else
         if (state_fetch)
           begin
              if (destpdlp)
                pdlptr <= ob[9:0];
              else
                if (pdlcnt && srcpdlpop)
                  pdlptr <= pdlptr - 10'd1;
           end

endmodule
