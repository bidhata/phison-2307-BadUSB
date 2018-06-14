                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.7.1 #10443 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module timers
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _tmr0isr
                                     12 	.globl _tmr1isr
                                     13 	.globl _RI
                                     14 	.globl _TI
                                     15 	.globl _RB8
                                     16 	.globl _TB8
                                     17 	.globl _REN
                                     18 	.globl _SM2
                                     19 	.globl _SM1
                                     20 	.globl _SM0
                                     21 	.globl _RXD
                                     22 	.globl _TXD
                                     23 	.globl _INT0
                                     24 	.globl _INT1
                                     25 	.globl _T0
                                     26 	.globl _T1
                                     27 	.globl _WR
                                     28 	.globl _RD
                                     29 	.globl _PX0
                                     30 	.globl _PT0
                                     31 	.globl _PX1
                                     32 	.globl _PT1
                                     33 	.globl _PS
                                     34 	.globl _EX0
                                     35 	.globl _ET0
                                     36 	.globl _EX1
                                     37 	.globl _ET1
                                     38 	.globl _ES
                                     39 	.globl _EA
                                     40 	.globl _IT0
                                     41 	.globl _IE0
                                     42 	.globl _IT1
                                     43 	.globl _IE1
                                     44 	.globl _TR0
                                     45 	.globl _TF0
                                     46 	.globl _TR1
                                     47 	.globl _TF1
                                     48 	.globl _P
                                     49 	.globl _OV
                                     50 	.globl _RS0
                                     51 	.globl _RS1
                                     52 	.globl _F0
                                     53 	.globl _AC
                                     54 	.globl _CY
                                     55 	.globl _SBUF
                                     56 	.globl _SCON
                                     57 	.globl _IP
                                     58 	.globl _IE
                                     59 	.globl _TH1
                                     60 	.globl _TH0
                                     61 	.globl _TL1
                                     62 	.globl _TL0
                                     63 	.globl _TMOD
                                     64 	.globl _TCON
                                     65 	.globl _PCON
                                     66 	.globl _DPH
                                     67 	.globl _DPL
                                     68 	.globl _SP
                                     69 	.globl _B
                                     70 	.globl _ACC
                                     71 	.globl _PSW
                                     72 	.globl _P3
                                     73 	.globl _P2
                                     74 	.globl _P1
                                     75 	.globl _P0
                                     76 	.globl _PRAMCTL
                                     77 	.globl _BANK2PAH
                                     78 	.globl _BANK2PAL
                                     79 	.globl _BANK2VA
                                     80 	.globl _BANK1PAH
                                     81 	.globl _BANK1PAL
                                     82 	.globl _BANK1VA
                                     83 	.globl _BANK0PAH
                                     84 	.globl _BANK0PAL
                                     85 	.globl _WARMSTATUS
                                     86 	.globl _GPIO0OUT
                                     87 	.globl _GPIO0DIR
                                     88 	.globl _DMACMD
                                     89 	.globl _DMAFILL3
                                     90 	.globl _DMAFILL2
                                     91 	.globl _DMAFILL1
                                     92 	.globl _DMAFILL0
                                     93 	.globl _DMASIZEH
                                     94 	.globl _DMASIZEM
                                     95 	.globl _DMASIZEL
                                     96 	.globl _DMADSTH
                                     97 	.globl _DMADSTM
                                     98 	.globl _DMADSTL
                                     99 	.globl _DMASRCH
                                    100 	.globl _DMASRCM
                                    101 	.globl _DMASRCL
                                    102 	.globl _NANDCSDIR
                                    103 	.globl _NANDCSOUT
                                    104 	.globl _EP4
                                    105 	.globl _EP3
                                    106 	.globl _EP2
                                    107 	.globl _EP1
                                    108 	.globl _EP0
                                    109 	.globl _SETUPDAT
                                    110 	.globl _EP0CS
                                    111 	.globl _EPIE
                                    112 	.globl _EPIRQ
                                    113 	.globl _USBIRQ
                                    114 	.globl _USBSTAT
                                    115 	.globl _USBCTL
                                    116 	.globl _REGBANK
                                    117 	.globl _InitTicks
                                    118 	.globl _GetTickCount
                                    119 	.globl _SetLEDThreshold
                                    120 	.globl _InitLED
                                    121 	.globl _LEDBlink
                                    122 	.globl _LEDOff
                                    123 ;--------------------------------------------------------
                                    124 ; special function registers
                                    125 ;--------------------------------------------------------
                                    126 	.area RSEG    (ABS,DATA)
      000000                        127 	.org 0x0000
                           000080   128 _P0	=	0x0080
                           000090   129 _P1	=	0x0090
                           0000A0   130 _P2	=	0x00a0
                           0000B0   131 _P3	=	0x00b0
                           0000D0   132 _PSW	=	0x00d0
                           0000E0   133 _ACC	=	0x00e0
                           0000F0   134 _B	=	0x00f0
                           000081   135 _SP	=	0x0081
                           000082   136 _DPL	=	0x0082
                           000083   137 _DPH	=	0x0083
                           000087   138 _PCON	=	0x0087
                           000088   139 _TCON	=	0x0088
                           000089   140 _TMOD	=	0x0089
                           00008A   141 _TL0	=	0x008a
                           00008B   142 _TL1	=	0x008b
                           00008C   143 _TH0	=	0x008c
                           00008D   144 _TH1	=	0x008d
                           0000A8   145 _IE	=	0x00a8
                           0000B8   146 _IP	=	0x00b8
                           000098   147 _SCON	=	0x0098
                           000099   148 _SBUF	=	0x0099
                                    149 ;--------------------------------------------------------
                                    150 ; special function bits
                                    151 ;--------------------------------------------------------
                                    152 	.area RSEG    (ABS,DATA)
      000000                        153 	.org 0x0000
                           0000D7   154 _CY	=	0x00d7
                           0000D6   155 _AC	=	0x00d6
                           0000D5   156 _F0	=	0x00d5
                           0000D4   157 _RS1	=	0x00d4
                           0000D3   158 _RS0	=	0x00d3
                           0000D2   159 _OV	=	0x00d2
                           0000D0   160 _P	=	0x00d0
                           00008F   161 _TF1	=	0x008f
                           00008E   162 _TR1	=	0x008e
                           00008D   163 _TF0	=	0x008d
                           00008C   164 _TR0	=	0x008c
                           00008B   165 _IE1	=	0x008b
                           00008A   166 _IT1	=	0x008a
                           000089   167 _IE0	=	0x0089
                           000088   168 _IT0	=	0x0088
                           0000AF   169 _EA	=	0x00af
                           0000AC   170 _ES	=	0x00ac
                           0000AB   171 _ET1	=	0x00ab
                           0000AA   172 _EX1	=	0x00aa
                           0000A9   173 _ET0	=	0x00a9
                           0000A8   174 _EX0	=	0x00a8
                           0000BC   175 _PS	=	0x00bc
                           0000BB   176 _PT1	=	0x00bb
                           0000BA   177 _PX1	=	0x00ba
                           0000B9   178 _PT0	=	0x00b9
                           0000B8   179 _PX0	=	0x00b8
                           0000B7   180 _RD	=	0x00b7
                           0000B6   181 _WR	=	0x00b6
                           0000B5   182 _T1	=	0x00b5
                           0000B4   183 _T0	=	0x00b4
                           0000B3   184 _INT1	=	0x00b3
                           0000B2   185 _INT0	=	0x00b2
                           0000B1   186 _TXD	=	0x00b1
                           0000B0   187 _RXD	=	0x00b0
                           00009F   188 _SM0	=	0x009f
                           00009E   189 _SM1	=	0x009e
                           00009D   190 _SM2	=	0x009d
                           00009C   191 _REN	=	0x009c
                           00009B   192 _TB8	=	0x009b
                           00009A   193 _RB8	=	0x009a
                           000099   194 _TI	=	0x0099
                           000098   195 _RI	=	0x0098
                                    196 ;--------------------------------------------------------
                                    197 ; overlayable register banks
                                    198 ;--------------------------------------------------------
                                    199 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        200 	.ds 8
                                    201 ;--------------------------------------------------------
                                    202 ; internal ram data
                                    203 ;--------------------------------------------------------
                                    204 	.area DSEG    (DATA)
      000013                        205 _tmr0count:
      000013                        206 	.ds 1
      000014                        207 _led_ticks:
      000014                        208 	.ds 1
      000015                        209 _led_timer:
      000015                        210 	.ds 1
      000016                        211 _led_tick_threshold:
      000016                        212 	.ds 1
      000017                        213 _tmr1count:
      000017                        214 	.ds 1
      000018                        215 _tmr1reload:
      000018                        216 	.ds 2
                                    217 ;--------------------------------------------------------
                                    218 ; overlayable items in internal ram 
                                    219 ;--------------------------------------------------------
                                    220 	.area	OSEG    (OVR,DATA)
                                    221 ;--------------------------------------------------------
                                    222 ; indirectly addressable internal ram data
                                    223 ;--------------------------------------------------------
                                    224 	.area ISEG    (DATA)
                                    225 ;--------------------------------------------------------
                                    226 ; absolute internal ram data
                                    227 ;--------------------------------------------------------
                                    228 	.area IABS    (ABS,DATA)
                                    229 	.area IABS    (ABS,DATA)
                                    230 ;--------------------------------------------------------
                                    231 ; bit data
                                    232 ;--------------------------------------------------------
                                    233 	.area BSEG    (BIT)
                                    234 ;--------------------------------------------------------
                                    235 ; paged external ram data
                                    236 ;--------------------------------------------------------
                                    237 	.area PSEG    (PAG,XDATA)
                                    238 ;--------------------------------------------------------
                                    239 ; external ram data
                                    240 ;--------------------------------------------------------
                                    241 	.area XSEG    (XDATA)
                           00F000   242 _REGBANK	=	0xf000
                           00F008   243 _USBCTL	=	0xf008
                           00F009   244 _USBSTAT	=	0xf009
                           00F027   245 _USBIRQ	=	0xf027
                           00F020   246 _EPIRQ	=	0xf020
                           00F030   247 _EPIE	=	0xf030
                           00F048   248 _EP0CS	=	0xf048
                           00F0B8   249 _SETUPDAT	=	0xf0b8
                           00F1C0   250 _EP0	=	0xf1c0
                           00F200   251 _EP1	=	0xf200
                           00F240   252 _EP2	=	0xf240
                           00F280   253 _EP3	=	0xf280
                           00F2C0   254 _EP4	=	0xf2c0
                           00F608   255 _NANDCSOUT	=	0xf608
                           00F618   256 _NANDCSDIR	=	0xf618
                           00F900   257 _DMASRCL	=	0xf900
                           00F901   258 _DMASRCM	=	0xf901
                           00F902   259 _DMASRCH	=	0xf902
                           00F904   260 _DMADSTL	=	0xf904
                           00F905   261 _DMADSTM	=	0xf905
                           00F906   262 _DMADSTH	=	0xf906
                           00F908   263 _DMASIZEL	=	0xf908
                           00F909   264 _DMASIZEM	=	0xf909
                           00F90A   265 _DMASIZEH	=	0xf90a
                           00F90C   266 _DMAFILL0	=	0xf90c
                           00F90D   267 _DMAFILL1	=	0xf90d
                           00F90E   268 _DMAFILL2	=	0xf90e
                           00F90F   269 _DMAFILL3	=	0xf90f
                           00F930   270 _DMACMD	=	0xf930
                           00FA14   271 _GPIO0DIR	=	0xfa14
                           00FA15   272 _GPIO0OUT	=	0xfa15
                           00FA38   273 _WARMSTATUS	=	0xfa38
                           00FA40   274 _BANK0PAL	=	0xfa40
                           00FA41   275 _BANK0PAH	=	0xfa41
                           00FA42   276 _BANK1VA	=	0xfa42
                           00FA43   277 _BANK1PAL	=	0xfa43
                           00FA44   278 _BANK1PAH	=	0xfa44
                           00FA45   279 _BANK2VA	=	0xfa45
                           00FA46   280 _BANK2PAL	=	0xfa46
                           00FA47   281 _BANK2PAH	=	0xfa47
                           00FA48   282 _PRAMCTL	=	0xfa48
                                    283 ;--------------------------------------------------------
                                    284 ; absolute external ram data
                                    285 ;--------------------------------------------------------
                                    286 	.area XABS    (ABS,XDATA)
                                    287 ;--------------------------------------------------------
                                    288 ; external initialized ram data
                                    289 ;--------------------------------------------------------
                                    290 	.area XISEG   (XDATA)
                                    291 	.area HOME    (CODE)
                                    292 	.area GSINIT0 (CODE)
                                    293 	.area GSINIT1 (CODE)
                                    294 	.area GSINIT2 (CODE)
                                    295 	.area GSINIT3 (CODE)
                                    296 	.area GSINIT4 (CODE)
                                    297 	.area GSINIT5 (CODE)
                                    298 	.area GSINIT  (CODE)
                                    299 	.area GSFINAL (CODE)
                                    300 	.area CSEG    (CODE)
                                    301 ;--------------------------------------------------------
                                    302 ; global & static initialisations
                                    303 ;--------------------------------------------------------
                                    304 	.area HOME    (CODE)
                                    305 	.area GSINIT  (CODE)
                                    306 	.area GSFINAL (CODE)
                                    307 	.area GSINIT  (CODE)
                                    308 ;--------------------------------------------------------
                                    309 ; Home
                                    310 ;--------------------------------------------------------
                                    311 	.area HOME    (CODE)
                                    312 	.area HOME    (CODE)
                                    313 ;--------------------------------------------------------
                                    314 ; code
                                    315 ;--------------------------------------------------------
                                    316 	.area CSEG    (CODE)
                                    317 ;------------------------------------------------------------
                                    318 ;Allocation info for local variables in function 'tmr1isr'
                                    319 ;------------------------------------------------------------
                                    320 ;	timers.c:8: void tmr1isr(void) __interrupt TMR1_VECT
                                    321 ;	-----------------------------------------
                                    322 ;	 function tmr1isr
                                    323 ;	-----------------------------------------
      0003B9                        324 _tmr1isr:
                           000007   325 	ar7 = 0x07
                           000006   326 	ar6 = 0x06
                           000005   327 	ar5 = 0x05
                           000004   328 	ar4 = 0x04
                           000003   329 	ar3 = 0x03
                           000002   330 	ar2 = 0x02
                           000001   331 	ar1 = 0x01
                           000000   332 	ar0 = 0x00
                                    333 ;	timers.c:10: TR1 = 0;
                                    334 ;	assignBit
      0003B9 C2 8E            [12]  335 	clr	_TR1
                                    336 ;	timers.c:11: TH1 = MSB(tmr1reload);
      0003BB 85 19 8D         [24]  337 	mov	_TH1,(_tmr1reload + 1)
                                    338 ;	timers.c:12: TL1 = LSB(tmr1reload);
      0003BE 85 18 8B         [24]  339 	mov	_TL1,_tmr1reload
                                    340 ;	timers.c:13: tmr1count++;
      0003C1 05 17            [12]  341 	inc	_tmr1count
                                    342 ;	timers.c:14: TR1 = 1;
                                    343 ;	assignBit
      0003C3 D2 8E            [12]  344 	setb	_TR1
                                    345 ;	timers.c:15: }
      0003C5 32               [24]  346 	reti
                                    347 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    348 ;	eliminated unneeded push/pop psw
                                    349 ;	eliminated unneeded push/pop dpl
                                    350 ;	eliminated unneeded push/pop dph
                                    351 ;	eliminated unneeded push/pop b
                                    352 ;	eliminated unneeded push/pop acc
                                    353 ;------------------------------------------------------------
                                    354 ;Allocation info for local variables in function 'InitTicks'
                                    355 ;------------------------------------------------------------
                                    356 ;	timers.c:17: void InitTicks()
                                    357 ;	-----------------------------------------
                                    358 ;	 function InitTicks
                                    359 ;	-----------------------------------------
      0003C6                        360 _InitTicks:
                                    361 ;	timers.c:19: if (XVAL(0xFA60) == 0x0F)
      0003C6 90 FA 60         [24]  362 	mov	dptr,#0xfa60
      0003C9 E0               [24]  363 	movx	a,@dptr
      0003CA FF               [12]  364 	mov	r7,a
      0003CB BF 0F 08         [24]  365 	cjne	r7,#0x0f,00102$
                                    366 ;	timers.c:21: tmr1reload = 0xF63C;
      0003CE 75 18 3C         [24]  367 	mov	_tmr1reload,#0x3c
      0003D1 75 19 F6         [24]  368 	mov	(_tmr1reload + 1),#0xf6
      0003D4 80 23            [24]  369 	sjmp	00103$
      0003D6                        370 00102$:
                                    371 ;	timers.c:25: tmr1reload = 0-(2500/(XVAL(0xFA60)+2));
      0003D6 90 FA 60         [24]  372 	mov	dptr,#0xfa60
      0003D9 E0               [24]  373 	movx	a,@dptr
      0003DA FF               [12]  374 	mov	r7,a
      0003DB 7E 00            [12]  375 	mov	r6,#0x00
      0003DD 74 02            [12]  376 	mov	a,#0x02
      0003DF 2F               [12]  377 	add	a,r7
      0003E0 F5 45            [12]  378 	mov	__divsint_PARM_2,a
      0003E2 E4               [12]  379 	clr	a
      0003E3 3E               [12]  380 	addc	a,r6
      0003E4 F5 46            [12]  381 	mov	(__divsint_PARM_2 + 1),a
      0003E6 90 09 C4         [24]  382 	mov	dptr,#0x09c4
      0003E9 12 11 54         [24]  383 	lcall	__divsint
      0003EC AE 82            [24]  384 	mov	r6,dpl
      0003EE AF 83            [24]  385 	mov	r7,dph
      0003F0 C3               [12]  386 	clr	c
      0003F1 E4               [12]  387 	clr	a
      0003F2 9E               [12]  388 	subb	a,r6
      0003F3 F5 18            [12]  389 	mov	_tmr1reload,a
      0003F5 E4               [12]  390 	clr	a
      0003F6 9F               [12]  391 	subb	a,r7
      0003F7 F5 19            [12]  392 	mov	(_tmr1reload + 1),a
      0003F9                        393 00103$:
                                    394 ;	timers.c:28: tmr1count = 0;
      0003F9 75 17 00         [24]  395 	mov	_tmr1count,#0x00
                                    396 ;	timers.c:29: TR1 = 0;
                                    397 ;	assignBit
      0003FC C2 8E            [12]  398 	clr	_TR1
                                    399 ;	timers.c:30: ET1 = 1;
                                    400 ;	assignBit
      0003FE D2 AB            [12]  401 	setb	_ET1
                                    402 ;	timers.c:31: TMOD = TMOD & 0x0F | 0x10;
      000400 AE 89            [24]  403 	mov	r6,_TMOD
      000402 53 06 0F         [24]  404 	anl	ar6,#0x0f
      000405 43 06 10         [24]  405 	orl	ar6,#0x10
      000408 8E 89            [24]  406 	mov	_TMOD,r6
                                    407 ;	timers.c:32: }
      00040A 22               [24]  408 	ret
                                    409 ;------------------------------------------------------------
                                    410 ;Allocation info for local variables in function 'GetTickCount'
                                    411 ;------------------------------------------------------------
                                    412 ;	timers.c:34: BYTE GetTickCount(void)
                                    413 ;	-----------------------------------------
                                    414 ;	 function GetTickCount
                                    415 ;	-----------------------------------------
      00040B                        416 _GetTickCount:
                                    417 ;	timers.c:36: return tmr1count;
      00040B 85 17 82         [24]  418 	mov	dpl,_tmr1count
                                    419 ;	timers.c:37: }
      00040E 22               [24]  420 	ret
                                    421 ;------------------------------------------------------------
                                    422 ;Allocation info for local variables in function 'tmr0isr'
                                    423 ;------------------------------------------------------------
                                    424 ;	timers.c:39: void tmr0isr(void) __interrupt TMR0_VECT
                                    425 ;	-----------------------------------------
                                    426 ;	 function tmr0isr
                                    427 ;	-----------------------------------------
      00040F                        428 _tmr0isr:
      00040F C0 E0            [24]  429 	push	acc
      000411 C0 82            [24]  430 	push	dpl
      000413 C0 83            [24]  431 	push	dph
      000415 C0 07            [24]  432 	push	ar7
      000417 C0 06            [24]  433 	push	ar6
      000419 C0 D0            [24]  434 	push	psw
      00041B 75 D0 00         [24]  435 	mov	psw,#0x00
                                    436 ;	timers.c:42: TR0 = 0;
                                    437 ;	assignBit
      00041E C2 8C            [12]  438 	clr	_TR0
                                    439 ;	timers.c:43: TL0 = 0xE6;
      000420 75 8A E6         [24]  440 	mov	_TL0,#0xe6
                                    441 ;	timers.c:44: TH0 = 0x96;
      000423 75 8C 96         [24]  442 	mov	_TH0,#0x96
                                    443 ;	timers.c:45: TR0 = 1;
                                    444 ;	assignBit
      000426 D2 8C            [12]  445 	setb	_TR0
                                    446 ;	timers.c:47: if ((GPIO0OUT & 2) == 0) //turned off
      000428 90 FA 15         [24]  447 	mov	dptr,#_GPIO0OUT
      00042B E0               [24]  448 	movx	a,@dptr
      00042C 20 E1 02         [24]  449 	jb	acc.1,00102$
                                    450 ;	timers.c:49: return;
      00042F 80 58            [24]  451 	sjmp	00114$
      000431                        452 00102$:
                                    453 ;	timers.c:52: tmr0count++;
      000431 05 13            [12]  454 	inc	_tmr0count
                                    455 ;	timers.c:53: led_ticks++;
      000433 05 14            [12]  456 	inc	_led_ticks
                                    457 ;	timers.c:54: if (led_ticks < led_tick_threshold)
      000435 C3               [12]  458 	clr	c
      000436 E5 14            [12]  459 	mov	a,_led_ticks
      000438 95 16            [12]  460 	subb	a,_led_tick_threshold
      00043A 50 02            [24]  461 	jnc	00104$
                                    462 ;	timers.c:56: return;
      00043C 80 4B            [24]  463 	sjmp	00114$
      00043E                        464 00104$:
                                    465 ;	timers.c:59: led_ticks = 0;
      00043E 75 14 00         [24]  466 	mov	_led_ticks,#0x00
                                    467 ;	timers.c:60: if (led_timer >= 31)
      000441 74 E1            [12]  468 	mov	a,#0x100 - 0x1f
      000443 25 15            [12]  469 	add	a,_led_timer
      000445 50 0B            [24]  470 	jnc	00106$
                                    471 ;	timers.c:62: GPIO0OUT = 1;
      000447 90 FA 15         [24]  472 	mov	dptr,#_GPIO0OUT
      00044A 74 01            [12]  473 	mov	a,#0x01
      00044C F0               [24]  474 	movx	@dptr,a
                                    475 ;	timers.c:63: led_timer = 0;		
      00044D 75 15 00         [24]  476 	mov	_led_timer,#0x00
                                    477 ;	timers.c:64: return;
      000450 80 37            [24]  478 	sjmp	00114$
      000452                        479 00106$:
                                    480 ;	timers.c:67: if (led_timer >= 10)
      000452 74 F6            [12]  481 	mov	a,#0x100 - 0x0a
      000454 25 15            [12]  482 	add	a,_led_timer
      000456 50 0B            [24]  483 	jnc	00108$
                                    484 ;	timers.c:69: GPIO0OUT = ~GPIO0OUT;
      000458 90 FA 15         [24]  485 	mov	dptr,#_GPIO0OUT
      00045B E0               [24]  486 	movx	a,@dptr
      00045C FF               [12]  487 	mov	r7,a
      00045D F4               [12]  488 	cpl	a
      00045E F0               [24]  489 	movx	@dptr,a
                                    490 ;	timers.c:70: led_timer++;
      00045F 05 15            [12]  491 	inc	_led_timer
                                    492 ;	timers.c:71: return;
      000461 80 26            [24]  493 	sjmp	00114$
      000463                        494 00108$:
                                    495 ;	timers.c:74: if (led_timer == 0)
      000463 E5 15            [12]  496 	mov	a,_led_timer
      000465 70 02            [24]  497 	jnz	00110$
                                    498 ;	timers.c:76: return;
      000467 80 20            [24]  499 	sjmp	00114$
      000469                        500 00110$:
                                    501 ;	timers.c:79: if (GPIO0OUT & 1)
      000469 90 FA 15         [24]  502 	mov	dptr,#_GPIO0OUT
      00046C E0               [24]  503 	movx	a,@dptr
      00046D 30 E0 0A         [24]  504 	jnb	acc.0,00112$
                                    505 ;	timers.c:81: GPIO0OUT &= 0xFE;
      000470 90 FA 15         [24]  506 	mov	dptr,#_GPIO0OUT
      000473 E0               [24]  507 	movx	a,@dptr
      000474 53 E0 FE         [24]  508 	anl	acc,#0xfe
      000477 F0               [24]  509 	movx	@dptr,a
      000478 80 0F            [24]  510 	sjmp	00114$
      00047A                        511 00112$:
                                    512 ;	timers.c:85: GPIO0OUT |= 1;
      00047A 90 FA 15         [24]  513 	mov	dptr,#_GPIO0OUT
      00047D E0               [24]  514 	movx	a,@dptr
      00047E FF               [12]  515 	mov	r7,a
      00047F 7E 00            [12]  516 	mov	r6,#0x00
      000481 43 07 01         [24]  517 	orl	ar7,#0x01
      000484 90 FA 15         [24]  518 	mov	dptr,#_GPIO0OUT
      000487 EF               [12]  519 	mov	a,r7
      000488 F0               [24]  520 	movx	@dptr,a
      000489                        521 00114$:
                                    522 ;	timers.c:87: }
      000489 D0 D0            [24]  523 	pop	psw
      00048B D0 06            [24]  524 	pop	ar6
      00048D D0 07            [24]  525 	pop	ar7
      00048F D0 83            [24]  526 	pop	dph
      000491 D0 82            [24]  527 	pop	dpl
      000493 D0 E0            [24]  528 	pop	acc
      000495 32               [24]  529 	reti
                                    530 ;	eliminated unneeded push/pop b
                                    531 ;------------------------------------------------------------
                                    532 ;Allocation info for local variables in function 'SetLEDThreshold'
                                    533 ;------------------------------------------------------------
                                    534 ;threshold                 Allocated to registers r6 r7 
                                    535 ;------------------------------------------------------------
                                    536 ;	timers.c:89: void SetLEDThreshold(int threshold)
                                    537 ;	-----------------------------------------
                                    538 ;	 function SetLEDThreshold
                                    539 ;	-----------------------------------------
      000496                        540 _SetLEDThreshold:
      000496 AE 82            [24]  541 	mov	r6,dpl
                                    542 ;	timers.c:91: led_tick_threshold = threshold;
      000498 8E 16            [24]  543 	mov	_led_tick_threshold,r6
                                    544 ;	timers.c:92: }
      00049A 22               [24]  545 	ret
                                    546 ;------------------------------------------------------------
                                    547 ;Allocation info for local variables in function 'InitLED'
                                    548 ;------------------------------------------------------------
                                    549 ;	timers.c:94: void InitLED(void)
                                    550 ;	-----------------------------------------
                                    551 ;	 function InitLED
                                    552 ;	-----------------------------------------
      00049B                        553 _InitLED:
                                    554 ;	timers.c:96: led_tick_threshold = 100;
      00049B 75 16 64         [24]  555 	mov	_led_tick_threshold,#0x64
                                    556 ;	timers.c:97: tmr0count = 0;
      00049E 75 13 00         [24]  557 	mov	_tmr0count,#0x00
                                    558 ;	timers.c:98: GPIO0OUT = 3;
      0004A1 90 FA 15         [24]  559 	mov	dptr,#_GPIO0OUT
      0004A4 74 03            [12]  560 	mov	a,#0x03
      0004A6 F0               [24]  561 	movx	@dptr,a
                                    562 ;	timers.c:99: led_ticks = 0;
      0004A7 75 14 00         [24]  563 	mov	_led_ticks,#0x00
                                    564 ;	timers.c:100: led_timer = 0;
      0004AA 75 15 00         [24]  565 	mov	_led_timer,#0x00
                                    566 ;	timers.c:101: EA = 1;
                                    567 ;	assignBit
      0004AD D2 AF            [12]  568 	setb	_EA
                                    569 ;	timers.c:102: ET0 = 1;
                                    570 ;	assignBit
      0004AF D2 A9            [12]  571 	setb	_ET0
                                    572 ;	timers.c:103: TR0 = 1;
                                    573 ;	assignBit
      0004B1 D2 8C            [12]  574 	setb	_TR0
                                    575 ;	timers.c:104: }
      0004B3 22               [24]  576 	ret
                                    577 ;------------------------------------------------------------
                                    578 ;Allocation info for local variables in function 'LEDBlink'
                                    579 ;------------------------------------------------------------
                                    580 ;	timers.c:106: void LEDBlink(void)
                                    581 ;	-----------------------------------------
                                    582 ;	 function LEDBlink
                                    583 ;	-----------------------------------------
      0004B4                        584 _LEDBlink:
                                    585 ;	timers.c:108: GPIO0OUT = 2;
      0004B4 90 FA 15         [24]  586 	mov	dptr,#_GPIO0OUT
      0004B7 74 02            [12]  587 	mov	a,#0x02
      0004B9 F0               [24]  588 	movx	@dptr,a
                                    589 ;	timers.c:109: led_timer = 1;
      0004BA 75 15 01         [24]  590 	mov	_led_timer,#0x01
                                    591 ;	timers.c:110: }
      0004BD 22               [24]  592 	ret
                                    593 ;------------------------------------------------------------
                                    594 ;Allocation info for local variables in function 'LEDOff'
                                    595 ;------------------------------------------------------------
                                    596 ;	timers.c:112: void LEDOff(void)
                                    597 ;	-----------------------------------------
                                    598 ;	 function LEDOff
                                    599 ;	-----------------------------------------
      0004BE                        600 _LEDOff:
                                    601 ;	timers.c:114: GPIO0OUT = 3;
      0004BE 90 FA 15         [24]  602 	mov	dptr,#_GPIO0OUT
      0004C1 74 03            [12]  603 	mov	a,#0x03
      0004C3 F0               [24]  604 	movx	@dptr,a
                                    605 ;	timers.c:115: led_timer = 0;
      0004C4 75 15 00         [24]  606 	mov	_led_timer,#0x00
                                    607 ;	timers.c:116: }
      0004C7 22               [24]  608 	ret
                                    609 	.area CSEG    (CODE)
                                    610 	.area CONST   (CODE)
                                    611 	.area XINIT   (CODE)
                                    612 	.area CABS    (ABS,CODE)
