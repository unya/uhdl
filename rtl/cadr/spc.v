// TK	CADR	SPC MEMORY AND POINTER

module SPC(clk, reset, spcnt, state_fetch, spush, spcptr, spco, spcw,srp,swp);

   input clk;
   input reset;

   input spcnt;
   output [18:0] spco;
   input 	srp;
   input 	swp;
   input [18:0] spcw;
   input spush;
   input state_fetch;
   output [4:0] spcptr;

   ////////////////////////////////////////////////////////////////////////////////

   reg [4:0]	spcptr;

   // orig rtl:
   //  pop  = read[p], decr p
   //  push = incr p, write[p]

   // spcpop = read[spcptr] (state_write), spcptr-- (state_fetch)
   // spcpush = write[spcptr+1] (state_write), spcptr++ (state_fetch)

   wire [4:0] spcptr_p1;

   assign spcptr_p1 = spcptr + 5'b00001;

`define old_spc
`ifdef old_spc
   wire [4:0] spcadr;
   assign spcadr = (spcnt && spush) ? spcptr_p1 : spcptr;
`else
   reg [4:0]  spcadr;

   always @(posedge clk)
     if (reset)
       spcadr <= 0;
     else
       //       if (state_read)
       spcadr <= (spcnt && spush) ? spcptr_p1 : spcptr;
`endif

   part_32x19dpram i_SPC(
			 .reset(reset),

			 .clk_a(clk),
			 .address_a(spcptr),
			 .data_a(19'b0),
			 .q_a(spco),
			 .wren_a(1'b0),
			 .rden_a(srp && ~swp),

			 .clk_b(clk),
			 .address_b(spcadr),
			 .data_b(spcw),
			 .q_b(),
			 .wren_b(swp),
			 .rden_b(1'b0)
			 );

   always @(posedge clk)
     if (reset)
       spcptr <= 0;
     else
       if (state_fetch)
	 begin
	    if (spcnt)
	      begin
		 if (spush)
		   spcptr <= spcptr + 5'd1;
		 else
		   spcptr <= spcptr - 5'd1;
	      end
	 end

endmodule
