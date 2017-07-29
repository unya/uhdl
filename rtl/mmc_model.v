// mmc_model.v --- simple MMC card behavioral model
//
// Very simple MMC card behavioral model.
//
// - Supports DI/DO SPI interface only.
// - MMC SPI init. sequence.
// - Single block read, single block write, 512 byte blocks.
// - Binary file for backing store.

module mmc_model(
                 input spiClk,
                 input spiDataIn,
                 output reg spiDataOut,
                 input spiCS_n
                 );

   reg [7:0] rxByte;
   reg [7:0] respByte;
   reg [3:0] state;
   reg [7:0] cnt;

   reg [7:0] cmdBytes[0:5];
   reg [7:0] rd_data[0:511];
   reg [7:0] wr_data[0:511];

   integer init_seq;
   integer respDelay;
   integer respCount;
   integer respIndex;
   integer i;
   integer blockSize;
   integer diskAddr;
   integer blockNumber;
`ifdef USE_FILE
   integer file_fd;
   integer file_ret;
`else
   reg [7:0] block0[0:511];
   reg [7:0] block1[0:511];
   reg [7:0] block2[0:511];
   reg [7:0] block3[0:511];
`endif

   integer debug = 0;

   parameter [3:0]
     POWERUP = 4'd0,
     IDLE = 4'd1,
     CMD = 4'd2,
     CMD_RESP = 4'd3,
     READ = 4'd4,
     READ_RESP = 4'd5,
     WRITE = 4'd6,
     WRITE_DATA = 4'd7;

   initial
     begin
        state = POWERUP;
        spiDataOut = 0;
        init_seq = 0;

        blockSize = 512;

`ifdef USE_FILE
        file_fd = $fopen("disk.img", "rw");
