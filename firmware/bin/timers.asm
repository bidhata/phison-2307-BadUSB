;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #10443 (MINGW64)
;--------------------------------------------------------
	.module timers
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _tmr0isr
	.globl _tmr1isr
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
	.globl _InitTicks
	.globl _GetTickCount
	.globl _SetLEDThreshold
	.globl _InitLED
	.globl _LEDBlink
	.globl _LEDOff
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
_tmr0count:
	.ds 1
_led_ticks:
	.ds 1
_led_timer:
	.ds 1
_led_tick_threshold:
	.ds 1
_tmr1count:
	.ds 1
_tmr1reload:
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
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
;Allocation info for local variables in function 'tmr1isr'
;------------------------------------------------------------
;	timers.c:8: void tmr1isr(void) __interrupt TMR1_VECT
;	-----------------------------------------
;	 function tmr1isr
;	-----------------------------------------
_tmr1isr:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	timers.c:10: TR1 = 0;
;	assignBit
	clr	_TR1
;	timers.c:11: TH1 = MSB(tmr1reload);
	mov	_TH1,(_tmr1reload + 1)
;	timers.c:12: TL1 = LSB(tmr1reload);
	mov	_TL1,_tmr1reload
;	timers.c:13: tmr1count++;
	inc	_tmr1count
;	timers.c:14: TR1 = 1;
;	assignBit
	setb	_TR1
;	timers.c:15: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'InitTicks'
;------------------------------------------------------------
;	timers.c:17: void InitTicks()
;	-----------------------------------------
;	 function InitTicks
;	-----------------------------------------
_InitTicks:
;	timers.c:19: if (XVAL(0xFA60) == 0x0F)
	mov	dptr,#0xfa60
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x0f,00102$
;	timers.c:21: tmr1reload = 0xF63C;
	mov	_tmr1reload,#0x3c
	mov	(_tmr1reload + 1),#0xf6
	sjmp	00103$
00102$:
;	timers.c:25: tmr1reload = 0-(2500/(XVAL(0xFA60)+2));
	mov	dptr,#0xfa60
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	mov	a,#0x02
	add	a,r7
	mov	__divsint_PARM_2,a
	clr	a
	addc	a,r6
	mov	(__divsint_PARM_2 + 1),a
	mov	dptr,#0x09c4
	lcall	__divsint
	mov	r6,dpl
	mov	r7,dph
	clr	c
	clr	a
	subb	a,r6
	mov	_tmr1reload,a
	clr	a
	subb	a,r7
	mov	(_tmr1reload + 1),a
00103$:
;	timers.c:28: tmr1count = 0;
	mov	_tmr1count,#0x00
;	timers.c:29: TR1 = 0;
;	assignBit
	clr	_TR1
;	timers.c:30: ET1 = 1;
;	assignBit
	setb	_ET1
;	timers.c:31: TMOD = TMOD & 0x0F | 0x10;
	mov	r6,_TMOD
	anl	ar6,#0x0f
	orl	ar6,#0x10
	mov	_TMOD,r6
;	timers.c:32: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GetTickCount'
;------------------------------------------------------------
;	timers.c:34: BYTE GetTickCount(void)
;	-----------------------------------------
;	 function GetTickCount
;	-----------------------------------------
_GetTickCount:
;	timers.c:36: return tmr1count;
	mov	dpl,_tmr1count
;	timers.c:37: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'tmr0isr'
;------------------------------------------------------------
;	timers.c:39: void tmr0isr(void) __interrupt TMR0_VECT
;	-----------------------------------------
;	 function tmr0isr
;	-----------------------------------------
_tmr0isr:
	push	acc
	push	dpl
	push	dph
	push	ar7
	push	ar6
	push	psw
	mov	psw,#0x00
;	timers.c:42: TR0 = 0;
;	assignBit
	clr	_TR0
;	timers.c:43: TL0 = 0xE6;
	mov	_TL0,#0xe6
;	timers.c:44: TH0 = 0x96;
	mov	_TH0,#0x96
;	timers.c:45: TR0 = 1;
;	assignBit
	setb	_TR0
;	timers.c:47: if ((GPIO0OUT & 2) == 0) //turned off
	mov	dptr,#_GPIO0OUT
	movx	a,@dptr
	jb	acc.1,00102$
;	timers.c:49: return;
	sjmp	00114$
00102$:
;	timers.c:52: tmr0count++;
	inc	_tmr0count
;	timers.c:53: led_ticks++;
	inc	_led_ticks
;	timers.c:54: if (led_ticks < led_tick_threshold)
	clr	c
	mov	a,_led_ticks
	subb	a,_led_tick_threshold
	jnc	00104$
