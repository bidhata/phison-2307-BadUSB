;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #10443 (MINGW64)
;--------------------------------------------------------
	.module scsi
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _HandleCDB
	.globl _SendData1
	.globl _memset
	.globl _RI
	.globl _TI
	.globl _RB8
	.globl _TB8
	.globl _REN
	.globl _SM2
	.globl _SM1
	.globl _SM0
	.globl _RXD
	.globl _TXD
	.globl _INT0
	.globl _INT1
	.globl _T0
	.globl _T1
	.globl _WR
	.globl _RD
	.globl _PX0
	.globl _PT0
	.globl _PX1
	.globl _PT1
	.globl _PS
	.globl _EX0
	.globl _ET0
	.globl _EX1
	.globl _ET1
	.globl _ES
	.globl _EA
	.globl _IT0
	.globl _IE0
	.globl _IT1
	.globl _IE1
	.globl _TR0
	.globl _TF0
	.globl _TR1
	.globl _TF1
	.globl _P
	.globl _OV
	.globl _RS0
	.globl _RS1
	.globl _F0
	.globl _AC
	.globl _CY
	.globl _SBUF
	.globl _SCON
	.globl _IP
	.globl _IE
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _P3
	.globl _P2
	.globl _P1
	.globl _P0
	.globl _PRAMCTL
	.globl _BANK2PAH
	.globl _BANK2PAL
	.globl _BANK2VA
	.globl _BANK1PAH
	.globl _BANK1PAL
	.globl _BANK1VA
	.globl _BANK0PAH
	.globl _BANK0PAL
	.globl _WARMSTATUS
	.globl _GPIO0OUT
	.globl _GPIO0DIR
	.globl _DMACMD
	.globl _DMAFILL3
	.globl _DMAFILL2
	.globl _DMAFILL1
	.globl _DMAFILL0
	.globl _DMASIZEH
	.globl _DMASIZEM
	.globl _DMASIZEL
	.globl _DMADSTH
	.globl _DMADSTM
	.globl _DMADSTL
	.globl _DMASRCH
	.globl _DMASRCM
	.globl _DMASRCL
	.globl _NANDCSDIR
	.globl _NANDCSOUT
	.globl _EP4
	.globl _EP3
	.globl _EP2
	.globl _EP1
	.globl _EP0
	.globl _SETUPDAT
	.globl _EP0CS
	.globl _EPIE
	.globl _EPIRQ
	.globl _USBIRQ
	.globl _USBSTAT
	.globl _USBCTL
	.globl _REGBANK
	.globl _scsi_cdb_size
	.globl _scsi_cdb
	.globl _scsi_lun
	.globl _scsi_dir_in
	.globl _scsi_tag
	.globl _scsi_transfer_size
	.globl _scsi_data_residue
	.globl _scsi_status
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_P1	=	0x0090
_P2	=	0x00a0
_P3	=	0x00b0
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_IE	=	0x00a8
_IP	=	0x00b8
_SCON	=	0x0098
_SBUF	=	0x0099
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_CY	=	0x00d7
_AC	=	0x00d6
_F0	=	0x00d5
_RS1	=	0x00d4
_RS0	=	0x00d3
_OV	=	0x00d2
_P	=	0x00d0
_TF1	=	0x008f
_TR1	=	0x008e
_TF0	=	0x008d
_TR0	=	0x008c
_IE1	=	0x008b
_IT1	=	0x008a
_IE0	=	0x0089
_IT0	=	0x0088
_EA	=	0x00af
_ES	=	0x00ac
_ET1	=	0x00ab
_EX1	=	0x00aa
_ET0	=	0x00a9
_EX0	=	0x00a8
_PS	=	0x00bc
_PT1	=	0x00bb
_PX1	=	0x00ba
_PT0	=	0x00b9
_PX0	=	0x00b8
_RD	=	0x00b7
_WR	=	0x00b6
_T1	=	0x00b5
_T0	=	0x00b4
_INT1	=	0x00b3
_INT0	=	0x00b2
_TXD	=	0x00b1
_RXD	=	0x00b0
_SM0	=	0x009f
_SM1	=	0x009e
_SM2	=	0x009d
_REN	=	0x009c
_TB8	=	0x009b
_RB8	=	0x009a
_TI	=	0x0099
_RI	=	0x0098
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_scsi_status::
	.ds 1
