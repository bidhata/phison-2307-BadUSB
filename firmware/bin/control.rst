                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module control
                                      6 	.optsdcc -mmcs51 --model-small
                                      7
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _HandleVendorRequest
                                     12 	.globl _HandleClassRequest
                                     13 	.globl _HandleStandardRequest
                                     14 	.globl _EP0ACK
                                     15 	.globl _SendControlResponse
                                     16 	.globl _RI
                                     17 	.globl _TI
                                     18 	.globl _RB8
                                     19 	.globl _TB8
                                     20 	.globl _REN
                                     21 	.globl _SM2
                                     22 	.globl _SM1
                                     23 	.globl _SM0
                                     24 	.globl _RXD
                                     25 	.globl _TXD
                                     26 	.globl _INT0
                                     27 	.globl _INT1
                                     28 	.globl _T0
                                     29 	.globl _T1
                                     30 	.globl _WR
                                     31 	.globl _RD
                                     32 	.globl _PX0
                                     33 	.globl _PT0
                                     34 	.globl _PX1
                                     35 	.globl _PT1
                                     36 	.globl _PS
                                     37 	.globl _EX0
                                     38 	.globl _ET0
                                     39 	.globl _EX1
                                     40 	.globl _ET1
                                     41 	.globl _ES
                                     42 	.globl _EA
                                     43 	.globl _IT0
                                     44 	.globl _IE0
                                     45 	.globl _IT1
                                     46 	.globl _IE1
                                     47 	.globl _TR0
                                     48 	.globl _TF0
                                     49 	.globl _TR1
                                     50 	.globl _TF1
                                     51 	.globl _P
                                     52 	.globl _OV
                                     53 	.globl _RS0
                                     54 	.globl _RS1
                                     55 	.globl _F0
                                     56 	.globl _AC
                                     57 	.globl _CY
                                     58 	.globl _SBUF
                                     59 	.globl _SCON
                                     60 	.globl _IP
                                     61 	.globl _IE
                                     62 	.globl _TH1
                                     63 	.globl _TH0
                                     64 	.globl _TL1
                                     65 	.globl _TL0
                                     66 	.globl _TMOD
                                     67 	.globl _TCON
                                     68 	.globl _PCON
                                     69 	.globl _DPH
                                     70 	.globl _DPL
                                     71 	.globl _SP
                                     72 	.globl _B
                                     73 	.globl _ACC
                                     74 	.globl _PSW
                                     75 	.globl _P3
                                     76 	.globl _P2
                                     77 	.globl _P1
                                     78 	.globl _P0
                                     79 	.globl _PRAMCTL
                                     80 	.globl _BANK2PAH
                                     81 	.globl _BANK2PAL
                                     82 	.globl _BANK2VA
                                     83 	.globl _BANK1PAH
                                     84 	.globl _BANK1PAL
                                     85 	.globl _BANK1VA
                                     86 	.globl _BANK0PAH
                                     87 	.globl _BANK0PAL
                                     88 	.globl _WARMSTATUS
                                     89 	.globl _GPIO0OUT
                                     90 	.globl _GPIO0DIR
                                     91 	.globl _DMACMD
                                     92 	.globl _DMAFILL3
                                     93 	.globl _DMAFILL2
                                     94 	.globl _DMAFILL1
                                     95 	.globl _DMAFILL0
                                     96 	.globl _DMASIZEH
                                     97 	.globl _DMASIZEM
                                     98 	.globl _DMASIZEL
                                     99 	.globl _DMADSTH
                                    100 	.globl _DMADSTM
                                    101 	.globl _DMADSTL
                                    102 	.globl _DMASRCH
                                    103 	.globl _DMASRCM
                                    104 	.globl _DMASRCL
                                    105 	.globl _NANDCSDIR
                                    106 	.globl _NANDCSOUT
                                    107 	.globl _EP4
                                    108 	.globl _EP3
                                    109 	.globl _EP2
                                    110 	.globl _EP1
                                    111 	.globl _EP0
                                    112 	.globl _SETUPDAT
                                    113 	.globl _EP0CS
                                    114 	.globl _EPIE
                                    115 	.globl _EPIRQ
                                    116 	.globl _USBIRQ
                                    117 	.globl _USBSTAT
                                    118 	.globl _USBCTL
                                    119 	.globl _REGBANK
                                    120 ;--------------------------------------------------------
                                    121 ; special function registers
                                    122 ;--------------------------------------------------------
                                    123 	.area RSEG    (ABS,DATA)
      000000                        124 	.org 0x0000
                           000080   125 _P0	=	0x0080
                           000090   126 _P1	=	0x0090
                           0000A0   127 _P2	=	0x00a0
                           0000B0   128 _P3	=	0x00b0
                           0000D0   129 _PSW	=	0x00d0
                           0000E0   130 _ACC	=	0x00e0
                           0000F0   131 _B	=	0x00f0
                           000081   132 _SP	=	0x0081
                           000082   133 _DPL	=	0x0082
                           000083   134 _DPH	=	0x0083
                           000087   135 _PCON	=	0x0087
                           000088   136 _TCON	=	0x0088
                           000089   137 _TMOD	=	0x0089
                           00008A   138 _TL0	=	0x008a
                           00008B   139 _TL1	=	0x008b
                           00008C   140 _TH0	=	0x008c
                           00008D   141 _TH1	=	0x008d
                           0000A8   142 _IE	=	0x00a8
                           0000B8   143 _IP	=	0x00b8
                           000098   144 _SCON	=	0x0098
                           000099   145 _SBUF	=	0x0099
                                    146 ;--------------------------------------------------------
                                    147 ; special function bits
                                    148 ;--------------------------------------------------------
                                    149 	.area RSEG    (ABS,DATA)
      000000                        150 	.org 0x0000
                           0000D7   151 _CY	=	0x00d7
                           0000D6   152 _AC	=	0x00d6
                           0000D5   153 _F0	=	0x00d5
                           0000D4   154 _RS1	=	0x00d4
                           0000D3   155 _RS0	=	0x00d3
                           0000D2   156 _OV	=	0x00d2
                           0000D0   157 _P	=	0x00d0
                           00008F   158 _TF1	=	0x008f
                           00008E   159 _TR1	=	0x008e
                           00008D   160 _TF0	=	0x008d
                           00008C   161 _TR0	=	0x008c
                           00008B   162 _IE1	=	0x008b
                           00008A   163 _IT1	=	0x008a
                           000089   164 _IE0	=	0x0089
                           000088   165 _IT0	=	0x0088
                           0000AF   166 _EA	=	0x00af
                           0000AC   167 _ES	=	0x00ac
                           0000AB   168 _ET1	=	0x00ab
                           0000AA   169 _EX1	=	0x00aa
                           0000A9   170 _ET0	=	0x00a9
                           0000A8   171 _EX0	=	0x00a8
                           0000BC   172 _PS	=	0x00bc
                           0000BB   173 _PT1	=	0x00bb
                           0000BA   174 _PX1	=	0x00ba
                           0000B9   175 _PT0	=	0x00b9
                           0000B8   176 _PX0	=	0x00b8
                           0000B7   177 _RD	=	0x00b7
                           0000B6   178 _WR	=	0x00b6
                           0000B5   179 _T1	=	0x00b5
                           0000B4   180 _T0	=	0x00b4
                           0000B3   181 _INT1	=	0x00b3
                           0000B2   182 _INT0	=	0x00b2
                           0000B1   183 _TXD	=	0x00b1
                           0000B0   184 _RXD	=	0x00b0
                           00009F   185 _SM0	=	0x009f
                           00009E   186 _SM1	=	0x009e
                           00009D   187 _SM2	=	0x009d
                           00009C   188 _REN	=	0x009c
                           00009B   189 _TB8	=	0x009b
                           00009A   190 _RB8	=	0x009a
                           000099   191 _TI	=	0x0099
                           000098   192 _RI	=	0x0098
                                    193 ;--------------------------------------------------------
                                    194 ; overlayable register banks
                                    195 ;--------------------------------------------------------
                                    196 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        197 	.ds 8
                                    198 ;--------------------------------------------------------
                                    199 ; internal ram data
                                    200 ;--------------------------------------------------------
                                    201 	.area DSEG    (DATA)
                                    202 ;--------------------------------------------------------
                                    203 ; overlayable items in internal ram
                                    204 ;--------------------------------------------------------
                                    205 ;--------------------------------------------------------
                                    206 ; indirectly addressable internal ram data
                                    207 ;--------------------------------------------------------
                                    208 	.area ISEG    (DATA)
                                    209 ;--------------------------------------------------------
                                    210 ; absolute internal ram data
                                    211 ;--------------------------------------------------------
                                    212 	.area IABS    (ABS,DATA)
                                    213 	.area IABS    (ABS,DATA)
                                    214 ;--------------------------------------------------------
                                    215 ; bit data
                                    216 ;--------------------------------------------------------
                                    217 	.area BSEG    (BIT)
                                    218 ;--------------------------------------------------------
                                    219 ; paged external ram data
                                    220 ;--------------------------------------------------------
                                    221 	.area PSEG    (PAG,XDATA)
                                    222 ;--------------------------------------------------------
                                    223 ; external ram data
                                    224 ;--------------------------------------------------------
                                    225 	.area XSEG    (XDATA)
                           00F000   226 _REGBANK	=	0xf000
                           00F008   227 _USBCTL	=	0xf008
                           00F009   228 _USBSTAT	=	0xf009
                           00F027   229 _USBIRQ	=	0xf027
                           00F020   230 _EPIRQ	=	0xf020
                           00F030   231 _EPIE	=	0xf030
                           00F048   232 _EP0CS	=	0xf048
                           00F0B8   233 _SETUPDAT	=	0xf0b8
                           00F1C0   234 _EP0	=	0xf1c0
                           00F200   235 _EP1	=	0xf200
                           00F240   236 _EP2	=	0xf240
                           00F280   237 _EP3	=	0xf280
                           00F2C0   238 _EP4	=	0xf2c0
                           00F608   239 _NANDCSOUT	=	0xf608
                           00F618   240 _NANDCSDIR	=	0xf618
                           00F900   241 _DMASRCL	=	0xf900
                           00F901   242 _DMASRCM	=	0xf901
                           00F902   243 _DMASRCH	=	0xf902
                           00F904   244 _DMADSTL	=	0xf904
                           00F905   245 _DMADSTM	=	0xf905
                           00F906   246 _DMADSTH	=	0xf906
                           00F908   247 _DMASIZEL	=	0xf908
                           00F909   248 _DMASIZEM	=	0xf909
                           00F90A   249 _DMASIZEH	=	0xf90a
                           00F90C   250 _DMAFILL0	=	0xf90c
                           00F90D   251 _DMAFILL1	=	0xf90d
                           00F90E   252 _DMAFILL2	=	0xf90e
                           00F90F   253 _DMAFILL3	=	0xf90f
                           00F930   254 _DMACMD	=	0xf930
                           00FA14   255 _GPIO0DIR	=	0xfa14
                           00FA15   256 _GPIO0OUT	=	0xfa15
                           00FA38   257 _WARMSTATUS	=	0xfa38
                           00FA40   258 _BANK0PAL	=	0xfa40
                           00FA41   259 _BANK0PAH	=	0xfa41
                           00FA42   260 _BANK1VA	=	0xfa42
                           00FA43   261 _BANK1PAL	=	0xfa43
                           00FA44   262 _BANK1PAH	=	0xfa44
                           00FA45   263 _BANK2VA	=	0xfa45
                           00FA46   264 _BANK2PAL	=	0xfa46
                           00FA47   265 _BANK2PAH	=	0xfa47
                           00FA48   266 _PRAMCTL	=	0xfa48
                                    267 ;--------------------------------------------------------
                                    268 ; absolute external ram data
                                    269 ;--------------------------------------------------------
                                    270 	.area XABS    (ABS,XDATA)
                                    271 ;--------------------------------------------------------
                                    272 ; external initialized ram data
                                    273 ;--------------------------------------------------------
                                    274 	.area XISEG   (XDATA)
                                    275 	.area HOME    (CODE)
                                    276 	.area GSINIT0 (CODE)
                                    277 	.area GSINIT1 (CODE)
                                    278 	.area GSINIT2 (CODE)
                                    279 	.area GSINIT3 (CODE)
                                    280 	.area GSINIT4 (CODE)
                                    281 	.area GSINIT5 (CODE)
                                    282 	.area GSINIT  (CODE)
                                    283 	.area GSFINAL (CODE)
                                    284 	.area CSEG    (CODE)
                                    285 ;--------------------------------------------------------
                                    286 ; global & static initialisations
                                    287 ;--------------------------------------------------------
                                    288 	.area HOME    (CODE)
                                    289 	.area GSINIT  (CODE)
                                    290 	.area GSFINAL (CODE)
                                    291 	.area GSINIT  (CODE)
                                    292 ;--------------------------------------------------------
                                    293 ; Home
                                    294 ;--------------------------------------------------------
                                    295 	.area HOME    (CODE)
                                    296 	.area HOME    (CODE)
                                    297 ;--------------------------------------------------------
                                    298 ; code
                                    299 ;--------------------------------------------------------
                                    300 	.area CSEG    (CODE)
                                    301 ;------------------------------------------------------------
                                    302 ;Allocation info for local variables in function 'EP0ACK'
                                    303 ;------------------------------------------------------------
                                    304 ;	control.c:28: void EP0ACK()
                                    305 ;	-----------------------------------------
                                    306 ;	 function EP0ACK
                                    307 ;	-----------------------------------------
      000C68                        308 _EP0ACK:
                           000007   309 	ar7 = 0x07
                           000006   310 	ar6 = 0x06
                           000005   311 	ar5 = 0x05
                           000004   312 	ar4 = 0x04
                           000003   313 	ar3 = 0x03
                           000002   314 	ar2 = 0x02
                           000001   315 	ar1 = 0x01
                           000000   316 	ar0 = 0x00
                                    317 ;	control.c:30: EP0CS = bmEP0ACK;
      000C68 90 F0 48         [24]  318 	mov	dptr,#_EP0CS
      000C6B 74 01            [12]  319 	mov	a,#0x01
      000C6D F0               [24]  320 	movx	@dptr,a
                                    321 ;	control.c:31: }
      000C6E 22               [24]  322 	ret
                                    323 ;------------------------------------------------------------
                                    324 ;Allocation info for local variables in function 'SetAddress'
                                    325 ;------------------------------------------------------------
                                    326 ;ret                       Allocated to registers r7
                                    327 ;------------------------------------------------------------
                                    328 ;	control.c:33: static BYTE SetAddress()
                                    329 ;	-----------------------------------------
                                    330 ;	 function SetAddress
                                    331 ;	-----------------------------------------
      000C6F                        332 _SetAddress:
                                    333 ;	control.c:35: BYTE ret = FALSE;
      000C6F 7F 00            [12]  334 	mov	r7,#0x00
                                    335 ;	control.c:37: if (wValue < 0x7F)
      000C71 AD 1C            [24]  336 	mov	r5,_wValue
      000C73 AE 1D            [24]  337 	mov	r6,(_wValue + 1)
      000C75 C3               [12]  338 	clr	c
      000C76 ED               [12]  339 	mov	a,r5
      000C77 94 7F            [12]  340 	subb	a,#0x7f
      000C79 EE               [12]  341 	mov	a,r6
      000C7A 94 00            [12]  342 	subb	a,#0x00
      000C7C 50 05            [24]  343 	jnc	00102$
                                    344 ;	control.c:39: EP0ACK();
      000C7E 12 0C 68         [24]  345 	lcall	_EP0ACK
                                    346 ;	control.c:40: ret = TRUE;
      000C81 7F 01            [12]  347 	mov	r7,#0x01
      000C83                        348 00102$:
                                    349 ;	control.c:43: return ret;
      000C83 8F 82            [24]  350 	mov	dpl,r7
                                    351 ;	control.c:44: }
      000C85 22               [24]  352 	ret
                                    353 ;------------------------------------------------------------
                                    354 ;Allocation info for local variables in function 'GetDescriptor'
                                    355 ;------------------------------------------------------------
                                    356 ;type                      Allocated to registers r7
                                    357 ;i                         Allocated to registers r7
                                    358 ;total                     Allocated to registers r5
                                    359 ;ret                       Allocated to registers r6
                                    360 ;------------------------------------------------------------
                                    361 ;	control.c:46: static BYTE GetDescriptor()
                                    362 ;	-----------------------------------------
                                    363 ;	 function GetDescriptor
                                    364 ;	-----------------------------------------
      000C86                        365 _GetDescriptor:
                                    366 ;	control.c:48: BYTE type = (wValue >> 8) & 0xFF;
      000C86 AF 1D            [24]  367 	mov	r7,(_wValue + 1)
                                    368 ;	control.c:50: BYTE ret = FALSE;
      000C88 7E 00            [12]  369 	mov	r6,#0x00
                                    370 ;	control.c:52: switch (type)
      000C8A BF 01 02         [24]  371 	cjne	r7,#0x01,00217$
      000C8D 80 14            [24]  372 	sjmp	00101$
      000C8F                        373 00217$:
      000C8F BF 02 02         [24]  374 	cjne	r7,#0x02,00218$
      000C92 80 46            [24]  375 	sjmp	00103$
      000C94                        376 00218$:
      000C94 BF 06 03         [24]  377 	cjne	r7,#0x06,00219$
      000C97 02 0D 11         [24]  378 	ljmp	00105$
      000C9A                        379 00219$:
      000C9A BF 22 03         [24]  380 	cjne	r7,#0x22,00220$
      000C9D 02 0D 47         [24]  381 	ljmp	00107$
      000CA0                        382 00220$:
      000CA0 02 0D 7B         [24]  383 	ljmp	00110$
                                    384 ;	control.c:54: case 0x01:
      000CA3                        385 00101$:
                                    386 ;	control.c:56: total = wLength < sizeof(deviceDescriptor) ? wLength : sizeof(deviceDescriptor);
      000CA3 C3               [12]  387 	clr	c
      000CA4 E5 20            [12]  388 	mov	a,_wLength
      000CA6 94 12            [12]  389 	subb	a,#0x12
      000CA8 E5 21            [12]  390 	mov	a,(_wLength + 1)
      000CAA 94 00            [12]  391 	subb	a,#0x00
      000CAC 50 06            [24]  392 	jnc	00125$
      000CAE AD 20            [24]  393 	mov	r5,_wLength
      000CB0 AF 21            [24]  394 	mov	r7,(_wLength + 1)
      000CB2 80 04            [24]  395 	sjmp	00126$
      000CB4                        396 00125$:
      000CB4 7D 12            [12]  397 	mov	r5,#0x12
      000CB6 7F 00            [12]  398 	mov	r7,#0x00
      000CB8                        399 00126$:
                                    400 ;	control.c:57: for (i = 0; i < total; i++)
      000CB8 7F 00            [12]  401 	mov	r7,#0x00
      000CBA                        402 00112$:
      000CBA C3               [12]  403 	clr	c
      000CBB EF               [12]  404 	mov	a,r7
      000CBC 9D               [12]  405 	subb	a,r5
      000CBD 50 0D            [24]  406 	jnc	00102$
                                    407 ;	control.c:59: EP0.fifo = deviceDescriptor[i];
      000CBF EF               [12]  408 	mov	a,r7
      000CC0 90 31 57         [24]  409 	mov	dptr,#_deviceDescriptor
      000CC3 93               [24]  410 	movc	a,@a+dptr
      000CC4 FC               [12]  411 	mov	r4,a
      000CC5 90 F1 DC         [24]  412 	mov	dptr,#(_EP0 + 0x001c)
      000CC8 F0               [24]  413 	movx	@dptr,a
                                    414 ;	control.c:57: for (i = 0; i < total; i++)
      000CC9 0F               [12]  415 	inc	r7
      000CCA 80 EE            [24]  416 	sjmp	00112$
      000CCC                        417 00102$:
                                    418 ;	control.c:62: SendControlResponse(total);
      000CCC 7F 00            [12]  419 	mov	r7,#0x00
      000CCE 8D 82            [24]  420 	mov	dpl,r5
      000CD0 8F 83            [24]  421 	mov	dph,r7
      000CD2 12 04 F8         [24]  422 	lcall	_SendControlResponse
                                    423 ;	control.c:63: ret = TRUE;
      000CD5 7E 01            [12]  424 	mov	r6,#0x01
                                    425 ;	control.c:65: break;
      000CD7 02 0D 7B         [24]  426 	ljmp	00110$
                                    427 ;	control.c:67: case 0x02:
      000CDA                        428 00103$:
                                    429 ;	control.c:69: total = wLength < sizeof(configDescriptor) ? wLength : sizeof(configDescriptor);
      000CDA C3               [12]  430 	clr	c
      000CDB E5 20            [12]  431 	mov	a,_wLength
      000CDD 94 47            [12]  432 	subb	a,#0x47
      000CDF E5 21            [12]  433 	mov	a,(_wLength + 1)
      000CE1 94 00            [12]  434 	subb	a,#0x00
      000CE3 50 06            [24]  435 	jnc	00127$
      000CE5 AD 20            [24]  436 	mov	r5,_wLength
      000CE7 AF 21            [24]  437 	mov	r7,(_wLength + 1)
      000CE9 80 04            [24]  438 	sjmp	00128$
      000CEB                        439 00127$:
      000CEB 7D 47            [12]  440 	mov	r5,#0x47
      000CED 7F 00            [12]  441 	mov	r7,#0x00
      000CEF                        442 00128$:
                                    443 ;	control.c:70: for (i = 0; i < total; i++)
      000CEF 7F 00            [12]  444 	mov	r7,#0x00
      000CF1                        445 00115$:
      000CF1 C3               [12]  446 	clr	c
      000CF2 EF               [12]  447 	mov	a,r7
      000CF3 9D               [12]  448 	subb	a,r5
      000CF4 50 0D            [24]  449 	jnc	00104$
                                    450 ;	control.c:72: EP0.fifo = configDescriptor[i];
      000CF6 EF               [12]  451 	mov	a,r7
      000CF7 90 31 69         [24]  452 	mov	dptr,#_configDescriptor
      000CFA 93               [24]  453 	movc	a,@a+dptr
      000CFB FC               [12]  454 	mov	r4,a
      000CFC 90 F1 DC         [24]  455 	mov	dptr,#(_EP0 + 0x001c)
      000CFF F0               [24]  456 	movx	@dptr,a
                                    457 ;	control.c:70: for (i = 0; i < total; i++)
      000D00 0F               [12]  458 	inc	r7
      000D01 80 EE            [24]  459 	sjmp	00115$
      000D03                        460 00104$:
                                    461 ;	control.c:75: SendControlResponse(total);
      000D03 7F 00            [12]  462 	mov	r7,#0x00
      000D05 8D 82            [24]  463 	mov	dpl,r5
      000D07 8F 83            [24]  464 	mov	dph,r7
      000D09 12 04 F8         [24]  465 	lcall	_SendControlResponse
                                    466 ;	control.c:76: ret = TRUE;
      000D0C 7E 01            [12]  467 	mov	r6,#0x01
                                    468 ;	control.c:78: break;
      000D0E 02 0D 7B         [24]  469 	ljmp	00110$
                                    470 ;	control.c:80: case 0x06:
      000D11                        471 00105$:
                                    472 ;	control.c:82: total = wLength < sizeof(deviceQualifierDescriptor) ? wLength : sizeof(deviceQualifierDescriptor);
      000D11 C3               [12]  473 	clr	c
      000D12 E5 20            [12]  474 	mov	a,_wLength
      000D14 94 0A            [12]  475 	subb	a,#0x0a
      000D16 E5 21            [12]  476 	mov	a,(_wLength + 1)
      000D18 94 00            [12]  477 	subb	a,#0x00
      000D1A 50 06            [24]  478 	jnc	00129$
      000D1C AD 20            [24]  479 	mov	r5,_wLength
      000D1E AF 21            [24]  480 	mov	r7,(_wLength + 1)
      000D20 80 04            [24]  481 	sjmp	00130$
      000D22                        482 00129$:
      000D22 7D 0A            [12]  483 	mov	r5,#0x0a
      000D24 7F 00            [12]  484 	mov	r7,#0x00
      000D26                        485 00130$:
                                    486 ;	control.c:83: for (i = 0; i < total; i++)
      000D26 7F 00            [12]  487 	mov	r7,#0x00
      000D28                        488 00118$:
      000D28 C3               [12]  489 	clr	c
      000D29 EF               [12]  490 	mov	a,r7
      000D2A 9D               [12]  491 	subb	a,r5
      000D2B 50 0D            [24]  492 	jnc	00106$
                                    493 ;	control.c:85: EP0.fifo = deviceQualifierDescriptor[i];
      000D2D EF               [12]  494 	mov	a,r7
      000D2E 90 31 EF         [24]  495 	mov	dptr,#_deviceQualifierDescriptor
      000D31 93               [24]  496 	movc	a,@a+dptr
      000D32 FC               [12]  497 	mov	r4,a
      000D33 90 F1 DC         [24]  498 	mov	dptr,#(_EP0 + 0x001c)
      000D36 F0               [24]  499 	movx	@dptr,a
                                    500 ;	control.c:83: for (i = 0; i < total; i++)
      000D37 0F               [12]  501 	inc	r7
      000D38 80 EE            [24]  502 	sjmp	00118$
      000D3A                        503 00106$:
                                    504 ;	control.c:88: SendControlResponse(total);
      000D3A 7F 00            [12]  505 	mov	r7,#0x00
      000D3C 8D 82            [24]  506 	mov	dpl,r5
      000D3E 8F 83            [24]  507 	mov	dph,r7
      000D40 12 04 F8         [24]  508 	lcall	_SendControlResponse
                                    509 ;	control.c:89: ret = TRUE;
      000D43 7E 01            [12]  510 	mov	r6,#0x01
                                    511 ;	control.c:91: break;
                                    512 ;	control.c:93: case 0x22:
      000D45 80 34            [24]  513 	sjmp	00110$
      000D47                        514 00107$:
                                    515 ;	control.c:95: total = wLength < sizeof(HIDreportDescriptor) ? wLength : sizeof(HIDreportDescriptor);
      000D47 C3               [12]  516 	clr	c
      000D48 E5 20            [12]  517 	mov	a,_wLength
      000D4A 94 3F            [12]  518 	subb	a,#0x3f
      000D4C E5 21            [12]  519 	mov	a,(_wLength + 1)
      000D4E 94 00            [12]  520 	subb	a,#0x00
      000D50 50 06            [24]  521 	jnc	00131$
      000D52 AD 20            [24]  522 	mov	r5,_wLength
      000D54 AF 21            [24]  523 	mov	r7,(_wLength + 1)
      000D56 80 04            [24]  524 	sjmp	00132$
      000D58                        525 00131$:
      000D58 7D 3F            [12]  526 	mov	r5,#0x3f
      000D5A 7F 00            [12]  527 	mov	r7,#0x00
      000D5C                        528 00132$:
                                    529 ;	control.c:96: for (i = 0; i < total; i++)
      000D5C 7F 00            [12]  530 	mov	r7,#0x00
      000D5E                        531 00121$:
      000D5E C3               [12]  532 	clr	c
      000D5F EF               [12]  533 	mov	a,r7
      000D60 9D               [12]  534 	subb	a,r5
      000D61 50 0D            [24]  535 	jnc	00108$
                                    536 ;	control.c:98: EP0.fifo = HIDreportDescriptor[i];
      000D63 EF               [12]  537 	mov	a,r7
      000D64 90 31 B0         [24]  538 	mov	dptr,#_HIDreportDescriptor
      000D67 93               [24]  539 	movc	a,@a+dptr
      000D68 FC               [12]  540 	mov	r4,a
      000D69 90 F1 DC         [24]  541 	mov	dptr,#(_EP0 + 0x001c)
      000D6C F0               [24]  542 	movx	@dptr,a
                                    543 ;	control.c:96: for (i = 0; i < total; i++)
      000D6D 0F               [12]  544 	inc	r7
      000D6E 80 EE            [24]  545 	sjmp	00121$
      000D70                        546 00108$:
                                    547 ;	control.c:101: SendControlResponse(total);
      000D70 7F 00            [12]  548 	mov	r7,#0x00
      000D72 8D 82            [24]  549 	mov	dpl,r5
      000D74 8F 83            [24]  550 	mov	dph,r7
      000D76 12 04 F8         [24]  551 	lcall	_SendControlResponse
                                    552 ;	control.c:102: ret = TRUE;
      000D79 7E 01            [12]  553 	mov	r6,#0x01
                                    554 ;	control.c:110: }
      000D7B                        555 00110$:
                                    556 ;	control.c:112: return ret;
      000D7B 8E 82            [24]  557 	mov	dpl,r6
                                    558 ;	control.c:113: }
      000D7D 22               [24]  559 	ret
                                    560 ;------------------------------------------------------------
                                    561 ;Allocation info for local variables in function 'SetConfiguration'
                                    562 ;------------------------------------------------------------
                                    563 ;ret                       Allocated to registers r7
                                    564 ;------------------------------------------------------------
                                    565 ;	control.c:115: static BYTE SetConfiguration()
                                    566 ;	-----------------------------------------
                                    567 ;	 function SetConfiguration
                                    568 ;	-----------------------------------------
      000D7E                        569 _SetConfiguration:
                                    570 ;	control.c:117: BYTE ret = FALSE;
      000D7E 7F 00            [12]  571 	mov	r7,#0x00
                                    572 ;	control.c:119: if (wValue <= 1)
      000D80 AD 1C            [24]  573 	mov	r5,_wValue
      000D82 AE 1D            [24]  574 	mov	r6,(_wValue + 1)
      000D84 C3               [12]  575 	clr	c
      000D85 74 01            [12]  576 	mov	a,#0x01
      000D87 9D               [12]  577 	subb	a,r5
      000D88 E4               [12]  578 	clr	a
      000D89 9E               [12]  579 	subb	a,r6
      000D8A 40 05            [24]  580 	jc	00102$
                                    581 ;	control.c:121: EP0ACK();
      000D8C 12 0C 68         [24]  582 	lcall	_EP0ACK
                                    583 ;	control.c:122: ret = TRUE;
      000D8F 7F 01            [12]  584 	mov	r7,#0x01
      000D91                        585 00102$:
                                    586 ;	control.c:125: return ret;
      000D91 8F 82            [24]  587 	mov	dpl,r7
                                    588 ;	control.c:126: }
      000D93 22               [24]  589 	ret
                                    590 ;------------------------------------------------------------
                                    591 ;Allocation info for local variables in function 'HandleStandardRequest'
                                    592 ;------------------------------------------------------------
                                    593 ;	control.c:128: BYTE HandleStandardRequest()
                                    594 ;	-----------------------------------------
                                    595 ;	 function HandleStandardRequest
                                    596 ;	-----------------------------------------
      000D94                        597 _HandleStandardRequest:
                                    598 ;	control.c:130: switch(bRequest)
      000D94 74 05            [12]  599 	mov	a,#0x05
      000D96 B5 1B 02         [24]  600 	cjne	a,_bRequest,00120$
      000D99 80 0E            [24]  601 	sjmp	00101$
      000D9B                        602 00120$:
      000D9B 74 06            [12]  603 	mov	a,#0x06
      000D9D B5 1B 02         [24]  604 	cjne	a,_bRequest,00121$
      000DA0 80 0A            [24]  605 	sjmp	00102$
      000DA2                        606 00121$:
      000DA2 74 09            [12]  607 	mov	a,#0x09
                                    608 ;	control.c:132: case 0x05:
      000DA4 B5 1B 0B         [24]  609 	cjne	a,_bRequest,00104$
      000DA7 80 06            [24]  610 	sjmp	00103$
      000DA9                        611 00101$:
                                    612 ;	control.c:134: return SetAddress();
                                    613 ;	control.c:136: case 0x06:
      000DA9 02 0C 6F         [24]  614 	ljmp	_SetAddress
      000DAC                        615 00102$:
                                    616 ;	control.c:138: return GetDescriptor();
                                    617 ;	control.c:140: case 0x09:
      000DAC 02 0C 86         [24]  618 	ljmp	_GetDescriptor
      000DAF                        619 00103$:
                                    620 ;	control.c:142: return SetConfiguration();
                                    621 ;	control.c:144: default:
      000DAF 02 0D 7E         [24]  622 	ljmp	_SetConfiguration
      000DB2                        623 00104$:
                                    624 ;	control.c:146: return FALSE;
      000DB2 75 82 00         [24]  625 	mov	dpl,#0x00
                                    626 ;	control.c:148: }
                                    627 ;	control.c:149: }
      000DB5 22               [24]  628 	ret
                                    629 ;------------------------------------------------------------
                                    630 ;Allocation info for local variables in function 'GetMaxLUN'
                                    631 ;------------------------------------------------------------
                                    632 ;	control.c:151: static BYTE GetMaxLUN()
                                    633 ;	-----------------------------------------
                                    634 ;	 function GetMaxLUN
                                    635 ;	-----------------------------------------
      000DB6                        636 _GetMaxLUN:
                                    637 ;	control.c:153: EP0.fifo = 0x00;
      000DB6 90 F1 DC         [24]  638 	mov	dptr,#(_EP0 + 0x001c)
      000DB9 E4               [12]  639 	clr	a
      000DBA F0               [24]  640 	movx	@dptr,a
                                    641 ;	control.c:154: SendControlResponse(wLength < 0x01 ? wLength : 0x01);
      000DBB AE 20            [24]  642 	mov	r6,_wLength
      000DBD AF 21            [24]  643 	mov	r7,(_wLength + 1)
      000DBF C3               [12]  644 	clr	c
      000DC0 EE               [12]  645 	mov	a,r6
      000DC1 94 01            [12]  646 	subb	a,#0x01
      000DC3 EF               [12]  647 	mov	a,r7
      000DC4 94 00            [12]  648 	subb	a,#0x00
      000DC6 50 02            [24]  649 	jnc	00103$
      000DC8 80 04            [24]  650 	sjmp	00104$
      000DCA                        651 00103$:
      000DCA 7E 01            [12]  652 	mov	r6,#0x01
      000DCC 7F 00            [12]  653 	mov	r7,#0x00
      000DCE                        654 00104$:
      000DCE 8E 82            [24]  655 	mov	dpl,r6
      000DD0 8F 83            [24]  656 	mov	dph,r7
      000DD2 12 04 F8         [24]  657 	lcall	_SendControlResponse
                                    658 ;	control.c:156: return TRUE;
      000DD5 75 82 01         [24]  659 	mov	dpl,#0x01
                                    660 ;	control.c:157: }
      000DD8 22               [24]  661 	ret
                                    662 ;------------------------------------------------------------
                                    663 ;Allocation info for local variables in function 'HandleClassRequest'
                                    664 ;------------------------------------------------------------
                                    665 ;	control.c:159: BYTE HandleClassRequest()
                                    666 ;	-----------------------------------------
                                    667 ;	 function HandleClassRequest
                                    668 ;	-----------------------------------------
      000DD9                        669 _HandleClassRequest:
                                    670 ;	control.c:161: switch(bRequest)
      000DD9 74 09            [12]  671 	mov	a,#0x09
      000DDB B5 1B 02         [24]  672 	cjne	a,_bRequest,00120$
      000DDE 80 0E            [24]  673 	sjmp	00101$
      000DE0                        674 00120$:
      000DE0 74 0A            [12]  675 	mov	a,#0x0a
      000DE2 B5 1B 02         [24]  676 	cjne	a,_bRequest,00121$
      000DE5 80 11            [24]  677 	sjmp	00102$
      000DE7                        678 00121$:
      000DE7 74 FE            [12]  679 	mov	a,#0xfe
                                    680 ;	control.c:163: case 0x09:
      000DE9 B5 1B 16         [24]  681 	cjne	a,_bRequest,00104$
      000DEC 80 11            [24]  682 	sjmp	00103$
      000DEE                        683 00101$:
                                    684 ;	control.c:165: EP0CS = 0x05;
      000DEE 90 F0 48         [24]  685 	mov	dptr,#_EP0CS
      000DF1 74 05            [12]  686 	mov	a,#0x05
      000DF3 F0               [24]  687 	movx	@dptr,a
                                    688 ;	control.c:166: return TRUE;
      000DF4 75 82 01         [24]  689 	mov	dpl,#0x01
                                    690 ;	control.c:168: case 0x0A:
      000DF7 22               [24]  691 	ret
      000DF8                        692 00102$:
                                    693 ;	control.c:170: EP0ACK();
      000DF8 12 0C 68         [24]  694 	lcall	_EP0ACK
                                    695 ;	control.c:171: return TRUE;
      000DFB 75 82 01         [24]  696 	mov	dpl,#0x01
                                    697 ;	control.c:173: case 0xFE:
      000DFE 22               [24]  698 	ret
      000DFF                        699 00103$:
                                    700 ;	control.c:175: return GetMaxLUN();
                                    701 ;	control.c:177: default:
      000DFF 02 0D B6         [24]  702 	ljmp	_GetMaxLUN
      000E02                        703 00104$:
                                    704 ;	control.c:179: return FALSE;
      000E02 75 82 00         [24]  705 	mov	dpl,#0x00
                                    706 ;	control.c:181: }
                                    707 ;	control.c:182: }
      000E05 22               [24]  708 	ret
                                    709 ;------------------------------------------------------------
                                    710 ;Allocation info for local variables in function 'HandleVendorRequest'
                                    711 ;------------------------------------------------------------
                                    712 ;	control.c:184: BYTE HandleVendorRequest()
                                    713 ;	-----------------------------------------
                                    714 ;	 function HandleVendorRequest
                                    715 ;	-----------------------------------------
      000E06                        716 _HandleVendorRequest:
                                    717 ;	control.c:186: return FALSE;
      000E06 75 82 00         [24]  718 	mov	dpl,#0x00
                                    719 ;	control.c:187: }
      000E09 22               [24]  720 	ret
                                    721 	.area CSEG    (CODE)
                                    722 	.area CONST   (CODE)
      003157                        723 _deviceDescriptor:
      003157 12                     724 	.db #0x12	; 18
      003158 01                     725 	.db #0x01	; 1
      003159 00                     726 	.db #0x00	; 0
      00315A 02                     727 	.db #0x02	; 2
      00315B 00                     728 	.db #0x00	; 0
      00315C 00                     729 	.db #0x00	; 0
      00315D 00                     730 	.db #0x00	; 0
      00315E 40                     731 	.db #0x40	; 64
      00315F FE                     732 	.db #0xfe	; 254
      003160 13                     733 	.db #0x13	; 19
      003161 01                     734 	.db #0x01	; 1
      003162 52                     735 	.db #0x52	; 82	'R'
      003163 10                     736 	.db #0x10	; 16
      003164 01                     737 	.db #0x01	; 1
      003165 00                     738 	.db #0x00	; 0
      003166 00                     739 	.db #0x00	; 0
      003167 00                     740 	.db #0x00	; 0
      003168 01                     741 	.db #0x01	; 1
      003169                        742 _configDescriptor:
      003169 09                     743 	.db #0x09	; 9
      00316A 02                     744 	.db #0x02	; 2
      00316B 47                     745 	.db #0x47	; 71	'G'
      00316C 00                     746 	.db #0x00	; 0
      00316D 02                     747 	.db #0x02	; 2
      00316E 01                     748 	.db #0x01	; 1
      00316F 00                     749 	.db #0x00	; 0
      003170 80                     750 	.db #0x80	; 128
      003171 4B                     751 	.db #0x4b	; 75	'K'
      003172 09                     752 	.db #0x09	; 9
      003173 04                     753 	.db #0x04	; 4
      003174 00                     754 	.db #0x00	; 0
      003175 00                     755 	.db #0x00	; 0
      003176 03                     756 	.db #0x03	; 3
      003177 08                     757 	.db #0x08	; 8
      003178 06                     758 	.db #0x06	; 6
      003179 50                     759 	.db #0x50	; 80	'P'
      00317A 00                     760 	.db #0x00	; 0
      00317B 07                     761 	.db #0x07	; 7
      00317C 05                     762 	.db #0x05	; 5
      00317D 81                     763 	.db #0x81	; 129
      00317E 02                     764 	.db #0x02	; 2
      00317F 40                     765 	.db #0x40	; 64
      003180 00                     766 	.db #0x00	; 0
      003181 00                     767 	.db #0x00	; 0
      003182 07                     768 	.db #0x07	; 7
      003183 05                     769 	.db #0x05	; 5
      003184 02                     770 	.db #0x02	; 2
      003185 02                     771 	.db #0x02	; 2
      003186 40                     772 	.db #0x40	; 64
      003187 00                     773 	.db #0x00	; 0
      003188 00                     774 	.db #0x00	; 0
      003189 07                     775 	.db #0x07	; 7
      00318A 05                     776 	.db #0x05	; 5
      00318B 83                     777 	.db #0x83	; 131
      00318C 03                     778 	.db #0x03	; 3
      00318D 08                     779 	.db #0x08	; 8
      00318E 00                     780 	.db #0x00	; 0
      00318F 00                     781 	.db #0x00	; 0
      003190 09                     782 	.db #0x09	; 9
      003191 04                     783 	.db #0x04	; 4
      003192 01                     784 	.db #0x01	; 1
      003193 00                     785 	.db #0x00	; 0
      003194 02                     786 	.db #0x02	; 2
      003195 03                     787 	.db #0x03	; 3
      003196 01                     788 	.db #0x01	; 1
      003197 01                     789 	.db #0x01	; 1
      003198 00                     790 	.db #0x00	; 0
      003199 09                     791 	.db #0x09	; 9
      00319A 21                     792 	.db #0x21	; 33
      00319B 01                     793 	.db #0x01	; 1
      00319C 01                     794 	.db #0x01	; 1
      00319D 00                     795 	.db #0x00	; 0
      00319E 01                     796 	.db #0x01	; 1
      00319F 22                     797 	.db #0x22	; 34
      0031A0 3F                     798 	.db #0x3f	; 63
      0031A1 00                     799 	.db #0x00	; 0
      0031A2 07                     800 	.db #0x07	; 7
      0031A3 05                     801 	.db #0x05	; 5
      0031A4 83                     802 	.db #0x83	; 131
      0031A5 03                     803 	.db #0x03	; 3
      0031A6 08                     804 	.db #0x08	; 8
      0031A7 00                     805 	.db #0x00	; 0
      0031A8 01                     806 	.db #0x01	; 1
      0031A9 07                     807 	.db #0x07	; 7
      0031AA 05                     808 	.db #0x05	; 5
      0031AB 04                     809 	.db #0x04	; 4
      0031AC 03                     810 	.db #0x03	; 3
      0031AD 08                     811 	.db #0x08	; 8
      0031AE 00                     812 	.db #0x00	; 0
      0031AF 01                     813 	.db #0x01	; 1
      0031B0                        814 _HIDreportDescriptor:
      0031B0 05                     815 	.db #0x05	; 5
      0031B1 01                     816 	.db #0x01	; 1
      0031B2 09                     817 	.db #0x09	; 9
      0031B3 06                     818 	.db #0x06	; 6
      0031B4 A1                     819 	.db #0xa1	; 161
      0031B5 01                     820 	.db #0x01	; 1
      0031B6 05                     821 	.db #0x05	; 5
      0031B7 07                     822 	.db #0x07	; 7
      0031B8 19                     823 	.db #0x19	; 25
      0031B9 E0                     824 	.db #0xe0	; 224
      0031BA 29                     825 	.db #0x29	; 41
      0031BB E7                     826 	.db #0xe7	; 231
      0031BC 15                     827 	.db #0x15	; 21
      0031BD 00                     828 	.db #0x00	; 0
      0031BE 25                     829 	.db #0x25	; 37
      0031BF 01                     830 	.db #0x01	; 1
      0031C0 75                     831 	.db #0x75	; 117	'u'
      0031C1 01                     832 	.db #0x01	; 1
      0031C2 95                     833 	.db #0x95	; 149
      0031C3 08                     834 	.db #0x08	; 8
      0031C4 81                     835 	.db #0x81	; 129
      0031C5 02                     836 	.db #0x02	; 2
      0031C6 95                     837 	.db #0x95	; 149
      0031C7 01                     838 	.db #0x01	; 1
      0031C8 75                     839 	.db #0x75	; 117	'u'
      0031C9 08                     840 	.db #0x08	; 8
      0031CA 81                     841 	.db #0x81	; 129
      0031CB 01                     842 	.db #0x01	; 1
      0031CC 95                     843 	.db #0x95	; 149
      0031CD 05                     844 	.db #0x05	; 5
      0031CE 75                     845 	.db #0x75	; 117	'u'
      0031CF 01                     846 	.db #0x01	; 1
      0031D0 05                     847 	.db #0x05	; 5
      0031D1 08                     848 	.db #0x08	; 8
      0031D2 19                     849 	.db #0x19	; 25
      0031D3 01                     850 	.db #0x01	; 1
      0031D4 29                     851 	.db #0x29	; 41
      0031D5 05                     852 	.db #0x05	; 5
      0031D6 91                     853 	.db #0x91	; 145
      0031D7 02                     854 	.db #0x02	; 2
      0031D8 95                     855 	.db #0x95	; 149
      0031D9 01                     856 	.db #0x01	; 1
      0031DA 75                     857 	.db #0x75	; 117	'u'
      0031DB 03                     858 	.db #0x03	; 3
      0031DC 91                     859 	.db #0x91	; 145
      0031DD 01                     860 	.db #0x01	; 1
      0031DE 95                     861 	.db #0x95	; 149
      0031DF 06                     862 	.db #0x06	; 6
      0031E0 75                     863 	.db #0x75	; 117	'u'
      0031E1 08                     864 	.db #0x08	; 8
      0031E2 15                     865 	.db #0x15	; 21
      0031E3 00                     866 	.db #0x00	; 0
      0031E4 25                     867 	.db #0x25	; 37
      0031E5 65                     868 	.db #0x65	; 101	'e'
      0031E6 05                     869 	.db #0x05	; 5
      0031E7 07                     870 	.db #0x07	; 7
      0031E8 19                     871 	.db #0x19	; 25
      0031E9 00                     872 	.db #0x00	; 0
      0031EA 29                     873 	.db #0x29	; 41
      0031EB 65                     874 	.db #0x65	; 101	'e'
      0031EC 81                     875 	.db #0x81	; 129
      0031ED 00                     876 	.db #0x00	; 0
      0031EE C0                     877 	.db #0xc0	; 192
      0031EF                        878 _deviceQualifierDescriptor:
      0031EF 0A                     879 	.db #0x0a	; 10
      0031F0 06                     880 	.db #0x06	; 6
      0031F1 00                     881 	.db #0x00	; 0
      0031F2 02                     882 	.db #0x02	; 2
      0031F3 00                     883 	.db #0x00	; 0
      0031F4 00                     884 	.db #0x00	; 0
      0031F5 00                     885 	.db #0x00	; 0
      0031F6 40                     886 	.db #0x40	; 64
      0031F7 01                     887 	.db #0x01	; 1
      0031F8 00                     888 	.db #0x00	; 0
                                    889 	.area XINIT   (CODE)
                                    890 	.area CABS    (ABS,CODE)