;	timers.c:56: return;
	sjmp	00114$
00104$:
;	timers.c:59: led_ticks = 0;
	mov	_led_ticks,#0x00
;	timers.c:60: if (led_timer >= 31)
	mov	a,#0x100 - 0x1f
	add	a,_led_timer
	jnc	00106$
;	timers.c:62: GPIO0OUT = 1;
	mov	dptr,#_GPIO0OUT
	mov	a,#0x01
	movx	@dptr,a
;	timers.c:63: led_timer = 0;		
	mov	_led_timer,#0x00
;	timers.c:64: return;
	sjmp	00114$
00106$:
;	timers.c:67: if (led_timer >= 10)
	mov	a,#0x100 - 0x0a
	add	a,_led_timer
	jnc	00108$
;	timers.c:69: GPIO0OUT = ~GPIO0OUT;
	mov	dptr,#_GPIO0OUT
	movx	a,@dptr
	mov	r7,a
	cpl	a
	movx	@dptr,a
;	timers.c:70: led_timer++;
	inc	_led_timer
;	timers.c:71: return;
	sjmp	00114$
00108$:
;	timers.c:74: if (led_timer == 0)
	mov	a,_led_timer
	jnz	00110$
;	timers.c:76: return;
	sjmp	00114$
00110$:
;	timers.c:79: if (GPIO0OUT & 1)
	mov	dptr,#_GPIO0OUT
	movx	a,@dptr
	jnb	acc.0,00112$
;	timers.c:81: GPIO0OUT &= 0xFE;
	mov	dptr,#_GPIO0OUT
	movx	a,@dptr
	anl	acc,#0xfe
	movx	@dptr,a
	sjmp	00114$
00112$:
;	timers.c:85: GPIO0OUT |= 1;
	mov	dptr,#_GPIO0OUT
	movx	a,@dptr
	mov	r7,a
	mov	r6,#0x00
	orl	ar7,#0x01
	mov	dptr,#_GPIO0OUT
	mov	a,r7
	movx	@dptr,a
00114$:
;	timers.c:87: }
	pop	psw
	pop	ar6
	pop	ar7
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'SetLEDThreshold'
;------------------------------------------------------------
;threshold                 Allocated to registers r6 r7 
;------------------------------------------------------------
;	timers.c:89: void SetLEDThreshold(int threshold)
;	-----------------------------------------
;	 function SetLEDThreshold
;	-----------------------------------------
_SetLEDThreshold:
	mov	r6,dpl
;	timers.c:91: led_tick_threshold = threshold;
	mov	_led_tick_threshold,r6
;	timers.c:92: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitLED'
;------------------------------------------------------------
;	timers.c:94: void InitLED(void)
;	-----------------------------------------
;	 function InitLED
;	-----------------------------------------
_InitLED:
;	timers.c:96: led_tick_threshold = 100;
	mov	_led_tick_threshold,#0x64
;	timers.c:97: tmr0count = 0;
	mov	_tmr0count,#0x00
;	timers.c:98: GPIO0OUT = 3;
	mov	dptr,#_GPIO0OUT
	mov	a,#0x03
	movx	@dptr,a
;	timers.c:99: led_ticks = 0;
	mov	_led_ticks,#0x00
;	timers.c:100: led_timer = 0;
	mov	_led_timer,#0x00
;	timers.c:101: EA = 1;
;	assignBit
	setb	_EA
;	timers.c:102: ET0 = 1;
;	assignBit
	setb	_ET0
;	timers.c:103: TR0 = 1;
;	assignBit
	setb	_TR0
;	timers.c:104: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LEDBlink'
;------------------------------------------------------------
;	timers.c:106: void LEDBlink(void)
;	-----------------------------------------
;	 function LEDBlink
;	-----------------------------------------
_LEDBlink:
;	timers.c:108: GPIO0OUT = 2;
	mov	dptr,#_GPIO0OUT
	mov	a,#0x02
	movx	@dptr,a
;	timers.c:109: led_timer = 1;
	mov	_led_timer,#0x01
;	timers.c:110: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LEDOff'
;------------------------------------------------------------
;	timers.c:112: void LEDOff(void)
;	-----------------------------------------
;	 function LEDOff
;	-----------------------------------------
_LEDOff:
;	timers.c:114: GPIO0OUT = 3;
	mov	dptr,#_GPIO0OUT
	mov	a,#0x03
	movx	@dptr,a
;	timers.c:115: led_timer = 0;
	mov	_led_timer,#0x00
;	timers.c:116: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