_scsi_data_residue::
	.ds 4
_scsi_transfer_size::
	.ds 4
_scsi_tag::
	.ds 4
_scsi_dir_in::
	.ds 1
_scsi_lun::
	.ds 1
_scsi_cdb::
	.ds 16
_scsi_cdb_size::
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_REGBANK	=	0xf000
_USBCTL	=	0xf008
_USBSTAT	=	0xf009
_USBIRQ	=	0xf027
_EPIRQ	=	0xf020
_EPIE	=	0xf030
_EP0CS	=	0xf048
_SETUPDAT	=	0xf0b8
_EP0	=	0xf1c0
_EP1	=	0xf200
_EP2	=	0xf240
_EP3	=	0xf280
_EP4	=	0xf2c0
_NANDCSOUT	=	0xf608
_NANDCSDIR	=	0xf618
_DMASRCL	=	0xf900
_DMASRCM	=	0xf901
_DMASRCH	=	0xf902
_DMADSTL	=	0xf904
_DMADSTM	=	0xf905
_DMADSTH	=	0xf906
_DMASIZEL	=	0xf908
_DMASIZEM	=	0xf909
_DMASIZEH	=	0xf90a
_DMAFILL0	=	0xf90c
_DMAFILL1	=	0xf90d
_DMAFILL2	=	0xf90e
_DMAFILL3	=	0xf90f
_DMACMD	=	0xf930
_GPIO0DIR	=	0xfa14
_GPIO0OUT	=	0xfa15
_WARMSTATUS	=	0xfa38
_BANK0PAL	=	0xfa40
_BANK0PAH	=	0xfa41
_BANK1VA	=	0xfa42
_BANK1PAL	=	0xfa43
_BANK1PAH	=	0xfa44
_BANK2VA	=	0xfa45
_BANK2PAL	=	0xfa46
_BANK2PAH	=	0xfa47
_PRAMCTL	=	0xfa48
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'HandleCDB'
;------------------------------------------------------------
;i                         Allocated to registers r6 r7 
;i                         Allocated with name '_HandleCDB_i_5_44'
;------------------------------------------------------------
;	scsi.c:29: BYTE HandleCDB()
;	-----------------------------------------
;	 function HandleCDB
;	-----------------------------------------
_HandleCDB:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	scsi.c:32: scsi_status = 1;
	mov	_scsi_status,#0x01
;	scsi.c:34: switch(scsi_cdb[0])
	mov	r7,_scsi_cdb
	cjne	r7,#0x00,00210$
	sjmp	00102$
00210$:
	cjne	r7,#0x03,00211$
	ljmp	00106$
00211$:
	cjne	r7,#0x06,00212$
	ljmp	00109$
00212$:
	cjne	r7,#0x12,00213$
	sjmp	00103$
00213$:
	cjne	r7,#0x1a,00214$
	ljmp	00105$
00214$:
	cjne	r7,#0x1e,00215$
	sjmp	00101$
00215$:
	cjne	r7,#0x23,00216$
	sjmp	00104$
00216$:
	cjne	r7,#0xc6,00217$
	ljmp	00109$
00217$:
	cjne	r7,#0xc7,00218$
	ljmp	00109$
00218$:
	ljmp	00123$
;	scsi.c:36: case PREVENT_ALLOW_MEDIUM_REMOVAL:
00101$:
;	scsi.c:38: scsi_status = 0;
	mov	_scsi_status,#0x00
;	scsi.c:39: return 1;
	mov	dpl,#0x01
	ret
;	scsi.c:41: case TEST_UNIT_READY:
00102$:
;	scsi.c:43: return 1;
	mov	dpl,#0x01
	ret