`else
        for (i = 0; i < 512; i = i + 1)
          begin
             block0[i] = i;
             block1[i] = i;
             block2[i] = i;
             block3[i] = i;
          end
`endif
     end

   task txRxByte;
      input [7:0] txData;
      output [7:0] rxData;

      integer i;
      begin
         if (debug) $display("MMC: txRxByte txData %x; %t", txData, $time);
         spiDataOut <= txData[7];
         for (i = 0; i < 8; i=i+1) begin
            @(posedge spiClk);
            if (spiCS_n == 0) begin
               rxData = rxData << 1;
               rxData[0] <= spiDataIn;
               if (debug) $display("txRxByte: bit %d <- %b (%x); %t", i, spiDataIn, rxData, $time);
               @(negedge spiClk);
               spiDataOut <= txData[6];
               txData = txData << 1;
            end
            else begin
               i = -1;
               @(negedge spiClk);
            end
         end
      end
   endtask

   task setRespByte;
      input [7:0] dataByte;
      input [31:0] delay;
      begin
         respByte = dataByte;
         respDelay = delay;
      end
   endtask

   task waitForCS;
      integer done, clk, oldclk, clkcnt;
      begin
         done = 0;
         oldclk = 0;
         clkcnt = 0;

         if (debug) $display("waitForCS: cs %b %t", spiCS_n, $time);

         while (done == 0)
           begin
              if (spiCS_n == 0)
                done = 1;

              if (spiDataIn == 1) begin
                 clk = spiClk;
                 if (clk && oldclk == 0) begin
                    clkcnt = clkcnt + 1;
                 end
                 oldclk = clk;
              end

              #1;
           end

         $display("waitForCS: clkcnt %d cs %b; %t", clkcnt, spiCS_n, $time);

         if (clkcnt > 74) begin
            state = IDLE;
            if (debug) $display("mmc_modem: IDLE");
         end
      end
   endtask

   task yield;
      begin
         #1;
      end
   endtask

   // Response state machine.
   always begin
      case (state)

        POWERUP: begin
           if (init_seq == 0) begin
              $display("MMC: powerup");
              init_seq = 1;
           end
           waitForCS;
           cnt = 0;
        end

        IDLE: begin
           txRxByte(8'hff, rxByte);
           if (rxByte == 8'hff) begin
              cnt = 0;
           end
           else begin
              $display("MMC: idle, byte %d = %x; %t", cnt, rxByte, $time);
              cmdBytes[cnt] = rxByte;
              cnt = cnt + 1;
              if (cnt == 6) begin
                 state = CMD;
                 if (debug) $display("mmc_modem: CMD");
              end
           end
        end

`define CMD0 8'h40
`define CMD1 8'h41
`define CMD16 8'h50
`define CMD17 8'h51
`define CMD24 8'h58

        CMD: begin
           case (cmdBytes[0])
             `CMD0: begin
                $display("MMC: cmd0; %t", $time);
                state = CMD_RESP;
                setRespByte(8'h01, 0);
             end
             `CMD1: begin
                $display("MMC: cmd1; %t", $time);
                state = CMD_RESP;
                setRespByte(8'h00, 0);
             end
             `CMD16: begin
                $display("MMC: cmd16");
                state = CMD_RESP;
                setRespByte(8'h00, 20);
                blockSize = { cmdBytes[1], cmdBytes[2], cmdBytes[3], cmdBytes[4] };
                $display("MMC: set blocksize %d bytes", blockSize);
             end
             `CMD17: begin
                $display("MMC: cmd17");
                state = CMD_RESP;
                setRespByte(8'h00, 20);
             end
             `CMD24: begin
                $display("MMC: cmd24");
                state = CMD_RESP;
                setRespByte(8'h00, 20);
             end
             default: begin
                state = CMD_RESP;
                setRespByte(8'h7f, 0);
             end
           endcase

           yield;
        end

        CMD_RESP: begin
           $display("MMC: cmd_resp; %t", $time);

           txRxByte(8'hff, rxByte);
           while (respDelay > 0) begin
              txRxByte(8'hff, rxByte);
              respDelay = respDelay - 1;
           end

           $display("MMC: send resp byte %x; %t", respByte, $time);
           txRxByte(respByte, rxByte);
           cnt = 0;
           state = IDLE;

           if (cmdBytes[0] == `CMD17)
             state = READ;
           if (cmdBytes[0] == `CMD24)
             state = WRITE;

           if (state == READ || state == WRITE)
             begin
                diskAddr = { cmdBytes[1], cmdBytes[2], cmdBytes[3], cmdBytes[4] };
                blockNumber = diskAddr / blockSize;
                $display("MMC: byte-offset=0x%x, block=%d", diskAddr, blockNumber);
             end

           cmdBytes[0] = 0;
        end

        READ: begin
           $display("MMC: read; %t", $time);
           state = READ_RESP;
           respCount = 512;
           respIndex = 0;

`ifdef USE_FILE
           file_ret = $fseek(file_fd, blockNumber*512, 0);
           file_ret = $fread(file_fd, rd_data);
`else
           case (blockNumber)
             0: for (i = 0; i < 512; i = i + 1) rd_data[i] = block0[i];
             1: for (i = 0; i < 512; i = i + 1) rd_data[i] = block1[i];
             2: for (i = 0; i < 512; i = i + 1) rd_data[i] = block2[i];
             3: for (i = 0; i < 512; i = i + 1) rd_data[i] = block3[i];
           endcase
`endif

           // Read token.
           txRxByte(8'hff, rxByte);
           txRxByte(8'hff, rxByte);
           txRxByte(8'hfe, rxByte);
        end

        READ_RESP: begin
           $display("MMC: read_resp");
           while (respCount > 0) begin
              txRxByte(rd_data[respIndex], rxByte);
              respIndex = respIndex + 1;
              respCount = respCount - 1;
           end
           cnt = 0;
           state = IDLE;
        end

        WRITE: begin
           $display("MMC: write %t", $time);
           state = WRITE_DATA;
           respCount = 512;
           respIndex = 0;
           // Write token.
           txRxByte(8'h00, rxByte);
        end

        WRITE_DATA: begin
           $display("MMC: write_data");
           while (respCount > 0) begin
              txRxByte(8'hff, rxByte);
              wr_data[respIndex] = rxByte;
              $display("MMC: write_data [%d] <- %x", respIndex, rxByte);
              respIndex = respIndex + 1;
              respCount = respCount - 1;
           end

           if (0) $display("MMC: write done %x %x %x %x", wr_data[0],wr_data[1],wr_data[2],wr_data[3]);

`ifdef USE_FILE
           file_ret = $fseek(file_fd, blockNumber*512, 0);
           $fwrite(file_fd, wr_data);
           $fflush(file_fd);
`else
           case (blockNumber)
             0: for (i = 0; i < 512; i = i + 1) block0[i] = wr_data[i];
             1: for (i = 0; i < 512; i = i + 1) block1[i] = wr_data[i];
             2: for (i = 0; i < 512; i = i + 1) block2[i] = wr_data[i];
             3: for (i = 0; i < 512; i = i + 1) block3[i] = wr_data[i];
           endcase
`endif
           // CRC.
           txRxByte(8'hff, rxByte);
           txRxByte(8'hff, rxByte);
           // Data response.
           txRxByte(8'h15, rxByte);

           cnt = 0;
           state = CMD_RESP;
           setRespByte(8'h01, 0);
        end

      endcase
   end

endmodule
