module PDCTL(clk, reset, pdlidx, pdla, pdlp, pdlwrite, state_alu, state_write, state_read, ir, pwidx, pwp, prp, pdlenb, pdldrive, pdlcnt, pdlptr, destpdltop, destpdl_x, destpdl_p, srcpdlpop, state_mmu, nop, srcpdltop, state_fetch);

   input clk;
   input reset;

   input [48:0] ir;
   input [9:0]	pdlidx;
   input [9:0]	pdlptr;
   input	destpdl_p;
   input	destpdl_x;
   input	destpdltop;
   input	nop;
   input	srcpdlpop;
   input	srcpdltop;
   input	state_alu;
   input	state_fetch;
   input	state_mmu;
   input	state_read;
   input	state_write;
   output [9:0] pdla;
   output	pdlcnt;
   output	pdldrive;
   output	pdlenb;
   output	pdlp;
   output	pdlwrite;
   output	prp;
   output	pwidx;
   output	pwp;

   ////////////////////////////////////////////////////////////////////////////////

   reg		pwidx;

   /* m-src = pdl buffer, or index based write */
   assign pdlp = (state_read & ir[30]) | (~state_read & ~pwidx);

   assign pdla = pdlp ? pdlptr : pdlidx;

   assign pdlwrite = destpdltop | destpdl_x | destpdl_p;

   always @(posedge clk)
     if (reset)
       begin
	  pwidx <= 0;
       end
     else
       if (state_alu | state_write)
	 begin
	    pwidx <= destpdl_x;
	 end

   assign pwp = pdlwrite & state_write;
   assign prp = pdlenb && state_read;

   assign pdlenb = srcpdlpop | srcpdltop;

   assign pdldrive = pdlenb &
		     (state_alu || state_write || state_mmu || state_fetch);

   assign pdlcnt = (~nop & srcpdlpop) | destpdl_p;

endmodule