;	scsi.c:45: case INQUIRY:
00103$:
;	scsi.c:47: memset(usb_buffer, 0, 36);
	mov	_memset_PARM_2,#0x00
	mov	_memset_PARM_3,#0x24
	mov	(_memset_PARM_3 + 1),#0x00
	mov	dptr,#_usb_buffer
	mov	b,#0x00
	lcall	_memset
;	scsi.c:48: usb_buffer[1] = 0x80; //removable media
	mov	dptr,#(_usb_buffer + 0x0001)
	mov	a,#0x80
	movx	@dptr,a
;	scsi.c:49: usb_buffer[3] = 0x01; //because the UFI spec says so
	mov	dptr,#(_usb_buffer + 0x0003)
	rl	a
	movx	@dptr,a
;	scsi.c:50: usb_buffer[4] = 0x1F; //additional length
	mov	dptr,#(_usb_buffer + 0x0004)
	mov	a,#0x1f
	movx	@dptr,a
;	scsi.c:51: SendData1(36, 0);
	mov	_SendData1_PARM_2,#0x00
	mov	dptr,#0x0024
	lcall	_SendData1
;	scsi.c:52: scsi_status = 0;
	mov	_scsi_status,#0x00
;	scsi.c:53: return 1;
	mov	dpl,#0x01
	ret
;	scsi.c:55: case READ_FORMAT_CAPACITIES:
00104$:
;	scsi.c:57: memset(usb_buffer, 0, 12);
	mov	_memset_PARM_2,#0x00
	mov	_memset_PARM_3,#0x0c
	mov	(_memset_PARM_3 + 1),#0x00
	mov	dptr,#_usb_buffer
	mov	b,#0x00
	lcall	_memset
;	scsi.c:58: usb_buffer[3] = 0x08; //capacity list length
	mov	dptr,#(_usb_buffer + 0x0003)
	mov	a,#0x08
	movx	@dptr,a
;	scsi.c:59: usb_buffer[6] = 0x10; //number of blocks (sectors) (dummy 2MB)
	mov	dptr,#(_usb_buffer + 0x0006)
	rl	a
	movx	@dptr,a
;	scsi.c:60: usb_buffer[8] = 0x03;
	mov	dptr,#(_usb_buffer + 0x0008)
	mov	a,#0x03
	movx	@dptr,a
;	scsi.c:61: usb_buffer[10] = 0x02; //block length (512 bytes/sector)
	mov	dptr,#(_usb_buffer + 0x000a)
	dec	a
	movx	@dptr,a
;	scsi.c:62: SendData1(12, 0);
	mov	_SendData1_PARM_2,#0x00
	mov	dptr,#0x000c
	lcall	_SendData1
;	scsi.c:63: scsi_status = 0;
	mov	_scsi_status,#0x00
;	scsi.c:64: return 1;
	mov	dpl,#0x01
	ret
;	scsi.c:66: case MODE_SENSE:
00105$:
;	scsi.c:68: memset(usb_buffer, 0, 8);
	mov	_memset_PARM_2,#0x00
	mov	_memset_PARM_3,#0x08
	mov	(_memset_PARM_3 + 1),#0x00
	mov	dptr,#_usb_buffer
	mov	b,#0x00
	lcall	_memset
;	scsi.c:69: usb_buffer[0] = 0x03;
	mov	dptr,#_usb_buffer
	mov	a,#0x03
	movx	@dptr,a
;	scsi.c:70: usb_buffer[2] = 0x80;
	mov	dptr,#(_usb_buffer + 0x0002)
	mov	a,#0x80
	movx	@dptr,a
;	scsi.c:71: SendData1(4, 0);
	mov	_SendData1_PARM_2,#0x00
	mov	dptr,#0x0004
	lcall	_SendData1
;	scsi.c:72: scsi_status = 0;
	mov	_scsi_status,#0x00
;	scsi.c:73: return 1;
	mov	dpl,#0x01
	ret
