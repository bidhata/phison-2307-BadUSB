                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.7.1 #10443 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module usb
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _SetDMA_PARM_3
                                     12 	.globl _SetDMA_PARM_2
                                     13 	.globl _HandleUSBEvents
                                     14 	.globl _ep_isr
                                     15 	.globl _usb_isr
                                     16 	.globl _InitUSB
                                     17 	.globl _SendData1
                                     18 	.globl _SendData0
                                     19 	.globl _SendControlResponse
                                     20 	.globl _SetDMA
                                     21 	.globl _HandleVendorRequest
                                     22 	.globl _HandleClassRequest
                                     23 	.globl _HandleStandardRequest
                                     24 	.globl _HandleCDB
                                     25 	.globl _RI
                                     26 	.globl _TI
                                     27 	.globl _RB8
                                     28 	.globl _TB8
                                     29 	.globl _REN
                                     30 	.globl _SM2
                                     31 	.globl _SM1
                                     32 	.globl _SM0
                                     33 	.globl _RXD
                                     34 	.globl _TXD
                                     35 	.globl _INT0
                                     36 	.globl _INT1
                                     37 	.globl _T0
                                     38 	.globl _T1
                                     39 	.globl _WR
                                     40 	.globl _RD
                                     41 	.globl _PX0
                                     42 	.globl _PT0
                                     43 	.globl _PX1
                                     44 	.globl _PT1
                                     45 	.globl _PS
                                     46 	.globl _EX0
                                     47 	.globl _ET0
                                     48 	.globl _EX1
                                     49 	.globl _ET1
                                     50 	.globl _ES
                                     51 	.globl _EA
                                     52 	.globl _IT0
                                     53 	.globl _IE0
                                     54 	.globl _IT1
                                     55 	.globl _IE1
                                     56 	.globl _TR0
                                     57 	.globl _TF0
                                     58 	.globl _TR1
                                     59 	.globl _TF1
                                     60 	.globl _P
                                     61 	.globl _OV
                                     62 	.globl _RS0
                                     63 	.globl _RS1
                                     64 	.globl _F0
                                     65 	.globl _AC
                                     66 	.globl _CY
                                     67 	.globl _SBUF
                                     68 	.globl _SCON
                                     69 	.globl _IP
                                     70 	.globl _IE
                                     71 	.globl _TH1
                                     72 	.globl _TH0
                                     73 	.globl _TL1
                                     74 	.globl _TL0
                                     75 	.globl _TMOD
                                     76 	.globl _TCON
                                     77 	.globl _PCON
                                     78 	.globl _DPH
                                     79 	.globl _DPL
                                     80 	.globl _SP
                                     81 	.globl _B
                                     82 	.globl _ACC
                                     83 	.globl _PSW
                                     84 	.globl _P3
                                     85 	.globl _P2
                                     86 	.globl _P1
                                     87 	.globl _P0
                                     88 	.globl _usb_have_csw_ready
                                     89 	.globl _usb_received_data_ready
                                     90 	.globl _usb_buffer
                                     91 	.globl _PRAMCTL
                                     92 	.globl _BANK2PAH
                                     93 	.globl _BANK2PAL
                                     94 	.globl _BANK2VA
                                     95 	.globl _BANK1PAH
                                     96 	.globl _BANK1PAL
                                     97 	.globl _BANK1VA
                                     98 	.globl _BANK0PAH
                                     99 	.globl _BANK0PAL
                                    100 	.globl _WARMSTATUS
                                    101 	.globl _GPIO0OUT
                                    102 	.globl _GPIO0DIR
                                    103 	.globl _DMACMD
                                    104 	.globl _DMAFILL3
                                    105 	.globl _DMAFILL2
                                    106 	.globl _DMAFILL1
                                    107 	.globl _DMAFILL0
                                    108 	.globl _DMASIZEH
                                    109 	.globl _DMASIZEM
                                    110 	.globl _DMASIZEL
                                    111 	.globl _DMADSTH
                                    112 	.globl _DMADSTM
                                    113 	.globl _DMADSTL
                                    114 	.globl _DMASRCH
                                    115 	.globl _DMASRCM
                                    116 	.globl _DMASRCL
                                    117 	.globl _NANDCSDIR
                                    118 	.globl _NANDCSOUT
                                    119 	.globl _EP4
                                    120 	.globl _EP3
                                    121 	.globl _EP2
                                    122 	.globl _EP1
                                    123 	.globl _EP0
                                    124 	.globl _SETUPDAT
                                    125 	.globl _EP0CS
                                    126 	.globl _EPIE
                                    127 	.globl _EPIRQ
                                    128 	.globl _USBIRQ
                                    129 	.globl _USBSTAT
                                    130 	.globl _USBCTL
                                    131 	.globl _REGBANK
                                    132 	.globl _SendData1_PARM_2
                                    133 	.globl _SendData0_PARM_2
                                    134 	.globl _usb_speed
                                    135 	.globl _wLength
                                    136 	.globl _wIndex
                                    137 	.globl _wValue
                                    138 	.globl _bRequest
                                    139 	.globl _bmRequestType
                                    140 ;--------------------------------------------------------
                                    141 ; special function registers
                                    142 ;--------------------------------------------------------
                                    143 	.area RSEG    (ABS,DATA)
      000000                        144 	.org 0x0000
                           000080   145 _P0	=	0x0080
                           000090   146 _P1	=	0x0090
                           0000A0   147 _P2	=	0x00a0
                           0000B0   148 _P3	=	0x00b0
                           0000D0   149 _PSW	=	0x00d0
                           0000E0   150 _ACC	=	0x00e0
                           0000F0   151 _B	=	0x00f0
                           000081   152 _SP	=	0x0081
                           000082   153 _DPL	=	0x0082
                           000083   154 _DPH	=	0x0083
                           000087   155 _PCON	=	0x0087
                           000088   156 _TCON	=	0x0088
                           000089   157 _TMOD	=	0x0089
                           00008A   158 _TL0	=	0x008a
                           00008B   159 _TL1	=	0x008b
                           00008C   160 _TH0	=	0x008c
                           00008D   161 _TH1	=	0x008d
                           0000A8   162 _IE	=	0x00a8
                           0000B8   163 _IP	=	0x00b8
                           000098   164 _SCON	=	0x0098
                           000099   165 _SBUF	=	0x0099
                                    166 ;--------------------------------------------------------
                                    167 ; special function bits
                                    168 ;--------------------------------------------------------
                                    169 	.area RSEG    (ABS,DATA)
      000000                        170 	.org 0x0000
                           0000D7   171 _CY	=	0x00d7
                           0000D6   172 _AC	=	0x00d6
                           0000D5   173 _F0	=	0x00d5
                           0000D4   174 _RS1	=	0x00d4
                           0000D3   175 _RS0	=	0x00d3
                           0000D2   176 _OV	=	0x00d2
                           0000D0   177 _P	=	0x00d0
                           00008F   178 _TF1	=	0x008f
                           00008E   179 _TR1	=	0x008e
                           00008D   180 _TF0	=	0x008d
                           00008C   181 _TR0	=	0x008c
                           00008B   182 _IE1	=	0x008b
                           00008A   183 _IT1	=	0x008a
                           000089   184 _IE0	=	0x0089
                           000088   185 _IT0	=	0x0088
                           0000AF   186 _EA	=	0x00af
                           0000AC   187 _ES	=	0x00ac
                           0000AB   188 _ET1	=	0x00ab
                           0000AA   189 _EX1	=	0x00aa
                           0000A9   190 _ET0	=	0x00a9
                           0000A8   191 _EX0	=	0x00a8
                           0000BC   192 _PS	=	0x00bc
                           0000BB   193 _PT1	=	0x00bb
                           0000BA   194 _PX1	=	0x00ba
                           0000B9   195 _PT0	=	0x00b9
                           0000B8   196 _PX0	=	0x00b8
                           0000B7   197 _RD	=	0x00b7
                           0000B6   198 _WR	=	0x00b6
                           0000B5   199 _T1	=	0x00b5
                           0000B4   200 _T0	=	0x00b4
                           0000B3   201 _INT1	=	0x00b3
                           0000B2   202 _INT0	=	0x00b2
                           0000B1   203 _TXD	=	0x00b1
                           0000B0   204 _RXD	=	0x00b0
                           00009F   205 _SM0	=	0x009f
                           00009E   206 _SM1	=	0x009e
                           00009D   207 _SM2	=	0x009d
                           00009C   208 _REN	=	0x009c
                           00009B   209 _TB8	=	0x009b
                           00009A   210 _RB8	=	0x009a
                           000099   211 _TI	=	0x0099
                           000098   212 _RI	=	0x0098
                                    213 ;--------------------------------------------------------
                                    214 ; overlayable register banks
                                    215 ;--------------------------------------------------------
                                    216 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        217 	.ds 8
                                    218 ;--------------------------------------------------------
                                    219 ; internal ram data
                                    220 ;--------------------------------------------------------
                                    221 	.area DSEG    (DATA)
      00001A                        222 _bmRequestType::
      00001A                        223 	.ds 1
      00001B                        224 _bRequest::
      00001B                        225 	.ds 1
      00001C                        226 _wValue::
      00001C                        227 	.ds 2
      00001E                        228 _wIndex::
      00001E                        229 	.ds 2
      000020                        230 _wLength::
      000020                        231 	.ds 2
      000022                        232 _usb_speed::
      000022                        233 	.ds 1
      000023                        234 _SendData0_PARM_2:
      000023                        235 	.ds 1
      000024                        236 _SendData1_PARM_2:
      000024                        237 	.ds 1
                                    238 ;--------------------------------------------------------
                                    239 ; overlayable items in internal ram 
                                    240 ;--------------------------------------------------------
                                    241 	.area	OSEG    (OVR,DATA)
      000045                        242 _SetDMA_PARM_2:
      000045                        243 	.ds 1
      000046                        244 _SetDMA_PARM_3:
      000046                        245 	.ds 1
                                    246 	.area	OSEG    (OVR,DATA)
                                    247 ;--------------------------------------------------------
                                    248 ; indirectly addressable internal ram data
                                    249 ;--------------------------------------------------------
                                    250 	.area ISEG    (DATA)
                                    251 ;--------------------------------------------------------
                                    252 ; absolute internal ram data
                                    253 ;--------------------------------------------------------
                                    254 	.area IABS    (ABS,DATA)
                                    255 	.area IABS    (ABS,DATA)
                                    256 ;--------------------------------------------------------
                                    257 ; bit data
                                    258 ;--------------------------------------------------------
                                    259 	.area BSEG    (BIT)
                                    260 ;--------------------------------------------------------
                                    261 ; paged external ram data
                                    262 ;--------------------------------------------------------
                                    263 	.area PSEG    (PAG,XDATA)
                                    264 ;--------------------------------------------------------
                                    265 ; external ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area XSEG    (XDATA)
                           00F000   268 _REGBANK	=	0xf000
                           00F008   269 _USBCTL	=	0xf008
                           00F009   270 _USBSTAT	=	0xf009
                           00F027   271 _USBIRQ	=	0xf027
                           00F020   272 _EPIRQ	=	0xf020
                           00F030   273 _EPIE	=	0xf030
                           00F048   274 _EP0CS	=	0xf048
                           00F0B8   275 _SETUPDAT	=	0xf0b8
                           00F1C0   276 _EP0	=	0xf1c0
                           00F200   277 _EP1	=	0xf200
                           00F240   278 _EP2	=	0xf240
                           00F280   279 _EP3	=	0xf280
                           00F2C0   280 _EP4	=	0xf2c0
                           00F608   281 _NANDCSOUT	=	0xf608
                           00F618   282 _NANDCSDIR	=	0xf618
                           00F900   283 _DMASRCL	=	0xf900
                           00F901   284 _DMASRCM	=	0xf901
                           00F902   285 _DMASRCH	=	0xf902
                           00F904   286 _DMADSTL	=	0xf904
                           00F905   287 _DMADSTM	=	0xf905
                           00F906   288 _DMADSTH	=	0xf906
                           00F908   289 _DMASIZEL	=	0xf908
                           00F909   290 _DMASIZEM	=	0xf909
                           00F90A   291 _DMASIZEH	=	0xf90a
                           00F90C   292 _DMAFILL0	=	0xf90c
                           00F90D   293 _DMAFILL1	=	0xf90d
                           00F90E   294 _DMAFILL2	=	0xf90e
                           00F90F   295 _DMAFILL3	=	0xf90f
                           00F930   296 _DMACMD	=	0xf930
                           00FA14   297 _GPIO0DIR	=	0xfa14
                           00FA15   298 _GPIO0OUT	=	0xfa15
                           00FA38   299 _WARMSTATUS	=	0xfa38
                           00FA40   300 _BANK0PAL	=	0xfa40
                           00FA41   301 _BANK0PAH	=	0xfa41
                           00FA42   302 _BANK1VA	=	0xfa42
                           00FA43   303 _BANK1PAL	=	0xfa43
                           00FA44   304 _BANK1PAH	=	0xfa44
                           00FA45   305 _BANK2VA	=	0xfa45
                           00FA46   306 _BANK2PAL	=	0xfa46
                           00FA47   307 _BANK2PAH	=	0xfa47
                           00FA48   308 _PRAMCTL	=	0xfa48
                           000000   309 _usb_buffer	=	0x0000
      006000                        310 _usb_irq:
      006000                        311 	.ds 1
      006001                        312 _UsbIntStsF080:
      006001                        313 	.ds 1
      006002                        314 _UsbIntStsF082:
      006002                        315 	.ds 1
      006003                        316 _UsbIntStsF086:
      006003                        317 	.ds 1
      006004                        318 _UsbIntStsF087:
      006004                        319 	.ds 1
      006005                        320 _usb_received_data_ready::
      006005                        321 	.ds 1
      006006                        322 _usb_have_csw_ready::
      006006                        323 	.ds 1
                                    324 ;--------------------------------------------------------
                                    325 ; absolute external ram data
                                    326 ;--------------------------------------------------------
                                    327 	.area XABS    (ABS,XDATA)
                                    328 ;--------------------------------------------------------
                                    329 ; external initialized ram data
                                    330 ;--------------------------------------------------------
                                    331 	.area XISEG   (XDATA)
                                    332 	.area HOME    (CODE)
                                    333 	.area GSINIT0 (CODE)
                                    334 	.area GSINIT1 (CODE)
                                    335 	.area GSINIT2 (CODE)
                                    336 	.area GSINIT3 (CODE)
                                    337 	.area GSINIT4 (CODE)
                                    338 	.area GSINIT5 (CODE)
                                    339 	.area GSINIT  (CODE)
                                    340 	.area GSFINAL (CODE)
                                    341 	.area CSEG    (CODE)
                                    342 ;--------------------------------------------------------
                                    343 ; global & static initialisations
                                    344 ;--------------------------------------------------------
                                    345 	.area HOME    (CODE)
                                    346 	.area GSINIT  (CODE)
                                    347 	.area GSFINAL (CODE)
                                    348 	.area GSINIT  (CODE)
                                    349 ;--------------------------------------------------------
                                    350 ; Home
                                    351 ;--------------------------------------------------------
                                    352 	.area HOME    (CODE)
                                    353 	.area HOME    (CODE)
                                    354 ;--------------------------------------------------------
                                    355 ; code
                                    356 ;--------------------------------------------------------
                                    357 	.area CSEG    (CODE)
                                    358 ;------------------------------------------------------------
                                    359 ;Allocation info for local variables in function 'SetDMA'
                                    360 ;------------------------------------------------------------
                                    361 ;p3                        Allocated with name '_SetDMA_PARM_2'
                                    362 ;px                        Allocated with name '_SetDMA_PARM_3'
                                    363 ;p5                        Allocated to registers r7 
                                    364 ;------------------------------------------------------------
                                    365 ;	usb.c:34: void SetDMA(BYTE p5, BYTE p3, BYTE px)
                                    366 ;	-----------------------------------------
                                    367 ;	 function SetDMA
                                    368 ;	-----------------------------------------
      0004C8                        369 _SetDMA:
                           000007   370 	ar7 = 0x07
                           000006   371 	ar6 = 0x06
                           000005   372 	ar5 = 0x05
                           000004   373 	ar4 = 0x04
                           000003   374 	ar3 = 0x03
                           000002   375 	ar2 = 0x02
                           000001   376 	ar1 = 0x01
                           000000   377 	ar0 = 0x00
      0004C8 AF 82            [24]  378 	mov	r7,dpl
                                    379 ;	usb.c:36: XVAL(0xF80B) = 0;
      0004CA 90 F8 0B         [24]  380 	mov	dptr,#0xf80b
      0004CD E4               [12]  381 	clr	a
      0004CE F0               [24]  382 	movx	@dptr,a
                                    383 ;	usb.c:37: XVAL(0xF80C) = p5-1;
      0004CF 1F               [12]  384 	dec	r7
      0004D0 90 F8 0C         [24]  385 	mov	dptr,#0xf80c
      0004D3 EF               [12]  386 	mov	a,r7
      0004D4 F0               [24]  387 	movx	@dptr,a
                                    388 ;	usb.c:39: switch(px)
      0004D5 E4               [12]  389 	clr	a
      0004D6 B5 46 02         [24]  390 	cjne	a,_SetDMA_PARM_3,00120$
      0004D9 80 0E            [24]  391 	sjmp	00101$
      0004DB                        392 00120$:
      0004DB 74 01            [12]  393 	mov	a,#0x01
      0004DD B5 46 02         [24]  394 	cjne	a,_SetDMA_PARM_3,00121$
      0004E0 80 14            [24]  395 	sjmp	00102$
      0004E2                        396 00121$:
      0004E2 74 02            [12]  397 	mov	a,#0x02
                                    398 ;	usb.c:41: case 0:
      0004E4 B5 46 1C         [24]  399 	cjne	a,_SetDMA_PARM_3,00106$
      0004E7 80 14            [24]  400 	sjmp	00103$
      0004E9                        401 00101$:
                                    402 ;	usb.c:43: XVAL(0xF80D) = p3;
      0004E9 90 F8 0D         [24]  403 	mov	dptr,#0xf80d
      0004EC E5 45            [12]  404 	mov	a,_SetDMA_PARM_2
      0004EE F0               [24]  405 	movx	@dptr,a
                                    406 ;	usb.c:44: XVAL(0xF80E) = p3;
      0004EF 90 F8 0E         [24]  407 	mov	dptr,#0xf80e
      0004F2 E5 45            [12]  408 	mov	a,_SetDMA_PARM_2
      0004F4 F0               [24]  409 	movx	@dptr,a
                                    410 ;	usb.c:45: break;
                                    411 ;	usb.c:47: case 1:
      0004F5 22               [24]  412 	ret
      0004F6                        413 00102$:
                                    414 ;	usb.c:49: XVAL(0xF80D) = p3;
      0004F6 90 F8 0D         [24]  415 	mov	dptr,#0xf80d
      0004F9 E5 45            [12]  416 	mov	a,_SetDMA_PARM_2
      0004FB F0               [24]  417 	movx	@dptr,a
                                    418 ;	usb.c:50: break;
                                    419 ;	usb.c:52: case 2:
      0004FC 22               [24]  420 	ret
      0004FD                        421 00103$:
                                    422 ;	usb.c:54: XVAL(0xF80E) = p3;
      0004FD 90 F8 0E         [24]  423 	mov	dptr,#0xf80e
      000500 E5 45            [12]  424 	mov	a,_SetDMA_PARM_2
      000502 F0               [24]  425 	movx	@dptr,a
                                    426 ;	usb.c:61: }
      000503                        427 00106$:
                                    428 ;	usb.c:62: }
      000503 22               [24]  429 	ret
                                    430 ;------------------------------------------------------------
                                    431 ;Allocation info for local variables in function 'SendControlResponse'
                                    432 ;------------------------------------------------------------
                                    433 ;size                      Allocated to registers r6 r7 
                                    434 ;------------------------------------------------------------
                                    435 ;	usb.c:64: void SendControlResponse(int size)
                                    436 ;	-----------------------------------------
                                    437 ;	 function SendControlResponse
                                    438 ;	-----------------------------------------
      000504                        439 _SendControlResponse:
      000504 AE 82            [24]  440 	mov	r6,dpl
      000506 AF 83            [24]  441 	mov	r7,dph
                                    442 ;	usb.c:66: EP0.len_l = LSB(size);
      000508 8E 05            [24]  443 	mov	ar5,r6
      00050A 90 F1 CC         [24]  444 	mov	dptr,#(_EP0 + 0x000c)
      00050D ED               [12]  445 	mov	a,r5
      00050E F0               [24]  446 	movx	@dptr,a
                                    447 ;	usb.c:67: EP0.len_m = MSB(size);
      00050F 8F 06            [24]  448 	mov	ar6,r7
      000511 90 F1 CD         [24]  449 	mov	dptr,#(_EP0 + 0x000d)
      000514 EE               [12]  450 	mov	a,r6
      000515 F0               [24]  451 	movx	@dptr,a
                                    452 ;	usb.c:68: EP0.len_h = 0;
      000516 90 F1 CE         [24]  453 	mov	dptr,#(_EP0 + 0x000e)
      000519 E4               [12]  454 	clr	a
      00051A F0               [24]  455 	movx	@dptr,a
                                    456 ;	usb.c:69: EP0.cs = 0x40;
      00051B 90 F1 D3         [24]  457 	mov	dptr,#(_EP0 + 0x0013)
      00051E 74 40            [12]  458 	mov	a,#0x40
      000520 F0               [24]  459 	movx	@dptr,a
                                    460 ;	usb.c:70: while (EP0.cs & 0x40);
      000521                        461 00101$:
      000521 90 F1 D3         [24]  462 	mov	dptr,#(_EP0 + 0x0013)
      000524 E0               [24]  463 	movx	a,@dptr
      000525 FF               [12]  464 	mov	r7,a
      000526 20 E6 F8         [24]  465 	jb	acc.6,00101$
                                    466 ;	usb.c:71: EP0CS = 0x05;
      000529 90 F0 48         [24]  467 	mov	dptr,#_EP0CS
      00052C 74 05            [12]  468 	mov	a,#0x05
      00052E F0               [24]  469 	movx	@dptr,a
                                    470 ;	usb.c:72: }
      00052F 22               [24]  471 	ret
                                    472 ;------------------------------------------------------------
                                    473 ;Allocation info for local variables in function 'SendData0'
                                    474 ;------------------------------------------------------------
                                    475 ;offset                    Allocated with name '_SendData0_PARM_2'
                                    476 ;size                      Allocated to registers r6 r7 
                                    477 ;------------------------------------------------------------
                                    478 ;	usb.c:74: void SendData0(WORD size, BYTE offset)
                                    479 ;	-----------------------------------------
                                    480 ;	 function SendData0
                                    481 ;	-----------------------------------------
      000530                        482 _SendData0:
      000530 AE 82            [24]  483 	mov	r6,dpl
      000532 AF 83            [24]  484 	mov	r7,dph
                                    485 ;	usb.c:76: if (size > 0)
      000534 EE               [12]  486 	mov	a,r6
      000535 4F               [12]  487 	orl	a,r7
      000536 60 56            [24]  488 	jz	00106$
                                    489 ;	usb.c:78: SetDMA(0x20, 0, 0);
      000538 75 45 00         [24]  490 	mov	_SetDMA_PARM_2,#0x00
      00053B 75 46 00         [24]  491 	mov	_SetDMA_PARM_3,#0x00
      00053E 75 82 20         [24]  492 	mov	dpl,#0x20
      000541 C0 07            [24]  493 	push	ar7
      000543 C0 06            [24]  494 	push	ar6
      000545 12 04 C8         [24]  495 	lcall	_SetDMA
                                    496 ;	usb.c:79: SetDMA(0x20, 0x80, 1);
      000548 75 45 80         [24]  497 	mov	_SetDMA_PARM_2,#0x80
      00054B 75 46 01         [24]  498 	mov	_SetDMA_PARM_3,#0x01
      00054E 75 82 20         [24]  499 	mov	dpl,#0x20
      000551 12 04 C8         [24]  500 	lcall	_SetDMA
      000554 D0 06            [24]  501 	pop	ar6
      000556 D0 07            [24]  502 	pop	ar7
                                    503 ;	usb.c:80: EP0.ptr_l = usb_buffer_PA>>8;
      000558 90 F1 C5         [24]  504 	mov	dptr,#(_EP0 + 0x0005)
      00055B 74 80            [12]  505 	mov	a,#0x80
      00055D F0               [24]  506 	movx	@dptr,a
                                    507 ;	usb.c:81: EP0.ptr_m = usb_buffer_PA>>16;
      00055E 90 F1 C6         [24]  508 	mov	dptr,#(_EP0 + 0x0006)
      000561 E4               [12]  509 	clr	a
      000562 F0               [24]  510 	movx	@dptr,a
                                    511 ;	usb.c:82: EP0.ptr_h = usb_buffer_PA>>24;
      000563 90 F1 C7         [24]  512 	mov	dptr,#(_EP0 + 0x0007)
      000566 F0               [24]  513 	movx	@dptr,a
                                    514 ;	usb.c:83: EP0.offset = offset;
      000567 90 F1 CA         [24]  515 	mov	dptr,#(_EP0 + 0x000a)
      00056A E5 23            [12]  516 	mov	a,_SendData0_PARM_2
      00056C F0               [24]  517 	movx	@dptr,a
                                    518 ;	usb.c:84: EP0.len_l = LSB(size);
      00056D 8E 05            [24]  519 	mov	ar5,r6
      00056F 90 F1 CC         [24]  520 	mov	dptr,#(_EP0 + 0x000c)
      000572 ED               [12]  521 	mov	a,r5
      000573 F0               [24]  522 	movx	@dptr,a
                                    523 ;	usb.c:85: EP0.len_m = MSB(size);
      000574 8F 06            [24]  524 	mov	ar6,r7
      000576 90 F1 CD         [24]  525 	mov	dptr,#(_EP0 + 0x000d)
      000579 EE               [12]  526 	mov	a,r6
      00057A F0               [24]  527 	movx	@dptr,a
                                    528 ;	usb.c:86: EP0.len_h = 0;
      00057B 90 F1 CE         [24]  529 	mov	dptr,#(_EP0 + 0x000e)
      00057E E4               [12]  530 	clr	a
      00057F F0               [24]  531 	movx	@dptr,a
                                    532 ;	usb.c:87: EP0.cs = 0x88;		
      000580 90 F1 D3         [24]  533 	mov	dptr,#(_EP0 + 0x0013)
      000583 74 88            [12]  534 	mov	a,#0x88
      000585 F0               [24]  535 	movx	@dptr,a
                                    536 ;	usb.c:89: while(EP0.cs & 0x80);	
      000586                        537 00101$:
      000586 90 F1 D3         [24]  538 	mov	dptr,#(_EP0 + 0x0013)
      000589 E0               [24]  539 	movx	a,@dptr
      00058A FF               [12]  540 	mov	r7,a
      00058B 20 E7 F8         [24]  541 	jb	acc.7,00101$
      00058E                        542 00106$:
                                    543 ;	usb.c:91: }
      00058E 22               [24]  544 	ret
                                    545 ;------------------------------------------------------------
                                    546 ;Allocation info for local variables in function 'SendData1'
                                    547 ;------------------------------------------------------------
                                    548 ;offset                    Allocated with name '_SendData1_PARM_2'
                                    549 ;size                      Allocated to registers r6 r7 
                                    550 ;------------------------------------------------------------
                                    551 ;	usb.c:93: void SendData1(WORD size, BYTE offset)
                                    552 ;	-----------------------------------------
                                    553 ;	 function SendData1
                                    554 ;	-----------------------------------------
      00058F                        555 _SendData1:
      00058F AE 82            [24]  556 	mov	r6,dpl
      000591 AF 83            [24]  557 	mov	r7,dph
                                    558 ;	usb.c:95: if (size > 0)
      000593 EE               [12]  559 	mov	a,r6
      000594 4F               [12]  560 	orl	a,r7
      000595 60 56            [24]  561 	jz	00106$
                                    562 ;	usb.c:97: SetDMA(0x20, 0, 0);
      000597 75 45 00         [24]  563 	mov	_SetDMA_PARM_2,#0x00
      00059A 75 46 00         [24]  564 	mov	_SetDMA_PARM_3,#0x00
      00059D 75 82 20         [24]  565 	mov	dpl,#0x20
      0005A0 C0 07            [24]  566 	push	ar7
      0005A2 C0 06            [24]  567 	push	ar6
      0005A4 12 04 C8         [24]  568 	lcall	_SetDMA
                                    569 ;	usb.c:98: SetDMA(0x20, 0x80, 1);
      0005A7 75 45 80         [24]  570 	mov	_SetDMA_PARM_2,#0x80
      0005AA 75 46 01         [24]  571 	mov	_SetDMA_PARM_3,#0x01
      0005AD 75 82 20         [24]  572 	mov	dpl,#0x20
      0005B0 12 04 C8         [24]  573 	lcall	_SetDMA
      0005B3 D0 06            [24]  574 	pop	ar6
      0005B5 D0 07            [24]  575 	pop	ar7
                                    576 ;	usb.c:99: EP1.ptr_l = usb_buffer_PA>>8;
      0005B7 90 F2 05         [24]  577 	mov	dptr,#(_EP1 + 0x0005)
      0005BA 74 80            [12]  578 	mov	a,#0x80
      0005BC F0               [24]  579 	movx	@dptr,a
                                    580 ;	usb.c:100: EP1.ptr_m = usb_buffer_PA>>16;
      0005BD 90 F2 06         [24]  581 	mov	dptr,#(_EP1 + 0x0006)
      0005C0 E4               [12]  582 	clr	a
      0005C1 F0               [24]  583 	movx	@dptr,a
                                    584 ;	usb.c:101: EP1.ptr_h = usb_buffer_PA>>24;
      0005C2 90 F2 07         [24]  585 	mov	dptr,#(_EP1 + 0x0007)
      0005C5 F0               [24]  586 	movx	@dptr,a
                                    587 ;	usb.c:102: EP1.offset = offset;
      0005C6 90 F2 0A         [24]  588 	mov	dptr,#(_EP1 + 0x000a)
      0005C9 E5 24            [12]  589 	mov	a,_SendData1_PARM_2
      0005CB F0               [24]  590 	movx	@dptr,a
                                    591 ;	usb.c:103: EP1.len_l = LSB(size);
      0005CC 8E 05            [24]  592 	mov	ar5,r6
      0005CE 90 F2 0C         [24]  593 	mov	dptr,#(_EP1 + 0x000c)
      0005D1 ED               [12]  594 	mov	a,r5
      0005D2 F0               [24]  595 	movx	@dptr,a
                                    596 ;	usb.c:104: EP1.len_m = MSB(size);
      0005D3 8F 06            [24]  597 	mov	ar6,r7
      0005D5 90 F2 0D         [24]  598 	mov	dptr,#(_EP1 + 0x000d)
      0005D8 EE               [12]  599 	mov	a,r6
      0005D9 F0               [24]  600 	movx	@dptr,a
                                    601 ;	usb.c:105: EP1.len_h = 0;
      0005DA 90 F2 0E         [24]  602 	mov	dptr,#(_EP1 + 0x000e)
      0005DD E4               [12]  603 	clr	a
      0005DE F0               [24]  604 	movx	@dptr,a
                                    605 ;	usb.c:106: EP1.cs = 0x88;		
      0005DF 90 F2 13         [24]  606 	mov	dptr,#(_EP1 + 0x0013)
      0005E2 74 88            [12]  607 	mov	a,#0x88
      0005E4 F0               [24]  608 	movx	@dptr,a
                                    609 ;	usb.c:108: while(EP1.cs & 0x80);	
      0005E5                        610 00101$:
      0005E5 90 F2 13         [24]  611 	mov	dptr,#(_EP1 + 0x0013)
      0005E8 E0               [24]  612 	movx	a,@dptr
      0005E9 FF               [12]  613 	mov	r7,a
      0005EA 20 E7 F8         [24]  614 	jb	acc.7,00101$
      0005ED                        615 00106$:
                                    616 ;	usb.c:110: }
      0005ED 22               [24]  617 	ret
                                    618 ;------------------------------------------------------------
                                    619 ;Allocation info for local variables in function 'SendCSW'
                                    620 ;------------------------------------------------------------
                                    621 ;	usb.c:112: static void SendCSW()
                                    622 ;	-----------------------------------------
                                    623 ;	 function SendCSW
                                    624 ;	-----------------------------------------
      0005EE                        625 _SendCSW:
                                    626 ;	usb.c:114: usb_buffer[0] = 'U';
      0005EE 90 00 00         [24]  627 	mov	dptr,#_usb_buffer
      0005F1 74 55            [12]  628 	mov	a,#0x55
      0005F3 F0               [24]  629 	movx	@dptr,a
                                    630 ;	usb.c:115: usb_buffer[1] = 'S';
      0005F4 90 00 01         [24]  631 	mov	dptr,#(_usb_buffer + 0x0001)
      0005F7 74 53            [12]  632 	mov	a,#0x53
      0005F9 F0               [24]  633 	movx	@dptr,a
                                    634 ;	usb.c:116: usb_buffer[2] = 'B';
      0005FA 90 00 02         [24]  635 	mov	dptr,#(_usb_buffer + 0x0002)
      0005FD 74 42            [12]  636 	mov	a,#0x42
      0005FF F0               [24]  637 	movx	@dptr,a
                                    638 ;	usb.c:117: usb_buffer[3] = 'S';
      000600 90 00 03         [24]  639 	mov	dptr,#(_usb_buffer + 0x0003)
      000603 74 53            [12]  640 	mov	a,#0x53
      000605 F0               [24]  641 	movx	@dptr,a
                                    642 ;	usb.c:118: usb_buffer[4] = scsi_tag[0];
      000606 90 00 04         [24]  643 	mov	dptr,#(_usb_buffer + 0x0004)
      000609 E5 2E            [12]  644 	mov	a,_scsi_tag
      00060B F0               [24]  645 	movx	@dptr,a
                                    646 ;	usb.c:119: usb_buffer[5] = scsi_tag[1];
      00060C 90 00 05         [24]  647 	mov	dptr,#(_usb_buffer + 0x0005)
      00060F E5 2F            [12]  648 	mov	a,(_scsi_tag + 0x0001)
      000611 F0               [24]  649 	movx	@dptr,a
                                    650 ;	usb.c:120: usb_buffer[6] = scsi_tag[2];
      000612 90 00 06         [24]  651 	mov	dptr,#(_usb_buffer + 0x0006)
      000615 E5 30            [12]  652 	mov	a,(_scsi_tag + 0x0002)
      000617 F0               [24]  653 	movx	@dptr,a
                                    654 ;	usb.c:121: usb_buffer[7] = scsi_tag[3];
      000618 90 00 07         [24]  655 	mov	dptr,#(_usb_buffer + 0x0007)
      00061B E5 31            [12]  656 	mov	a,(_scsi_tag + 0x0003)
      00061D F0               [24]  657 	movx	@dptr,a
                                    658 ;	usb.c:122: usb_buffer[8] = scsi_data_residue;
      00061E AF 26            [24]  659 	mov	r7,_scsi_data_residue
      000620 90 00 08         [24]  660 	mov	dptr,#(_usb_buffer + 0x0008)
      000623 EF               [12]  661 	mov	a,r7
      000624 F0               [24]  662 	movx	@dptr,a
                                    663 ;	usb.c:123: usb_buffer[9] = scsi_data_residue>>8;
      000625 AF 27            [24]  664 	mov	r7,(_scsi_data_residue + 1)
      000627 90 00 09         [24]  665 	mov	dptr,#(_usb_buffer + 0x0009)
      00062A EF               [12]  666 	mov	a,r7
      00062B F0               [24]  667 	movx	@dptr,a
                                    668 ;	usb.c:124: usb_buffer[10] = scsi_data_residue>>16;
      00062C AF 28            [24]  669 	mov	r7,(_scsi_data_residue + 2)
      00062E 90 00 0A         [24]  670 	mov	dptr,#(_usb_buffer + 0x000a)
      000631 EF               [12]  671 	mov	a,r7
      000632 F0               [24]  672 	movx	@dptr,a
                                    673 ;	usb.c:125: usb_buffer[11] = scsi_data_residue>>24;
      000633 AF 29            [24]  674 	mov	r7,(_scsi_data_residue + 3)
      000635 90 00 0B         [24]  675 	mov	dptr,#(_usb_buffer + 0x000b)
      000638 EF               [12]  676 	mov	a,r7
      000639 F0               [24]  677 	movx	@dptr,a
                                    678 ;	usb.c:126: usb_buffer[12] = scsi_status;
      00063A 90 00 0C         [24]  679 	mov	dptr,#(_usb_buffer + 0x000c)
      00063D E5 25            [12]  680 	mov	a,_scsi_status
      00063F F0               [24]  681 	movx	@dptr,a
                                    682 ;	usb.c:128: SendData1(13, 0);
      000640 75 24 00         [24]  683 	mov	_SendData1_PARM_2,#0x00
      000643 90 00 0D         [24]  684 	mov	dptr,#0x000d
      000646 12 05 8F         [24]  685 	lcall	_SendData1
                                    686 ;	usb.c:129: usb_have_csw_ready = 0;
      000649 90 60 06         [24]  687 	mov	dptr,#_usb_have_csw_ready
      00064C E4               [12]  688 	clr	a
      00064D F0               [24]  689 	movx	@dptr,a
                                    690 ;	usb.c:130: scsi_data_residue = 0;
      00064E F5 26            [12]  691 	mov	_scsi_data_residue,a
      000650 F5 27            [12]  692 	mov	(_scsi_data_residue + 1),a
      000652 F5 28            [12]  693 	mov	(_scsi_data_residue + 2),a
      000654 F5 29            [12]  694 	mov	(_scsi_data_residue + 3),a
                                    695 ;	usb.c:131: }
      000656 22               [24]  696 	ret
                                    697 ;------------------------------------------------------------
                                    698 ;Allocation info for local variables in function 'SendCSW2'
                                    699 ;------------------------------------------------------------
                                    700 ;	usb.c:133: static void SendCSW2()
                                    701 ;	-----------------------------------------
                                    702 ;	 function SendCSW2
                                    703 ;	-----------------------------------------
      000657                        704 _SendCSW2:
                                    705 ;	usb.c:135: while(EP1.cs & bmSTALL);
      000657                        706 00101$:
      000657 90 F2 13         [24]  707 	mov	dptr,#(_EP1 + 0x0013)
      00065A E0               [24]  708 	movx	a,@dptr
      00065B FF               [12]  709 	mov	r7,a
      00065C 20 E1 F8         [24]  710 	jb	acc.1,00101$
                                    711 ;	usb.c:136: while((EP1.r17 & 0x80)==0)
      00065F 90 F0 10         [24]  712 	mov	dptr,#0xf010
      000662 E0               [24]  713 	movx	a,@dptr
      000663 FF               [12]  714 	mov	r7,a
      000664 74 20            [12]  715 	mov	a,#0x20
      000666 5F               [12]  716 	anl	a,r7
      000667 FE               [12]  717 	mov	r6,a
      000668 7F 00            [12]  718 	mov	r7,#0x00
      00066A                        719 00106$:
      00066A 90 F2 17         [24]  720 	mov	dptr,#(_EP1 + 0x0017)
      00066D E0               [24]  721 	movx	a,@dptr
      00066E FD               [12]  722 	mov	r5,a
      00066F 20 E7 0A         [24]  723 	jb	acc.7,00109$
                                    724 ;	usb.c:138: if ((XVAL(0xF010) & 0x20)==0)
      000672 EE               [12]  725 	mov	a,r6
      000673 4F               [12]  726 	orl	a,r7
      000674 70 F4            [24]  727 	jnz	00106$
                                    728 ;	usb.c:140: usb_have_csw_ready = 0;
      000676 90 60 06         [24]  729 	mov	dptr,#_usb_have_csw_ready
      000679 E4               [12]  730 	clr	a
      00067A F0               [24]  731 	movx	@dptr,a
                                    732 ;	usb.c:141: return;
      00067B 22               [24]  733 	ret
                                    734 ;	usb.c:145: while(EP1.cs & 0x40);
      00067C                        735 00109$:
      00067C 90 F2 13         [24]  736 	mov	dptr,#(_EP1 + 0x0013)
      00067F E0               [24]  737 	movx	a,@dptr
      000680 FF               [12]  738 	mov	r7,a
      000681 20 E6 F8         [24]  739 	jb	acc.6,00109$
                                    740 ;	usb.c:146: while(EP2.cs & 0x40);
      000684                        741 00112$:
      000684 90 F2 53         [24]  742 	mov	dptr,#(_EP2 + 0x0013)
      000687 E0               [24]  743 	movx	a,@dptr
      000688 FF               [12]  744 	mov	r7,a
      000689 20 E6 F8         [24]  745 	jb	acc.6,00112$
                                    746 ;	usb.c:147: while(EP3.cs & 0x40);
      00068C                        747 00115$:
      00068C 90 F2 93         [24]  748 	mov	dptr,#(_EP3 + 0x0013)
      00068F E0               [24]  749 	movx	a,@dptr
      000690 FF               [12]  750 	mov	r7,a
      000691 20 E6 F8         [24]  751 	jb	acc.6,00115$
                                    752 ;	usb.c:148: while(EP4.cs & 0x40);
      000694                        753 00118$:
      000694 90 F2 D3         [24]  754 	mov	dptr,#(_EP4 + 0x0013)
      000697 E0               [24]  755 	movx	a,@dptr
      000698 FF               [12]  756 	mov	r7,a
      000699 20 E6 F8         [24]  757 	jb	acc.6,00118$
                                    758 ;	usb.c:150: EP1.fifo = 'U';
                                    759 ;	usb.c:151: EP1.fifo = 'S';
                                    760 ;	usb.c:152: EP1.fifo = 'B';
                                    761 ;	usb.c:153: EP1.fifo = 'S';
      00069C 90 F2 1C         [24]  762 	mov	dptr,#(_EP1 + 0x001c)
      00069F 74 55            [12]  763 	mov	a,#0x55
      0006A1 F0               [24]  764 	movx	@dptr,a
      0006A2 74 53            [12]  765 	mov	a,#0x53
      0006A4 F0               [24]  766 	movx	@dptr,a
      0006A5 74 42            [12]  767 	mov	a,#0x42
      0006A7 F0               [24]  768 	movx	@dptr,a
      0006A8 74 53            [12]  769 	mov	a,#0x53
      0006AA F0               [24]  770 	movx	@dptr,a
                                    771 ;	usb.c:154: EP1.fifo = scsi_tag[0];
                                    772 ;	usb.c:155: EP1.fifo = scsi_tag[1];
                                    773 ;	usb.c:156: EP1.fifo = scsi_tag[2];
                                    774 ;	usb.c:157: EP1.fifo = scsi_tag[3];
      0006AB 90 F2 1C         [24]  775 	mov	dptr,#(_EP1 + 0x001c)
      0006AE E5 2E            [12]  776 	mov	a,_scsi_tag
      0006B0 F0               [24]  777 	movx	@dptr,a
      0006B1 E5 2F            [12]  778 	mov	a,(_scsi_tag + 0x0001)
      0006B3 F0               [24]  779 	movx	@dptr,a
      0006B4 E5 30            [12]  780 	mov	a,(_scsi_tag + 0x0002)
      0006B6 F0               [24]  781 	movx	@dptr,a
      0006B7 E5 31            [12]  782 	mov	a,(_scsi_tag + 0x0003)
      0006B9 F0               [24]  783 	movx	@dptr,a
                                    784 ;	usb.c:158: EP1.fifo = scsi_data_residue;
      0006BA AF 26            [24]  785 	mov	r7,_scsi_data_residue
      0006BC 90 F2 1C         [24]  786 	mov	dptr,#(_EP1 + 0x001c)
      0006BF EF               [12]  787 	mov	a,r7
      0006C0 F0               [24]  788 	movx	@dptr,a
                                    789 ;	usb.c:159: EP1.fifo = scsi_data_residue>>8;
      0006C1 AF 27            [24]  790 	mov	r7,(_scsi_data_residue + 1)
      0006C3 90 F2 1C         [24]  791 	mov	dptr,#(_EP1 + 0x001c)
      0006C6 EF               [12]  792 	mov	a,r7
      0006C7 F0               [24]  793 	movx	@dptr,a
                                    794 ;	usb.c:160: EP1.fifo = scsi_data_residue>>16;
      0006C8 AF 28            [24]  795 	mov	r7,(_scsi_data_residue + 2)
      0006CA 90 F2 1C         [24]  796 	mov	dptr,#(_EP1 + 0x001c)
      0006CD EF               [12]  797 	mov	a,r7
      0006CE F0               [24]  798 	movx	@dptr,a
                                    799 ;	usb.c:161: EP1.fifo = scsi_data_residue>>24;
      0006CF AF 29            [24]  800 	mov	r7,(_scsi_data_residue + 3)
                                    801 ;	usb.c:162: EP1.fifo = scsi_status;
      0006D1 90 F2 1C         [24]  802 	mov	dptr,#(_EP1 + 0x001c)
      0006D4 EF               [12]  803 	mov	a,r7
      0006D5 F0               [24]  804 	movx	@dptr,a
      0006D6 E5 25            [12]  805 	mov	a,_scsi_status
      0006D8 F0               [24]  806 	movx	@dptr,a
                                    807 ;	usb.c:163: EP1.len_l = 13;
      0006D9 90 F2 0C         [24]  808 	mov	dptr,#(_EP1 + 0x000c)
      0006DC 74 0D            [12]  809 	mov	a,#0x0d
      0006DE F0               [24]  810 	movx	@dptr,a
                                    811 ;	usb.c:164: EP1.len_m = 0;
      0006DF 90 F2 0D         [24]  812 	mov	dptr,#(_EP1 + 0x000d)
      0006E2 E4               [12]  813 	clr	a
      0006E3 F0               [24]  814 	movx	@dptr,a
                                    815 ;	usb.c:165: EP1.len_h = 0;
      0006E4 90 F2 0E         [24]  816 	mov	dptr,#(_EP1 + 0x000e)
      0006E7 F0               [24]  817 	movx	@dptr,a
                                    818 ;	usb.c:166: EP1.cs = 0x40;		
      0006E8 90 F2 13         [24]  819 	mov	dptr,#(_EP1 + 0x0013)
      0006EB 74 40            [12]  820 	mov	a,#0x40
      0006ED F0               [24]  821 	movx	@dptr,a
                                    822 ;	usb.c:167: usb_have_csw_ready = 0;
      0006EE 90 60 06         [24]  823 	mov	dptr,#_usb_have_csw_ready
      0006F1 E4               [12]  824 	clr	a
      0006F2 F0               [24]  825 	movx	@dptr,a
                                    826 ;	usb.c:168: scsi_data_residue = 0;
      0006F3 F5 26            [12]  827 	mov	_scsi_data_residue,a
      0006F5 F5 27            [12]  828 	mov	(_scsi_data_residue + 1),a
      0006F7 F5 28            [12]  829 	mov	(_scsi_data_residue + 2),a
      0006F9 F5 29            [12]  830 	mov	(_scsi_data_residue + 3),a
                                    831 ;	usb.c:169: }
      0006FB 22               [24]  832 	ret
                                    833 ;------------------------------------------------------------
                                    834 ;Allocation info for local variables in function 'InitUSB'
                                    835 ;------------------------------------------------------------
                                    836 ;b                         Allocated to registers r7 
                                    837 ;------------------------------------------------------------
                                    838 ;	usb.c:171: void InitUSB(void)
                                    839 ;	-----------------------------------------
                                    840 ;	 function InitUSB
                                    841 ;	-----------------------------------------
      0006FC                        842 _InitUSB:
                                    843 ;	usb.c:175: usb_irq = 0;
      0006FC 90 60 00         [24]  844 	mov	dptr,#_usb_irq
      0006FF E4               [12]  845 	clr	a
      000700 F0               [24]  846 	movx	@dptr,a
                                    847 ;	usb.c:176: usb_received_data_ready = 0;
      000701 90 60 05         [24]  848 	mov	dptr,#_usb_received_data_ready
      000704 F0               [24]  849 	movx	@dptr,a
                                    850 ;	usb.c:177: usb_have_csw_ready = 0;
      000705 90 60 06         [24]  851 	mov	dptr,#_usb_have_csw_ready
      000708 F0               [24]  852 	movx	@dptr,a
                                    853 ;	usb.c:178: usb_speed = 0;
                                    854 ;	1-genFromRTrack replaced	mov	_usb_speed,#0x00
      000709 F5 22            [12]  855 	mov	_usb_speed,a
                                    856 ;	usb.c:179: EP1.ptr_l = usb_buffer_PA>>8;
      00070B 90 F2 05         [24]  857 	mov	dptr,#(_EP1 + 0x0005)
      00070E 74 80            [12]  858 	mov	a,#0x80
      000710 F0               [24]  859 	movx	@dptr,a
                                    860 ;	usb.c:180: EP1.ptr_m = usb_buffer_PA>>16;
      000711 90 F2 06         [24]  861 	mov	dptr,#(_EP1 + 0x0006)
      000714 E4               [12]  862 	clr	a
      000715 F0               [24]  863 	movx	@dptr,a
                                    864 ;	usb.c:181: EP1.ptr_h = usb_buffer_PA>>24;
      000716 90 F2 07         [24]  865 	mov	dptr,#(_EP1 + 0x0007)
      000719 F0               [24]  866 	movx	@dptr,a
                                    867 ;	usb.c:182: EP1.r8 = 0x10;
      00071A 90 F2 08         [24]  868 	mov	dptr,#(_EP1 + 0x0008)
      00071D 74 10            [12]  869 	mov	a,#0x10
      00071F F0               [24]  870 	movx	@dptr,a
                                    871 ;	usb.c:183: EP1.offset = 0;
      000720 90 F2 0A         [24]  872 	mov	dptr,#(_EP1 + 0x000a)
      000723 E4               [12]  873 	clr	a
      000724 F0               [24]  874 	movx	@dptr,a
                                    875 ;	usb.c:184: EP2.ptr_l = usb_buffer_PA>>8;
      000725 90 F2 45         [24]  876 	mov	dptr,#(_EP2 + 0x0005)
      000728 74 80            [12]  877 	mov	a,#0x80
      00072A F0               [24]  878 	movx	@dptr,a
                                    879 ;	usb.c:185: EP2.ptr_m = usb_buffer_PA>>16;
      00072B 90 F2 46         [24]  880 	mov	dptr,#(_EP2 + 0x0006)
      00072E E4               [12]  881 	clr	a
      00072F F0               [24]  882 	movx	@dptr,a
                                    883 ;	usb.c:186: EP2.ptr_h = usb_buffer_PA>>24;
      000730 90 F2 47         [24]  884 	mov	dptr,#(_EP2 + 0x0007)
      000733 F0               [24]  885 	movx	@dptr,a
                                    886 ;	usb.c:187: EP2.r8 = 0x10;
      000734 90 F2 48         [24]  887 	mov	dptr,#(_EP2 + 0x0008)
      000737 74 10            [12]  888 	mov	a,#0x10
      000739 F0               [24]  889 	movx	@dptr,a
                                    890 ;	usb.c:188: EP2.offset = 0;
      00073A 90 F2 4A         [24]  891 	mov	dptr,#(_EP2 + 0x000a)
      00073D E4               [12]  892 	clr	a
      00073E F0               [24]  893 	movx	@dptr,a
                                    894 ;	usb.c:190: if (WARMSTATUS & 2) //USB warm start
      00073F 90 FA 38         [24]  895 	mov	dptr,#_WARMSTATUS
      000742 E0               [24]  896 	movx	a,@dptr
      000743 30 E1 54         [24]  897 	jnb	acc.1,00112$
                                    898 ;	usb.c:192: if ((USBSTAT & bmSpeed) == bmSuperSpeed)
      000746 90 F0 09         [24]  899 	mov	dptr,#_USBSTAT
      000749 E0               [24]  900 	movx	a,@dptr
      00074A FF               [12]  901 	mov	r7,a
      00074B 53 07 07         [24]  902 	anl	ar7,#0x07
      00074E 7E 00            [12]  903 	mov	r6,#0x00
      000750 BF 04 08         [24]  904 	cjne	r7,#0x04,00108$
      000753 BE 00 05         [24]  905 	cjne	r6,#0x00,00108$
                                    906 ;	usb.c:194: usb_speed = bmSuperSpeed;
      000756 75 22 04         [24]  907 	mov	_usb_speed,#0x04
      000759 80 27            [24]  908 	sjmp	00109$
      00075B                        909 00108$:
                                    910 ;	usb.c:196: else if ((USBSTAT & bmSpeed) == bmHighSpeed)
      00075B 90 F0 09         [24]  911 	mov	dptr,#_USBSTAT
      00075E E0               [24]  912 	movx	a,@dptr
      00075F 54 07            [12]  913 	anl	a,#0x07
      000761 60 02            [24]  914 	jz	00144$
      000763 80 05            [24]  915 	sjmp	00105$
      000765                        916 00144$:
                                    917 ;	usb.c:198: usb_speed = bmHighSpeed;
      000765 75 22 00         [24]  918 	mov	_usb_speed,#0x00
      000768 80 18            [24]  919 	sjmp	00109$
      00076A                        920 00105$:
                                    921 ;	usb.c:200: else if ((USBSTAT & bmSpeed) == bmFullSpeed)
      00076A 90 F0 09         [24]  922 	mov	dptr,#_USBSTAT
      00076D E0               [24]  923 	movx	a,@dptr
      00076E FF               [12]  924 	mov	r7,a
      00076F 53 07 07         [24]  925 	anl	ar7,#0x07
      000772 7E 00            [12]  926 	mov	r6,#0x00
      000774 BF 01 08         [24]  927 	cjne	r7,#0x01,00102$
      000777 BE 00 05         [24]  928 	cjne	r6,#0x00,00102$
                                    929 ;	usb.c:202: usb_speed = bmFullSpeed;
      00077A 75 22 01         [24]  930 	mov	_usb_speed,#0x01
      00077D 80 03            [24]  931 	sjmp	00109$
      00077F                        932 00102$:
                                    933 ;	usb.c:206: usb_speed = 0;
      00077F 75 22 00         [24]  934 	mov	_usb_speed,#0x00
      000782                        935 00109$:
                                    936 ;	usb.c:209: EX1 = 1;
                                    937 ;	assignBit
      000782 D2 AA            [12]  938 	setb	_EX1
                                    939 ;	usb.c:210: EX0 = 1;
                                    940 ;	assignBit
      000784 D2 A8            [12]  941 	setb	_EX0
                                    942 ;	usb.c:211: EPIE = bmEP2IRQ | bmEP4IRQ;
      000786 90 F0 30         [24]  943 	mov	dptr,#_EPIE
      000789 74 0A            [12]  944 	mov	a,#0x0a
      00078B F0               [24]  945 	movx	@dptr,a
                                    946 ;	usb.c:212: scsi_data_residue = 0;
      00078C E4               [12]  947 	clr	a
      00078D F5 26            [12]  948 	mov	_scsi_data_residue,a
      00078F F5 27            [12]  949 	mov	(_scsi_data_residue + 1),a
      000791 F5 28            [12]  950 	mov	(_scsi_data_residue + 2),a
      000793 F5 29            [12]  951 	mov	(_scsi_data_residue + 3),a
                                    952 ;	usb.c:213: scsi_status = 0;
                                    953 ;	1-genFromRTrack replaced	mov	_scsi_status,#0x00
      000795 F5 25            [12]  954 	mov	_scsi_status,a
                                    955 ;	usb.c:214: SendCSW();
      000797 02 05 EE         [24]  956 	ljmp	_SendCSW
      00079A                        957 00112$:
                                    958 ;	usb.c:219: REGBANK = 6;
      00079A 90 F0 00         [24]  959 	mov	dptr,#_REGBANK
      00079D 74 06            [12]  960 	mov	a,#0x06
      00079F F0               [24]  961 	movx	@dptr,a
                                    962 ;	usb.c:349: __endasm;
      0007A0 90                     963 	.db	0x90
      0007A1 F2                     964 	.db	0xF2
      0007A2 83                     965 	.db	0x83
      0007A3 E0                     966 	.db	0xE0
      0007A4 44                     967 	.db	0x44
      0007A5 10                     968 	.db	0x10
      0007A6 F0                     969 	.db	0xF0
      0007A7 90                     970 	.db	0x90
      0007A8 F2                     971 	.db	0xF2
      0007A9 8C                     972 	.db	0x8C
      0007AA 74                     973 	.db	0x74
      0007AB C2                     974 	.db	0xC2
      0007AC F0                     975 	.db	0xF0
      0007AD A3                     976 	.db	0xA3
      0007AE 74                     977 	.db	0x74
      0007AF E0                     978 	.db	0xE0
      0007B0 F0                     979 	.db	0xF0
      0007B1 A3                     980 	.db	0xA3
      0007B2 74                     981 	.db	0x74
      0007B3 9C                     982 	.db	0x9C
      0007B4 F0                     983 	.db	0xF0
      0007B5 90                     984 	.db	0x90
      0007B6 F2                     985 	.db	0xF2
      0007B7 90                     986 	.db	0x90
      0007B8 74                     987 	.db	0x74
      0007B9 17                     988 	.db	0x17
      0007BA F0                     989 	.db	0xF0
      0007BB 90                     990 	.db	0x90
      0007BC F2                     991 	.db	0xF2
      0007BD 93                     992 	.db	0x93
      0007BE 74                     993 	.db	0x74
      0007BF 0C                     994 	.db	0x0C
      0007C0 F0                     995 	.db	0xF0
      0007C1 90                     996 	.db	0x90
      0007C2 F3                     997 	.db	0xF3
      0007C3 20                     998 	.db	0x20
      0007C4 74                     999 	.db	0x74
      0007C5 C0                    1000 	.db	0xC0
      0007C6 F0                    1001 	.db	0xF0
      0007C7 A3                    1002 	.db	0xA3
      0007C8 74                    1003 	.db	0x74
      0007C9 E3                    1004 	.db	0xE3
      0007CA F0                    1005 	.db	0xF0
      0007CB A3                    1006 	.db	0xA3
      0007CC 74                    1007 	.db	0x74
      0007CD 8B                    1008 	.db	0x8B
      0007CE F0                    1009 	.db	0xF0
      0007CF A3                    1010 	.db	0xA3
      0007D0 74                    1011 	.db	0x74
      0007D1 2E                    1012 	.db	0x2E
      0007D2 F0                    1013 	.db	0xF0
      0007D3 90                    1014 	.db	0x90
      0007D4 F3                    1015 	.db	0xF3
      0007D5 26                    1016 	.db	0x26
      0007D6 74                    1017 	.db	0x74
      0007D7 01                    1018 	.db	0x01
      0007D8 F0                    1019 	.db	0xF0
      0007D9 A3                    1020 	.db	0xA3
      0007DA 74                    1021 	.db	0x74
      0007DB 05                    1022 	.db	0x05
      0007DC F0                    1023 	.db	0xF0
      0007DD 90                    1024 	.db	0x90
      0007DE F3                    1025 	.db	0xF3
      0007DF 0D                    1026 	.db	0x0D
      0007E0 74                    1027 	.db	0x74
      0007E1 10                    1028 	.db	0x10
      0007E2 F0                    1029 	.db	0xF0
      0007E3 90                    1030 	.db	0x90
      0007E4 F3                    1031 	.db	0xF3
      0007E5 0C                    1032 	.db	0x0C
      0007E6 74                    1033 	.db	0x74
      0007E7 02                    1034 	.db	0x02
      0007E8 F0                    1035 	.db	0xF0
      0007E9 90                    1036 	.db	0x90
      0007EA F3                    1037 	.db	0xF3
      0007EB 0A                    1038 	.db	0x0A
      0007EC 74                    1039 	.db	0x74
      0007ED 30                    1040 	.db	0x30
      0007EE F0                    1041 	.db	0xF0
      0007EF 90                    1042 	.db	0x90
      0007F0 F0                    1043 	.db	0xF0
      0007F1 00                    1044 	.db	0x00
      0007F2 74                    1045 	.db	0x74
      0007F3 07                    1046 	.db	0x07
      0007F4 F0                    1047 	.db	0xF0
      0007F5 90                    1048 	.db	0x90
      0007F6 F2                    1049 	.db	0xF2
      0007F7 80                    1050 	.db	0x80
      0007F8 74                    1051 	.db	0x74
      0007F9 B5                    1052 	.db	0xB5
      0007FA F0                    1053 	.db	0xF0
      0007FB 90                    1054 	.db	0x90
      0007FC FA                    1055 	.db	0xFA
      0007FD 6F                    1056 	.db	0x6F
      0007FE E0                    1057 	.db	0xE0
      0007FF 54                    1058 	.db	0x54
      000800 EF                    1059 	.db	0xEF
      000801 F0                    1060 	.db	0xF0
      000802 E4                    1061 	.db	0xE4
      000803 90                    1062 	.db	0x90
      000804 42                    1063 	.db	0x42
      000805 2B                    1064 	.db	0x2B
      000806 F0                    1065 	.db	0xF0
      000807 90                    1066 	.db	0x90
      000808 42                    1067 	.db	0x42
      000809 2B                    1068 	.db	0x2B
      00080A E0                    1069 	.db	0xE0
      00080B 04                    1070 	.db	0x04
      00080C F0                    1071 	.db	0xF0
      00080D E0                    1072 	.db	0xE0
      00080E B4                    1073 	.db	0xB4
      00080F FA                    1074 	.db	0xFA
      000810 F6                    1075 	.db	0xF6
      000811 90                    1076 	.db	0x90
      000812 FA                    1077 	.db	0xFA
      000813 6F                    1078 	.db	0x6F
      000814 E0                    1079 	.db	0xE0
      000815 44                    1080 	.db	0x44
      000816 10                    1081 	.db	0x10
      000817 F0                    1082 	.db	0xF0
      000818 90                    1083 	.db	0x90
      000819 F0                    1084 	.db	0xF0
      00081A 14                    1085 	.db	0x14
      00081B E0                    1086 	.db	0xE0
      00081C 54                    1087 	.db	0x54
      00081D 03                    1088 	.db	0x03
      00081E 60                    1089 	.db	0x60
      00081F F8                    1090 	.db	0xF8
                                   1091 ;	usb.c:350: REGBANK = 0;
      000820 90 F0 00         [24] 1092 	mov	dptr,#_REGBANK
      000823 E4               [12] 1093 	clr	a
      000824 F0               [24] 1094 	movx	@dptr,a
                                   1095 ;	usb.c:358: __endasm;
      000825 90                    1096 	.db	0x90
      000826 F0                    1097 	.db	0xF0
      000827 68                    1098 	.db	0x68
      000828 74                    1099 	.db	0x74
      000829 C0                    1100 	.db	0xC0
      00082A F0                    1101 	.db	0xF0
                                   1102 ;	usb.c:359: EPIE = bmEP2IRQ | bmEP4IRQ;
      00082B 90 F0 30         [24] 1103 	mov	dptr,#_EPIE
      00082E 74 0A            [12] 1104 	mov	a,#0x0a
      000830 F0               [24] 1105 	movx	@dptr,a
                                   1106 ;	usb.c:360: USBCTL = bmAttach | bmHighSpeed;
      000831 90 F0 08         [24] 1107 	mov	dptr,#_USBCTL
      000834 74 80            [12] 1108 	mov	a,#0x80
      000836 F0               [24] 1109 	movx	@dptr,a
                                   1110 ;	usb.c:362: XVAL(0xFA38) |= 2;
      000837 90 FA 38         [24] 1111 	mov	dptr,#0xfa38
      00083A E0               [24] 1112 	movx	a,@dptr
      00083B FF               [12] 1113 	mov	r7,a
      00083C 7E 00            [12] 1114 	mov	r6,#0x00
      00083E 43 07 02         [24] 1115 	orl	ar7,#0x02
      000841 90 FA 38         [24] 1116 	mov	dptr,#0xfa38
      000844 EF               [12] 1117 	mov	a,r7
      000845 F0               [24] 1118 	movx	@dptr,a
                                   1119 ;	usb.c:364: EX1 = 1;
                                   1120 ;	assignBit
      000846 D2 AA            [12] 1121 	setb	_EX1
                                   1122 ;	usb.c:365: EX0 = 1;
                                   1123 ;	assignBit
      000848 D2 A8            [12] 1124 	setb	_EX0
                                   1125 ;	usb.c:366: for (b = 0; b < 250; b++);			
      00084A 7F FA            [12] 1126 	mov	r7,#0xfa
      00084C                       1127 00116$:
      00084C EF               [12] 1128 	mov	a,r7
      00084D 14               [12] 1129 	dec	a
      00084E FE               [12] 1130 	mov	r6,a
      00084F FF               [12] 1131 	mov	r7,a
      000850 70 FA            [24] 1132 	jnz	00116$
                                   1133 ;	usb.c:368: }
      000852 22               [24] 1134 	ret
                                   1135 ;------------------------------------------------------------
                                   1136 ;Allocation info for local variables in function 'usb_isr'
                                   1137 ;------------------------------------------------------------
                                   1138 ;	usb.c:370: void usb_isr(void) __interrupt USB_VECT
                                   1139 ;	-----------------------------------------
                                   1140 ;	 function usb_isr
                                   1141 ;	-----------------------------------------
      000853                       1142 _usb_isr:
      000853 C0 E0            [24] 1143 	push	acc
      000855 C0 82            [24] 1144 	push	dpl
      000857 C0 83            [24] 1145 	push	dph
      000859 C0 07            [24] 1146 	push	ar7
      00085B C0 06            [24] 1147 	push	ar6
      00085D C0 05            [24] 1148 	push	ar5
      00085F C0 04            [24] 1149 	push	ar4
      000861 C0 D0            [24] 1150 	push	psw
      000863 75 D0 00         [24] 1151 	mov	psw,#0x00
                                   1152 ;	usb.c:372: usb_irq = USBIRQ;
      000866 90 F0 27         [24] 1153 	mov	dptr,#_USBIRQ
      000869 E0               [24] 1154 	movx	a,@dptr
      00086A FF               [12] 1155 	mov	r7,a
      00086B 90 60 00         [24] 1156 	mov	dptr,#_usb_irq
      00086E F0               [24] 1157 	movx	@dptr,a
                                   1158 ;	usb.c:374: if (usb_irq & 0x20)
      00086F EF               [12] 1159 	mov	a,r7
      000870 30 E5 06         [24] 1160 	jnb	acc.5,00102$
                                   1161 ;	usb.c:376: USBIRQ = 0x20;
      000873 90 F0 27         [24] 1162 	mov	dptr,#_USBIRQ
      000876 74 20            [12] 1163 	mov	a,#0x20
      000878 F0               [24] 1164 	movx	@dptr,a
      000879                       1165 00102$:
                                   1166 ;	usb.c:379: if (usb_irq & 0x10)
      000879 EF               [12] 1167 	mov	a,r7
      00087A 30 E4 06         [24] 1168 	jnb	acc.4,00104$
                                   1169 ;	usb.c:381: USBIRQ = 0x10;
      00087D 90 F0 27         [24] 1170 	mov	dptr,#_USBIRQ
      000880 74 10            [12] 1171 	mov	a,#0x10
      000882 F0               [24] 1172 	movx	@dptr,a
      000883                       1173 00104$:
                                   1174 ;	usb.c:384: if (usb_irq & bmSpeedChange)
      000883 EF               [12] 1175 	mov	a,r7
      000884 30 E7 3F         [24] 1176 	jnb	acc.7,00115$
                                   1177 ;	usb.c:386: USBIRQ = bmSpeedChange;
      000887 90 F0 27         [24] 1178 	mov	dptr,#_USBIRQ
      00088A 74 80            [12] 1179 	mov	a,#0x80
      00088C F0               [24] 1180 	movx	@dptr,a
                                   1181 ;	usb.c:387: if ((USBSTAT & bmSpeed) == bmSuperSpeed)
      00088D 90 F0 09         [24] 1182 	mov	dptr,#_USBSTAT
      000890 E0               [24] 1183 	movx	a,@dptr
      000891 FE               [12] 1184 	mov	r6,a
      000892 53 06 07         [24] 1185 	anl	ar6,#0x07
      000895 7D 00            [12] 1186 	mov	r5,#0x00
      000897 BE 04 08         [24] 1187 	cjne	r6,#0x04,00112$
      00089A BD 00 05         [24] 1188 	cjne	r5,#0x00,00112$
                                   1189 ;	usb.c:389: usb_speed = bmSuperSpeed;
      00089D 75 22 04         [24] 1190 	mov	_usb_speed,#0x04
      0008A0 80 24            [24] 1191 	sjmp	00115$
      0008A2                       1192 00112$:
                                   1193 ;	usb.c:391: else if ((USBSTAT & bmSpeed) == bmHighSpeed)
      0008A2 90 F0 09         [24] 1194 	mov	dptr,#_USBSTAT
      0008A5 E0               [24] 1195 	movx	a,@dptr
      0008A6 54 07            [12] 1196 	anl	a,#0x07
                                   1197 ;	usb.c:393: usb_speed = bmHighSpeed;
      0008A8 70 04            [24] 1198 	jnz	00109$
      0008AA F5 22            [12] 1199 	mov	_usb_speed,a
      0008AC 80 18            [24] 1200 	sjmp	00115$
      0008AE                       1201 00109$:
                                   1202 ;	usb.c:395: else if ((USBSTAT & bmSpeed) == bmFullSpeed)
      0008AE 90 F0 09         [24] 1203 	mov	dptr,#_USBSTAT
      0008B1 E0               [24] 1204 	movx	a,@dptr
      0008B2 FE               [12] 1205 	mov	r6,a
      0008B3 53 06 07         [24] 1206 	anl	ar6,#0x07
      0008B6 7D 00            [12] 1207 	mov	r5,#0x00
      0008B8 BE 01 08         [24] 1208 	cjne	r6,#0x01,00106$
      0008BB BD 00 05         [24] 1209 	cjne	r5,#0x00,00106$
                                   1210 ;	usb.c:397: usb_speed = bmFullSpeed;
      0008BE 75 22 01         [24] 1211 	mov	_usb_speed,#0x01
      0008C1 80 03            [24] 1212 	sjmp	00115$
      0008C3                       1213 00106$:
                                   1214 ;	usb.c:401: usb_speed = 0;
      0008C3 75 22 00         [24] 1215 	mov	_usb_speed,#0x00
      0008C6                       1216 00115$:
                                   1217 ;	usb.c:405: if (usb_irq & 0x40)
      0008C6 EF               [12] 1218 	mov	a,r7
      0008C7 30 E6 06         [24] 1219 	jnb	acc.6,00117$
                                   1220 ;	usb.c:407: USBIRQ = 0x40;
      0008CA 90 F0 27         [24] 1221 	mov	dptr,#_USBIRQ
      0008CD 74 40            [12] 1222 	mov	a,#0x40
      0008CF F0               [24] 1223 	movx	@dptr,a
      0008D0                       1224 00117$:
                                   1225 ;	usb.c:410: UsbIntStsF087 = XVAL(0xF087);
      0008D0 90 F0 87         [24] 1226 	mov	dptr,#0xf087
      0008D3 E0               [24] 1227 	movx	a,@dptr
      0008D4 90 60 04         [24] 1228 	mov	dptr,#_UsbIntStsF087
      0008D7 F0               [24] 1229 	movx	@dptr,a
                                   1230 ;	usb.c:411: UsbIntStsF086 = XVAL(0xF086);
      0008D8 90 F0 86         [24] 1231 	mov	dptr,#0xf086
      0008DB E0               [24] 1232 	movx	a,@dptr
      0008DC 90 60 03         [24] 1233 	mov	dptr,#_UsbIntStsF086
      0008DF F0               [24] 1234 	movx	@dptr,a
                                   1235 ;	usb.c:412: UsbIntStsF082 = XVAL(0xF082);
      0008E0 90 F0 82         [24] 1236 	mov	dptr,#0xf082
      0008E3 E0               [24] 1237 	movx	a,@dptr
      0008E4 FF               [12] 1238 	mov	r7,a
      0008E5 90 60 02         [24] 1239 	mov	dptr,#_UsbIntStsF082
      0008E8 F0               [24] 1240 	movx	@dptr,a
                                   1241 ;	usb.c:413: UsbIntStsF080 = XVAL(0xF080);
      0008E9 90 F0 80         [24] 1242 	mov	dptr,#0xf080
      0008EC E0               [24] 1243 	movx	a,@dptr
      0008ED FE               [12] 1244 	mov	r6,a
      0008EE 90 60 01         [24] 1245 	mov	dptr,#_UsbIntStsF080
      0008F1 F0               [24] 1246 	movx	@dptr,a
                                   1247 ;	usb.c:415: if (UsbIntStsF082 & 0x80)
      0008F2 EF               [12] 1248 	mov	a,r7
      0008F3 30 E7 06         [24] 1249 	jnb	acc.7,00119$
                                   1250 ;	usb.c:417: XVAL(0xF082) = 0x80;
      0008F6 90 F0 82         [24] 1251 	mov	dptr,#0xf082
      0008F9 74 80            [12] 1252 	mov	a,#0x80
      0008FB F0               [24] 1253 	movx	@dptr,a
      0008FC                       1254 00119$:
                                   1255 ;	usb.c:420: if (UsbIntStsF082 & 0x40)
      0008FC 90 60 02         [24] 1256 	mov	dptr,#_UsbIntStsF082
      0008FF E0               [24] 1257 	movx	a,@dptr
      000900 30 E6 06         [24] 1258 	jnb	acc.6,00121$
                                   1259 ;	usb.c:422: XVAL(0xF082) = 0x40;
      000903 90 F0 82         [24] 1260 	mov	dptr,#0xf082
      000906 74 40            [12] 1261 	mov	a,#0x40
      000908 F0               [24] 1262 	movx	@dptr,a
      000909                       1263 00121$:
                                   1264 ;	usb.c:425: if (UsbIntStsF080 & 1)
      000909 90 60 01         [24] 1265 	mov	dptr,#_UsbIntStsF080
      00090C E0               [24] 1266 	movx	a,@dptr
      00090D 30 E0 53         [24] 1267 	jnb	acc.0,00125$
                                   1268 ;	usb.c:427: XVAL(0xF080) = 1;
      000910 90 F0 80         [24] 1269 	mov	dptr,#0xf080
      000913 74 01            [12] 1270 	mov	a,#0x01
      000915 F0               [24] 1271 	movx	@dptr,a
                                   1272 ;	usb.c:428: if (EP0CS & bmSUDAV)
      000916 90 F0 48         [24] 1273 	mov	dptr,#_EP0CS
      000919 E0               [24] 1274 	movx	a,@dptr
      00091A 30 E7 46         [24] 1275 	jnb	acc.7,00125$
                                   1276 ;	usb.c:430: bmRequestType = SETUPDAT[0];
      00091D 90 F0 B8         [24] 1277 	mov	dptr,#_SETUPDAT
      000920 E0               [24] 1278 	movx	a,@dptr
      000921 F5 1A            [12] 1279 	mov	_bmRequestType,a
                                   1280 ;	usb.c:431: bRequest = SETUPDAT[1];
      000923 90 F0 B9         [24] 1281 	mov	dptr,#(_SETUPDAT + 0x0001)
      000926 E0               [24] 1282 	movx	a,@dptr
      000927 F5 1B            [12] 1283 	mov	_bRequest,a
                                   1284 ;	usb.c:432: wValue = SETUPDAT[2] | (SETUPDAT[3] << 8);
      000929 90 F0 BA         [24] 1285 	mov	dptr,#(_SETUPDAT + 0x0002)
      00092C E0               [24] 1286 	movx	a,@dptr
      00092D FF               [12] 1287 	mov	r7,a
      00092E 90 F0 BB         [24] 1288 	mov	dptr,#(_SETUPDAT + 0x0003)
      000931 E0               [24] 1289 	movx	a,@dptr
      000932 FD               [12] 1290 	mov	r5,a
      000933 E4               [12] 1291 	clr	a
      000934 FC               [12] 1292 	mov	r4,a
      000935 4F               [12] 1293 	orl	a,r7
      000936 F5 1C            [12] 1294 	mov	_wValue,a
      000938 ED               [12] 1295 	mov	a,r5
      000939 4C               [12] 1296 	orl	a,r4
      00093A F5 1D            [12] 1297 	mov	(_wValue + 1),a
                                   1298 ;	usb.c:433: wIndex = SETUPDAT[4] | (SETUPDAT[5] << 8);
      00093C 90 F0 BC         [24] 1299 	mov	dptr,#(_SETUPDAT + 0x0004)
      00093F E0               [24] 1300 	movx	a,@dptr
      000940 FF               [12] 1301 	mov	r7,a
      000941 90 F0 BD         [24] 1302 	mov	dptr,#(_SETUPDAT + 0x0005)
      000944 E0               [24] 1303 	movx	a,@dptr
      000945 FD               [12] 1304 	mov	r5,a
      000946 E4               [12] 1305 	clr	a
      000947 FC               [12] 1306 	mov	r4,a
      000948 4F               [12] 1307 	orl	a,r7
      000949 F5 1E            [12] 1308 	mov	_wIndex,a
      00094B ED               [12] 1309 	mov	a,r5
      00094C 4C               [12] 1310 	orl	a,r4
      00094D F5 1F            [12] 1311 	mov	(_wIndex + 1),a
                                   1312 ;	usb.c:434: wLength = SETUPDAT[6] | (SETUPDAT[7] << 8);
      00094F 90 F0 BE         [24] 1313 	mov	dptr,#(_SETUPDAT + 0x0006)
      000952 E0               [24] 1314 	movx	a,@dptr
      000953 FF               [12] 1315 	mov	r7,a
      000954 90 F0 BF         [24] 1316 	mov	dptr,#(_SETUPDAT + 0x0007)
      000957 E0               [24] 1317 	movx	a,@dptr
      000958 FD               [12] 1318 	mov	r5,a
      000959 E4               [12] 1319 	clr	a
      00095A FE               [12] 1320 	mov	r6,a
      00095B FC               [12] 1321 	mov	r4,a
      00095C 4F               [12] 1322 	orl	a,r7
      00095D F5 20            [12] 1323 	mov	_wLength,a
      00095F ED               [12] 1324 	mov	a,r5
      000960 4C               [12] 1325 	orl	a,r4
      000961 F5 21            [12] 1326 	mov	(_wLength + 1),a
      000963                       1327 00125$:
                                   1328 ;	usb.c:438: if (XVAL(0xF082) & 0x20)
      000963 90 F0 82         [24] 1329 	mov	dptr,#0xf082
      000966 E0               [24] 1330 	movx	a,@dptr
      000967 FF               [12] 1331 	mov	r7,a
      000968 30 E5 06         [24] 1332 	jnb	acc.5,00127$
                                   1333 ;	usb.c:440: XVAL(0xF082) = 0x20;
      00096B 90 F0 82         [24] 1334 	mov	dptr,#0xf082
      00096E 74 20            [12] 1335 	mov	a,#0x20
      000970 F0               [24] 1336 	movx	@dptr,a
      000971                       1337 00127$:
                                   1338 ;	usb.c:443: if (XVAL(0xF081) & 0x10)
      000971 90 F0 81         [24] 1339 	mov	dptr,#0xf081
      000974 E0               [24] 1340 	movx	a,@dptr
      000975 FF               [12] 1341 	mov	r7,a
      000976 30 E4 06         [24] 1342 	jnb	acc.4,00129$
                                   1343 ;	usb.c:445: XVAL(0xF081) = 0x10;
      000979 90 F0 81         [24] 1344 	mov	dptr,#0xf081
      00097C 74 10            [12] 1345 	mov	a,#0x10
      00097E F0               [24] 1346 	movx	@dptr,a
      00097F                       1347 00129$:
                                   1348 ;	usb.c:448: if (XVAL(0xF081) & 0x20)
      00097F 90 F0 81         [24] 1349 	mov	dptr,#0xf081
      000982 E0               [24] 1350 	movx	a,@dptr
      000983 FF               [12] 1351 	mov	r7,a
      000984 30 E5 06         [24] 1352 	jnb	acc.5,00131$
                                   1353 ;	usb.c:450: XVAL(0xF081) = 0x20;
      000987 90 F0 81         [24] 1354 	mov	dptr,#0xf081
      00098A 74 20            [12] 1355 	mov	a,#0x20
      00098C F0               [24] 1356 	movx	@dptr,a
      00098D                       1357 00131$:
                                   1358 ;	usb.c:453: if (UsbIntStsF080 | UsbIntStsF082 | UsbIntStsF086 | UsbIntStsF087 | usb_irq)
      00098D 90 60 02         [24] 1359 	mov	dptr,#_UsbIntStsF082
      000990 E0               [24] 1360 	movx	a,@dptr
      000991 FF               [12] 1361 	mov	r7,a
      000992 90 60 01         [24] 1362 	mov	dptr,#_UsbIntStsF080
      000995 E0               [24] 1363 	movx	a,@dptr
      000996 42 07            [12] 1364 	orl	ar7,a
      000998 90 60 03         [24] 1365 	mov	dptr,#_UsbIntStsF086
      00099B E0               [24] 1366 	movx	a,@dptr
      00099C 42 07            [12] 1367 	orl	ar7,a
      00099E 90 60 04         [24] 1368 	mov	dptr,#_UsbIntStsF087
      0009A1 E0               [24] 1369 	movx	a,@dptr
      0009A2 42 07            [12] 1370 	orl	ar7,a
      0009A4 90 60 00         [24] 1371 	mov	dptr,#_usb_irq
      0009A7 E0               [24] 1372 	movx	a,@dptr
      0009A8 FE               [12] 1373 	mov	r6,a
      0009A9 4F               [12] 1374 	orl	a,r7
      0009AA 60 02            [24] 1375 	jz	00134$
                                   1376 ;	usb.c:455: EX0 = 0;
                                   1377 ;	assignBit
      0009AC C2 A8            [12] 1378 	clr	_EX0
      0009AE                       1379 00134$:
                                   1380 ;	usb.c:457: }
      0009AE D0 D0            [24] 1381 	pop	psw
      0009B0 D0 04            [24] 1382 	pop	ar4
      0009B2 D0 05            [24] 1383 	pop	ar5
      0009B4 D0 06            [24] 1384 	pop	ar6
      0009B6 D0 07            [24] 1385 	pop	ar7
      0009B8 D0 83            [24] 1386 	pop	dph
      0009BA D0 82            [24] 1387 	pop	dpl
      0009BC D0 E0            [24] 1388 	pop	acc
      0009BE 32               [24] 1389 	reti
                                   1390 ;	eliminated unneeded push/pop b
                                   1391 ;------------------------------------------------------------
                                   1392 ;Allocation info for local variables in function 'ep_isr'
                                   1393 ;------------------------------------------------------------
                                   1394 ;interrupts                Allocated to registers r7 
                                   1395 ;------------------------------------------------------------
                                   1396 ;	usb.c:459: void ep_isr(void) __interrupt EP_VECT
                                   1397 ;	-----------------------------------------
                                   1398 ;	 function ep_isr
                                   1399 ;	-----------------------------------------
      0009BF                       1400 _ep_isr:
      0009BF C0 E0            [24] 1401 	push	acc
      0009C1 C0 82            [24] 1402 	push	dpl
      0009C3 C0 83            [24] 1403 	push	dph
      0009C5 C0 07            [24] 1404 	push	ar7
      0009C7 C0 06            [24] 1405 	push	ar6
      0009C9 C0 05            [24] 1406 	push	ar5
      0009CB C0 D0            [24] 1407 	push	psw
      0009CD 75 D0 00         [24] 1408 	mov	psw,#0x00
                                   1409 ;	usb.c:461: BYTE interrupts = (EPIRQ & (bmEP2IRQ | bmEP4IRQ));
      0009D0 90 F0 20         [24] 1410 	mov	dptr,#_EPIRQ
      0009D3 E0               [24] 1411 	movx	a,@dptr
      0009D4 54 0A            [12] 1412 	anl	a,#0x0a
                                   1413 ;	usb.c:462: if (interrupts & bmEP2IRQ)
      0009D6 FF               [12] 1414 	mov	r7,a
      0009D7 30 E1 1D         [24] 1415 	jnb	acc.1,00102$
                                   1416 ;	usb.c:464: EPIE &= ~bmEP2IRQ; //disable this 
      0009DA 90 F0 30         [24] 1417 	mov	dptr,#_EPIE
      0009DD E0               [24] 1418 	movx	a,@dptr
      0009DE 53 E0 FD         [24] 1419 	anl	acc,#0xfd
      0009E1 F0               [24] 1420 	movx	@dptr,a
                                   1421 ;	usb.c:465: EPIRQ = bmEP2IRQ; //acknowledge it
      0009E2 90 F0 20         [24] 1422 	mov	dptr,#_EPIRQ
      0009E5 74 02            [12] 1423 	mov	a,#0x02
      0009E7 F0               [24] 1424 	movx	@dptr,a
                                   1425 ;	usb.c:466: usb_received_data_ready |= bmEP2IRQ;
      0009E8 90 60 05         [24] 1426 	mov	dptr,#_usb_received_data_ready
      0009EB E0               [24] 1427 	movx	a,@dptr
      0009EC FE               [12] 1428 	mov	r6,a
      0009ED 7D 00            [12] 1429 	mov	r5,#0x00
      0009EF 43 06 02         [24] 1430 	orl	ar6,#0x02
      0009F2 90 60 05         [24] 1431 	mov	dptr,#_usb_received_data_ready
      0009F5 EE               [12] 1432 	mov	a,r6
      0009F6 F0               [24] 1433 	movx	@dptr,a
      0009F7                       1434 00102$:
                                   1435 ;	usb.c:469: if (interrupts & bmEP4IRQ)
      0009F7 EF               [12] 1436 	mov	a,r7
      0009F8 30 E3 1D         [24] 1437 	jnb	acc.3,00105$
                                   1438 ;	usb.c:471: EPIE &= ~bmEP4IRQ; //disable this 
      0009FB 90 F0 30         [24] 1439 	mov	dptr,#_EPIE
      0009FE E0               [24] 1440 	movx	a,@dptr
      0009FF 53 E0 F7         [24] 1441 	anl	acc,#0xf7
      000A02 F0               [24] 1442 	movx	@dptr,a
                                   1443 ;	usb.c:472: EPIRQ = bmEP4IRQ; //acknowledge it
      000A03 90 F0 20         [24] 1444 	mov	dptr,#_EPIRQ
      000A06 74 08            [12] 1445 	mov	a,#0x08
      000A08 F0               [24] 1446 	movx	@dptr,a
                                   1447 ;	usb.c:473: usb_received_data_ready |= bmEP4IRQ;
      000A09 90 60 05         [24] 1448 	mov	dptr,#_usb_received_data_ready
      000A0C E0               [24] 1449 	movx	a,@dptr
      000A0D FF               [12] 1450 	mov	r7,a
      000A0E 7E 00            [12] 1451 	mov	r6,#0x00
      000A10 43 07 08         [24] 1452 	orl	ar7,#0x08
      000A13 90 60 05         [24] 1453 	mov	dptr,#_usb_received_data_ready
      000A16 EF               [12] 1454 	mov	a,r7
      000A17 F0               [24] 1455 	movx	@dptr,a
      000A18                       1456 00105$:
                                   1457 ;	usb.c:475: }
      000A18 D0 D0            [24] 1458 	pop	psw
      000A1A D0 05            [24] 1459 	pop	ar5
      000A1C D0 06            [24] 1460 	pop	ar6
      000A1E D0 07            [24] 1461 	pop	ar7
      000A20 D0 83            [24] 1462 	pop	dph
      000A22 D0 82            [24] 1463 	pop	dpl
      000A24 D0 E0            [24] 1464 	pop	acc
      000A26 32               [24] 1465 	reti
                                   1466 ;	eliminated unneeded push/pop b
                                   1467 ;------------------------------------------------------------
                                   1468 ;Allocation info for local variables in function 'ResetEPs'
                                   1469 ;------------------------------------------------------------
                                   1470 ;	usb.c:477: static void ResetEPs()
                                   1471 ;	-----------------------------------------
                                   1472 ;	 function ResetEPs
                                   1473 ;	-----------------------------------------
      000A27                       1474 _ResetEPs:
                                   1475 ;	usb.c:479: EPIE = bmEP2IRQ | bmEP4IRQ;
      000A27 90 F0 30         [24] 1476 	mov	dptr,#_EPIE
      000A2A 74 0A            [12] 1477 	mov	a,#0x0a
      000A2C F0               [24] 1478 	movx	@dptr,a
                                   1479 ;	usb.c:480: EP1.cs = 0;
      000A2D 90 F2 13         [24] 1480 	mov	dptr,#(_EP1 + 0x0013)
      000A30 E4               [12] 1481 	clr	a
      000A31 F0               [24] 1482 	movx	@dptr,a
                                   1483 ;	usb.c:481: EP2.cs = 0;
      000A32 90 F2 53         [24] 1484 	mov	dptr,#(_EP2 + 0x0013)
      000A35 F0               [24] 1485 	movx	@dptr,a
                                   1486 ;	usb.c:482: EP3.cs = 0;
      000A36 90 F2 93         [24] 1487 	mov	dptr,#(_EP3 + 0x0013)
      000A39 F0               [24] 1488 	movx	@dptr,a
                                   1489 ;	usb.c:483: EP4.cs = 0;
      000A3A 90 F2 D3         [24] 1490 	mov	dptr,#(_EP4 + 0x0013)
      000A3D F0               [24] 1491 	movx	@dptr,a
                                   1492 ;	usb.c:484: }
      000A3E 22               [24] 1493 	ret
                                   1494 ;------------------------------------------------------------
                                   1495 ;Allocation info for local variables in function 'HandleControlRequest'
                                   1496 ;------------------------------------------------------------
                                   1497 ;res                       Allocated to registers r7 
                                   1498 ;------------------------------------------------------------
                                   1499 ;	usb.c:486: static void HandleControlRequest(void)
                                   1500 ;	-----------------------------------------
                                   1501 ;	 function HandleControlRequest
                                   1502 ;	-----------------------------------------
      000A3F                       1503 _HandleControlRequest:
                                   1504 ;	usb.c:489: switch(bmRequestType & 0x60)
      000A3F AE 1A            [24] 1505 	mov	r6,_bmRequestType
      000A41 53 06 60         [24] 1506 	anl	ar6,#0x60
      000A44 7F 00            [12] 1507 	mov	r7,#0x00
      000A46 BE 00 05         [24] 1508 	cjne	r6,#0x00,00132$
      000A49 BF 00 02         [24] 1509 	cjne	r7,#0x00,00132$
      000A4C 80 10            [24] 1510 	sjmp	00101$
      000A4E                       1511 00132$:
      000A4E BE 20 05         [24] 1512 	cjne	r6,#0x20,00133$
      000A51 BF 00 02         [24] 1513 	cjne	r7,#0x00,00133$
      000A54 80 0F            [24] 1514 	sjmp	00102$
      000A56                       1515 00133$:
                                   1516 ;	usb.c:491: case 0:
      000A56 BE 40 1A         [24] 1517 	cjne	r6,#0x40,00104$
      000A59 BF 00 17         [24] 1518 	cjne	r7,#0x00,00104$
      000A5C 80 0E            [24] 1519 	sjmp	00103$
      000A5E                       1520 00101$:
                                   1521 ;	usb.c:492: res = HandleStandardRequest();
      000A5E 12 0D C1         [24] 1522 	lcall	_HandleStandardRequest
      000A61 AF 82            [24] 1523 	mov	r7,dpl
                                   1524 ;	usb.c:493: break;
                                   1525 ;	usb.c:494: case 0x20:
      000A63 80 10            [24] 1526 	sjmp	00105$
      000A65                       1527 00102$:
                                   1528 ;	usb.c:495: res = HandleClassRequest();
      000A65 12 0E 08         [24] 1529 	lcall	_HandleClassRequest
      000A68 AF 82            [24] 1530 	mov	r7,dpl
                                   1531 ;	usb.c:496: break;
                                   1532 ;	usb.c:497: case 0x40:
      000A6A 80 09            [24] 1533 	sjmp	00105$
      000A6C                       1534 00103$:
                                   1535 ;	usb.c:498: res = HandleVendorRequest();
      000A6C 12 0E 35         [24] 1536 	lcall	_HandleVendorRequest
      000A6F AF 82            [24] 1537 	mov	r7,dpl
                                   1538 ;	usb.c:499: break;
                                   1539 ;	usb.c:500: default:
      000A71 80 02            [24] 1540 	sjmp	00105$
      000A73                       1541 00104$:
                                   1542 ;	usb.c:501: res = FALSE;
      000A73 7F 00            [12] 1543 	mov	r7,#0x00
                                   1544 ;	usb.c:502: }
      000A75                       1545 00105$:
                                   1546 ;	usb.c:504: if (!res)
      000A75 EF               [12] 1547 	mov	a,r7
      000A76 70 15            [24] 1548 	jnz	00108$
                                   1549 ;	usb.c:506: EP0CS = wLength ? bmEP0STALL : bmEP0NAK;
      000A78 E5 20            [12] 1550 	mov	a,_wLength
      000A7A 45 21            [12] 1551 	orl	a,(_wLength + 1)
      000A7C 60 06            [24] 1552 	jz	00110$
      000A7E 7E 08            [12] 1553 	mov	r6,#0x08
      000A80 7F 00            [12] 1554 	mov	r7,#0x00
      000A82 80 04            [24] 1555 	sjmp	00111$
      000A84                       1556 00110$:
      000A84 7E 02            [12] 1557 	mov	r6,#0x02
      000A86 7F 00            [12] 1558 	mov	r7,#0x00
      000A88                       1559 00111$:
      000A88 90 F0 48         [24] 1560 	mov	dptr,#_EP0CS
      000A8B EE               [12] 1561 	mov	a,r6
      000A8C F0               [24] 1562 	movx	@dptr,a
      000A8D                       1563 00108$:
                                   1564 ;	usb.c:508: }
      000A8D 22               [24] 1565 	ret
                                   1566 ;------------------------------------------------------------
                                   1567 ;Allocation info for local variables in function 'HandleUSBEvents'
                                   1568 ;------------------------------------------------------------
                                   1569 ;a                         Allocated to registers r7 
                                   1570 ;b                         Allocated to registers r6 
                                   1571 ;c                         Allocated to registers r5 
                                   1572 ;d                         Allocated to registers r4 
                                   1573 ;------------------------------------------------------------
                                   1574 ;	usb.c:510: void HandleUSBEvents(void)
                                   1575 ;	-----------------------------------------
                                   1576 ;	 function HandleUSBEvents
                                   1577 ;	-----------------------------------------
      000A8E                       1578 _HandleUSBEvents:
                                   1579 ;	usb.c:512: if (UsbIntStsF080 | UsbIntStsF082 | UsbIntStsF086 | UsbIntStsF087 | usb_irq)
      000A8E 90 60 02         [24] 1580 	mov	dptr,#_UsbIntStsF082
      000A91 E0               [24] 1581 	movx	a,@dptr
      000A92 FF               [12] 1582 	mov	r7,a
      000A93 90 60 01         [24] 1583 	mov	dptr,#_UsbIntStsF080
      000A96 E0               [24] 1584 	movx	a,@dptr
      000A97 FE               [12] 1585 	mov	r6,a
      000A98 4F               [12] 1586 	orl	a,r7
      000A99 FD               [12] 1587 	mov	r5,a
      000A9A 90 60 03         [24] 1588 	mov	dptr,#_UsbIntStsF086
      000A9D E0               [24] 1589 	movx	a,@dptr
      000A9E 42 05            [12] 1590 	orl	ar5,a
      000AA0 90 60 04         [24] 1591 	mov	dptr,#_UsbIntStsF087
      000AA3 E0               [24] 1592 	movx	a,@dptr
      000AA4 42 05            [12] 1593 	orl	ar5,a
      000AA6 90 60 00         [24] 1594 	mov	dptr,#_usb_irq
      000AA9 E0               [24] 1595 	movx	a,@dptr
      000AAA FC               [12] 1596 	mov	r4,a
      000AAB 4D               [12] 1597 	orl	a,r5
      000AAC 60 76            [24] 1598 	jz	00144$
                                   1599 ;	usb.c:514: if (usb_irq)
      000AAE EC               [12] 1600 	mov	a,r4
      000AAF 60 39            [24] 1601 	jz	00116$
                                   1602 ;	usb.c:516: if (usb_irq & 0x40)
      000AB1 EC               [12] 1603 	mov	a,r4
      000AB2 30 E6 24         [24] 1604 	jnb	acc.6,00105$
                                   1605 ;	usb.c:518: USBCTL &= ~bmAttach;
      000AB5 90 F0 08         [24] 1606 	mov	dptr,#_USBCTL
      000AB8 E0               [24] 1607 	movx	a,@dptr
      000AB9 53 E0 7F         [24] 1608 	anl	acc,#0x7f
      000ABC F0               [24] 1609 	movx	@dptr,a
                                   1610 ;	usb.c:519: ResetEPs();
      000ABD 12 0A 27         [24] 1611 	lcall	_ResetEPs
                                   1612 ;	usb.c:520: XVAL(0xFF88) = 0;
      000AC0 90 FF 88         [24] 1613 	mov	dptr,#0xff88
      000AC3 E4               [12] 1614 	clr	a
      000AC4 F0               [24] 1615 	movx	@dptr,a
                                   1616 ;	usb.c:521: XVAL(0xFF82) = 0x10;
      000AC5 90 FF 82         [24] 1617 	mov	dptr,#0xff82
      000AC8 74 10            [12] 1618 	mov	a,#0x10
      000ACA F0               [24] 1619 	movx	@dptr,a
                                   1620 ;	usb.c:522: while(XVAL(0xFF88)!=2);
      000ACB                       1621 00101$:
      000ACB 90 FF 88         [24] 1622 	mov	dptr,#0xff88
      000ACE E0               [24] 1623 	movx	a,@dptr
      000ACF FD               [12] 1624 	mov	r5,a
      000AD0 BD 02 F8         [24] 1625 	cjne	r5,#0x02,00101$
                                   1626 ;	usb.c:523: USBCTL = bmAttach;
      000AD3 90 F0 08         [24] 1627 	mov	dptr,#_USBCTL
      000AD6 74 80            [12] 1628 	mov	a,#0x80
      000AD8 F0               [24] 1629 	movx	@dptr,a
      000AD9                       1630 00105$:
                                   1631 ;	usb.c:526: if (usb_irq & bmSpeedChange)
      000AD9 90 60 00         [24] 1632 	mov	dptr,#_usb_irq
      000ADC E0               [24] 1633 	movx	a,@dptr
      000ADD 30 E7 03         [24] 1634 	jnb	acc.7,00107$
                                   1635 ;	usb.c:528: ResetEPs();
      000AE0 12 0A 27         [24] 1636 	lcall	_ResetEPs
      000AE3                       1637 00107$:
                                   1638 ;	usb.c:531: usb_irq = 0;
      000AE3 90 60 00         [24] 1639 	mov	dptr,#_usb_irq
      000AE6 E4               [12] 1640 	clr	a
      000AE7 F0               [24] 1641 	movx	@dptr,a
      000AE8 80 38            [24] 1642 	sjmp	00117$
      000AEA                       1643 00116$:
                                   1644 ;	usb.c:535: if (UsbIntStsF082 & 0xC0)
      000AEA EF               [12] 1645 	mov	a,r7
      000AEB 54 C0            [12] 1646 	anl	a,#0xc0
      000AED 60 1B            [24] 1647 	jz	00113$
                                   1648 ;	usb.c:537: ResetEPs();
      000AEF 12 0A 27         [24] 1649 	lcall	_ResetEPs
                                   1650 ;	usb.c:538: XVAL(0xF092) = 0;
      000AF2 90 F0 92         [24] 1651 	mov	dptr,#0xf092
      000AF5 E4               [12] 1652 	clr	a
      000AF6 F0               [24] 1653 	movx	@dptr,a
                                   1654 ;	usb.c:539: XVAL(0xF096) = 0;
      000AF7 90 F0 96         [24] 1655 	mov	dptr,#0xf096
      000AFA F0               [24] 1656 	movx	@dptr,a
                                   1657 ;	usb.c:540: if (UsbIntStsF082 & 0x40)
      000AFB 90 60 02         [24] 1658 	mov	dptr,#_UsbIntStsF082
      000AFE E0               [24] 1659 	movx	a,@dptr
      000AFF 30 E6 0F         [24] 1660 	jnb	acc.6,00114$
                                   1661 ;	usb.c:542: XVAL(0xF07A) = 1;
      000B02 90 F0 7A         [24] 1662 	mov	dptr,#0xf07a
      000B05 74 01            [12] 1663 	mov	a,#0x01
      000B07 F0               [24] 1664 	movx	@dptr,a
      000B08 80 07            [24] 1665 	sjmp	00114$
      000B0A                       1666 00113$:
                                   1667 ;	usb.c:547: if (UsbIntStsF080 & 1)
      000B0A EE               [12] 1668 	mov	a,r6
      000B0B 30 E0 03         [24] 1669 	jnb	acc.0,00114$
                                   1670 ;	usb.c:549: HandleControlRequest();
      000B0E 12 0A 3F         [24] 1671 	lcall	_HandleControlRequest
      000B11                       1672 00114$:
                                   1673 ;	usb.c:553: UsbIntStsF080 = 0;
      000B11 90 60 01         [24] 1674 	mov	dptr,#_UsbIntStsF080
      000B14 E4               [12] 1675 	clr	a
      000B15 F0               [24] 1676 	movx	@dptr,a
                                   1677 ;	usb.c:554: UsbIntStsF082 = 0; 
      000B16 90 60 02         [24] 1678 	mov	dptr,#_UsbIntStsF082
      000B19 F0               [24] 1679 	movx	@dptr,a
                                   1680 ;	usb.c:555: UsbIntStsF086 = 0; 
      000B1A 90 60 03         [24] 1681 	mov	dptr,#_UsbIntStsF086
      000B1D F0               [24] 1682 	movx	@dptr,a
                                   1683 ;	usb.c:556: UsbIntStsF087 = 0;
      000B1E 90 60 04         [24] 1684 	mov	dptr,#_UsbIntStsF087
      000B21 F0               [24] 1685 	movx	@dptr,a
      000B22                       1686 00117$:
                                   1687 ;	usb.c:559: EX0 = 1;	
                                   1688 ;	assignBit
      000B22 D2 A8            [12] 1689 	setb	_EX0
                                   1690 ;	usb.c:563: if (1)//usb_received_data_ready)
      000B24                       1691 00144$:
                                   1692 ;	usb.c:567: if (EP4.fifo_count > 0)
      000B24 90 F2 DA         [24] 1693 	mov	dptr,#(_EP4 + 0x001a)
      000B27 E0               [24] 1694 	movx	a,@dptr
      000B28 60 20            [24] 1695 	jz	00123$
                                   1696 ;	usb.c:569: EP4.cs = 0x40;
      000B2A 90 F2 D3         [24] 1697 	mov	dptr,#(_EP4 + 0x0013)
      000B2D 74 40            [12] 1698 	mov	a,#0x40
      000B2F F0               [24] 1699 	movx	@dptr,a
                                   1700 ;	usb.c:571: send_keys_enabled = 1;
      000B30 75 0A 01         [24] 1701 	mov	_send_keys_enabled,#0x01
                                   1702 ;	usb.c:572: usb_received_data_ready &= ~bmEP4IRQ;
      000B33 90 60 05         [24] 1703 	mov	dptr,#_usb_received_data_ready
      000B36 E0               [24] 1704 	movx	a,@dptr
      000B37 53 E0 F7         [24] 1705 	anl	acc,#0xf7
      000B3A F0               [24] 1706 	movx	@dptr,a
                                   1707 ;	usb.c:573: EPIE |= bmEP4IRQ;
      000B3B 90 F0 30         [24] 1708 	mov	dptr,#_EPIE
      000B3E E0               [24] 1709 	movx	a,@dptr
      000B3F FF               [12] 1710 	mov	r7,a
      000B40 7E 00            [12] 1711 	mov	r6,#0x00
      000B42 43 07 08         [24] 1712 	orl	ar7,#0x08
      000B45 90 F0 30         [24] 1713 	mov	dptr,#_EPIE
      000B48 EF               [12] 1714 	mov	a,r7
      000B49 F0               [24] 1715 	movx	@dptr,a
      000B4A                       1716 00123$:
                                   1717 ;	usb.c:577: if (usb_received_data_ready & bmEP2IRQ)
      000B4A 90 60 05         [24] 1718 	mov	dptr,#_usb_received_data_ready
      000B4D E0               [24] 1719 	movx	a,@dptr
      000B4E 20 E1 03         [24] 1720 	jb	acc.1,00251$
      000B51 02 0C 9F         [24] 1721 	ljmp	00145$
      000B54                       1722 00251$:
                                   1723 ;	usb.c:579: if (EP2.fifo_count == 31) //CBW size
      000B54 90 F2 5A         [24] 1724 	mov	dptr,#(_EP2 + 0x001a)
      000B57 E0               [24] 1725 	movx	a,@dptr
      000B58 FF               [12] 1726 	mov	r7,a
      000B59 BF 1F 02         [24] 1727 	cjne	r7,#0x1f,00252$
      000B5C 80 03            [24] 1728 	sjmp	00253$
      000B5E                       1729 00252$:
      000B5E 02 0C 80         [24] 1730 	ljmp	00140$
      000B61                       1731 00253$:
                                   1732 ;	usb.c:583: scsi_data_residue = 0;
      000B61 E4               [12] 1733 	clr	a
      000B62 F5 26            [12] 1734 	mov	_scsi_data_residue,a
      000B64 F5 27            [12] 1735 	mov	(_scsi_data_residue + 1),a
      000B66 F5 28            [12] 1736 	mov	(_scsi_data_residue + 2),a
      000B68 F5 29            [12] 1737 	mov	(_scsi_data_residue + 3),a
                                   1738 ;	usb.c:589: a = EP2.fifo;
      000B6A 90 F2 5C         [24] 1739 	mov	dptr,#(_EP2 + 0x001c)
      000B6D E0               [24] 1740 	movx	a,@dptr
      000B6E FF               [12] 1741 	mov	r7,a
                                   1742 ;	usb.c:590: b = EP2.fifo;
      000B6F 90 F2 5C         [24] 1743 	mov	dptr,#(_EP2 + 0x001c)
      000B72 E0               [24] 1744 	movx	a,@dptr
      000B73 FE               [12] 1745 	mov	r6,a
                                   1746 ;	usb.c:591: c = EP2.fifo;
      000B74 90 F2 5C         [24] 1747 	mov	dptr,#(_EP2 + 0x001c)
      000B77 E0               [24] 1748 	movx	a,@dptr
      000B78 FD               [12] 1749 	mov	r5,a
                                   1750 ;	usb.c:592: d = EP2.fifo;
      000B79 90 F2 5C         [24] 1751 	mov	dptr,#(_EP2 + 0x001c)
      000B7C E0               [24] 1752 	movx	a,@dptr
      000B7D FC               [12] 1753 	mov	r4,a
                                   1754 ;	usb.c:593: if ((a=='U') && (b=='S') && (c=='B') && (d=='C'))
      000B7E BF 55 02         [24] 1755 	cjne	r7,#0x55,00254$
      000B81 80 03            [24] 1756 	sjmp	00255$
      000B83                       1757 00254$:
      000B83 02 0C 76         [24] 1758 	ljmp	00134$
      000B86                       1759 00255$:
      000B86 BE 53 02         [24] 1760 	cjne	r6,#0x53,00256$
      000B89 80 03            [24] 1761 	sjmp	00257$
      000B8B                       1762 00256$:
      000B8B 02 0C 76         [24] 1763 	ljmp	00134$
      000B8E                       1764 00257$:
      000B8E BD 42 02         [24] 1765 	cjne	r5,#0x42,00258$
      000B91 80 03            [24] 1766 	sjmp	00259$
      000B93                       1767 00258$:
      000B93 02 0C 76         [24] 1768 	ljmp	00134$
      000B96                       1769 00259$:
      000B96 BC 43 02         [24] 1770 	cjne	r4,#0x43,00260$
      000B99 80 03            [24] 1771 	sjmp	00261$
      000B9B                       1772 00260$:
      000B9B 02 0C 76         [24] 1773 	ljmp	00134$
      000B9E                       1774 00261$:
                                   1775 ;	usb.c:595: scsi_tag[0] = EP2.fifo;
      000B9E 90 F2 5C         [24] 1776 	mov	dptr,#(_EP2 + 0x001c)
      000BA1 E0               [24] 1777 	movx	a,@dptr
      000BA2 FF               [12] 1778 	mov	r7,a
      000BA3 8F 2E            [24] 1779 	mov	_scsi_tag,r7
                                   1780 ;	usb.c:596: scsi_tag[1] = EP2.fifo;
      000BA5 90 F2 5C         [24] 1781 	mov	dptr,#(_EP2 + 0x001c)
      000BA8 E0               [24] 1782 	movx	a,@dptr
      000BA9 FF               [12] 1783 	mov	r7,a
      000BAA 8F 2F            [24] 1784 	mov	(_scsi_tag + 0x0001),r7
                                   1785 ;	usb.c:597: scsi_tag[2] = EP2.fifo;
      000BAC 90 F2 5C         [24] 1786 	mov	dptr,#(_EP2 + 0x001c)
      000BAF E0               [24] 1787 	movx	a,@dptr
      000BB0 FF               [12] 1788 	mov	r7,a
      000BB1 8F 30            [24] 1789 	mov	(_scsi_tag + 0x0002),r7
                                   1790 ;	usb.c:598: scsi_tag[3] = EP2.fifo;
      000BB3 90 F2 5C         [24] 1791 	mov	dptr,#(_EP2 + 0x001c)
      000BB6 E0               [24] 1792 	movx	a,@dptr
      000BB7 FF               [12] 1793 	mov	r7,a
      000BB8 8F 31            [24] 1794 	mov	(_scsi_tag + 0x0003),r7
                                   1795 ;	usb.c:599: scsi_transfer_size = EP2.fifo;
      000BBA 90 F2 5C         [24] 1796 	mov	dptr,#(_EP2 + 0x001c)
      000BBD E0               [24] 1797 	movx	a,@dptr
      000BBE FF               [12] 1798 	mov	r7,a
      000BBF 8F 2A            [24] 1799 	mov	_scsi_transfer_size,r7
      000BC1 75 2B 00         [24] 1800 	mov	(_scsi_transfer_size + 1),#0x00
      000BC4 75 2C 00         [24] 1801 	mov	(_scsi_transfer_size + 2),#0x00
      000BC7 75 2D 00         [24] 1802 	mov	(_scsi_transfer_size + 3),#0x00
                                   1803 ;	usb.c:600: scsi_transfer_size |= ((DWORD)EP2.fifo)<<8;
      000BCA 90 F2 5C         [24] 1804 	mov	dptr,#(_EP2 + 0x001c)
      000BCD E0               [24] 1805 	movx	a,@dptr
      000BCE FF               [12] 1806 	mov	r7,a
      000BCF 7E 00            [12] 1807 	mov	r6,#0x00
      000BD1 7D 00            [12] 1808 	mov	r5,#0x00
      000BD3 8D 04            [24] 1809 	mov	ar4,r5
      000BD5 8E 05            [24] 1810 	mov	ar5,r6
      000BD7 8F 06            [24] 1811 	mov	ar6,r7
      000BD9 E4               [12] 1812 	clr	a
      000BDA 42 2A            [12] 1813 	orl	_scsi_transfer_size,a
      000BDC EE               [12] 1814 	mov	a,r6
      000BDD 42 2B            [12] 1815 	orl	(_scsi_transfer_size + 1),a
      000BDF ED               [12] 1816 	mov	a,r5
      000BE0 42 2C            [12] 1817 	orl	(_scsi_transfer_size + 2),a
      000BE2 EC               [12] 1818 	mov	a,r4
      000BE3 42 2D            [12] 1819 	orl	(_scsi_transfer_size + 3),a
                                   1820 ;	usb.c:601: scsi_transfer_size |= ((DWORD)EP2.fifo)<<16;
      000BE5 90 F2 5C         [24] 1821 	mov	dptr,#(_EP2 + 0x001c)
      000BE8 E0               [24] 1822 	movx	a,@dptr
      000BE9 FF               [12] 1823 	mov	r7,a
      000BEA 7E 00            [12] 1824 	mov	r6,#0x00
      000BEC 8E 04            [24] 1825 	mov	ar4,r6
      000BEE 8F 05            [24] 1826 	mov	ar5,r7
      000BF0 E4               [12] 1827 	clr	a
      000BF1 FE               [12] 1828 	mov	r6,a
      000BF2 42 2A            [12] 1829 	orl	_scsi_transfer_size,a
      000BF4 EE               [12] 1830 	mov	a,r6
      000BF5 42 2B            [12] 1831 	orl	(_scsi_transfer_size + 1),a
      000BF7 ED               [12] 1832 	mov	a,r5
      000BF8 42 2C            [12] 1833 	orl	(_scsi_transfer_size + 2),a
      000BFA EC               [12] 1834 	mov	a,r4
      000BFB 42 2D            [12] 1835 	orl	(_scsi_transfer_size + 3),a
                                   1836 ;	usb.c:602: scsi_transfer_size |= ((DWORD)EP2.fifo)<<24;
      000BFD 90 F2 5C         [24] 1837 	mov	dptr,#(_EP2 + 0x001c)
      000C00 E0               [24] 1838 	movx	a,@dptr
      000C01 FC               [12] 1839 	mov	r4,a
      000C02 E4               [12] 1840 	clr	a
      000C03 FF               [12] 1841 	mov	r7,a
      000C04 FE               [12] 1842 	mov	r6,a
      000C05 FD               [12] 1843 	mov	r5,a
      000C06 EF               [12] 1844 	mov	a,r7
      000C07 42 2A            [12] 1845 	orl	_scsi_transfer_size,a
      000C09 EE               [12] 1846 	mov	a,r6
      000C0A 42 2B            [12] 1847 	orl	(_scsi_transfer_size + 1),a
      000C0C ED               [12] 1848 	mov	a,r5
      000C0D 42 2C            [12] 1849 	orl	(_scsi_transfer_size + 2),a
      000C0F EC               [12] 1850 	mov	a,r4
      000C10 42 2D            [12] 1851 	orl	(_scsi_transfer_size + 3),a
                                   1852 ;	usb.c:603: scsi_dir_in = EP2.fifo & 0x80;
      000C12 90 F2 5C         [24] 1853 	mov	dptr,#(_EP2 + 0x001c)
      000C15 E0               [24] 1854 	movx	a,@dptr
      000C16 FF               [12] 1855 	mov	r7,a
      000C17 74 80            [12] 1856 	mov	a,#0x80
      000C19 5F               [12] 1857 	anl	a,r7
      000C1A F5 32            [12] 1858 	mov	_scsi_dir_in,a
                                   1859 ;	usb.c:604: scsi_lun = EP2.fifo;
      000C1C 90 F2 5C         [24] 1860 	mov	dptr,#(_EP2 + 0x001c)
      000C1F E0               [24] 1861 	movx	a,@dptr
      000C20 F5 33            [12] 1862 	mov	_scsi_lun,a
                                   1863 ;	usb.c:605: scsi_cdb_size = EP2.fifo;
      000C22 90 F2 5C         [24] 1864 	mov	dptr,#(_EP2 + 0x001c)
      000C25 E0               [24] 1865 	movx	a,@dptr
      000C26 F5 44            [12] 1866 	mov	_scsi_cdb_size,a
                                   1867 ;	usb.c:606: for(a = 0; a < 16; a++)
      000C28 7F 00            [12] 1868 	mov	r7,#0x00
      000C2A                       1869 00148$:
                                   1870 ;	usb.c:608: scsi_cdb[a] = EP2.fifo;
      000C2A EF               [12] 1871 	mov	a,r7
      000C2B 24 34            [12] 1872 	add	a,#_scsi_cdb
      000C2D F9               [12] 1873 	mov	r1,a
      000C2E 90 F2 5C         [24] 1874 	mov	dptr,#(_EP2 + 0x001c)
      000C31 E0               [24] 1875 	movx	a,@dptr
      000C32 FE               [12] 1876 	mov	r6,a
      000C33 F7               [12] 1877 	mov	@r1,a
                                   1878 ;	usb.c:606: for(a = 0; a < 16; a++)
      000C34 0F               [12] 1879 	inc	r7
      000C35 BF 10 00         [24] 1880 	cjne	r7,#0x10,00262$
      000C38                       1881 00262$:
      000C38 40 F0            [24] 1882 	jc	00148$
                                   1883 ;	usb.c:611: EP2.cs = 0x40;
      000C3A 90 F2 53         [24] 1884 	mov	dptr,#(_EP2 + 0x0013)
      000C3D 74 40            [12] 1885 	mov	a,#0x40
      000C3F F0               [24] 1886 	movx	@dptr,a
                                   1887 ;	usb.c:612: if (!HandleCDB())
      000C40 12 0E 39         [24] 1888 	lcall	_HandleCDB
      000C43 E5 82            [12] 1889 	mov	a,dpl
      000C45 70 27            [24] 1890 	jnz	00132$
                                   1891 ;	usb.c:614: scsi_status = 1;
      000C47 75 25 01         [24] 1892 	mov	_scsi_status,#0x01
                                   1893 ;	usb.c:615: if (scsi_transfer_size == 0)
      000C4A E5 2A            [12] 1894 	mov	a,_scsi_transfer_size
      000C4C 45 2B            [12] 1895 	orl	a,(_scsi_transfer_size + 1)
      000C4E 45 2C            [12] 1896 	orl	a,(_scsi_transfer_size + 2)
      000C50 45 2D            [12] 1897 	orl	a,(_scsi_transfer_size + 3)
      000C52 70 08            [24] 1898 	jnz	00129$
                                   1899 ;	usb.c:617: EP1.cs = bmSTALL; 
      000C54 90 F2 13         [24] 1900 	mov	dptr,#(_EP1 + 0x0013)
      000C57 74 02            [12] 1901 	mov	a,#0x02
      000C59 F0               [24] 1902 	movx	@dptr,a
      000C5A 80 12            [24] 1903 	sjmp	00132$
      000C5C                       1904 00129$:
                                   1905 ;	usb.c:619: else if (scsi_dir_in)
      000C5C E5 32            [12] 1906 	mov	a,_scsi_dir_in
      000C5E 60 08            [24] 1907 	jz	00126$
                                   1908 ;	usb.c:621: EP1.cs = bmSTALL;
      000C60 90 F2 13         [24] 1909 	mov	dptr,#(_EP1 + 0x0013)
      000C63 74 02            [12] 1910 	mov	a,#0x02
      000C65 F0               [24] 1911 	movx	@dptr,a
      000C66 80 06            [24] 1912 	sjmp	00132$
      000C68                       1913 00126$:
                                   1914 ;	usb.c:625: EP2.cs = bmSTALL;
      000C68 90 F2 53         [24] 1915 	mov	dptr,#(_EP2 + 0x0013)
      000C6B 74 02            [12] 1916 	mov	a,#0x02
      000C6D F0               [24] 1917 	movx	@dptr,a
      000C6E                       1918 00132$:
                                   1919 ;	usb.c:629: usb_have_csw_ready = 1;
      000C6E 90 60 06         [24] 1920 	mov	dptr,#_usb_have_csw_ready
      000C71 74 01            [12] 1921 	mov	a,#0x01
      000C73 F0               [24] 1922 	movx	@dptr,a
      000C74 80 12            [24] 1923 	sjmp	00141$
      000C76                       1924 00134$:
                                   1925 ;	usb.c:633: EP2.cs = 0x40;
                                   1926 ;	usb.c:634: EP2.cs = 4;
      000C76 90 F2 53         [24] 1927 	mov	dptr,#(_EP2 + 0x0013)
      000C79 74 40            [12] 1928 	mov	a,#0x40
      000C7B F0               [24] 1929 	movx	@dptr,a
      000C7C C4               [12] 1930 	swap	a
      000C7D F0               [24] 1931 	movx	@dptr,a
      000C7E 80 08            [24] 1932 	sjmp	00141$
      000C80                       1933 00140$:
                                   1934 ;	usb.c:639: EP2.cs = 0x40;
                                   1935 ;	usb.c:640: EP2.cs = 4;
      000C80 90 F2 53         [24] 1936 	mov	dptr,#(_EP2 + 0x0013)
      000C83 74 40            [12] 1937 	mov	a,#0x40
      000C85 F0               [24] 1938 	movx	@dptr,a
      000C86 C4               [12] 1939 	swap	a
      000C87 F0               [24] 1940 	movx	@dptr,a
      000C88                       1941 00141$:
                                   1942 ;	usb.c:643: usb_received_data_ready &= ~bmEP2IRQ;
      000C88 90 60 05         [24] 1943 	mov	dptr,#_usb_received_data_ready
      000C8B E0               [24] 1944 	movx	a,@dptr
      000C8C 53 E0 FD         [24] 1945 	anl	acc,#0xfd
      000C8F F0               [24] 1946 	movx	@dptr,a
                                   1947 ;	usb.c:644: EPIE |= bmEP2IRQ;
      000C90 90 F0 30         [24] 1948 	mov	dptr,#_EPIE
      000C93 E0               [24] 1949 	movx	a,@dptr
      000C94 FF               [12] 1950 	mov	r7,a
      000C95 7E 00            [12] 1951 	mov	r6,#0x00
      000C97 43 07 02         [24] 1952 	orl	ar7,#0x02
      000C9A 90 F0 30         [24] 1953 	mov	dptr,#_EPIE
      000C9D EF               [12] 1954 	mov	a,r7
      000C9E F0               [24] 1955 	movx	@dptr,a
      000C9F                       1956 00145$:
                                   1957 ;	usb.c:648: if (usb_have_csw_ready)
      000C9F 90 60 06         [24] 1958 	mov	dptr,#_usb_have_csw_ready
      000CA2 E0               [24] 1959 	movx	a,@dptr
      000CA3 60 03            [24] 1960 	jz	00150$
                                   1961 ;	usb.c:650: SendCSW2();
                                   1962 ;	usb.c:652: }
      000CA5 02 06 57         [24] 1963 	ljmp	_SendCSW2
      000CA8                       1964 00150$:
      000CA8 22               [24] 1965 	ret
                                   1966 	.area CSEG    (CODE)
                                   1967 	.area CONST   (CODE)
                                   1968 	.area XINIT   (CODE)
                                   1969 	.area CABS    (ABS,CODE)
