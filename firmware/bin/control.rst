                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.7.1 #10443 (MINGW64)
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
      000CA9                        308 _EP0ACK:
                           000007   309 	ar7 = 0x07
                           000006   310 	ar6 = 0x06
                           000005   311 	ar5 = 0x05
                           000004   312 	ar4 = 0x04
                           000003   313 	ar3 = 0x03
                           000002   314 	ar2 = 0x02
                           000001   315 	ar1 = 0x01
                           000000   316 	ar0 = 0x00
                                    317 ;	control.c:30: EP0CS = bmEP0ACK;
      000CA9 90 F0 48         [24]  318 	mov	dptr,#_EP0CS
      000CAC 74 01            [12]  319 	mov	a,#0x01
      000CAE F0               [24]  320 	movx	@dptr,a
                                    321 ;	control.c:31: }
      000CAF 22               [24]  322 	ret
                                    323 ;------------------------------------------------------------
                                    324 ;Allocation info for local variables in function 'SetAddress'
                                    325 ;------------------------------------------------------------
                                    326 ;ret                       Allocated to registers r7 
                                    327 ;------------------------------------------------------------
                                    328 ;	control.c:33: static BYTE SetAddress()
                                    329 ;	-----------------------------------------
                                    330 ;	 function SetAddress
                                    331 ;	-----------------------------------------
      000CB0                        332 _SetAddress:
                                    333 ;	control.c:35: BYTE ret = FALSE;
      000CB0 7F 00            [12]  334 	mov	r7,#0x00
                                    335 ;	control.c:37: if (wValue < 0x7F)
      000CB2 C3               [12]  336 	clr	c
      000CB3 E5 1C            [12]  337 	mov	a,_wValue
      000CB5 94 7F            [12]  338 	subb	a,#0x7f
      000CB7 E5 1D            [12]  339 	mov	a,(_wValue + 1)
      000CB9 94 00            [12]  340 	subb	a,#0x00
      000CBB 50 05            [24]  341 	jnc	00102$
                                    342 ;	control.c:39: EP0ACK();
      000CBD 12 0C A9         [24]  343 	lcall	_EP0ACK
                                    344 ;	control.c:40: ret = TRUE;
      000CC0 7F 01            [12]  345 	mov	r7,#0x01
      000CC2                        346 00102$:
                                    347 ;	control.c:43: return ret;
      000CC2 8F 82            [24]  348 	mov	dpl,r7
                                    349 ;	control.c:44: }
      000CC4 22               [24]  350 	ret
                                    351 ;------------------------------------------------------------
                                    352 ;Allocation info for local variables in function 'GetDescriptor'
                                    353 ;------------------------------------------------------------
                                    354 ;type                      Allocated to registers r7 
                                    355 ;i                         Allocated to registers r7 
                                    356 ;total                     Allocated to registers r5 
                                    357 ;ret                       Allocated to registers r6 
                                    358 ;------------------------------------------------------------
                                    359 ;	control.c:46: static BYTE GetDescriptor()
                                    360 ;	-----------------------------------------
                                    361 ;	 function GetDescriptor
                                    362 ;	-----------------------------------------
      000CC5                        363 _GetDescriptor:
                                    364 ;	control.c:48: BYTE type = (wValue >> 8) & 0xFF;
      000CC5 AF 1D            [24]  365 	mov	r7,(_wValue + 1)
                                    366 ;	control.c:50: BYTE ret = FALSE;
      000CC7 7E 00            [12]  367 	mov	r6,#0x00
                                    368 ;	control.c:52: switch (type)
      000CC9 BF 01 02         [24]  369 	cjne	r7,#0x01,00198$
      000CCC 80 14            [24]  370 	sjmp	00134$
      000CCE                        371 00198$:
      000CCE BF 02 02         [24]  372 	cjne	r7,#0x02,00199$
      000CD1 80 41            [24]  373 	sjmp	00103$
      000CD3                        374 00199$:
      000CD3 BF 06 03         [24]  375 	cjne	r7,#0x06,00200$
      000CD6 02 0D 4A         [24]  376 	ljmp	00140$
      000CD9                        377 00200$:
      000CD9 BF 22 03         [24]  378 	cjne	r7,#0x22,00201$
      000CDC 02 0D 7B         [24]  379 	ljmp	00143$
      000CDF                        380 00201$:
      000CDF 02 0D AA         [24]  381 	ljmp	00110$
                                    382 ;	control.c:56: for (i = 0; i < 0x12; i++)
      000CE2                        383 00134$:
      000CE2 7F 00            [12]  384 	mov	r7,#0x00
      000CE4                        385 00111$:
                                    386 ;	control.c:58: EP0.fifo = deviceDescriptor[i];
      000CE4 EF               [12]  387 	mov	a,r7
      000CE5 90 31 90         [24]  388 	mov	dptr,#_deviceDescriptor
      000CE8 93               [24]  389 	movc	a,@a+dptr
      000CE9 FD               [12]  390 	mov	r5,a
      000CEA 90 F1 DC         [24]  391 	mov	dptr,#(_EP0 + 0x001c)
      000CED F0               [24]  392 	movx	@dptr,a
                                    393 ;	control.c:56: for (i = 0; i < 0x12; i++)
      000CEE 0F               [12]  394 	inc	r7
      000CEF BF 12 00         [24]  395 	cjne	r7,#0x12,00202$
      000CF2                        396 00202$:
                                    397 ;	control.c:61: SendControlResponse(wLength < 0x12 ? wLength : 0x12);
      000CF2 40 F0            [24]  398 	jc	00111$
      000CF4 E5 20            [12]  399 	mov	a,_wLength
      000CF6 94 12            [12]  400 	subb	a,#0x12
      000CF8 E5 21            [12]  401 	mov	a,(_wLength + 1)
      000CFA 94 00            [12]  402 	subb	a,#0x00
      000CFC 50 06            [24]  403 	jnc	00122$
      000CFE AD 20            [24]  404 	mov	r5,_wLength
      000D00 AF 21            [24]  405 	mov	r7,(_wLength + 1)
      000D02 80 04            [24]  406 	sjmp	00123$
      000D04                        407 00122$:
      000D04 7D 12            [12]  408 	mov	r5,#0x12
      000D06 7F 00            [12]  409 	mov	r7,#0x00
      000D08                        410 00123$:
      000D08 8D 82            [24]  411 	mov	dpl,r5
      000D0A 8F 83            [24]  412 	mov	dph,r7
      000D0C 12 05 04         [24]  413 	lcall	_SendControlResponse
                                    414 ;	control.c:62: ret = TRUE;
      000D0F 7E 01            [12]  415 	mov	r6,#0x01
                                    416 ;	control.c:64: break;
      000D11 02 0D AA         [24]  417 	ljmp	00110$
                                    418 ;	control.c:66: case 0x02:
      000D14                        419 00103$:
                                    420 ;	control.c:68: total = wLength < sizeof(configDescriptor) ? wLength : sizeof(configDescriptor);
      000D14 C3               [12]  421 	clr	c
      000D15 E5 20            [12]  422 	mov	a,_wLength
      000D17 94 47            [12]  423 	subb	a,#0x47
      000D19 E5 21            [12]  424 	mov	a,(_wLength + 1)
      000D1B 94 00            [12]  425 	subb	a,#0x00
      000D1D 50 06            [24]  426 	jnc	00124$
      000D1F AD 20            [24]  427 	mov	r5,_wLength
      000D21 AF 21            [24]  428 	mov	r7,(_wLength + 1)
      000D23 80 04            [24]  429 	sjmp	00125$
      000D25                        430 00124$:
      000D25 7D 47            [12]  431 	mov	r5,#0x47
      000D27 7F 00            [12]  432 	mov	r7,#0x00
      000D29                        433 00125$:
                                    434 ;	control.c:69: for (i = 0; i < total; i++)
      000D29 7F 00            [12]  435 	mov	r7,#0x00
      000D2B                        436 00114$:
      000D2B C3               [12]  437 	clr	c
      000D2C EF               [12]  438 	mov	a,r7
      000D2D 9D               [12]  439 	subb	a,r5
      000D2E 50 0D            [24]  440 	jnc	00104$
                                    441 ;	control.c:71: EP0.fifo = configDescriptor[i];
      000D30 EF               [12]  442 	mov	a,r7
      000D31 90 31 A2         [24]  443 	mov	dptr,#_configDescriptor
      000D34 93               [24]  444 	movc	a,@a+dptr
      000D35 FC               [12]  445 	mov	r4,a
      000D36 90 F1 DC         [24]  446 	mov	dptr,#(_EP0 + 0x001c)
      000D39 F0               [24]  447 	movx	@dptr,a
                                    448 ;	control.c:69: for (i = 0; i < total; i++)
      000D3A 0F               [12]  449 	inc	r7
      000D3B 80 EE            [24]  450 	sjmp	00114$
      000D3D                        451 00104$:
                                    452 ;	control.c:74: SendControlResponse(total);
      000D3D 7F 00            [12]  453 	mov	r7,#0x00
      000D3F 8D 82            [24]  454 	mov	dpl,r5
      000D41 8F 83            [24]  455 	mov	dph,r7
      000D43 12 05 04         [24]  456 	lcall	_SendControlResponse
                                    457 ;	control.c:75: ret = TRUE;
      000D46 7E 01            [12]  458 	mov	r6,#0x01
                                    459 ;	control.c:77: break;
                                    460 ;	control.c:81: for (i = 0; i < sizeof(deviceQualifierDescriptor); i++)
      000D48 80 60            [24]  461 	sjmp	00110$
      000D4A                        462 00140$:
      000D4A 7F 00            [12]  463 	mov	r7,#0x00
      000D4C                        464 00116$:
                                    465 ;	control.c:83: EP0.fifo = deviceQualifierDescriptor[i];
      000D4C EF               [12]  466 	mov	a,r7
      000D4D 90 32 28         [24]  467 	mov	dptr,#_deviceQualifierDescriptor
      000D50 93               [24]  468 	movc	a,@a+dptr
      000D51 FD               [12]  469 	mov	r5,a
      000D52 90 F1 DC         [24]  470 	mov	dptr,#(_EP0 + 0x001c)
      000D55 F0               [24]  471 	movx	@dptr,a
                                    472 ;	control.c:81: for (i = 0; i < sizeof(deviceQualifierDescriptor); i++)
      000D56 0F               [12]  473 	inc	r7
      000D57 BF 0A 00         [24]  474 	cjne	r7,#0x0a,00207$
      000D5A                        475 00207$:
                                    476 ;	control.c:86: SendControlResponse(wLength < sizeof(deviceQualifierDescriptor) ? wLength : sizeof(deviceQualifierDescriptor));
      000D5A 40 F0            [24]  477 	jc	00116$
      000D5C E5 20            [12]  478 	mov	a,_wLength
      000D5E 94 0A            [12]  479 	subb	a,#0x0a
      000D60 E5 21            [12]  480 	mov	a,(_wLength + 1)
      000D62 94 00            [12]  481 	subb	a,#0x00
      000D64 50 06            [24]  482 	jnc	00126$
      000D66 AD 20            [24]  483 	mov	r5,_wLength
      000D68 AF 21            [24]  484 	mov	r7,(_wLength + 1)
      000D6A 80 04            [24]  485 	sjmp	00127$
      000D6C                        486 00126$:
      000D6C 7D 0A            [12]  487 	mov	r5,#0x0a
      000D6E 7F 00            [12]  488 	mov	r7,#0x00
      000D70                        489 00127$:
      000D70 8D 82            [24]  490 	mov	dpl,r5
      000D72 8F 83            [24]  491 	mov	dph,r7
      000D74 12 05 04         [24]  492 	lcall	_SendControlResponse
                                    493 ;	control.c:87: ret = TRUE;
      000D77 7E 01            [12]  494 	mov	r6,#0x01
                                    495 ;	control.c:89: break;
                                    496 ;	control.c:93: for (i = 0; i < sizeof(HIDreportDescriptor); i++)
      000D79 80 2F            [24]  497 	sjmp	00110$
      000D7B                        498 00143$:
      000D7B 7F 00            [12]  499 	mov	r7,#0x00
      000D7D                        500 00118$:
                                    501 ;	control.c:95: EP0.fifo = HIDreportDescriptor[i];
      000D7D EF               [12]  502 	mov	a,r7
      000D7E 90 31 E9         [24]  503 	mov	dptr,#_HIDreportDescriptor
      000D81 93               [24]  504 	movc	a,@a+dptr
      000D82 FD               [12]  505 	mov	r5,a
      000D83 90 F1 DC         [24]  506 	mov	dptr,#(_EP0 + 0x001c)
      000D86 F0               [24]  507 	movx	@dptr,a
                                    508 ;	control.c:93: for (i = 0; i < sizeof(HIDreportDescriptor); i++)
      000D87 0F               [12]  509 	inc	r7
      000D88 BF 3F 00         [24]  510 	cjne	r7,#0x3f,00210$
      000D8B                        511 00210$:
                                    512 ;	control.c:98: SendControlResponse(wLength < sizeof(HIDreportDescriptor) ? wLength : sizeof(HIDreportDescriptor));
      000D8B 40 F0            [24]  513 	jc	00118$
      000D8D E5 20            [12]  514 	mov	a,_wLength
      000D8F 94 3F            [12]  515 	subb	a,#0x3f
      000D91 E5 21            [12]  516 	mov	a,(_wLength + 1)
      000D93 94 00            [12]  517 	subb	a,#0x00
      000D95 50 06            [24]  518 	jnc	00128$
      000D97 AD 20            [24]  519 	mov	r5,_wLength
      000D99 AF 21            [24]  520 	mov	r7,(_wLength + 1)
      000D9B 80 04            [24]  521 	sjmp	00129$
      000D9D                        522 00128$:
      000D9D 7D 3F            [12]  523 	mov	r5,#0x3f
      000D9F 7F 00            [12]  524 	mov	r7,#0x00
      000DA1                        525 00129$:
      000DA1 8D 82            [24]  526 	mov	dpl,r5
      000DA3 8F 83            [24]  527 	mov	dph,r7
      000DA5 12 05 04         [24]  528 	lcall	_SendControlResponse
                                    529 ;	control.c:99: ret = TRUE;
      000DA8 7E 01            [12]  530 	mov	r6,#0x01
                                    531 ;	control.c:107: }
      000DAA                        532 00110$:
                                    533 ;	control.c:109: return ret;
      000DAA 8E 82            [24]  534 	mov	dpl,r6
                                    535 ;	control.c:110: }
      000DAC 22               [24]  536 	ret
                                    537 ;------------------------------------------------------------
                                    538 ;Allocation info for local variables in function 'SetConfiguration'
                                    539 ;------------------------------------------------------------
                                    540 ;ret                       Allocated to registers r7 
                                    541 ;------------------------------------------------------------
                                    542 ;	control.c:112: static BYTE SetConfiguration()
                                    543 ;	-----------------------------------------
                                    544 ;	 function SetConfiguration
                                    545 ;	-----------------------------------------
      000DAD                        546 _SetConfiguration:
                                    547 ;	control.c:114: BYTE ret = FALSE;
      000DAD 7F 00            [12]  548 	mov	r7,#0x00
                                    549 ;	control.c:116: if (wValue <= 1)
      000DAF C3               [12]  550 	clr	c
      000DB0 74 01            [12]  551 	mov	a,#0x01
      000DB2 95 1C            [12]  552 	subb	a,_wValue
      000DB4 E4               [12]  553 	clr	a
      000DB5 95 1D            [12]  554 	subb	a,(_wValue + 1)
      000DB7 40 05            [24]  555 	jc	00102$
                                    556 ;	control.c:118: EP0ACK();
      000DB9 12 0C A9         [24]  557 	lcall	_EP0ACK
                                    558 ;	control.c:119: ret = TRUE;
      000DBC 7F 01            [12]  559 	mov	r7,#0x01
      000DBE                        560 00102$:
                                    561 ;	control.c:122: return ret;
      000DBE 8F 82            [24]  562 	mov	dpl,r7
                                    563 ;	control.c:123: }
      000DC0 22               [24]  564 	ret
                                    565 ;------------------------------------------------------------
                                    566 ;Allocation info for local variables in function 'HandleStandardRequest'
                                    567 ;------------------------------------------------------------
                                    568 ;	control.c:125: BYTE HandleStandardRequest()
                                    569 ;	-----------------------------------------
                                    570 ;	 function HandleStandardRequest
                                    571 ;	-----------------------------------------
      000DC1                        572 _HandleStandardRequest:
                                    573 ;	control.c:127: switch(bRequest)
      000DC1 74 05            [12]  574 	mov	a,#0x05
      000DC3 B5 1B 02         [24]  575 	cjne	a,_bRequest,00120$
      000DC6 80 0E            [24]  576 	sjmp	00101$
      000DC8                        577 00120$:
      000DC8 74 06            [12]  578 	mov	a,#0x06
      000DCA B5 1B 02         [24]  579 	cjne	a,_bRequest,00121$
      000DCD 80 0A            [24]  580 	sjmp	00102$
      000DCF                        581 00121$:
      000DCF 74 09            [12]  582 	mov	a,#0x09
                                    583 ;	control.c:129: case 0x05:
      000DD1 B5 1B 0B         [24]  584 	cjne	a,_bRequest,00104$
      000DD4 80 06            [24]  585 	sjmp	00103$
      000DD6                        586 00101$:
                                    587 ;	control.c:131: return SetAddress();
                                    588 ;	control.c:133: case 0x06:
      000DD6 02 0C B0         [24]  589 	ljmp	_SetAddress
      000DD9                        590 00102$:
                                    591 ;	control.c:135: return GetDescriptor();
                                    592 ;	control.c:137: case 0x09:
      000DD9 02 0C C5         [24]  593 	ljmp	_GetDescriptor
      000DDC                        594 00103$:
                                    595 ;	control.c:139: return SetConfiguration();
                                    596 ;	control.c:141: default:
      000DDC 02 0D AD         [24]  597 	ljmp	_SetConfiguration
      000DDF                        598 00104$:
                                    599 ;	control.c:143: return FALSE;
      000DDF 75 82 00         [24]  600 	mov	dpl,#0x00
                                    601 ;	control.c:145: }
                                    602 ;	control.c:146: }
      000DE2 22               [24]  603 	ret
                                    604 ;------------------------------------------------------------
                                    605 ;Allocation info for local variables in function 'GetMaxLUN'
                                    606 ;------------------------------------------------------------
                                    607 ;	control.c:148: static BYTE GetMaxLUN()
                                    608 ;	-----------------------------------------
                                    609 ;	 function GetMaxLUN
                                    610 ;	-----------------------------------------
      000DE3                        611 _GetMaxLUN:
                                    612 ;	control.c:150: EP0.fifo = 0x00;
      000DE3 90 F1 DC         [24]  613 	mov	dptr,#(_EP0 + 0x001c)
      000DE6 E4               [12]  614 	clr	a
      000DE7 F0               [24]  615 	movx	@dptr,a
                                    616 ;	control.c:151: SendControlResponse(wLength < 0x01 ? wLength : 0x01);
      000DE8 C3               [12]  617 	clr	c
      000DE9 E5 20            [12]  618 	mov	a,_wLength
      000DEB 94 01            [12]  619 	subb	a,#0x01
      000DED E5 21            [12]  620 	mov	a,(_wLength + 1)
      000DEF 94 00            [12]  621 	subb	a,#0x00
      000DF1 50 06            [24]  622 	jnc	00103$
      000DF3 AE 20            [24]  623 	mov	r6,_wLength
      000DF5 AF 21            [24]  624 	mov	r7,(_wLength + 1)
      000DF7 80 04            [24]  625 	sjmp	00104$
      000DF9                        626 00103$:
      000DF9 7E 01            [12]  627 	mov	r6,#0x01
      000DFB 7F 00            [12]  628 	mov	r7,#0x00
      000DFD                        629 00104$:
      000DFD 8E 82            [24]  630 	mov	dpl,r6
      000DFF 8F 83            [24]  631 	mov	dph,r7
      000E01 12 05 04         [24]  632 	lcall	_SendControlResponse
                                    633 ;	control.c:153: return TRUE;
      000E04 75 82 01         [24]  634 	mov	dpl,#0x01
                                    635 ;	control.c:154: }
      000E07 22               [24]  636 	ret
                                    637 ;------------------------------------------------------------
                                    638 ;Allocation info for local variables in function 'HandleClassRequest'
                                    639 ;------------------------------------------------------------
                                    640 ;	control.c:156: BYTE HandleClassRequest()
                                    641 ;	-----------------------------------------
                                    642 ;	 function HandleClassRequest
                                    643 ;	-----------------------------------------
      000E08                        644 _HandleClassRequest:
                                    645 ;	control.c:158: switch(bRequest)
      000E08 74 09            [12]  646 	mov	a,#0x09
      000E0A B5 1B 02         [24]  647 	cjne	a,_bRequest,00120$
      000E0D 80 0E            [24]  648 	sjmp	00101$
      000E0F                        649 00120$:
      000E0F 74 0A            [12]  650 	mov	a,#0x0a
      000E11 B5 1B 02         [24]  651 	cjne	a,_bRequest,00121$
      000E14 80 11            [24]  652 	sjmp	00102$
      000E16                        653 00121$:
      000E16 74 FE            [12]  654 	mov	a,#0xfe
                                    655 ;	control.c:160: case 0x09:
      000E18 B5 1B 16         [24]  656 	cjne	a,_bRequest,00104$
      000E1B 80 11            [24]  657 	sjmp	00103$
      000E1D                        658 00101$:
                                    659 ;	control.c:162: EP0CS = 0x05;
      000E1D 90 F0 48         [24]  660 	mov	dptr,#_EP0CS
      000E20 74 05            [12]  661 	mov	a,#0x05
      000E22 F0               [24]  662 	movx	@dptr,a
                                    663 ;	control.c:163: return TRUE;
      000E23 75 82 01         [24]  664 	mov	dpl,#0x01
                                    665 ;	control.c:165: case 0x0A:
      000E26 22               [24]  666 	ret
      000E27                        667 00102$:
                                    668 ;	control.c:167: EP0ACK();
      000E27 12 0C A9         [24]  669 	lcall	_EP0ACK
                                    670 ;	control.c:168: return TRUE;
      000E2A 75 82 01         [24]  671 	mov	dpl,#0x01
                                    672 ;	control.c:170: case 0xFE:
      000E2D 22               [24]  673 	ret
      000E2E                        674 00103$:
                                    675 ;	control.c:172: return GetMaxLUN();
                                    676 ;	control.c:174: default:
      000E2E 02 0D E3         [24]  677 	ljmp	_GetMaxLUN
      000E31                        678 00104$:
                                    679 ;	control.c:176: return FALSE;
      000E31 75 82 00         [24]  680 	mov	dpl,#0x00
                                    681 ;	control.c:178: }
                                    682 ;	control.c:179: }
      000E34 22               [24]  683 	ret
                                    684 ;------------------------------------------------------------
                                    685 ;Allocation info for local variables in function 'HandleVendorRequest'
                                    686 ;------------------------------------------------------------
                                    687 ;	control.c:181: BYTE HandleVendorRequest()
                                    688 ;	-----------------------------------------
                                    689 ;	 function HandleVendorRequest
                                    690 ;	-----------------------------------------
      000E35                        691 _HandleVendorRequest:
                                    692 ;	control.c:183: return FALSE;
      000E35 75 82 00         [24]  693 	mov	dpl,#0x00
                                    694 ;	control.c:184: }
      000E38 22               [24]  695 	ret
                                    696 	.area CSEG    (CODE)
                                    697 	.area CONST   (CODE)
      003190                        698 _deviceDescriptor:
      003190 12                     699 	.db #0x12	; 18
      003191 01                     700 	.db #0x01	; 1
      003192 00                     701 	.db #0x00	; 0
      003193 02                     702 	.db #0x02	; 2
      003194 00                     703 	.db #0x00	; 0
      003195 00                     704 	.db #0x00	; 0
      003196 00                     705 	.db #0x00	; 0
      003197 40                     706 	.db #0x40	; 64
      003198 FE                     707 	.db #0xfe	; 254
      003199 13                     708 	.db #0x13	; 19
      00319A 01                     709 	.db #0x01	; 1
      00319B 52                     710 	.db #0x52	; 82	'R'
      00319C 10                     711 	.db #0x10	; 16
      00319D 01                     712 	.db #0x01	; 1
      00319E 00                     713 	.db #0x00	; 0
      00319F 00                     714 	.db #0x00	; 0
      0031A0 00                     715 	.db #0x00	; 0
      0031A1 01                     716 	.db #0x01	; 1
      0031A2                        717 _configDescriptor:
      0031A2 09                     718 	.db #0x09	; 9
      0031A3 02                     719 	.db #0x02	; 2
      0031A4 47                     720 	.db #0x47	; 71	'G'
      0031A5 00                     721 	.db #0x00	; 0
      0031A6 02                     722 	.db #0x02	; 2
      0031A7 01                     723 	.db #0x01	; 1
      0031A8 00                     724 	.db #0x00	; 0
      0031A9 80                     725 	.db #0x80	; 128
      0031AA 4B                     726 	.db #0x4b	; 75	'K'
      0031AB 09                     727 	.db #0x09	; 9
      0031AC 04                     728 	.db #0x04	; 4
      0031AD 00                     729 	.db #0x00	; 0
      0031AE 00                     730 	.db #0x00	; 0
      0031AF 03                     731 	.db #0x03	; 3
      0031B0 08                     732 	.db #0x08	; 8
      0031B1 06                     733 	.db #0x06	; 6
      0031B2 50                     734 	.db #0x50	; 80	'P'
      0031B3 00                     735 	.db #0x00	; 0
      0031B4 07                     736 	.db #0x07	; 7
      0031B5 05                     737 	.db #0x05	; 5
      0031B6 81                     738 	.db #0x81	; 129
      0031B7 02                     739 	.db #0x02	; 2
      0031B8 40                     740 	.db #0x40	; 64
      0031B9 00                     741 	.db #0x00	; 0
      0031BA 00                     742 	.db #0x00	; 0
      0031BB 07                     743 	.db #0x07	; 7
      0031BC 05                     744 	.db #0x05	; 5
      0031BD 02                     745 	.db #0x02	; 2
      0031BE 02                     746 	.db #0x02	; 2
      0031BF 40                     747 	.db #0x40	; 64
      0031C0 00                     748 	.db #0x00	; 0
      0031C1 00                     749 	.db #0x00	; 0
      0031C2 07                     750 	.db #0x07	; 7
      0031C3 05                     751 	.db #0x05	; 5
      0031C4 83                     752 	.db #0x83	; 131
      0031C5 03                     753 	.db #0x03	; 3
      0031C6 08                     754 	.db #0x08	; 8
      0031C7 00                     755 	.db #0x00	; 0
      0031C8 00                     756 	.db #0x00	; 0
      0031C9 09                     757 	.db #0x09	; 9
      0031CA 04                     758 	.db #0x04	; 4
      0031CB 01                     759 	.db #0x01	; 1
      0031CC 00                     760 	.db #0x00	; 0
      0031CD 02                     761 	.db #0x02	; 2
      0031CE 03                     762 	.db #0x03	; 3
      0031CF 01                     763 	.db #0x01	; 1
      0031D0 01                     764 	.db #0x01	; 1
      0031D1 00                     765 	.db #0x00	; 0
      0031D2 09                     766 	.db #0x09	; 9
      0031D3 21                     767 	.db #0x21	; 33
      0031D4 01                     768 	.db #0x01	; 1
      0031D5 01                     769 	.db #0x01	; 1
      0031D6 00                     770 	.db #0x00	; 0
      0031D7 01                     771 	.db #0x01	; 1
      0031D8 22                     772 	.db #0x22	; 34
      0031D9 3F                     773 	.db #0x3f	; 63
      0031DA 00                     774 	.db #0x00	; 0
      0031DB 07                     775 	.db #0x07	; 7
      0031DC 05                     776 	.db #0x05	; 5
      0031DD 83                     777 	.db #0x83	; 131
      0031DE 03                     778 	.db #0x03	; 3
      0031DF 08                     779 	.db #0x08	; 8
      0031E0 00                     780 	.db #0x00	; 0
      0031E1 01                     781 	.db #0x01	; 1
      0031E2 07                     782 	.db #0x07	; 7
      0031E3 05                     783 	.db #0x05	; 5
      0031E4 04                     784 	.db #0x04	; 4
      0031E5 03                     785 	.db #0x03	; 3
      0031E6 08                     786 	.db #0x08	; 8
      0031E7 00                     787 	.db #0x00	; 0
      0031E8 01                     788 	.db #0x01	; 1
      0031E9                        789 _HIDreportDescriptor:
      0031E9 05                     790 	.db #0x05	; 5
      0031EA 01                     791 	.db #0x01	; 1
      0031EB 09                     792 	.db #0x09	; 9
      0031EC 06                     793 	.db #0x06	; 6
      0031ED A1                     794 	.db #0xa1	; 161
      0031EE 01                     795 	.db #0x01	; 1
      0031EF 05                     796 	.db #0x05	; 5
      0031F0 07                     797 	.db #0x07	; 7
      0031F1 19                     798 	.db #0x19	; 25
      0031F2 E0                     799 	.db #0xe0	; 224
      0031F3 29                     800 	.db #0x29	; 41
      0031F4 E7                     801 	.db #0xe7	; 231
      0031F5 15                     802 	.db #0x15	; 21
      0031F6 00                     803 	.db #0x00	; 0
      0031F7 25                     804 	.db #0x25	; 37
      0031F8 01                     805 	.db #0x01	; 1
      0031F9 75                     806 	.db #0x75	; 117	'u'
      0031FA 01                     807 	.db #0x01	; 1
      0031FB 95                     808 	.db #0x95	; 149
      0031FC 08                     809 	.db #0x08	; 8
      0031FD 81                     810 	.db #0x81	; 129
      0031FE 02                     811 	.db #0x02	; 2
      0031FF 95                     812 	.db #0x95	; 149
      003200 01                     813 	.db #0x01	; 1
      003201 75                     814 	.db #0x75	; 117	'u'
      003202 08                     815 	.db #0x08	; 8
      003203 81                     816 	.db #0x81	; 129
      003204 01                     817 	.db #0x01	; 1
      003205 95                     818 	.db #0x95	; 149
      003206 05                     819 	.db #0x05	; 5
      003207 75                     820 	.db #0x75	; 117	'u'
      003208 01                     821 	.db #0x01	; 1
      003209 05                     822 	.db #0x05	; 5
      00320A 08                     823 	.db #0x08	; 8
      00320B 19                     824 	.db #0x19	; 25
      00320C 01                     825 	.db #0x01	; 1
      00320D 29                     826 	.db #0x29	; 41
      00320E 05                     827 	.db #0x05	; 5
      00320F 91                     828 	.db #0x91	; 145
      003210 02                     829 	.db #0x02	; 2
      003211 95                     830 	.db #0x95	; 149
      003212 01                     831 	.db #0x01	; 1
      003213 75                     832 	.db #0x75	; 117	'u'
      003214 03                     833 	.db #0x03	; 3
      003215 91                     834 	.db #0x91	; 145
      003216 01                     835 	.db #0x01	; 1
      003217 95                     836 	.db #0x95	; 149
      003218 06                     837 	.db #0x06	; 6
      003219 75                     838 	.db #0x75	; 117	'u'
      00321A 08                     839 	.db #0x08	; 8
      00321B 15                     840 	.db #0x15	; 21
      00321C 00                     841 	.db #0x00	; 0
      00321D 25                     842 	.db #0x25	; 37
      00321E 65                     843 	.db #0x65	; 101	'e'
      00321F 05                     844 	.db #0x05	; 5
      003220 07                     845 	.db #0x07	; 7
      003221 19                     846 	.db #0x19	; 25
      003222 00                     847 	.db #0x00	; 0
      003223 29                     848 	.db #0x29	; 41
      003224 65                     849 	.db #0x65	; 101	'e'
      003225 81                     850 	.db #0x81	; 129
      003226 00                     851 	.db #0x00	; 0
      003227 C0                     852 	.db #0xc0	; 192
      003228                        853 _deviceQualifierDescriptor:
      003228 0A                     854 	.db #0x0a	; 10
      003229 06                     855 	.db #0x06	; 6
      00322A 00                     856 	.db #0x00	; 0
      00322B 02                     857 	.db #0x02	; 2
      00322C 00                     858 	.db #0x00	; 0
      00322D 00                     859 	.db #0x00	; 0
      00322E 00                     860 	.db #0x00	; 0
      00322F 40                     861 	.db #0x40	; 64
      003230 01                     862 	.db #0x01	; 1
      003231 00                     863 	.db #0x00	; 0
                                    864 	.area XINIT   (CODE)
                                    865 	.area CABS    (ABS,CODE)