;	scsi.c:75: case REQUEST_SENSE:
00106$:
;	scsi.c:77: memset(usb_buffer, 0, 18);
	mov	_memset_PARM_2,#0x00
	mov	_memset_PARM_3,#0x12
	mov	(_memset_PARM_3 + 1),#0x00
	mov	dptr,#_usb_buffer
	mov	b,#0x00
	lcall	_memset
;	scsi.c:78: usb_buffer[0] = 0x70;
	mov	dptr,#_usb_buffer
	mov	a,#0x70
	movx	@dptr,a
;	scsi.c:79: usb_buffer[2] = 0x02;
	mov	dptr,#(_usb_buffer + 0x0002)
	mov	a,#0x02
	movx	@dptr,a
;	scsi.c:80: usb_buffer[7] = 10;
	mov	dptr,#(_usb_buffer + 0x0007)
	mov	a,#0x0a
	movx	@dptr,a
;	scsi.c:81: usb_buffer[12] = 0x3A;
	mov	dptr,#(_usb_buffer + 0x000c)
	mov	a,#0x3a
	movx	@dptr,a
;	scsi.c:82: SendData1(18, 0);
	mov	_SendData1_PARM_2,#0x00
	mov	dptr,#0x0012
	lcall	_SendData1
;	scsi.c:83: scsi_status = 0;
	mov	_scsi_status,#0x00
;	scsi.c:84: return 1;
	mov	dpl,#0x01
	ret
;	scsi.c:89: case 0xC7:
00109$:
;	scsi.c:91: switch(scsi_cdb[1])
	mov	r7,(_scsi_cdb + 0x0001)
	cjne	r7,#0x05,00219$
	ljmp	00119$
00219$:
	cjne	r7,#0x06,00220$
	sjmp	00110$
00220$:
	cjne	r7,#0x07,00221$
	sjmp	00111$
00221$:
	cjne	r7,#0x08,00222$
	sjmp	00112$
00222$:
	cjne	r7,#0x09,00223$
	sjmp	00113$
00223$:
	cjne	r7,#0x56,00224$
	ljmp	00114$
00224$:
	cjne	r7,#0xbf,00225$
	ljmp	00120$
00225$:
	ljmp	00121$
;	scsi.c:93: case CUSTOM_XPEEK:
00110$:
;	scsi.c:95: usb_buffer[0] = XVAL((scsi_cdb[2] << 8) | scsi_cdb[3]);
	mov	r7,(_scsi_cdb + 0x0002)
	mov	r6,#0x00
	mov	r4,(_scsi_cdb + 0x0003)
	mov	r5,#0x00
	mov	a,r4
	orl	ar6,a
	mov	a,r5
	orl	ar7,a
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	mov	dptr,#_usb_buffer
	movx	@dptr,a
;	scsi.c:96: SendData1(1, 0);
	mov	_SendData1_PARM_2,#0x00
	mov	dptr,#0x0001
	lcall	_SendData1
;	scsi.c:97: break;
	ljmp	00123$
;	scsi.c:99: case CUSTOM_XPOKE:
00111$:
;	scsi.c:101: XVAL((scsi_cdb[2] << 8) | scsi_cdb[3]) = scsi_cdb[4];
	mov	r7,(_scsi_cdb + 0x0002)
	mov	r6,#0x00
	mov	r4,(_scsi_cdb + 0x0003)
	mov	r5,#0x00
	mov	a,r4
	orl	ar6,a
	mov	a,r5
	orl	ar7,a
	mov	dpl,r6
	mov	dph,r7
	mov	a,(_scsi_cdb + 0x0004)
	movx	@dptr,a
;	scsi.c:102: SendData1(1, 0);
	mov	_SendData1_PARM_2,#0x00
	mov	dptr,#0x0001
	lcall	_SendData1
;	scsi.c:103: break;
	ljmp	00123$
