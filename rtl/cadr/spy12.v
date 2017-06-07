module SPY12 (clk, reset, spy_out, ir, spy_mdh, spy_mdl, state_write, spy_vmah, spy_vmal, spy_obh_, spy_obl_, md, vma, ob, opc, waiting, boot,promdisable, stathalt, dbread, nop,spy_obh, spy_obl, spy_pc, spy_opc, spy_scratch, spy_irh, spy_irm, spy_irl,spy_disk, spy_bd, pc, err, scratch, spy_sth, spy_stl, spy_ah, spy_al, spy_mh, spy_ml, spy_flag2, spy_flag1, m, a, bd_state_in, wmap, ssdone,vmaok,destspc,jcond, srun,pcs1,pcs0,iwrited,imod,pdlwrite,spush );

   input wmap, ssdone,vmaok,jcond,pcs1,pcs0,iwrited,imod;
   input nop;
   input srun;
   input destspc;
   input clk, reset;
   output [15:0] spy_out;
   input [48:0]  ir;
   input	 state_write;
   input	 spy_mdh, spy_mdl, spy_vmah, spy_vmal, spy_obh_, spy_obl_;
   input	 spy_disk, spy_bd;
   input [31:0]  md;
   input [31:0]  ob;
   input [13:0]  opc;
   input [13:0]  pc;
   input [31:0]  vma;
   input	 waiting;
   input	 boot;
   input	 promdisable, stathalt, dbread;
   input	 err;
   input [15:0]  scratch;
   input	 pdlwrite;
   input	 spush;
   input [11:0]  bd_state_in;
   input [31:0]  m;
   input [31:0]  a;
   input	 spy_obh, spy_obl, spy_pc, spy_opc, spy_scratch, spy_irh, spy_irm, spy_irl;
   input	 spy_sth, spy_stl, spy_ah, spy_al, spy_mh, spy_ml, spy_flag2, spy_flag1;

   reg [31:0]	 ob_last;

   /* grab ob from last cycle for spy */
   always @(posedge clk)
     if (reset)
       ob_last <= 0;
     else
       if (/*state_fetch*/state_write)
	 ob_last <= ob;

   wire [15:0]	 spy_mux;

   assign spy_out = dbread ? spy_mux : 16'b1111111111111111;

   wire [4:0]	 disk_state_in;

   assign spy_mux =
		   spy_irh ? ir[47:32] :
		   spy_irm ? ir[31:16] :
		   spy_irl ? ir[15:0] :
		   spy_obh ? ob_last[31:16] :
		   spy_obl ? ob_last[15:0] :
		   spy_obh_ ? ob[31:16] :
		   spy_obl_ ? ob[15:0] :
		   spy_disk ? { 11'b0, disk_state_in } :
		   spy_bd ? { 4'b0, bd_state_in } :
		   spy_ah ? a[31:16] :
		   spy_al ? a[15:0] :
		   spy_mh ? m[31:16] :
		   spy_ml ? m[15:0] :
		   spy_mdh ? md[31:16] :
		   spy_mdl ? md[15:0] :
		   spy_vmah ? vma[31:16] :
		   spy_vmal ? vma[15:0] :
		   spy_flag2 ?
		   { 2'b0,wmap,destspc,iwrited,imod,pdlwrite,spush,
		     2'b0,ir[48],nop,vmaok,jcond,pcs1,pcs0 } :
		   spy_opc ?
		   { 2'b0,opc } :
		   spy_flag1 ?
		   { waiting, 1'b0, boot, promdisable,
		     stathalt, err, ssdone, srun,
		     1'b0, 1'b0, 1'b0, 1'b0,
		     1'b0, 1'b0, 1'b0, 1'b0 } :
		   spy_pc ?
		   { 2'b0,pc } :
		   spy_scratch ? scratch :
		   16'b1111111111111111;

endmodule
