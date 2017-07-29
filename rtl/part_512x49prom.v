// part_512x49prom.v --- 512x49 ROM

`ifdef SIMULATION
 `define debug_patch_rom
`endif

module part_512x49prom(clk, addr, q);

   input clk;
   input [8:0] addr;
   output [48:0] q;
   reg [48:0] q;

`ifdef no_rom
   always @(posedge clk)
     q <= 49'h000000000000;
`else

   always @(posedge clk)
     begin
        case (addr)
          9'h000: q = 49'h800000000000;
          9'h001: q = 49'h800000000000;
          9'h002: q = 49'h800000000000;
          9'h003: q = 49'h800000000000;
          9'h004: q = 49'h800000000000;
          9'h005: q = 49'h800000000000;
          9'h006: q = 49'h800000000000;
          9'h007: q = 49'h800000000000;
          9'h008: q = 49'h800000000000;
          9'h009: q = 49'h800000000000;
          9'h00a: q = 49'h800000000000;
          9'h00b: q = 49'h800000000000;
          9'h00c: q = 49'h800000000000;
          9'h00d: q = 49'h800000000000;
          9'h00e: q = 49'h800000000000;
          9'h00f: q = 49'h800000000000;
          9'h010: q = 49'h800000000000;
          9'h011: q = 49'h800000000000;
          9'h012: q = 49'h800000000000;
          9'h013: q = 49'h800000000000;
          9'h014: q = 49'h800000000000;
          9'h015: q = 49'h800000000000;
          9'h016: q = 49'h800000000000;
          9'h017: q = 49'h800000000000;
          9'h018: q = 49'h800000000000;
          9'h019: q = 49'h800000000000;
          9'h01a: q = 49'h800000000000;
          9'h01b: q = 49'h800000000000;
          9'h01c: q = 49'h800000000000;
          9'h01d: q = 49'h800000000000;
          9'h01e: q = 49'h800000000000;
          9'h01f: q = 49'h800000000000;
          9'h020: q = 49'h800000000000;
          9'h021: q = 49'h800000000000;
          9'h022: q = 49'h800000000000;
          9'h023: q = 49'h800000000000;
          9'h024: q = 49'h800000000000;
          9'h025: q = 49'h800000000000;
          9'h026: q = 49'h800000000000;
          9'h027: q = 49'h800000000000;
          9'h028: q = 49'h800000000000;
          9'h029: q = 49'h800000000000;
          9'h02a: q = 49'h800000000000;
          9'h02b: q = 49'h800000000000;
          9'h02c: q = 49'h800000000000;
          9'h02d: q = 49'h800000000000;
          9'h02e: q = 49'h800000000000;
          9'h02f: q = 49'h800000000000;
          9'h030: q = 49'h800000000000;
          9'h031: q = 49'h800000000000;
          9'h032: q = 49'h800000000000;
          9'h033: q = 49'h800000000000;
          9'h034: q = 49'h800000000000;
          9'h035: q = 49'h800000000000;
          9'h036: q = 49'h800000000000;
          9'h037: q = 49'h800000000000;
          9'h038: q = 49'h800000000000;
          9'h039: q = 49'h800000000000;
          9'h03a: q = 49'h800000000000;
          9'h03b: q = 49'h800000000000;
          9'h03c: q = 49'h800000000000;
          9'h03d: q = 49'h800000000000;
          9'h03e: q = 49'h800000000000;
          9'h03f: q = 49'h800000000000;
          9'h040: q = 49'h800000000000;
          9'h041: q = 49'h800000000000;
          9'h042: q = 49'h800000000000;
          9'h043: q = 49'h800000000000;
          9'h044: q = 49'h800000000000;
          9'h045: q = 49'h0034080010b7;
          9'h046: q = 49'h84009e0d1018;
          9'h047: q = 49'h0834080002a2;
          9'h048: q = 49'h8034260d1030;
          9'h049: q = 49'h8008080210b4;
          9'h04a: q = 49'h800920021128;
          9'h04b: q = 49'h8834081b7022;
          9'h04c: q = 49'h800920021109;
          9'h04d: q = 49'h000920023109;
          9'h04e: q = 49'h000920023109;
          9'h04f: q = 49'h000920023109;
          9'h050: q = 49'h000920023109;
          9'h051: q = 49'h000920023109;
          9'h052: q = 49'h000920023109;
          9'h053: q = 49'h000920023109;
          9'h054: q = 49'h000920023109;
          9'h055: q = 49'h000920023109;
          9'h056: q = 49'h000920023109;
          9'h057: q = 49'h000920023109;
          9'h058: q = 49'h000920023109;
          9'h059: q = 49'h000920023109;
          9'h05a: q = 49'h000920023109;
          9'h05b: q = 49'h000920023109;
          9'h05c: q = 49'h000920023109;
          9'h05d: q = 49'h000920023109;
          9'h05e: q = 49'h000920023109;
          9'h05f: q = 49'h000920023109;
          9'h060: q = 49'h000920023109;
          9'h061: q = 49'h000920023109;
          9'h062: q = 49'h000920023109;
          9'h063: q = 49'h000920023109;
          9'h064: q = 49'h000920023109;
          9'h065: q = 49'h000920023109;
          9'h066: q = 49'h000920023109;
          9'h067: q = 49'h000920023109;
          9'h068: q = 49'h000920023109;
          9'h069: q = 49'h000920023109;
          9'h06a: q = 49'h000920023109;
          9'h06b: q = 49'h000920023109;
          9'h06c: q = 49'h88009c022080;
          9'h06d: q = 49'h800908023149;
          9'h06e: q = 49'h0034080010b7;
          9'h06f: q = 49'h8000220d101b;
          9'h070: q = 49'h880220192061;
          9'h071: q = 49'h0800000002a7;
          9'h072: q = 49'h0802200200e3;
          9'h073: q = 49'h002aa8021008;
          9'h074: q = 49'h8800a81890c0;
          9'h075: q = 49'h8800000140a4;
          9'h076: q = 49'h003000881028;
          9'h077: q = 49'h8800000140a4;
          9'h078: q = 49'h0020a09010c8;
          9'h079: q = 49'h8800000140a4;
          9'h07a: q = 49'h0020a09010c8;
          9'h07b: q = 49'h8008a8c01038;
          9'h07c: q = 49'h98089c0230e8;
          9'h07d: q = 49'h002e00025028;
          9'h07e: q = 49'h88000018f127;
          9'h07f: q = 49'h18029cc03170;
          9'h080: q = 49'h802f00025028;
          9'h081: q = 49'h88000018f127;
          9'h082: q = 49'h8800000140a4;
          9'h083: q = 49'h0020a09010c8;
          9'h084: q = 49'h98020cc03100;
          9'h085: q = 49'h8800000140a4;
          9'h086: q = 49'h003000901028;
          9'h087: q = 49'h000024c01018;
          9'h088: q = 49'h8800000140a4;
          9'h089: q = 49'h18020c903120;
          9'h08a: q = 49'h980210c021e8;
          9'h08b: q = 49'h0800a81720c0;
          9'h08c: q = 49'h8800000140a4;
          9'h08d: q = 49'h003000881028;
          9'h08e: q = 49'h802500025028;
          9'h08f: q = 49'h000000025000;
          9'h090: q = 49'h880000172027;
          9'h091: q = 49'h0800000002a7;
          9'h092: q = 49'h88022416a0e3;
          9'h093: q = 49'h8029a8025008;
          9'h094: q = 49'h8800000140a4;
          9'h095: q = 49'h003000881028;
          9'h096: q = 49'h002b00025028;
          9'h097: q = 49'h080000172127;
          9'h098: q = 49'h800000021000;
          9'h099: q = 49'h18090c027008;
          9'h09a: q = 49'h080000172127;
          9'h09b: q = 49'h002400025028;
          9'h09c: q = 49'h800000021000;
          9'h09d: q = 49'h800000011000;
          9'h09e: q = 49'h0800a8158097;
          9'h09f: q = 49'h8800000140a4;
          9'h0a0: q = 49'h003000881028;
          9'h0a1: q = 49'h8800000140a4;
          9'h0a2: q = 49'h8021a09010c8;
          9'h0a3: q = 49'h803000801028;
          9'h0a4: q = 49'h800200c01028;
          9'h0a5: q = 49'h8800a81580c0;
          9'h0a6: q = 49'h8800000140a4;
          9'h0a7: q = 49'h003000881028;
          9'h0a8: q = 49'h00320a0c90cc;
          9'h0a9: q = 49'h88000014b027;
          9'h0aa: q = 49'h800000011000;
          9'h0ab: q = 49'h08000016f127;
          9'h0ac: q = 49'h003200021028;
          9'h0ad: q = 49'h00330e0cd0c8;
          9'h0ae: q = 49'h88330801e0e1;
          9'h0af: q = 49'h000000029000;
          9'h0b0: q = 49'h0020280290c8;
          9'h0b1: q = 49'h8400a8011018;
          9'h0b2: q = 49'h8800000140a4;
          9'h0b3: q = 49'h000028881018;
          9'h0b4: q = 49'h8827281500e1;
          9'h0b5: q = 49'h0000a0901018;
          9'h0b6: q = 49'h080000006027;
          9'h0b7: q = 49'h88028c1450e3;
          9'h0b8: q = 49'h00008c5810e4;
          9'h0b9: q = 49'h000096001018;
          9'h0ba: q = 49'h98028c70312e;
          9'h0bb: q = 49'h08008c1410db;
          9'h0bc: q = 49'h00008c5810e4;
          9'h0bd: q = 49'h800094001018;
          9'h0be: q = 49'h18028c70308e;
          9'h0bf: q = 49'h800000581000;
          9'h0c0: q = 49'h18240c803009;
          9'h0c1: q = 49'h18230cc03005;
          9'h0c2: q = 49'h00270000102b;
          9'h0c3: q = 49'h800000011000;
          9'h0c4: q = 49'h08000016f127;
          9'h0c5: q = 49'h002000021028;
          9'h0c6: q = 49'h800010481018;
          9'h0c7: q = 49'h880000133027;
          9'h0c8: q = 49'h80201c01d0b4;
          9'h0c9: q = 49'h08000014b127;
          9'h0ca: q = 49'h08021001c0e3;
          9'h0cb: q = 49'h1802180112b6;
          9'h0cc: q = 49'h88021c13a0a3;
          9'h0cd: q = 49'h8020186010b4;
          9'h0ce: q = 49'h8020180190b4;
          9'h0cf: q = 49'h88000012b027;
          9'h0d0: q = 49'h8027100110c8;
          9'h0d1: q = 49'h0020140150c8;
          9'h0d2: q = 49'h800014021018;
          9'h0d3: q = 49'h08000016f127;
          9'h0d4: q = 49'h08021810a0a3;
          9'h0d5: q = 49'h80311c0150c8;
          9'h0d6: q = 49'h88000014b1a7;
          9'h0d7: q = 49'h0020180190c8;
          9'h0d8: q = 49'h080000120027;
          9'h0d9: q = 49'hb00400000800;
          9'h0da: q = 49'h98021870314c;
          9'h0db: q = 49'h80201c01d0b4;
          9'h0dc: q = 49'h08000014b127;
          9'h0dd: q = 49'h08021001c0e3;
          9'h0de: q = 49'h980218011295;
          9'h0df: q = 49'h88021c10a0a3;
          9'h0e0: q = 49'h0020180190c8;
          9'h0e1: q = 49'h080000115027;
          9'h0e2: q = 49'h0805100003a7;
          9'h0e3: q = 49'h1802187031ac;
          9'h0e4: q = 49'h800010015018;
          9'h0e5: q = 49'h08000014b127;
          9'h0e6: q = 49'h80201c01d0b4;
          9'h0e7: q = 49'h08000014b127;
          9'h0e8: q = 49'h08021001c0e3;
          9'h0e9: q = 49'h180218011232;
          9'h0ea: q = 49'h88021c10a0a3;
          9'h0eb: q = 49'h08000001a0a7;
          9'h0ec: q = 49'h8823141320a3;
          9'h0ed: q = 49'h0822141290a3;
          9'h0ee: q = 49'h0821141200a3;
          9'h0ef: q = 49'h8820141150a3;
          9'h0f0: q = 49'h00001001d018;
          9'h0f1: q = 49'h800010019018;
          9'h0f2: q = 49'h08000014b127;
          9'h0f3: q = 49'h800010015018;
          9'h0f4: q = 49'h08000014b127;
          9'h0f5: q = 49'h88000014b1a7;
          9'h0f6: q = 49'h002700029028;
          9'h0f7: q = 49'h0000aa0cd018;
          9'h0f8: q = 49'h8800000140a4;
          9'h0f9: q = 49'h0020188810c8;
          9'h0fa: q = 49'h8032020c5028;
          9'h0fb: q = 49'h8000aa0c9018;
          9'h0fc: q = 49'h8800000140a4;
          9'h0fd: q = 49'h0020188990c8;
          9'h0fe: q = 49'h80201c01d0b4;
          9'h0ff: q = 49'h8800000fb027;
          9'h100: q = 49'h0004180190c8;
          9'h101: q = 49'h8805a81020a3;
          9'h102: q = 49'h8800000140a4;
          9'h103: q = 49'h000018881018;
          9'h104: q = 49'h08021c0180a3;
          9'h105: q = 49'h0020180190c8;
          9'h106: q = 49'h0000a8011018;
          9'h107: q = 49'h8800000140a4;
          9'h108: q = 49'h0020188990c8;
          9'h109: q = 49'h0000a801d018;
          9'h10a: q = 49'h8800000140a4;
          9'h10b: q = 49'h98020c89b007;
          9'h10c: q = 49'h8000a8015018;
          9'h10d: q = 49'h8800000140a4;
          9'h10e: q = 49'h0020188990c8;
          9'h10f: q = 49'h8000aa0bd018;
          9'h110: q = 49'h8800000140a4;
          9'h111: q = 49'h0020188990c8;
          9'h112: q = 49'h0000aa0b9018;
          9'h113: q = 49'h8800000140a4;
          9'h114: q = 49'h0020188990c8;
          9'h115: q = 49'h0000aa0b5018;
          9'h116: q = 49'h8800000140a4;
          9'h117: q = 49'h0020188990c8;
          9'h118: q = 49'h8000aa0b1018;
          9'h119: q = 49'h8800000140a4;
          9'h11a: q = 49'h0020188990c8;
          9'h11b: q = 49'h0820a80160e3;
          9'h11c: q = 49'h8800000140a4;
          9'h11d: q = 49'h0020188990c8;
          9'h11e: q = 49'h8805a80160e3;
          9'h11f: q = 49'h8800000140a4;
          9'h120: q = 49'h800200899028;
          9'h121: q = 49'h98050c01701e;
          9'h122: q = 49'h98050c01703a;
          9'h123: q = 49'h18050c017016;
          9'h124: q = 49'h98050c017011;
          9'h125: q = 49'h18050c01700e;
          9'h126: q = 49'h18050c017008;
          9'h127: q = 49'h98050c017006;
          9'h128: q = 49'h18020c017022;
          9'h129: q = 49'h800000011000;
          9'h12a: q = 49'h08000016f127;
          9'h12b: q = 49'h800000021000;
          9'h12c: q = 49'h800000011000;
          9'h12d: q = 49'h080000171127;
          9'h12e: q = 49'h002000021028;
          9'h12f: q = 49'h0800001581a7;
          9'h130: q = 49'h8800000140a4;
          9'h131: q = 49'h98240c903009;
          9'h132: q = 49'h802300c01028;
          9'h133: q = 49'h0827a00c80a1;
          9'h134: q = 49'h8800000140a4;
          9'h135: q = 49'h0000a8d01018;
          9'h136: q = 49'h8800000140a4;
          9'h137: q = 49'h0020a08810c8;
          9'h138: q = 49'h800000801078;
          9'h139: q = 49'h000000001000;
          9'h13a: q = 49'h98040c983000;
          9'h13b: q = 49'h0027a8c010c8;
          9'h13c: q = 49'h98050c983124;
          9'h13d: q = 49'h18040c017021;
          9'h13e: q = 49'h0027a8c010c8;
          9'h13f: q = 49'h18020e0c30c2;
          9'h140: q = 49'h18050c98306a;
          9'h141: q = 49'h002700c01028;
          9'h142: q = 49'h98040c017100;
          9'h143: q = 49'h98020c993076;
          9'h144: q = 49'h0802140120e3;
          9'h145: q = 49'h180210015088;
          9'h146: q = 49'h0000a4011018;
          9'h147: q = 49'h000000001000;
          9'h148: q = 49'h18020c98301a;
          9'h149: q = 49'h000000c01000;
          9'h14a: q = 49'h98020c10301b;
          9'h14b: q = 49'h8020100110b4;
          9'h14c: q = 49'h8802100b3063;
          9'h14d: q = 49'h002600011028;
          9'h14e: q = 49'h18020c10301c;
          9'h14f: q = 49'h0022020bd028;
          9'h150: q = 49'h8022020b9028;
          9'h151: q = 49'h8800a80ab0d5;
          9'h152: q = 49'h8020a8c010c8;
          9'h153: q = 49'hb00400000800;
          9'h154: q = 49'h1802a870314c;
          9'h155: q = 49'h98020cc13011;
          9'h156: q = 49'h8800a80a60d2;
          9'h157: q = 49'h8020a8c010c8;
          9'h158: q = 49'h8804100003a7;
          9'h159: q = 49'h9802a87031ac;
          9'h15a: q = 49'h800000c11000;
          9'h15b: q = 49'h0800a80a00c8;
          9'h15c: q = 49'h0027a8c010c8;
          9'h15d: q = 49'h18020c983019;
          9'h15e: q = 49'h18051098309b;
          9'h15f: q = 49'h9802a8011093;
          9'h160: q = 49'h000000c01000;
          9'h161: q = 49'h0800a809c0c8;
          9'h162: q = 49'h0028a8c010c8;
          9'h163: q = 49'h18020c99701a;
          9'h164: q = 49'h000000c01000;
          9'h165: q = 49'h0802100980e3;
          9'h166: q = 49'h8003100110c8;
          9'h167: q = 49'h800000681000;
          9'h168: q = 49'h002600011028;
          9'h169: q = 49'h0802100940e3;
          9'h16a: q = 49'h8003100110c8;
          9'h16b: q = 49'h800008481018;
          9'h16c: q = 49'h98020c61300a;
          9'h16d: q = 49'h182a0e0ab017;
          9'h16e: q = 49'h982a0e0ab169;
          9'h16f: q = 49'h98020e0ab064;
          9'h170: q = 49'h982b0e0af015;
          9'h171: q = 49'h18240e0af009;
          9'h172: q = 49'h18290e0a7048;
          9'h173: q = 49'h18020e0a7044;
          9'h174: q = 49'h18020e0a300d;
          9'h175: q = 49'h18020e09f008;
          9'h176: q = 49'h18020e09b005;
          9'h177: q = 49'h18200e097003;
          9'h178: q = 49'h18200e093002;
          9'h179: q = 49'h98020e08f002;
          9'h17a: q = 49'h18020e08b020;
          9'h17b: q = 49'h18020e087001;
          9'h17c: q = 49'h18020e083000;
          9'h17d: q = 49'h88000407f0d6;
          9'h17e: q = 49'h8002040050cc;
          9'h17f: q = 49'h00000a001018;
          9'h180: q = 49'h98020470312e;
          9'h181: q = 49'h98020c007005;
          9'h182: q = 49'h0801a807a0e3;
          9'h183: q = 49'h800008001018;
          9'h184: q = 49'h18020470308e;
          9'h185: q = 49'h8003040050c8;
          9'h186: q = 49'h98020cc03002;
          9'h187: q = 49'h98020c007005;
          9'h188: q = 49'h8802d00240e3;
          9'h189: q = 49'h0803d00240e3;
          9'h18a: q = 49'h0803a800c0e3;
          9'h18b: q = 49'h98039cc013df;
          9'h18c: q = 49'h00000c481018;
          9'h18d: q = 49'h800008481018;
          9'h18e: q = 49'h88009c00c0c1;
          9'h18f: q = 49'h88009c00c0df;
          9'h190: q = 49'h88009c00c080;
          9'h191: q = 49'h80030c0010cb;
          9'h192: q = 49'h08029c00c0e3;
          9'h193: q = 49'h80020c0010cf;
          9'h194: q = 49'h0802080100e3;
          9'h195: q = 49'h88029c00e0e3;
          9'h196: q = 49'h000000001003;
          9'h197: q = 49'h08030c0100e3;
          9'h198: q = 49'h08039c00e0e3;
          9'h199: q = 49'h88009c00a0c1;
          9'h19a: q = 49'h88009c00a0c2;
          9'h19b: q = 49'h08009c00a0c3;
          9'h19c: q = 49'h88009c00a0c4;
          9'h19d: q = 49'h08009c00a0c5;
          9'h19e: q = 49'h08009c00a0c6;
          9'h19f: q = 49'h88009c00a0c7;
          9'h1a0: q = 49'h88009c00a0c8;
          9'h1a1: q = 49'h08009c00a0c9;
          9'h1a2: q = 49'h08009c00a0ca;
          9'h1a3: q = 49'h88009c00a0cb;
          9'h1a4: q = 49'h08009c00a0cc;
          9'h1a5: q = 49'h88009c00a0cd;
          9'h1a6: q = 49'h88009c00a0ce;
          9'h1a7: q = 49'h08009c00a0cf;
          9'h1a8: q = 49'h88009c00a0d0;
          9'h1a9: q = 49'h08009c00a0d1;
          9'h1aa: q = 49'h08009c00a0d2;
          9'h1ab: q = 49'h88009c00a0d3;
          9'h1ac: q = 49'h08009c00a0d4;
          9'h1ad: q = 49'h88009c00a0d5;
          9'h1ae: q = 49'h88009c00a0d6;
          9'h1af: q = 49'h08009c00a0d7;
          9'h1b0: q = 49'h08009c00a0d8;
          9'h1b1: q = 49'h88009c00a0d9;
          9'h1b2: q = 49'h88009c00a0da;
          9'h1b3: q = 49'h08009c00a0db;
          9'h1b4: q = 49'h88009c00a0dc;
          9'h1b5: q = 49'h08009c00a0dd;
          9'h1b6: q = 49'h08009c00a0de;
          9'h1b7: q = 49'h88009c00a0df;
          9'h1b8: q = 49'h08009c00a0c0;
          9'h1b9: q = 49'h00000000d07b;
          9'h1ba: q = 49'h08009c00a081;
          9'h1bb: q = 49'h08009c00a082;
          9'h1bc: q = 49'h88009c00a083;
          9'h1bd: q = 49'h08009c00a084;
          9'h1be: q = 49'h88009c00a085;
          9'h1bf: q = 49'h88009c00a086;
          9'h1c0: q = 49'h08009c00a087;
          9'h1c1: q = 49'h08009c00a088;
          9'h1c2: q = 49'h88009c00a089;
          9'h1c3: q = 49'h88009c00a08a;
          9'h1c4: q = 49'h08009c00a08b;
          9'h1c5: q = 49'h88009c00a08c;
          9'h1c6: q = 49'h08009c00a08d;
          9'h1c7: q = 49'h08009c00a08e;
          9'h1c8: q = 49'h88009c00a08f;
          9'h1c9: q = 49'h08009c00a090;
          9'h1ca: q = 49'h88009c00a091;
          9'h1cb: q = 49'h88009c00a092;
          9'h1cc: q = 49'h08009c00a093;
          9'h1cd: q = 49'h88009c00a094;
          9'h1ce: q = 49'h08009c00a095;
          9'h1cf: q = 49'h08009c00a096;
          9'h1d0: q = 49'h88009c00a097;
          9'h1d1: q = 49'h88009c00a098;
          9'h1d2: q = 49'h08009c00a099;
          9'h1d3: q = 49'h08009c00a09a;
          9'h1d4: q = 49'h88009c00a09b;
          9'h1d5: q = 49'h08009c00a09c;
          9'h1d6: q = 49'h88009c00a09d;
          9'h1d7: q = 49'h88009c00a09e;
          9'h1d8: q = 49'h08009c00a09f;
          9'h1d9: q = 49'h88009c00a080;
          9'h1da: q = 49'h800000009003;
          9'h1db: q = 49'h0800000244a7;
          9'h1dc: q = 49'h000000001000;
          9'h1dd: q = 49'h0800000224a7;
          9'h1de: q = 49'h000000001000;
          9'h1df: q = 49'h8800000204a7;
          9'h1e0: q = 49'h000000001000;
          9'h1e1: q = 49'h08000001e4a7;
          9'h1e2: q = 49'h000000001000;
          9'h1e3: q = 49'h88000001c4a7;
          9'h1e4: q = 49'h000000001000;
          9'h1e5: q = 49'h88000001a4a7;
          9'h1e6: q = 49'h000000001000;
          9'h1e7: q = 49'h0800000184a7;
          9'h1e8: q = 49'h000000001000;
          9'h1e9: q = 49'h8800000164a7;
          9'h1ea: q = 49'h000000001000;
          9'h1eb: q = 49'h0800000144a7;
          9'h1ec: q = 49'h000000001000;
          9'h1ed: q = 49'h0800000124a7;
          9'h1ee: q = 49'h000000001000;
          9'h1ef: q = 49'h8800000104a7;
          9'h1f0: q = 49'h000000001000;
          9'h1f1: q = 49'h88000000e4a7;
          9'h1f2: q = 49'h000000001000;
          9'h1f3: q = 49'h08000000c4a7;
          9'h1f4: q = 49'h000000001000;
          9'h1f5: q = 49'h08000000a4a7;
          9'h1f6: q = 49'h000000001000;
          9'h1f7: q = 49'h8800000084a7;
          9'h1f8: q = 49'h80039c0010cb;
          9'h1f9: q = 49'h88029c006063;
          9'h1fa: q = 49'h800000000000;
          9'h1fb: q = 49'h800000000000;
          9'h1fc: q = 49'h800000000000;
          9'h1fd: q = 49'h800000000000;
          9'h1fe: q = 49'h800000000000;
          9'h1ff: q = 49'h0800000250a7;
        endcase

 `ifdef debug_patch_rom
        case (addr)
          // Clear local memories in FPGA.
          ~9'o175 & 9'h1ff: q = 49'h000000001000;
          ~9'o202 & 9'h1ff: q = 49'h000000001000;
          ~9'o226 & 9'h1ff: q = 49'h000000001000;
          ~9'o232 & 9'h1ff: q = 49'h000000001000;
          ~9'o236 & 9'h1ff: q = 49'h000000001000;
          ~9'o244 & 9'h1ff: q = 49'h000000001000;
          ~9'o251 & 9'h1ff: q = 49'h000000001000;
          ~9'o256 & 9'h1ff: q = 49'h000000001000;
          ~9'o263 & 9'h1ff: q = 49'h000000001000;
          ~9'o314 & 9'h1ff: q = 49'h000000001000;
        endcase
 `endif

 `ifdef debug_sdram_rom
        case (addr)
          ~9'o000 & 9'h1ff: q = 49'o0000000000150173;
          ~9'o001 & 9'h1ff: q = 49'o0200000000450247;
          ~9'o045 & 9'h1ff: q = 49'o4000000000110003;
          ~9'o046 & 9'h1ff: q = 49'o0000000000010003;
          ~9'o047 & 9'h1ff: q = 49'o0600101602030000;
          ~9'o050 & 9'h1ff: q = 49'o0600101602070001;
          ~9'o051 & 9'h1ff: q = 49'o0600101602130040;
          ~9'o052 & 9'h1ff: q = 49'o4600101602170002;
          ~9'o053 & 9'h1ff: q = 49'o0602001602230002;
          ~9'o054 & 9'h1ff: q = 49'o0602001602270003;
          ~9'o055 & 9'h1ff: q = 49'o0600101602330005;
          ~9'o056 & 9'h1ff: q = 49'o0600101602370010;
          ~9'o057 & 9'h1ff: q = 49'o0600101602430015;
          ~9'o060 & 9'h1ff: q = 49'o0600101602470104;
          ~9'o061 & 9'h1ff: q = 49'o0602441602470110;
          ~9'o062 & 9'h1ff: q = 49'o0602201602570011;
          ~9'o063 & 9'h1ff: q = 49'o4602541602570025;
          ~9'o064 & 9'h1ff: q = 49'o4600101602530144;
          ~9'o065 & 9'h1ff: q = 49'o4602501602530551;
          ~9'o066 & 9'h1ff: q = 49'o0602501602530027;
          ~9'o067 & 9'h1ff: q = 49'o0000000060010000;
          ~9'o070 & 9'h1ff: q = 49'o0600101446030032;
          ~9'o071 & 9'h1ff: q = 49'o0000000000010000;
          ~9'o072 & 9'h1ff: q = 49'o0000024400210030;
          ~9'o073 & 9'h1ff: q = 49'o0600102000250210;
          ~9'o074 & 9'h1ff: q = 49'o0200102400220343;
          ~9'o075 & 9'h1ff: q = 49'o4600101446230166;
          ~9'o076 & 9'h1ff: q = 49'o4600201400270400;
          ~9'o077 & 9'h1ff: q = 49'o0002340060010050;
          ~9'o100 & 9'h1ff: q = 49'o0600241446030152;
          ~9'o101 & 9'h1ff: q = 49'o0600101603030302;
          ~9'o102 & 9'h1ff: q = 49'o0002365060010310;
          ~9'o103 & 9'h1ff: q = 49'o0600201400270041;
          ~9'o104 & 9'h1ff: q = 49'o4600241446030444;
          ~9'o105 & 9'h1ff: q = 49'o0002365060010310;
          ~9'o106 & 9'h1ff: q = 49'o4600201446030000;
          ~9'o107 & 9'h1ff: q = 49'o0000000000010000;
          ~9'o110 & 9'h1ff: q = 49'o4000000040010170;
          ~9'o111 & 9'h1ff: q = 49'o0002024042010310;
          ~9'o112 & 9'h1ff: q = 49'o4200000000240244;
          ~9'o113 & 9'h1ff: q = 49'o0000025064010030;
          ~9'o114 & 9'h1ff: q = 49'o4200000000240244;
          ~9'o115 & 9'h1ff: q = 49'o0202364001110241;
          ~9'o116 & 9'h1ff: q = 49'o4002140060010050;
          ~9'o117 & 9'h1ff: q = 49'o4602201444030011;
          ~9'o120 & 9'h1ff: q = 49'o4200000000240244;
          ~9'o121 & 9'h1ff: q = 49'o0200000001110247;
          ~9'o122 & 9'h1ff: q = 49'o0000000000000000;
        endcase

 `endif
     end

 `ifdef debug_prom
   always @(posedge clk)
     begin
        $display("prom: prom addr %o val 0x%x %o; @%t",
                 addr, q, q, $time);
     end
 `endif

`endif

endmodule