;	scsi.c:105: case CUSTOM_IPEEK:
00112$:
;	scsi.c:107: usb_buffer[0] = IVAL(scsi_cdb[2]);
	mov	r1,(_scsi_cdb + 0x0002)
	mov	ar7,@r1
	mov	dptr,#_usb_buffer
	mov	a,r7
	movx	@dptr,a
;	scsi.c:108: SendData1(1, 0);
	mov	_SendData1_PARM_2,#0x00
	mov	dptr,#0x0001
	lcall	_SendData1
;	scsi.c:109: break;
	ljmp	00123$
;	scsi.c:111: case CUSTOM_IPOKE:
00113$:
;	scsi.c:113: IVAL(scsi_cdb[2]) = scsi_cdb[3];
	mov	r1,(_scsi_cdb + 0x0002)
	mov	@r1,(_scsi_cdb + 0x0003)
;	scsi.c:114: SendData1(1, 0);
	mov	_SendData1_PARM_2,#0x00
	mov	dptr,#0x0001
	lcall	_SendData1
;	scsi.c:115: break;
	ljmp	00123$
;	scsi.c:117: case VENDOR_CHIPID:
00114$:
;	scsi.c:120: memset(usb_buffer, 0x00, 0x200);
	mov	_memset_PARM_2,#0x00
	mov	_memset_PARM_3,#0x00
	mov	(_memset_PARM_3 + 1),#0x02
	mov	dptr,#_usb_buffer
	mov	b,#0x00
	lcall	_memset
;	scsi.c:123: XVAL(0xF480) = 0x00;
	mov	dptr,#0xf480
	clr	a
	movx	@dptr,a
;	scsi.c:124: XVAL(0xF618) = 0xFF;
	mov	dptr,#0xf618
	dec	a
	movx	@dptr,a
;	scsi.c:127: XVAL(0xF608) = 0xFE;
	mov	dptr,#0xf608
	dec	a
	movx	@dptr,a
;	scsi.c:130: XVAL(0xF400) = 0xFF;
	mov	dptr,#0xf400
	inc	a
	movx	@dptr,a
;	scsi.c:131: while (!(XVAL(0xF41E) & 0x01));
00115$:
	mov	dptr,#0xf41e
	movx	a,@dptr
	mov	r7,a
	jnb	acc.0,00115$
;	scsi.c:134: XVAL(0xF400) = 0x90;
	mov	dptr,#0xf400
	mov	a,#0x90
	movx	@dptr,a
;	scsi.c:135: XVAL(0xF404) = 0x00;
	mov	dptr,#0xf404
	clr	a
	movx	@dptr,a
;	scsi.c:136: for (i = 0; i < 6; i++)
	mov	r6,#0x00
	mov	r7,#0x00
00125$:
;	scsi.c:138: usb_buffer[i] = XVAL(0xF408);
	mov	ar4,r6
	mov	a,#(_usb_buffer >> 8)
	add	a,r7
	mov	r5,a
	mov	dptr,#0xf408
	movx	a,@dptr
	mov	r3,a
	mov	dpl,r4
	mov	dph,r5
	movx	@dptr,a
;	scsi.c:136: for (i = 0; i < 6; i++)
	inc	r6
	cjne	r6,#0x00,00227$
	inc	r7
00227$:
	clr	c
	mov	a,r6
	subb	a,#0x06
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jc	00125$
;	scsi.c:141: SendData1(0x200, 0);
	mov	_SendData1_PARM_2,#0x00
	mov	dptr,#0x0200
	lcall	_SendData1
;	scsi.c:142: scsi_status = 0;
	mov	_scsi_status,#0x00
;	scsi.c:143: return 1;
	mov	dpl,#0x01
	ret
;	scsi.c:145: case VENDOR_INFO: //get info
00119$:
;	scsi.c:149: memset(usb_buffer, 0x00, 0x210);
	mov	_memset_PARM_2,#0x00
	mov	_memset_PARM_3,#0x10
	mov	(_memset_PARM_3 + 1),#0x02
	mov	dptr,#_usb_buffer
	mov	b,#0x00
	lcall	_memset
