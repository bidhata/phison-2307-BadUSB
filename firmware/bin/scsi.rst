                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.7.1 #10443 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module scsi
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _HandleCDB
                                     12 	.globl _SendData1
                                     13 	.globl _memset
                                     14 	.globl _RI
                                     15 	.globl _TI
                                     16 	.globl _RB8
                                     17 	.globl _TB8
                                     18 	.globl _REN
                                     19 	.globl _SM2
                                     20 	.globl _SM1
                                     21 	.globl _SM0
                                     22 	.globl _RXD
                                     23 	.globl _TXD
                                     24 	.globl _INT0
                                     25 	.globl _INT1
                                     26 	.globl _T0
                                     27 	.globl _T1
                                     28 	.globl _WR
                                     29 	.globl _RD
                                     30 	.globl _PX0
                                     31 	.globl _PT0
                                     32 	.globl _PX1
                                     33 	.globl _PT1
                                     34 	.globl _PS
                                     35 	.globl _EX0
                                     36 	.globl _ET0
                                     37 	.globl _EX1
                                     38 	.globl _ET1
                                     39 	.globl _ES
                                     40 	.globl _EA
                                     41 	.globl _IT0
                                     42 	.globl _IE0
                                     43 	.globl _IT1
                                     44 	.globl _IE1
                                     45 	.globl _TR0
                                     46 	.globl _TF0
                                     47 	.globl _TR1
                                     48 	.globl _TF1
                                     49 	.globl _P
                                     50 	.globl _OV
                                     51 	.globl _RS0
                                     52 	.globl _RS1
                                     53 	.globl _F0
                                     54 	.globl _AC
                                     55 	.globl _CY
                                     56 	.globl _SBUF
                                     57 	.globl _SCON
                                     58 	.globl _IP
                                     59 	.globl _IE
                                     60 	.globl _TH1
                                     61 	.globl _TH0
                                     62 	.globl _TL1
                                     63 	.globl _TL0
                                     64 	.globl _TMOD
                                     65 	.globl _TCON
                                     66 	.globl _PCON
                                     67 	.globl _DPH
                                     68 	.globl _DPL
                                     69 	.globl _SP
                                     70 	.globl _B
                                     71 	.globl _ACC
                                     72 	.globl _PSW
                                     73 	.globl _P3
                                     74 	.globl _P2
                                     75 	.globl _P1
                                     76 	.globl _P0
                                     77 	.globl _PRAMCTL
                                     78 	.globl _BANK2PAH
                                     79 	.globl _BANK2PAL
                                     80 	.globl _BANK2VA
                                     81 	.globl _BANK1PAH
                                     82 	.globl _BANK1PAL
                                     83 	.globl _BANK1VA
                                     84 	.globl _BANK0PAH
                                     85 	.globl _BANK0PAL
                                     86 	.globl _WARMSTATUS
                                     87 	.globl _GPIO0OUT
                                     88 	.globl _GPIO0DIR
                                     89 	.globl _DMACMD
                                     90 	.globl _DMAFILL3
                                     91 	.globl _DMAFILL2
                                     92 	.globl _DMAFILL1
                                     93 	.globl _DMAFILL0
                                     94 	.globl _DMASIZEH
                                     95 	.globl _DMASIZEM
                                     96 	.globl _DMASIZEL
                                     97 	.globl _DMADSTH
                                     98 	.globl _DMADSTM
                                     99 	.globl _DMADSTL
                                    100 	.globl _DMASRCH
                                    101 	.globl _DMASRCM
                                    102 	.globl _DMASRCL
                                    103 	.globl _NANDCSDIR
                                    104 	.globl _NANDCSOUT
                                    105 	.globl _EP4
                                    106 	.globl _EP3
                                    107 	.globl _EP2
                                    108 	.globl _EP1
                                    109 	.globl _EP0
                                    110 	.globl _SETUPDAT
                                    111 	.globl _EP0CS
                                    112 	.globl _EPIE
                                    113 	.globl _EPIRQ
                                    114 	.globl _USBIRQ
                                    115 	.globl _USBSTAT
                                    116 	.globl _USBCTL
                                    117 	.globl _REGBANK
                                    118 	.globl _scsi_cdb_size
                                    119 	.globl _scsi_cdb
                                    120 	.globl _scsi_lun
                                    121 	.globl _scsi_dir_in
                                    122 	.globl _scsi_tag
                                    123 	.globl _scsi_transfer_size
                                    124 	.globl _scsi_data_residue
                                    125 	.globl _scsi_status
                                    126 ;--------------------------------------------------------
                                    127 ; special function registers
                                    128 ;--------------------------------------------------------
                                    129 	.area RSEG    (ABS,DATA)
      000000                        130 	.org 0x0000
                           000080   131 _P0	=	0x0080
                           000090   132 _P1	=	0x0090
                           0000A0   133 _P2	=	0x00a0
                           0000B0   134 _P3	=	0x00b0
                           0000D0   135 _PSW	=	0x00d0
                           0000E0   136 _ACC	=	0x00e0
                           0000F0   137 _B	=	0x00f0
                           000081   138 _SP	=	0x0081
                           000082   139 _DPL	=	0x0082
                           000083   140 _DPH	=	0x0083
                           000087   141 _PCON	=	0x0087
                           000088   142 _TCON	=	0x0088
                           000089   143 _TMOD	=	0x0089
                           00008A   144 _TL0	=	0x008a
                           00008B   145 _TL1	=	0x008b
                           00008C   146 _TH0	=	0x008c
                           00008D   147 _TH1	=	0x008d
                           0000A8   148 _IE	=	0x00a8
                           0000B8   149 _IP	=	0x00b8
                           000098   150 _SCON	=	0x0098
                           000099   151 _SBUF	=	0x0099
                                    152 ;--------------------------------------------------------
                                    153 ; special function bits
                                    154 ;--------------------------------------------------------
                                    155 	.area RSEG    (ABS,DATA)
      000000                        156 	.org 0x0000
                           0000D7   157 _CY	=	0x00d7
                           0000D6   158 _AC	=	0x00d6
                           0000D5   159 _F0	=	0x00d5
                           0000D4   160 _RS1	=	0x00d4
                           0000D3   161 _RS0	=	0x00d3
                           0000D2   162 _OV	=	0x00d2
                           0000D0   163 _P	=	0x00d0
                           00008F   164 _TF1	=	0x008f
                           00008E   165 _TR1	=	0x008e
                           00008D   166 _TF0	=	0x008d
                           00008C   167 _TR0	=	0x008c
                           00008B   168 _IE1	=	0x008b
                           00008A   169 _IT1	=	0x008a
                           000089   170 _IE0	=	0x0089
                           000088   171 _IT0	=	0x0088
                           0000AF   172 _EA	=	0x00af
                           0000AC   173 _ES	=	0x00ac
                           0000AB   174 _ET1	=	0x00ab
                           0000AA   175 _EX1	=	0x00aa
                           0000A9   176 _ET0	=	0x00a9
                           0000A8   177 _EX0	=	0x00a8
                           0000BC   178 _PS	=	0x00bc
                           0000BB   179 _PT1	=	0x00bb
                           0000BA   180 _PX1	=	0x00ba
                           0000B9   181 _PT0	=	0x00b9
                           0000B8   182 _PX0	=	0x00b8
                           0000B7   183 _RD	=	0x00b7
                           0000B6   184 _WR	=	0x00b6
                           0000B5   185 _T1	=	0x00b5
                           0000B4   186 _T0	=	0x00b4
                           0000B3   187 _INT1	=	0x00b3
                           0000B2   188 _INT0	=	0x00b2
                           0000B1   189 _TXD	=	0x00b1
                           0000B0   190 _RXD	=	0x00b0
                           00009F   191 _SM0	=	0x009f
                           00009E   192 _SM1	=	0x009e
                           00009D   193 _SM2	=	0x009d
                           00009C   194 _REN	=	0x009c
                           00009B   195 _TB8	=	0x009b
                           00009A   196 _RB8	=	0x009a
                           000099   197 _TI	=	0x0099
                           000098   198 _RI	=	0x0098
                                    199 ;--------------------------------------------------------
                                    200 ; overlayable register banks
                                    201 ;--------------------------------------------------------
                                    202 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        203 	.ds 8
                                    204 ;--------------------------------------------------------
                                    205 ; internal ram data
                                    206 ;--------------------------------------------------------
                                    207 	.area DSEG    (DATA)
      000025                        208 _scsi_status::
      000025                        209 	.ds 1
      000026                        210 _scsi_data_residue::
      000026                        211 	.ds 4
      00002A                        212 _scsi_transfer_size::
      00002A                        213 	.ds 4
      00002E                        214 _scsi_tag::
      00002E                        215 	.ds 4
      000032                        216 _scsi_dir_in::
      000032                        217 	.ds 1
      000033                        218 _scsi_lun::
      000033                        219 	.ds 1
      000034                        220 _scsi_cdb::
      000034                        221 	.ds 16
      000044                        222 _scsi_cdb_size::
      000044                        223 	.ds 1
                                    224 ;--------------------------------------------------------
                                    225 ; overlayable items in internal ram 
                                    226 ;--------------------------------------------------------
                                    227 ;--------------------------------------------------------
                                    228 ; indirectly addressable internal ram data
                                    229 ;--------------------------------------------------------
                                    230 	.area ISEG    (DATA)
                                    231 ;--------------------------------------------------------
                                    232 ; absolute internal ram data
                                    233 ;--------------------------------------------------------
                                    234 	.area IABS    (ABS,DATA)
                                    235 	.area IABS    (ABS,DATA)
                                    236 ;--------------------------------------------------------
                                    237 ; bit data
                                    238 ;--------------------------------------------------------
                                    239 	.area BSEG    (BIT)
                                    240 ;--------------------------------------------------------
                                    241 ; paged external ram data
                                    242 ;--------------------------------------------------------
                                    243 	.area PSEG    (PAG,XDATA)
                                    244 ;--------------------------------------------------------
                                    245 ; external ram data
                                    246 ;--------------------------------------------------------
                                    247 	.area XSEG    (XDATA)
                           00F000   248 _REGBANK	=	0xf000
                           00F008   249 _USBCTL	=	0xf008
                           00F009   250 _USBSTAT	=	0xf009
                           00F027   251 _USBIRQ	=	0xf027
                           00F020   252 _EPIRQ	=	0xf020
                           00F030   253 _EPIE	=	0xf030
                           00F048   254 _EP0CS	=	0xf048
                           00F0B8   255 _SETUPDAT	=	0xf0b8
                           00F1C0   256 _EP0	=	0xf1c0
                           00F200   257 _EP1	=	0xf200
                           00F240   258 _EP2	=	0xf240
                           00F280   259 _EP3	=	0xf280
                           00F2C0   260 _EP4	=	0xf2c0
                           00F608   261 _NANDCSOUT	=	0xf608
                           00F618   262 _NANDCSDIR	=	0xf618
                           00F900   263 _DMASRCL	=	0xf900
                           00F901   264 _DMASRCM	=	0xf901
                           00F902   265 _DMASRCH	=	0xf902
                           00F904   266 _DMADSTL	=	0xf904
                           00F905   267 _DMADSTM	=	0xf905
                           00F906   268 _DMADSTH	=	0xf906
                           00F908   269 _DMASIZEL	=	0xf908
                           00F909   270 _DMASIZEM	=	0xf909
                           00F90A   271 _DMASIZEH	=	0xf90a
                           00F90C   272 _DMAFILL0	=	0xf90c
                           00F90D   273 _DMAFILL1	=	0xf90d
                           00F90E   274 _DMAFILL2	=	0xf90e
                           00F90F   275 _DMAFILL3	=	0xf90f
                           00F930   276 _DMACMD	=	0xf930
                           00FA14   277 _GPIO0DIR	=	0xfa14
                           00FA15   278 _GPIO0OUT	=	0xfa15
                           00FA38   279 _WARMSTATUS	=	0xfa38
                           00FA40   280 _BANK0PAL	=	0xfa40
                           00FA41   281 _BANK0PAH	=	0xfa41
                           00FA42   282 _BANK1VA	=	0xfa42
                           00FA43   283 _BANK1PAL	=	0xfa43
                           00FA44   284 _BANK1PAH	=	0xfa44
                           00FA45   285 _BANK2VA	=	0xfa45
                           00FA46   286 _BANK2PAL	=	0xfa46
                           00FA47   287 _BANK2PAH	=	0xfa47
                           00FA48   288 _PRAMCTL	=	0xfa48
                                    289 ;--------------------------------------------------------
                                    290 ; absolute external ram data
                                    291 ;--------------------------------------------------------
                                    292 	.area XABS    (ABS,XDATA)
                                    293 ;--------------------------------------------------------
                                    294 ; external initialized ram data
                                    295 ;--------------------------------------------------------
                                    296 	.area XISEG   (XDATA)
                                    297 	.area HOME    (CODE)
                                    298 	.area GSINIT0 (CODE)
                                    299 	.area GSINIT1 (CODE)
                                    300 	.area GSINIT2 (CODE)
                                    301 	.area GSINIT3 (CODE)
                                    302 	.area GSINIT4 (CODE)
                                    303 	.area GSINIT5 (CODE)
                                    304 	.area GSINIT  (CODE)
                                    305 	.area GSFINAL (CODE)
                                    306 	.area CSEG    (CODE)
                                    307 ;--------------------------------------------------------
                                    308 ; global & static initialisations
                                    309 ;--------------------------------------------------------
                                    310 	.area HOME    (CODE)
                                    311 	.area GSINIT  (CODE)
                                    312 	.area GSFINAL (CODE)
                                    313 	.area GSINIT  (CODE)
                                    314 ;--------------------------------------------------------
                                    315 ; Home
                                    316 ;--------------------------------------------------------
                                    317 	.area HOME    (CODE)
                                    318 	.area HOME    (CODE)
                                    319 ;--------------------------------------------------------
                                    320 ; code
                                    321 ;--------------------------------------------------------
                                    322 	.area CSEG    (CODE)
                                    323 ;------------------------------------------------------------
                                    324 ;Allocation info for local variables in function 'HandleCDB'
                                    325 ;------------------------------------------------------------
                                    326 ;i                         Allocated to registers r6 r7 
                                    327 ;i                         Allocated with name '_HandleCDB_i_5_44'
                                    328 ;------------------------------------------------------------
                                    329 ;	scsi.c:29: BYTE HandleCDB()
                                    330 ;	-----------------------------------------
                                    331 ;	 function HandleCDB
                                    332 ;	-----------------------------------------
      000E39                        333 _HandleCDB:
                           000007   334 	ar7 = 0x07
                           000006   335 	ar6 = 0x06
                           000005   336 	ar5 = 0x05
                           000004   337 	ar4 = 0x04
                           000003   338 	ar3 = 0x03
                           000002   339 	ar2 = 0x02
                           000001   340 	ar1 = 0x01
                           000000   341 	ar0 = 0x00
                                    342 ;	scsi.c:32: scsi_status = 1;
      000E39 75 25 01         [24]  343 	mov	_scsi_status,#0x01
                                    344 ;	scsi.c:34: switch(scsi_cdb[0])
      000E3C AF 34            [24]  345 	mov	r7,_scsi_cdb
      000E3E BF 00 02         [24]  346 	cjne	r7,#0x00,00210$
      000E41 80 37            [24]  347 	sjmp	00102$
      000E43                        348 00210$:
      000E43 BF 03 03         [24]  349 	cjne	r7,#0x03,00211$
      000E46 02 0F 17         [24]  350 	ljmp	00106$
      000E49                        351 00211$:
      000E49 BF 06 03         [24]  352 	cjne	r7,#0x06,00212$
      000E4C 02 0F 51         [24]  353 	ljmp	00109$
      000E4F                        354 00212$:
      000E4F BF 12 02         [24]  355 	cjne	r7,#0x12,00213$
      000E52 80 2A            [24]  356 	sjmp	00103$
      000E54                        357 00213$:
      000E54 BF 1A 03         [24]  358 	cjne	r7,#0x1a,00214$
      000E57 02 0E E9         [24]  359 	ljmp	00105$
      000E5A                        360 00214$:
      000E5A BF 1E 02         [24]  361 	cjne	r7,#0x1e,00215$
      000E5D 80 14            [24]  362 	sjmp	00101$
      000E5F                        363 00215$:
      000E5F BF 23 02         [24]  364 	cjne	r7,#0x23,00216$
      000E62 80 4D            [24]  365 	sjmp	00104$
      000E64                        366 00216$:
      000E64 BF C6 03         [24]  367 	cjne	r7,#0xc6,00217$
      000E67 02 0F 51         [24]  368 	ljmp	00109$
      000E6A                        369 00217$:
      000E6A BF C7 03         [24]  370 	cjne	r7,#0xc7,00218$
      000E6D 02 0F 51         [24]  371 	ljmp	00109$
      000E70                        372 00218$:
      000E70 02 10 EC         [24]  373 	ljmp	00123$
                                    374 ;	scsi.c:36: case PREVENT_ALLOW_MEDIUM_REMOVAL:
      000E73                        375 00101$:
                                    376 ;	scsi.c:38: scsi_status = 0;
      000E73 75 25 00         [24]  377 	mov	_scsi_status,#0x00
                                    378 ;	scsi.c:39: return 1;
      000E76 75 82 01         [24]  379 	mov	dpl,#0x01
      000E79 22               [24]  380 	ret
                                    381 ;	scsi.c:41: case TEST_UNIT_READY:
      000E7A                        382 00102$:
                                    383 ;	scsi.c:43: return 1;
      000E7A 75 82 01         [24]  384 	mov	dpl,#0x01
      000E7D 22               [24]  385 	ret
                                    386 ;	scsi.c:45: case INQUIRY:
      000E7E                        387 00103$:
                                    388 ;	scsi.c:47: memset(usb_buffer, 0, 36);
      000E7E 75 45 00         [24]  389 	mov	_memset_PARM_2,#0x00
      000E81 75 46 24         [24]  390 	mov	_memset_PARM_3,#0x24
      000E84 75 47 00         [24]  391 	mov	(_memset_PARM_3 + 1),#0x00
      000E87 90 00 00         [24]  392 	mov	dptr,#_usb_buffer
      000E8A 75 F0 00         [24]  393 	mov	b,#0x00
      000E8D 12 10 F1         [24]  394 	lcall	_memset
                                    395 ;	scsi.c:48: usb_buffer[1] = 0x80; //removable media
      000E90 90 00 01         [24]  396 	mov	dptr,#(_usb_buffer + 0x0001)
      000E93 74 80            [12]  397 	mov	a,#0x80
      000E95 F0               [24]  398 	movx	@dptr,a
                                    399 ;	scsi.c:49: usb_buffer[3] = 0x01; //because the UFI spec says so
      000E96 90 00 03         [24]  400 	mov	dptr,#(_usb_buffer + 0x0003)
      000E99 23               [12]  401 	rl	a
      000E9A F0               [24]  402 	movx	@dptr,a
                                    403 ;	scsi.c:50: usb_buffer[4] = 0x1F; //additional length
      000E9B 90 00 04         [24]  404 	mov	dptr,#(_usb_buffer + 0x0004)
      000E9E 74 1F            [12]  405 	mov	a,#0x1f
      000EA0 F0               [24]  406 	movx	@dptr,a
                                    407 ;	scsi.c:51: SendData1(36, 0);
      000EA1 75 24 00         [24]  408 	mov	_SendData1_PARM_2,#0x00
      000EA4 90 00 24         [24]  409 	mov	dptr,#0x0024
      000EA7 12 05 8F         [24]  410 	lcall	_SendData1
                                    411 ;	scsi.c:52: scsi_status = 0;
      000EAA 75 25 00         [24]  412 	mov	_scsi_status,#0x00
                                    413 ;	scsi.c:53: return 1;
      000EAD 75 82 01         [24]  414 	mov	dpl,#0x01
      000EB0 22               [24]  415 	ret
                                    416 ;	scsi.c:55: case READ_FORMAT_CAPACITIES:
      000EB1                        417 00104$:
                                    418 ;	scsi.c:57: memset(usb_buffer, 0, 12);
      000EB1 75 45 00         [24]  419 	mov	_memset_PARM_2,#0x00
      000EB4 75 46 0C         [24]  420 	mov	_memset_PARM_3,#0x0c
      000EB7 75 47 00         [24]  421 	mov	(_memset_PARM_3 + 1),#0x00
      000EBA 90 00 00         [24]  422 	mov	dptr,#_usb_buffer
      000EBD 75 F0 00         [24]  423 	mov	b,#0x00
      000EC0 12 10 F1         [24]  424 	lcall	_memset
                                    425 ;	scsi.c:58: usb_buffer[3] = 0x08; //capacity list length
      000EC3 90 00 03         [24]  426 	mov	dptr,#(_usb_buffer + 0x0003)
      000EC6 74 08            [12]  427 	mov	a,#0x08
      000EC8 F0               [24]  428 	movx	@dptr,a
                                    429 ;	scsi.c:59: usb_buffer[6] = 0x10; //number of blocks (sectors) (dummy 2MB)
      000EC9 90 00 06         [24]  430 	mov	dptr,#(_usb_buffer + 0x0006)
      000ECC 23               [12]  431 	rl	a
      000ECD F0               [24]  432 	movx	@dptr,a
                                    433 ;	scsi.c:60: usb_buffer[8] = 0x03;
      000ECE 90 00 08         [24]  434 	mov	dptr,#(_usb_buffer + 0x0008)
      000ED1 74 03            [12]  435 	mov	a,#0x03
      000ED3 F0               [24]  436 	movx	@dptr,a
                                    437 ;	scsi.c:61: usb_buffer[10] = 0x02; //block length (512 bytes/sector)
      000ED4 90 00 0A         [24]  438 	mov	dptr,#(_usb_buffer + 0x000a)
      000ED7 14               [12]  439 	dec	a
      000ED8 F0               [24]  440 	movx	@dptr,a
                                    441 ;	scsi.c:62: SendData1(12, 0);
      000ED9 75 24 00         [24]  442 	mov	_SendData1_PARM_2,#0x00
      000EDC 90 00 0C         [24]  443 	mov	dptr,#0x000c
      000EDF 12 05 8F         [24]  444 	lcall	_SendData1
                                    445 ;	scsi.c:63: scsi_status = 0;
      000EE2 75 25 00         [24]  446 	mov	_scsi_status,#0x00
                                    447 ;	scsi.c:64: return 1;
      000EE5 75 82 01         [24]  448 	mov	dpl,#0x01
      000EE8 22               [24]  449 	ret
                                    450 ;	scsi.c:66: case MODE_SENSE:
      000EE9                        451 00105$:
                                    452 ;	scsi.c:68: memset(usb_buffer, 0, 8);
      000EE9 75 45 00         [24]  453 	mov	_memset_PARM_2,#0x00
      000EEC 75 46 08         [24]  454 	mov	_memset_PARM_3,#0x08
      000EEF 75 47 00         [24]  455 	mov	(_memset_PARM_3 + 1),#0x00
      000EF2 90 00 00         [24]  456 	mov	dptr,#_usb_buffer
      000EF5 75 F0 00         [24]  457 	mov	b,#0x00
      000EF8 12 10 F1         [24]  458 	lcall	_memset
                                    459 ;	scsi.c:69: usb_buffer[0] = 0x03;
      000EFB 90 00 00         [24]  460 	mov	dptr,#_usb_buffer
      000EFE 74 03            [12]  461 	mov	a,#0x03
      000F00 F0               [24]  462 	movx	@dptr,a
                                    463 ;	scsi.c:70: usb_buffer[2] = 0x80;
      000F01 90 00 02         [24]  464 	mov	dptr,#(_usb_buffer + 0x0002)
      000F04 74 80            [12]  465 	mov	a,#0x80
      000F06 F0               [24]  466 	movx	@dptr,a
                                    467 ;	scsi.c:71: SendData1(4, 0);
      000F07 75 24 00         [24]  468 	mov	_SendData1_PARM_2,#0x00
      000F0A 90 00 04         [24]  469 	mov	dptr,#0x0004
      000F0D 12 05 8F         [24]  470 	lcall	_SendData1
                                    471 ;	scsi.c:72: scsi_status = 0;
      000F10 75 25 00         [24]  472 	mov	_scsi_status,#0x00
                                    473 ;	scsi.c:73: return 1;
      000F13 75 82 01         [24]  474 	mov	dpl,#0x01
      000F16 22               [24]  475 	ret
                                    476 ;	scsi.c:75: case REQUEST_SENSE:
      000F17                        477 00106$:
                                    478 ;	scsi.c:77: memset(usb_buffer, 0, 18);
      000F17 75 45 00         [24]  479 	mov	_memset_PARM_2,#0x00
      000F1A 75 46 12         [24]  480 	mov	_memset_PARM_3,#0x12
      000F1D 75 47 00         [24]  481 	mov	(_memset_PARM_3 + 1),#0x00
      000F20 90 00 00         [24]  482 	mov	dptr,#_usb_buffer
      000F23 75 F0 00         [24]  483 	mov	b,#0x00
      000F26 12 10 F1         [24]  484 	lcall	_memset
                                    485 ;	scsi.c:78: usb_buffer[0] = 0x70;
      000F29 90 00 00         [24]  486 	mov	dptr,#_usb_buffer
      000F2C 74 70            [12]  487 	mov	a,#0x70
      000F2E F0               [24]  488 	movx	@dptr,a
                                    489 ;	scsi.c:79: usb_buffer[2] = 0x02;
      000F2F 90 00 02         [24]  490 	mov	dptr,#(_usb_buffer + 0x0002)
      000F32 74 02            [12]  491 	mov	a,#0x02
      000F34 F0               [24]  492 	movx	@dptr,a
                                    493 ;	scsi.c:80: usb_buffer[7] = 10;
      000F35 90 00 07         [24]  494 	mov	dptr,#(_usb_buffer + 0x0007)
      000F38 74 0A            [12]  495 	mov	a,#0x0a
      000F3A F0               [24]  496 	movx	@dptr,a
                                    497 ;	scsi.c:81: usb_buffer[12] = 0x3A;
      000F3B 90 00 0C         [24]  498 	mov	dptr,#(_usb_buffer + 0x000c)
      000F3E 74 3A            [12]  499 	mov	a,#0x3a
      000F40 F0               [24]  500 	movx	@dptr,a
                                    501 ;	scsi.c:82: SendData1(18, 0);
      000F41 75 24 00         [24]  502 	mov	_SendData1_PARM_2,#0x00
      000F44 90 00 12         [24]  503 	mov	dptr,#0x0012
      000F47 12 05 8F         [24]  504 	lcall	_SendData1
                                    505 ;	scsi.c:83: scsi_status = 0;
      000F4A 75 25 00         [24]  506 	mov	_scsi_status,#0x00
                                    507 ;	scsi.c:84: return 1;
      000F4D 75 82 01         [24]  508 	mov	dpl,#0x01
      000F50 22               [24]  509 	ret
                                    510 ;	scsi.c:89: case 0xC7:
      000F51                        511 00109$:
                                    512 ;	scsi.c:91: switch(scsi_cdb[1])
      000F51 AF 35            [24]  513 	mov	r7,(_scsi_cdb + 0x0001)
      000F53 BF 05 03         [24]  514 	cjne	r7,#0x05,00219$
      000F56 02 10 52         [24]  515 	ljmp	00119$
      000F59                        516 00219$:
      000F59 BF 06 02         [24]  517 	cjne	r7,#0x06,00220$
      000F5C 80 1E            [24]  518 	sjmp	00110$
      000F5E                        519 00220$:
      000F5E BF 07 02         [24]  520 	cjne	r7,#0x07,00221$
      000F61 80 3C            [24]  521 	sjmp	00111$
      000F63                        522 00221$:
      000F63 BF 08 02         [24]  523 	cjne	r7,#0x08,00222$
      000F66 80 58            [24]  524 	sjmp	00112$
      000F68                        525 00222$:
      000F68 BF 09 02         [24]  526 	cjne	r7,#0x09,00223$
      000F6B 80 68            [24]  527 	sjmp	00113$
      000F6D                        528 00223$:
      000F6D BF 56 03         [24]  529 	cjne	r7,#0x56,00224$
      000F70 02 0F E5         [24]  530 	ljmp	00114$
      000F73                        531 00224$:
      000F73 BF BF 03         [24]  532 	cjne	r7,#0xbf,00225$
      000F76 02 10 A9         [24]  533 	ljmp	00120$
      000F79                        534 00225$:
      000F79 02 10 E8         [24]  535 	ljmp	00121$
                                    536 ;	scsi.c:93: case CUSTOM_XPEEK:
      000F7C                        537 00110$:
                                    538 ;	scsi.c:95: usb_buffer[0] = XVAL((scsi_cdb[2] << 8) | scsi_cdb[3]);
      000F7C AF 36            [24]  539 	mov	r7,(_scsi_cdb + 0x0002)
      000F7E 7E 00            [12]  540 	mov	r6,#0x00
      000F80 AC 37            [24]  541 	mov	r4,(_scsi_cdb + 0x0003)
      000F82 7D 00            [12]  542 	mov	r5,#0x00
      000F84 EC               [12]  543 	mov	a,r4
      000F85 42 06            [12]  544 	orl	ar6,a
      000F87 ED               [12]  545 	mov	a,r5
      000F88 42 07            [12]  546 	orl	ar7,a
      000F8A 8E 82            [24]  547 	mov	dpl,r6
      000F8C 8F 83            [24]  548 	mov	dph,r7
      000F8E E0               [24]  549 	movx	a,@dptr
      000F8F 90 00 00         [24]  550 	mov	dptr,#_usb_buffer
      000F92 F0               [24]  551 	movx	@dptr,a
                                    552 ;	scsi.c:96: SendData1(1, 0);
      000F93 75 24 00         [24]  553 	mov	_SendData1_PARM_2,#0x00
      000F96 90 00 01         [24]  554 	mov	dptr,#0x0001
      000F99 12 05 8F         [24]  555 	lcall	_SendData1
                                    556 ;	scsi.c:97: break;
      000F9C 02 10 EC         [24]  557 	ljmp	00123$
                                    558 ;	scsi.c:99: case CUSTOM_XPOKE:
      000F9F                        559 00111$:
                                    560 ;	scsi.c:101: XVAL((scsi_cdb[2] << 8) | scsi_cdb[3]) = scsi_cdb[4];
      000F9F AF 36            [24]  561 	mov	r7,(_scsi_cdb + 0x0002)
      000FA1 7E 00            [12]  562 	mov	r6,#0x00
      000FA3 AC 37            [24]  563 	mov	r4,(_scsi_cdb + 0x0003)
      000FA5 7D 00            [12]  564 	mov	r5,#0x00
      000FA7 EC               [12]  565 	mov	a,r4
      000FA8 42 06            [12]  566 	orl	ar6,a
      000FAA ED               [12]  567 	mov	a,r5
      000FAB 42 07            [12]  568 	orl	ar7,a
      000FAD 8E 82            [24]  569 	mov	dpl,r6
      000FAF 8F 83            [24]  570 	mov	dph,r7
      000FB1 E5 38            [12]  571 	mov	a,(_scsi_cdb + 0x0004)
      000FB3 F0               [24]  572 	movx	@dptr,a
                                    573 ;	scsi.c:102: SendData1(1, 0);
      000FB4 75 24 00         [24]  574 	mov	_SendData1_PARM_2,#0x00
      000FB7 90 00 01         [24]  575 	mov	dptr,#0x0001
      000FBA 12 05 8F         [24]  576 	lcall	_SendData1
                                    577 ;	scsi.c:103: break;
      000FBD 02 10 EC         [24]  578 	ljmp	00123$
                                    579 ;	scsi.c:105: case CUSTOM_IPEEK:
      000FC0                        580 00112$:
                                    581 ;	scsi.c:107: usb_buffer[0] = IVAL(scsi_cdb[2]);
      000FC0 A9 36            [24]  582 	mov	r1,(_scsi_cdb + 0x0002)
      000FC2 87 07            [24]  583 	mov	ar7,@r1
      000FC4 90 00 00         [24]  584 	mov	dptr,#_usb_buffer
      000FC7 EF               [12]  585 	mov	a,r7
      000FC8 F0               [24]  586 	movx	@dptr,a
                                    587 ;	scsi.c:108: SendData1(1, 0);
      000FC9 75 24 00         [24]  588 	mov	_SendData1_PARM_2,#0x00
      000FCC 90 00 01         [24]  589 	mov	dptr,#0x0001
      000FCF 12 05 8F         [24]  590 	lcall	_SendData1
                                    591 ;	scsi.c:109: break;
      000FD2 02 10 EC         [24]  592 	ljmp	00123$
                                    593 ;	scsi.c:111: case CUSTOM_IPOKE:
      000FD5                        594 00113$:
                                    595 ;	scsi.c:113: IVAL(scsi_cdb[2]) = scsi_cdb[3];
      000FD5 A9 36            [24]  596 	mov	r1,(_scsi_cdb + 0x0002)
      000FD7 A7 37            [24]  597 	mov	@r1,(_scsi_cdb + 0x0003)
                                    598 ;	scsi.c:114: SendData1(1, 0);
      000FD9 75 24 00         [24]  599 	mov	_SendData1_PARM_2,#0x00
      000FDC 90 00 01         [24]  600 	mov	dptr,#0x0001
      000FDF 12 05 8F         [24]  601 	lcall	_SendData1
                                    602 ;	scsi.c:115: break;
      000FE2 02 10 EC         [24]  603 	ljmp	00123$
                                    604 ;	scsi.c:117: case VENDOR_CHIPID:
      000FE5                        605 00114$:
                                    606 ;	scsi.c:120: memset(usb_buffer, 0x00, 0x200);
      000FE5 75 45 00         [24]  607 	mov	_memset_PARM_2,#0x00
      000FE8 75 46 00         [24]  608 	mov	_memset_PARM_3,#0x00
      000FEB 75 47 02         [24]  609 	mov	(_memset_PARM_3 + 1),#0x02
      000FEE 90 00 00         [24]  610 	mov	dptr,#_usb_buffer
      000FF1 75 F0 00         [24]  611 	mov	b,#0x00
      000FF4 12 10 F1         [24]  612 	lcall	_memset
                                    613 ;	scsi.c:123: XVAL(0xF480) = 0x00;
      000FF7 90 F4 80         [24]  614 	mov	dptr,#0xf480
      000FFA E4               [12]  615 	clr	a
      000FFB F0               [24]  616 	movx	@dptr,a
                                    617 ;	scsi.c:124: XVAL(0xF618) = 0xFF;
      000FFC 90 F6 18         [24]  618 	mov	dptr,#0xf618
      000FFF 14               [12]  619 	dec	a
      001000 F0               [24]  620 	movx	@dptr,a
                                    621 ;	scsi.c:127: XVAL(0xF608) = 0xFE;
      001001 90 F6 08         [24]  622 	mov	dptr,#0xf608
      001004 14               [12]  623 	dec	a
      001005 F0               [24]  624 	movx	@dptr,a
                                    625 ;	scsi.c:130: XVAL(0xF400) = 0xFF;
      001006 90 F4 00         [24]  626 	mov	dptr,#0xf400
      001009 04               [12]  627 	inc	a
      00100A F0               [24]  628 	movx	@dptr,a
                                    629 ;	scsi.c:131: while (!(XVAL(0xF41E) & 0x01));
      00100B                        630 00115$:
      00100B 90 F4 1E         [24]  631 	mov	dptr,#0xf41e
      00100E E0               [24]  632 	movx	a,@dptr
      00100F FF               [12]  633 	mov	r7,a
      001010 30 E0 F8         [24]  634 	jnb	acc.0,00115$
                                    635 ;	scsi.c:134: XVAL(0xF400) = 0x90;
      001013 90 F4 00         [24]  636 	mov	dptr,#0xf400
      001016 74 90            [12]  637 	mov	a,#0x90
      001018 F0               [24]  638 	movx	@dptr,a
                                    639 ;	scsi.c:135: XVAL(0xF404) = 0x00;
      001019 90 F4 04         [24]  640 	mov	dptr,#0xf404
      00101C E4               [12]  641 	clr	a
      00101D F0               [24]  642 	movx	@dptr,a
                                    643 ;	scsi.c:136: for (i = 0; i < 6; i++)
      00101E 7E 00            [12]  644 	mov	r6,#0x00
      001020 7F 00            [12]  645 	mov	r7,#0x00
      001022                        646 00125$:
                                    647 ;	scsi.c:138: usb_buffer[i] = XVAL(0xF408);
      001022 8E 04            [24]  648 	mov	ar4,r6
      001024 74 00            [12]  649 	mov	a,#(_usb_buffer >> 8)
      001026 2F               [12]  650 	add	a,r7
      001027 FD               [12]  651 	mov	r5,a
      001028 90 F4 08         [24]  652 	mov	dptr,#0xf408
      00102B E0               [24]  653 	movx	a,@dptr
      00102C FB               [12]  654 	mov	r3,a
      00102D 8C 82            [24]  655 	mov	dpl,r4
      00102F 8D 83            [24]  656 	mov	dph,r5
      001031 F0               [24]  657 	movx	@dptr,a
                                    658 ;	scsi.c:136: for (i = 0; i < 6; i++)
      001032 0E               [12]  659 	inc	r6
      001033 BE 00 01         [24]  660 	cjne	r6,#0x00,00227$
      001036 0F               [12]  661 	inc	r7
      001037                        662 00227$:
      001037 C3               [12]  663 	clr	c
      001038 EE               [12]  664 	mov	a,r6
      001039 94 06            [12]  665 	subb	a,#0x06
      00103B EF               [12]  666 	mov	a,r7
      00103C 64 80            [12]  667 	xrl	a,#0x80
      00103E 94 80            [12]  668 	subb	a,#0x80
      001040 40 E0            [24]  669 	jc	00125$
                                    670 ;	scsi.c:141: SendData1(0x200, 0);
      001042 75 24 00         [24]  671 	mov	_SendData1_PARM_2,#0x00
      001045 90 02 00         [24]  672 	mov	dptr,#0x0200
      001048 12 05 8F         [24]  673 	lcall	_SendData1
                                    674 ;	scsi.c:142: scsi_status = 0;
      00104B 75 25 00         [24]  675 	mov	_scsi_status,#0x00
                                    676 ;	scsi.c:143: return 1;
      00104E 75 82 01         [24]  677 	mov	dpl,#0x01
      001051 22               [24]  678 	ret
                                    679 ;	scsi.c:145: case VENDOR_INFO: //get info
      001052                        680 00119$:
                                    681 ;	scsi.c:149: memset(usb_buffer, 0x00, 0x210);
      001052 75 45 00         [24]  682 	mov	_memset_PARM_2,#0x00
      001055 75 46 10         [24]  683 	mov	_memset_PARM_3,#0x10
      001058 75 47 02         [24]  684 	mov	(_memset_PARM_3 + 1),#0x02
      00105B 90 00 00         [24]  685 	mov	dptr,#_usb_buffer
      00105E 75 F0 00         [24]  686 	mov	b,#0x00
      001061 12 10 F1         [24]  687 	lcall	_memset
                                    688 ;	scsi.c:150: usb_buffer[0x094] = 0x00;
      001064 90 00 94         [24]  689 	mov	dptr,#(_usb_buffer + 0x0094)
      001067 E4               [12]  690 	clr	a
      001068 F0               [24]  691 	movx	@dptr,a
                                    692 ;	scsi.c:151: usb_buffer[0x095] = 0x99;
      001069 90 00 95         [24]  693 	mov	dptr,#(_usb_buffer + 0x0095)
      00106C 74 99            [12]  694 	mov	a,#0x99
      00106E F0               [24]  695 	movx	@dptr,a
                                    696 ;	scsi.c:152: usb_buffer[0x096] = 0x53;
      00106F 90 00 96         [24]  697 	mov	dptr,#(_usb_buffer + 0x0096)
      001072 74 53            [12]  698 	mov	a,#0x53
      001074 F0               [24]  699 	movx	@dptr,a
                                    700 ;	scsi.c:153: usb_buffer[0x17A] = 'V';
      001075 90 01 7A         [24]  701 	mov	dptr,#(_usb_buffer + 0x017a)
      001078 74 56            [12]  702 	mov	a,#0x56
      00107A F0               [24]  703 	movx	@dptr,a
                                    704 ;	scsi.c:154: usb_buffer[0x17B] = 'R';
      00107B 90 01 7B         [24]  705 	mov	dptr,#(_usb_buffer + 0x017b)
      00107E 74 52            [12]  706 	mov	a,#0x52
      001080 F0               [24]  707 	movx	@dptr,a
                                    708 ;	scsi.c:155: usb_buffer[0x17E] = 0x23;
      001081 90 01 7E         [24]  709 	mov	dptr,#(_usb_buffer + 0x017e)
      001084 74 23            [12]  710 	mov	a,#0x23
      001086 F0               [24]  711 	movx	@dptr,a
                                    712 ;	scsi.c:156: usb_buffer[0x17F] = 0x07;
      001087 90 01 7F         [24]  713 	mov	dptr,#(_usb_buffer + 0x017f)
      00108A 74 07            [12]  714 	mov	a,#0x07
      00108C F0               [24]  715 	movx	@dptr,a
                                    716 ;	scsi.c:157: usb_buffer[0x200] = 'I';
      00108D 90 02 00         [24]  717 	mov	dptr,#(_usb_buffer + 0x0200)
      001090 74 49            [12]  718 	mov	a,#0x49
      001092 F0               [24]  719 	movx	@dptr,a
                                    720 ;	scsi.c:158: usb_buffer[0x201] = 'F';
      001093 90 02 01         [24]  721 	mov	dptr,#(_usb_buffer + 0x0201)
      001096 74 46            [12]  722 	mov	a,#0x46
      001098 F0               [24]  723 	movx	@dptr,a
                                    724 ;	scsi.c:159: SendData1(0x210, 0);
      001099 75 24 00         [24]  725 	mov	_SendData1_PARM_2,#0x00
      00109C 90 02 10         [24]  726 	mov	dptr,#0x0210
      00109F 12 05 8F         [24]  727 	lcall	_SendData1
                                    728 ;	scsi.c:160: scsi_status = 0;
      0010A2 75 25 00         [24]  729 	mov	_scsi_status,#0x00
                                    730 ;	scsi.c:161: return 1;
      0010A5 75 82 01         [24]  731 	mov	dpl,#0x01
                                    732 ;	scsi.c:163: case VENDOR_BOOT:
      0010A8 22               [24]  733 	ret
      0010A9                        734 00120$:
                                    735 ;	scsi.c:166: XVAL(0xFA14) = 0x07;
      0010A9 90 FA 14         [24]  736 	mov	dptr,#0xfa14
      0010AC 74 07            [12]  737 	mov	a,#0x07
      0010AE F0               [24]  738 	movx	@dptr,a
                                    739 ;	scsi.c:167: XVAL(0xF747) &= 0xEF;
      0010AF 90 F7 47         [24]  740 	mov	dptr,#0xf747
      0010B2 E0               [24]  741 	movx	a,@dptr
      0010B3 54 EF            [12]  742 	anl	a,#0xef
      0010B5 F0               [24]  743 	movx	@dptr,a
                                    744 ;	scsi.c:168: XVAL(0xFA15) = 0x06;
      0010B6 90 FA 15         [24]  745 	mov	dptr,#0xfa15
      0010B9 74 06            [12]  746 	mov	a,#0x06
      0010BB F0               [24]  747 	movx	@dptr,a
                                    748 ;	scsi.c:169: XVAL(0xFA38) |= 0x01;
      0010BC 90 FA 38         [24]  749 	mov	dptr,#0xfa38
      0010BF E0               [24]  750 	movx	a,@dptr
      0010C0 FF               [12]  751 	mov	r7,a
      0010C1 7E 00            [12]  752 	mov	r6,#0x00
      0010C3 43 07 01         [24]  753 	orl	ar7,#0x01
      0010C6 90 FA 38         [24]  754 	mov	dptr,#0xfa38
      0010C9 EF               [12]  755 	mov	a,r7
      0010CA F0               [24]  756 	movx	@dptr,a
                                    757 ;	scsi.c:170: XVAL(0xF08F) = 0x00;
      0010CB 90 F0 8F         [24]  758 	mov	dptr,#0xf08f
      0010CE E4               [12]  759 	clr	a
      0010CF F0               [24]  760 	movx	@dptr,a
                                    761 ;	scsi.c:171: XVAL(0xFA68) &= 0xF7;
      0010D0 90 FA 68         [24]  762 	mov	dptr,#0xfa68
      0010D3 E0               [24]  763 	movx	a,@dptr
      0010D4 54 F7            [12]  764 	anl	a,#0xf7
      0010D6 F0               [24]  765 	movx	@dptr,a
                                    766 ;	scsi.c:172: XVAL(0xFA6A) &= 0xF7;
      0010D7 90 FA 6A         [24]  767 	mov	dptr,#0xfa6a
      0010DA E0               [24]  768 	movx	a,@dptr
      0010DB 54 F7            [12]  769 	anl	a,#0xf7
      0010DD F0               [24]  770 	movx	@dptr,a
                                    771 ;	scsi.c:173: XVAL(0xFA48) &= 0xFE;
      0010DE 90 FA 48         [24]  772 	mov	dptr,#0xfa48
      0010E1 E0               [24]  773 	movx	a,@dptr
      0010E2 54 FE            [12]  774 	anl	a,#0xfe
      0010E4 FF               [12]  775 	mov	r7,a
      0010E5 F0               [24]  776 	movx	@dptr,a
                                    777 ;	scsi.c:174: break;
                                    778 ;	scsi.c:176: default:
      0010E6 80 04            [24]  779 	sjmp	00123$
      0010E8                        780 00121$:
                                    781 ;	scsi.c:179: return 0;
      0010E8 75 82 00         [24]  782 	mov	dpl,#0x00
                                    783 ;	scsi.c:183: default:
      0010EB 22               [24]  784 	ret
      0010EC                        785 00123$:
                                    786 ;	scsi.c:186: return 0;
      0010EC 75 82 00         [24]  787 	mov	dpl,#0x00
                                    788 ;	scsi.c:188: }
                                    789 ;	scsi.c:189: }
      0010EF 22               [24]  790 	ret
                                    791 	.area CSEG    (CODE)
                                    792 	.area CONST   (CODE)
                                    793 	.area XINIT   (CODE)
                                    794 	.area CABS    (ABS,CODE)