;	scsi.c:150: usb_buffer[0x094] = 0x00;
	mov	dptr,#(_usb_buffer + 0x0094)
	clr	a
	movx	@dptr,a
;	scsi.c:151: usb_buffer[0x095] = 0x99;
	mov	dptr,#(_usb_buffer + 0x0095)
	mov	a,#0x99
	movx	@dptr,a
;	scsi.c:152: usb_buffer[0x096] = 0x53;
	mov	dptr,#(_usb_buffer + 0x0096)
	mov	a,#0x53
	movx	@dptr,a
;	scsi.c:153: usb_buffer[0x17A] = 'V';
	mov	dptr,#(_usb_buffer + 0x017a)
	mov	a,#0x56
	movx	@dptr,a
;	scsi.c:154: usb_buffer[0x17B] = 'R';
	mov	dptr,#(_usb_buffer + 0x017b)
	mov	a,#0x52
	movx	@dptr,a
;	scsi.c:155: usb_buffer[0x17E] = 0x23;
	mov	dptr,#(_usb_buffer + 0x017e)
	mov	a,#0x23
	movx	@dptr,a
;	scsi.c:156: usb_buffer[0x17F] = 0x07;
	mov	dptr,#(_usb_buffer + 0x017f)
	mov	a,#0x07
	movx	@dptr,a
;	scsi.c:157: usb_buffer[0x200] = 'I';
	mov	dptr,#(_usb_buffer + 0x0200)
	mov	a,#0x49
	movx	@dptr,a
;	scsi.c:158: usb_buffer[0x201] = 'F';
	mov	dptr,#(_usb_buffer + 0x0201)
	mov	a,#0x46
	movx	@dptr,a
;	scsi.c:159: SendData1(0x210, 0);
	mov	_SendData1_PARM_2,#0x00
	mov	dptr,#0x0210
	lcall	_SendData1
;	scsi.c:160: scsi_status = 0;
	mov	_scsi_status,#0x00
;	scsi.c:161: return 1;
	mov	dpl,#0x01
;	scsi.c:163: case VENDOR_BOOT:
	ret
00120$:
;	scsi.c:166: XVAL(0xFA14) = 0x07;
	mov	dptr,#0xfa14
	mov	a,#0x07
	movx	@dptr,a
;	scsi.c:167: XVAL(0xF747) &= 0xEF;
	mov	dptr,#0xf747
	movx	a,@dptr
	anl	a,#0xef
	movx	@dptr,a
;	scsi.c:168: XVAL(0xFA15) = 0x06;
	mov	dptr,#0xfa15
	mov	a,#0x06
	movx	@dptr,a
;	scsi.c:169: XVAL(0xFA38) |= 0x01;
	mov	dptr,#0xfa38
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	orl	ar7,#0x01
	mov	dptr,#0xfa38
	mov	a,r7
	movx	@dptr,a
;	scsi.c:170: XVAL(0xF08F) = 0x00;
	mov	dptr,#0xf08f
	clr	a
	movx	@dptr,a
;	scsi.c:171: XVAL(0xFA68) &= 0xF7;
	mov	dptr,#0xfa68
	movx	a,@dptr
	anl	a,#0xf7
	movx	@dptr,a
;	scsi.c:172: XVAL(0xFA6A) &= 0xF7;
	mov	dptr,#0xfa6a
	movx	a,@dptr
	anl	a,#0xf7
	movx	@dptr,a
;	scsi.c:173: XVAL(0xFA48) &= 0xFE;
	mov	dptr,#0xfa48
	movx	a,@dptr
	anl	a,#0xfe
	mov	r7,a
	movx	@dptr,a
;	scsi.c:174: break;
;	scsi.c:176: default:
	sjmp	00123$
00121$:
;	scsi.c:179: return 0;
	mov	dpl,#0x00
;	scsi.c:183: default:
	ret
00123$:
;	scsi.c:186: return 0;
	mov	dpl,#0x00
;	scsi.c:188: }
;	scsi.c:189: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
