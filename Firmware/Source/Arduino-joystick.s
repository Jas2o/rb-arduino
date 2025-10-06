	.file	"Arduino-joystick.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.RingBuffer_Remove.constprop.4,"ax",@progbits
	.type	RingBuffer_Remove.constprop.4, @function
RingBuffer_Remove.constprop.4:
.LFB101:
	.file 1 "Lib/LightweightRingBuff.h"
	.loc 1 182 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LVL0:
	.loc 1 184 0
	lds r30,USARTtoUSB_Buffer+130
	lds r31,USARTtoUSB_Buffer+130+1
	ld r24,Z+
.LVL1:
	.loc 1 186 0
	sts USARTtoUSB_Buffer+130+1,r31
	sts USARTtoUSB_Buffer+130,r30
	subi r30,lo8(USARTtoUSB_Buffer+128)
	sbci r31,hi8(USARTtoUSB_Buffer+128)
	brne .L2
	.loc 1 187 0
	ldi r18,lo8(USARTtoUSB_Buffer)
	ldi r19,hi8(USARTtoUSB_Buffer)
	sts USARTtoUSB_Buffer+130+1,r19
	sts USARTtoUSB_Buffer+130,r18
.L2:
.LBB46:
	.loc 1 189 0
	in r18,__SREG__
.LVL2:
.LBB47:
.LBB48:
	.file 2 "/usr/lib/avr/include/util/atomic.h"
	.loc 2 50 0
/* #APP */
 ;  50 "/usr/lib/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL3:
/* #NOAPP */
.LBE48:
.LBE47:
	.loc 1 191 0
	lds r25,USARTtoUSB_Buffer+132
	subi r25,lo8(-(-1))
	sts USARTtoUSB_Buffer+132,r25
.LVL4:
.LBB49:
.LBB50:
	.loc 2 70 0
	out __SREG__,r18
	.loc 2 71 0
.LBE50:
.LBE49:
.LBE46:
	.loc 1 195 0
	ret
	.cfi_endproc
.LFE101:
	.size	RingBuffer_Remove.constprop.4, .-RingBuffer_Remove.constprop.4
	.section	.text.SetupHardware,"ax",@progbits
.global	SetupHardware
	.type	SetupHardware, @function
SetupHardware:
.LFB87:
	.file 3 "Arduino-joystick.c"
	.loc 3 125 0
	.cfi_startproc
	push r28
.LCFI0:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI1:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	.loc 3 127 0
	in r24,0x34
	andi r24,lo8(-9)
	out 0x34,r24
	.loc 3 128 0
	ldi r24,lo8(24)
/* #APP */
 ;  128 "Arduino-joystick.c" 1
	in __tmp_reg__, __SREG__
	cli
	sts 96, r24
	sts 96, __zero_reg__
	out __SREG__,__tmp_reg__
	
 ;  0 "" 2
.LVL5:
/* #NOAPP */
.LBB55:
.LBB56:
	.file 4 "../../LUFA/Drivers/Peripheral/Serial.h"
	.loc 4 102 0
	ldi r24,lo8(16)
	ldi r25,0
	sts 204+1,r25
	sts 204,r24
	.loc 4 104 0
	ldi r24,lo8(6)
	sts 202,r24
	.loc 4 105 0
	ldi r24,lo8(2)
	sts 200,r24
	.loc 4 106 0
	ldi r28,lo8(-55)
	ldi r29,0
	ldi r24,lo8(24)
	st Y,r24
	.loc 4 108 0
	sbi 0xa,3
	.loc 4 109 0
	sbi 0xb,2
.LBE56:
.LBE55:
.LBB57:
.LBB58:
	.file 5 "./Board/LEDs.h"
	.loc 5 69 0
	in r24,0xa
	ori r24,lo8(48)
	out 0xa,r24
	.loc 5 70 0
	in r24,0xb
	ori r24,lo8(48)
	out 0xb,r24
.LBE58:
.LBE57:
	.loc 3 133 0
	call USB_Init
.LVL6:
	.loc 3 135 0
	ldi r24,lo8(-104)
	st Y,r24
/* epilogue start */
	.loc 3 136 0
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE87:
	.size	SetupHardware, .-SetupHardware
	.section	.text.startup.main,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB86:
	.loc 3 102 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 103 0
	call SetupHardware
.LVL7:
.LBB68:
.LBB69:
	.loc 1 87 0
	in r18,__SREG__
.LVL8:
.LBB70:
.LBB71:
	.loc 2 50 0
/* #APP */
 ;  50 "/usr/lib/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL9:
/* #NOAPP */
.LBE71:
.LBE70:
	.loc 1 89 0
	ldi r24,lo8(USARTtoUSB_Buffer)
	ldi r25,hi8(USARTtoUSB_Buffer)
	sts USARTtoUSB_Buffer+128+1,r25
	sts USARTtoUSB_Buffer+128,r24
	.loc 1 90 0
	sts USARTtoUSB_Buffer+130+1,r25
	sts USARTtoUSB_Buffer+130,r24
.LVL10:
.LBB72:
.LBB73:
	.loc 2 70 0
	out __SREG__,r18
	.loc 2 71 0
.LBE73:
.LBE72:
.LBE69:
.LBE68:
	.loc 3 107 0
/* #APP */
 ;  107 "Arduino-joystick.c" 1
	sei
 ;  0 "" 2
.LVL11:
/* #NOAPP */
.L7:
	.loc 3 110 0
	ldi r24,lo8(Joystick_HID_Interface)
	ldi r25,hi8(Joystick_HID_Interface)
	call HID_Device_USBTask
.LVL12:
	.loc 3 111 0
	call USB_USBTask
.LVL13:
	.loc 3 114 0
	lds r24,led1_ticks
	lds r25,led1_ticks+1
	or r24,r25
	breq .L7
	.loc 3 115 0
	lds r24,led1_ticks
	lds r25,led1_ticks+1
	sbiw r24,1
	sts led1_ticks+1,r25
	sts led1_ticks,r24
	.loc 3 116 0
	lds r24,led1_ticks
	lds r25,led1_ticks+1
	or r24,r25
	brne .L7
.LVL14:
.LBB74:
.LBB75:
	.loc 5 80 0
	sbi 0xb,5
	rjmp .L7
.LBE75:
.LBE74:
	.cfi_endproc
.LFE86:
	.size	main, .-main
	.section	.text.EVENT_USB_Device_Connect,"ax",@progbits
.global	EVENT_USB_Device_Connect
	.type	EVENT_USB_Device_Connect, @function
EVENT_USB_Device_Connect:
.LFB88:
	.loc 3 140 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.cfi_endproc
.LFE88:
	.size	EVENT_USB_Device_Connect, .-EVENT_USB_Device_Connect
	.section	.text.EVENT_USB_Device_Disconnect,"ax",@progbits
.global	EVENT_USB_Device_Disconnect
	.type	EVENT_USB_Device_Disconnect, @function
EVENT_USB_Device_Disconnect:
.LFB89:
	.loc 3 146 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.cfi_endproc
.LFE89:
	.size	EVENT_USB_Device_Disconnect, .-EVENT_USB_Device_Disconnect
	.section	.text.EVENT_USB_Device_ConfigurationChanged,"ax",@progbits
.global	EVENT_USB_Device_ConfigurationChanged
	.type	EVENT_USB_Device_ConfigurationChanged, @function
EVENT_USB_Device_ConfigurationChanged:
.LFB90:
	.loc 3 151 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 152 0
	ldi r24,lo8(Joystick_HID_Interface)
	ldi r25,hi8(Joystick_HID_Interface)
	call HID_Device_ConfigureEndpoints
.LVL15:
.LBB76:
.LBB77:
	.file 6 "../../LUFA/Drivers/USB/HighLevel/../LowLevel/Device.h"
	.loc 6 150 0
	ldi r30,lo8(-30)
	ldi r31,0
	ld r24,Z
	ori r24,lo8(4)
	st Z,r24
	ret
.LBE77:
.LBE76:
	.cfi_endproc
.LFE90:
	.size	EVENT_USB_Device_ConfigurationChanged, .-EVENT_USB_Device_ConfigurationChanged
	.section	.text.EVENT_USB_Device_UnhandledControlRequest,"ax",@progbits
.global	EVENT_USB_Device_UnhandledControlRequest
	.type	EVENT_USB_Device_UnhandledControlRequest, @function
EVENT_USB_Device_UnhandledControlRequest:
.LFB91:
	.loc 3 159 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 3 160 0
	ldi r24,lo8(Joystick_HID_Interface)
	ldi r25,hi8(Joystick_HID_Interface)
	jmp HID_Device_ProcessControlRequest
.LVL16:
	.cfi_endproc
.LFE91:
	.size	EVENT_USB_Device_UnhandledControlRequest, .-EVENT_USB_Device_UnhandledControlRequest
	.section	.text.EVENT_USB_Device_StartOfFrame,"ax",@progbits
.global	EVENT_USB_Device_StartOfFrame
	.type	EVENT_USB_Device_StartOfFrame, @function
EVENT_USB_Device_StartOfFrame:
.LFB92:
	.loc 3 165 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
.LVL17:
.LBB78:
.LBB79:
	.file 7 "../../LUFA/Drivers/USB/Class/Device/HID.h"
	.loc 7 201 0
	lds r24,Joystick_HID_Interface+11
	lds r25,Joystick_HID_Interface+11+1
	sbiw r24,0
	breq .L15
	.loc 7 202 0
	sbiw r24,1
	sts Joystick_HID_Interface+11+1,r25
	sts Joystick_HID_Interface+11,r24
.L15:
	ret
.LBE79:
.LBE78:
	.cfi_endproc
.LFE92:
	.size	EVENT_USB_Device_StartOfFrame, .-EVENT_USB_Device_StartOfFrame
	.section	.text.CALLBACK_HID_Device_CreateHIDReport,"ax",@progbits
.global	CALLBACK_HID_Device_CreateHIDReport
	.type	CALLBACK_HID_Device_CreateHIDReport, @function
CALLBACK_HID_Device_CreateHIDReport:
.LFB93:
	.loc 3 185 0
	.cfi_startproc
.LVL18:
	push r14
.LCFI2:
	.cfi_def_cfa_offset 3
	.cfi_offset 14, -2
	push r15
.LCFI3:
	.cfi_def_cfa_offset 4
	.cfi_offset 15, -3
	push r16
.LCFI4:
	.cfi_def_cfa_offset 5
	.cfi_offset 16, -4
	push r17
.LCFI5:
	.cfi_def_cfa_offset 6
	.cfi_offset 17, -5
	push r28
.LCFI6:
	.cfi_def_cfa_offset 7
	.cfi_offset 28, -6
	push r29
.LCFI7:
	.cfi_def_cfa_offset 8
	.cfi_offset 29, -7
/* prologue: function */
/* frame size = 0 */
/* stack size = 6 */
.L__stack_usage = 6
	movw r14,r18
.LBB98:
.LBB99:
.LBB100:
.LBB101:
	.loc 1 111 0
	in r25,__SREG__
.LBE101:
.LBE100:
.LBE99:
.LBE98:
	.loc 3 186 0
	cpi r20,lo8(2)
	brne .L21
.LVL19:
.LBB110:
.LBB108:
.LBB107:
.LBB106:
.LBB102:
.LBB103:
	.loc 2 50 0
/* #APP */
 ;  50 "/usr/lib/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL20:
/* #NOAPP */
.LBE103:
.LBE102:
	.loc 1 113 0
	lds r24,USARTtoUSB_Buffer+132
.LVL21:
.LBB104:
.LBB105:
	.loc 2 70 0
	out __SREG__,r25
	.loc 2 71 0
.LBE105:
.LBE104:
.LBE106:
.LBE107:
.LBE108:
	.loc 3 190 0
	cpi r24,lo8(9)
	brlo .L22
	ldi r28,lo8(joyReportBack)
	ldi r29,hi8(joyReportBack)
.LVL22:
.L24:
.LBB109:
	.loc 3 193 0 discriminator 2
	call RingBuffer_Remove.constprop.4
.LVL23:
	st Y+,r24
.LVL24:
	.loc 3 192 0 discriminator 2
	ldi r24,hi8(joyReportBack+8)
	cpi r28,lo8(joyReportBack+8)
	cpc r29,r24
	brne .L24
	.loc 3 197 0
	call RingBuffer_Remove.constprop.4
.LVL25:
.L22:
.LBE109:
	.loc 3 203 0
	ldi r24,lo8(8)
	ldi r30,lo8(joyReportBack)
	ldi r31,hi8(joyReportBack)
	movw r26,r14
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	.loc 3 204 0
	ldi r24,lo8(8)
	ldi r25,0
	rjmp .L29
.LVL26:
.L21:
.LBE110:
.LBB111:
.LBB112:
.LBB113:
.LBB114:
.LBB115:
.LBB116:
	.loc 2 50 0
/* #APP */
 ;  50 "/usr/lib/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL27:
/* #NOAPP */
.LBE116:
.LBE115:
	.loc 1 113 0
	lds r24,USARTtoUSB_Buffer+132
.LVL28:
.LBB117:
.LBB118:
	.loc 2 70 0
	out __SREG__,r25
	.loc 2 71 0
.LBE118:
.LBE117:
.LBE114:
.LBE113:
.LBE112:
	.loc 3 209 0
	cpi r24,lo8(28)
	brlo .L26
	ldi r28,lo8(joyReport)
	ldi r29,hi8(joyReport)
.LVL29:
.L28:
.LBB119:
	.loc 3 212 0 discriminator 2
	call RingBuffer_Remove.constprop.4
.LVL30:
	st Y+,r24
.LVL31:
	.loc 3 211 0 discriminator 2
	ldi r31,hi8(joyReport+27)
	cpi r28,lo8(joyReport+27)
	cpc r29,r31
	brne .L28
	.loc 3 216 0
	call RingBuffer_Remove.constprop.4
.LVL32:
.L26:
.LBE119:
	.loc 3 222 0
	ldi r24,lo8(27)
	ldi r30,lo8(joyReport)
	ldi r31,hi8(joyReport)
	movw r26,r14
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	.loc 3 223 0
	ldi r24,lo8(27)
	ldi r25,0
.LVL33:
.L29:
	movw r30,r16
	std Z+1,r25
	st Z,r24
.LBE111:
	.loc 3 226 0
	ldi r24,lo8(1)
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
.LVL34:
	pop r15
	pop r14
.LVL35:
	ret
	.cfi_endproc
.LFE93:
	.size	CALLBACK_HID_Device_CreateHIDReport, .-CALLBACK_HID_Device_CreateHIDReport
	.section	.text.CALLBACK_HID_Device_ProcessHIDReport,"ax",@progbits
.global	CALLBACK_HID_Device_ProcessHIDReport
	.type	CALLBACK_HID_Device_ProcessHIDReport, @function
CALLBACK_HID_Device_ProcessHIDReport:
.LFB94:
	.loc 3 241 0
	.cfi_startproc
.LVL36:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ret
	.cfi_endproc
.LFE94:
	.size	CALLBACK_HID_Device_ProcessHIDReport, .-CALLBACK_HID_Device_ProcessHIDReport
	.section	.text.__vector_23,"ax",@progbits
.global	__vector_23
	.type	__vector_23, @function
__vector_23:
.LFB95:
	.loc 3 249 0
	.cfi_startproc
	.loc 3 249 0
	push r1
.LCFI8:
	.cfi_def_cfa_offset 3
	.cfi_offset 1, -2
	push r0
.LCFI9:
	.cfi_def_cfa_offset 4
	.cfi_offset 0, -3
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r18
.LCFI10:
	.cfi_def_cfa_offset 5
	.cfi_offset 18, -4
	push r24
.LCFI11:
	.cfi_def_cfa_offset 6
	.cfi_offset 24, -5
	push r25
.LCFI12:
	.cfi_def_cfa_offset 7
	.cfi_offset 25, -6
	push r30
.LCFI13:
	.cfi_def_cfa_offset 8
	.cfi_offset 30, -7
	push r31
.LCFI14:
	.cfi_def_cfa_offset 9
	.cfi_offset 31, -8
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 8 */
.L__stack_usage = 8
	.loc 3 250 0
	lds r24,206
.LVL37:
	.loc 3 252 0
	in r25,0x1e
	cpi r25,lo8(4)
	brne .L31
.LVL38:
.LBB136:
.LBB137:
.LBB138:
.LBB139:
	.loc 1 111 0
	in r18,__SREG__
.LVL39:
.LBB140:
.LBB141:
	.loc 2 50 0
/* #APP */
 ;  50 "/usr/lib/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL40:
/* #NOAPP */
.LBE141:
.LBE140:
	.loc 1 113 0
	lds r25,USARTtoUSB_Buffer+132
.LVL41:
.LBB142:
.LBB143:
	.loc 2 70 0
	out __SREG__,r18
	.loc 2 71 0
.LBE143:
.LBE142:
.LBE139:
.LBE138:
.LBE137:
.LBE136:
	.loc 3 252 0
	cpi r25,lo8(-128)
	breq .L31
.LVL42:
.LBB144:
.LBB145:
	.loc 1 161 0
	lds r30,USARTtoUSB_Buffer+128
	lds r31,USARTtoUSB_Buffer+128+1
	st Z,r24
	.loc 1 163 0
	lds r30,USARTtoUSB_Buffer+128
	lds r31,USARTtoUSB_Buffer+128+1
	movw r24,r30
.LVL43:
	adiw r24,1
	sts USARTtoUSB_Buffer+128+1,r25
	sts USARTtoUSB_Buffer+128,r24
	subi r24,lo8(USARTtoUSB_Buffer+128)
	sbci r25,hi8(USARTtoUSB_Buffer+128)
.LVL44:
	brne .L35
	.loc 1 164 0
	ldi r24,lo8(USARTtoUSB_Buffer)
	ldi r25,hi8(USARTtoUSB_Buffer)
	std Z+2,r25
	std Z+1,r24
.L35:
.LBB146:
	.loc 1 166 0
	in r25,__SREG__
.LVL45:
.LBB147:
.LBB148:
	.loc 2 50 0
/* #APP */
 ;  50 "/usr/lib/avr/include/util/atomic.h" 1
	cli
 ;  0 "" 2
.LVL46:
/* #NOAPP */
.LBE148:
.LBE147:
	.loc 1 168 0
	lds r24,USARTtoUSB_Buffer+132
	subi r24,lo8(-(1))
	sts USARTtoUSB_Buffer+132,r24
.LVL47:
.LBB149:
.LBB150:
	.loc 2 70 0
	out __SREG__,r25
	.loc 2 71 0
.LVL48:
.L31:
/* epilogue start */
.LBE150:
.LBE149:
.LBE146:
.LBE145:
.LBE144:
	.loc 3 256 0
	pop r31
	pop r30
	pop r25
	pop r24
	pop r18
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
	.cfi_endproc
.LFE95:
	.size	__vector_23, .-__vector_23
.global	led1_ticks
	.section .bss
	.type	led1_ticks, @object
	.size	led1_ticks, 2
led1_ticks:
	.zero	2
.global	joyReportBack
	.data
	.type	joyReportBack, @object
	.size	joyReportBack, 8
joyReportBack:
	.byte	33
	.byte	38
	.byte	1
	.byte	6
	.byte	0
	.byte	0
	.byte	0
	.byte	0
.global	joyReport
	.type	joyReport, @object
	.size	joyReport, 27
joyReport:
	.byte	0
	.byte	0
	.byte	8
	.byte	-128
	.byte	127
	.byte	-128
	.byte	127
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	2
	.byte	0
	.byte	2
	.comm	USARTtoUSB_Buffer,133,1
.global	Joystick_HID_Interface
	.type	Joystick_HID_Interface, @object
	.size	Joystick_HID_Interface, 13
Joystick_HID_Interface:
	.byte	0
	.byte	1
	.word	64
	.byte	0
	.word	PrevJoystickHIDReportBuffer
	.byte	27
	.zero	5
	.comm	PrevJoystickHIDReportBuffer,27,1
	.text
.Letext0:
	.file 8 "/usr/lib/avr/include/stdint.h"
	.file 9 "Arduino-joystick.h"
	.file 10 "../../LUFA/Drivers/USB/HighLevel/../LowLevel/USBController.h"
	.file 11 "../../LUFA/Drivers/USB/HighLevel/USBTask.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xc6e
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF81
	.byte	0x1
	.long	.LASF82
	.long	.LASF83
	.long	.Ldebug_ranges0+0x30
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x8
	.byte	0x7a
	.long	0x3b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF3
	.byte	0x8
	.byte	0x7c
	.long	0x54
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.long	.LASF6
	.byte	0x8
	.byte	0x7e
	.long	0x6d
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF9
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.long	.LASF84
	.byte	0x1
	.byte	0x6
	.byte	0x72
	.long	0xba
	.uleb128 0x6
	.long	.LASF11
	.sleb128 0
	.uleb128 0x6
	.long	.LASF12
	.sleb128 1
	.uleb128 0x6
	.long	.LASF13
	.sleb128 2
	.uleb128 0x6
	.long	.LASF14
	.sleb128 3
	.uleb128 0x6
	.long	.LASF15
	.sleb128 4
	.uleb128 0x6
	.long	.LASF16
	.sleb128 5
	.byte	0
	.uleb128 0x7
	.byte	0x2
	.uleb128 0x8
	.byte	0x8
	.byte	0x7
	.byte	0x56
	.long	0x119
	.uleb128 0x9
	.long	.LASF17
	.byte	0x7
	.byte	0x58
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF18
	.byte	0x7
	.byte	0x5a
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x9
	.long	.LASF19
	.byte	0x7
	.byte	0x5b
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x9
	.long	.LASF20
	.byte	0x7
	.byte	0x5c
	.long	0x119
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF21
	.byte	0x7
	.byte	0x5e
	.long	0xba
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x9
	.long	.LASF22
	.byte	0x7
	.byte	0x6a
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF23
	.uleb128 0x8
	.byte	0x5
	.byte	0x7
	.byte	0x73
	.long	0x153
	.uleb128 0x9
	.long	.LASF24
	.byte	0x7
	.byte	0x75
	.long	0x119
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF25
	.byte	0x7
	.byte	0x76
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x9
	.long	.LASF26
	.byte	0x7
	.byte	0x77
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0
	.uleb128 0x8
	.byte	0xd
	.byte	0x7
	.byte	0x54
	.long	0x178
	.uleb128 0x9
	.long	.LASF27
	.byte	0x7
	.byte	0x70
	.long	0x178
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF28
	.byte	0x7
	.byte	0x79
	.long	0x120
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0xa
	.long	0xbc
	.uleb128 0x3
	.long	.LASF29
	.byte	0x7
	.byte	0x7c
	.long	0x153
	.uleb128 0x8
	.byte	0x85
	.byte	0x1
	.byte	0x46
	.long	0x1cb
	.uleb128 0x9
	.long	.LASF30
	.byte	0x1
	.byte	0x48
	.long	0x1cb
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xb
	.string	"In"
	.byte	0x1
	.byte	0x49
	.long	0x1db
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0xb
	.string	"Out"
	.byte	0x1
	.byte	0x4a
	.long	0x1db
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0x9
	.long	.LASF31
	.byte	0x1
	.byte	0x4b
	.long	0x30
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.byte	0
	.uleb128 0xc
	.long	0x30
	.long	0x1db
	.uleb128 0xd
	.long	0x82
	.byte	0x7f
	.byte	0
	.uleb128 0xe
	.byte	0x2
	.long	0x30
	.uleb128 0x3
	.long	.LASF32
	.byte	0x1
	.byte	0x4c
	.long	0x188
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF33
	.uleb128 0x8
	.byte	0x1b
	.byte	0x9
	.byte	0x3a
	.long	0x365
	.uleb128 0x9
	.long	.LASF34
	.byte	0x9
	.byte	0x3b
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF35
	.byte	0x9
	.byte	0x3c
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xb
	.string	"hat"
	.byte	0x9
	.byte	0x3d
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xb
	.string	"x"
	.byte	0x9
	.byte	0x3e
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xb
	.string	"y"
	.byte	0x9
	.byte	0x3f
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.string	"z"
	.byte	0x9
	.byte	0x40
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xb
	.string	"r"
	.byte	0x9
	.byte	0x41
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xb
	.string	"e1"
	.byte	0x9
	.byte	0x43
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0xb
	.string	"e2"
	.byte	0x9
	.byte	0x44
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.string	"e3"
	.byte	0x9
	.byte	0x45
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xb
	.string	"e4"
	.byte	0x9
	.byte	0x46
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xb
	.string	"e5"
	.byte	0x9
	.byte	0x47
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0xb
	.string	"e6"
	.byte	0x9
	.byte	0x48
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xb
	.string	"e7"
	.byte	0x9
	.byte	0x49
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0xd
	.uleb128 0xb
	.string	"e8"
	.byte	0x9
	.byte	0x4a
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xb
	.string	"e9"
	.byte	0x9
	.byte	0x4b
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.uleb128 0xb
	.string	"e10"
	.byte	0x9
	.byte	0x4c
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xb
	.string	"e11"
	.byte	0x9
	.byte	0x4d
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x11
	.uleb128 0xb
	.string	"e12"
	.byte	0x9
	.byte	0x4e
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xb
	.string	"e13"
	.byte	0x9
	.byte	0x4f
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0xb
	.string	"e14"
	.byte	0x9
	.byte	0x50
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xb
	.string	"e15"
	.byte	0x9
	.byte	0x51
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0xb
	.string	"e16"
	.byte	0x9
	.byte	0x52
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0xb
	.string	"e17"
	.byte	0x9
	.byte	0x53
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x17
	.uleb128 0xb
	.string	"e18"
	.byte	0x9
	.byte	0x54
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xb
	.string	"e19"
	.byte	0x9
	.byte	0x55
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xb
	.string	"e20"
	.byte	0x9
	.byte	0x56
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.byte	0
	.uleb128 0x3
	.long	.LASF36
	.byte	0x9
	.byte	0x57
	.long	0x1f3
	.uleb128 0x8
	.byte	0x8
	.byte	0x9
	.byte	0x59
	.long	0x3e1
	.uleb128 0xb
	.string	"e1"
	.byte	0x9
	.byte	0x5a
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xb
	.string	"e2"
	.byte	0x9
	.byte	0x5b
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xb
	.string	"e3"
	.byte	0x9
	.byte	0x5c
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xb
	.string	"e4"
	.byte	0x9
	.byte	0x5d
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xb
	.string	"e5"
	.byte	0x9
	.byte	0x5e
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.string	"e6"
	.byte	0x9
	.byte	0x5f
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xb
	.string	"e7"
	.byte	0x9
	.byte	0x60
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xb
	.string	"e8"
	.byte	0x9
	.byte	0x61
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.byte	0
	.uleb128 0x3
	.long	.LASF37
	.byte	0x9
	.byte	0x62
	.long	0x370
	.uleb128 0xf
	.long	.LASF40
	.byte	0x2
	.byte	0x44
	.byte	0x1
	.byte	0x3
	.long	0x405
	.uleb128 0x10
	.string	"__s"
	.byte	0x2
	.byte	0x44
	.long	0x405
	.byte	0
	.uleb128 0xe
	.byte	0x2
	.long	0x40b
	.uleb128 0xa
	.long	0x30
	.uleb128 0x11
	.long	.LASF85
	.byte	0x2
	.byte	0x30
	.byte	0x1
	.long	0x30
	.byte	0x3
	.uleb128 0x12
	.long	.LASF44
	.byte	0x1
	.byte	0x6b
	.byte	0x1
	.long	0x30
	.byte	0x3
	.long	0x45d
	.uleb128 0x13
	.long	.LASF30
	.byte	0x1
	.byte	0x6b
	.long	0x45d
	.uleb128 0x14
	.long	.LASF31
	.byte	0x1
	.byte	0x6d
	.long	0x30
	.uleb128 0x15
	.uleb128 0x14
	.long	.LASF38
	.byte	0x1
	.byte	0x6f
	.long	0x30
	.uleb128 0x14
	.long	.LASF39
	.byte	0x1
	.byte	0x6f
	.long	0x30
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x462
	.uleb128 0xe
	.byte	0x2
	.long	0x1e1
	.uleb128 0x16
	.long	.LASF54
	.byte	0x6
	.byte	0x94
	.byte	0x1
	.byte	0x3
	.uleb128 0xf
	.long	.LASF41
	.byte	0x7
	.byte	0xc7
	.byte	0x1
	.byte	0x3
	.long	0x48a
	.uleb128 0x13
	.long	.LASF42
	.byte	0x7
	.byte	0xc7
	.long	0x48a
	.byte	0
	.uleb128 0xa
	.long	0x48f
	.uleb128 0xe
	.byte	0x2
	.long	0x17d
	.uleb128 0xf
	.long	.LASF43
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.byte	0x3
	.long	0x4c6
	.uleb128 0x13
	.long	.LASF30
	.byte	0x1
	.byte	0x55
	.long	0x45d
	.uleb128 0x15
	.uleb128 0x14
	.long	.LASF38
	.byte	0x1
	.byte	0x57
	.long	0x30
	.uleb128 0x14
	.long	.LASF39
	.byte	0x1
	.byte	0x57
	.long	0x30
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	.LASF45
	.byte	0x1
	.byte	0x7f
	.byte	0x1
	.long	0x119
	.byte	0x3
	.long	0x4e3
	.uleb128 0x13
	.long	.LASF30
	.byte	0x1
	.byte	0x7f
	.long	0x45d
	.byte	0
	.uleb128 0xf
	.long	.LASF46
	.byte	0x1
	.byte	0x9e
	.byte	0x1
	.byte	0x3
	.long	0x51f
	.uleb128 0x13
	.long	.LASF30
	.byte	0x1
	.byte	0x9e
	.long	0x45d
	.uleb128 0x13
	.long	.LASF47
	.byte	0x1
	.byte	0x9f
	.long	0x40b
	.uleb128 0x15
	.uleb128 0x14
	.long	.LASF38
	.byte	0x1
	.byte	0xa6
	.long	0x30
	.uleb128 0x14
	.long	.LASF39
	.byte	0x1
	.byte	0xa6
	.long	0x30
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	.LASF48
	.byte	0x1
	.byte	0xb6
	.byte	0x1
	.long	0x30
	.byte	0x3
	.long	0x55f
	.uleb128 0x13
	.long	.LASF30
	.byte	0x1
	.byte	0xb6
	.long	0x45d
	.uleb128 0x14
	.long	.LASF47
	.byte	0x1
	.byte	0xb8
	.long	0x30
	.uleb128 0x15
	.uleb128 0x14
	.long	.LASF38
	.byte	0x1
	.byte	0xbd
	.long	0x30
	.uleb128 0x14
	.long	.LASF39
	.byte	0x1
	.byte	0xbd
	.long	0x30
	.byte	0
	.byte	0
	.uleb128 0xf
	.long	.LASF49
	.byte	0x5
	.byte	0x4e
	.byte	0x1
	.byte	0x3
	.long	0x578
	.uleb128 0x13
	.long	.LASF50
	.byte	0x5
	.byte	0x4e
	.long	0x40b
	.byte	0
	.uleb128 0xf
	.long	.LASF51
	.byte	0x4
	.byte	0x63
	.byte	0x1
	.byte	0x3
	.long	0x59c
	.uleb128 0x13
	.long	.LASF52
	.byte	0x4
	.byte	0x63
	.long	0x59c
	.uleb128 0x13
	.long	.LASF53
	.byte	0x4
	.byte	0x64
	.long	0x5a1
	.byte	0
	.uleb128 0xa
	.long	0x62
	.uleb128 0xa
	.long	0x119
	.uleb128 0x17
	.long	0x51f
	.long	.LFB101
	.long	.LFE101
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x615
	.uleb128 0x18
	.long	0x53b
	.byte	0x1
	.byte	0x68
	.uleb128 0x19
	.long	0x530
	.byte	0x6
	.byte	0x3
	.long	USARTtoUSB_Buffer
	.byte	0x9f
	.uleb128 0x1a
	.long	.LBB46
	.long	.LBE46
	.uleb128 0x18
	.long	0x547
	.byte	0x1
	.byte	0x62
	.uleb128 0x1b
	.long	0x552
	.long	.LLST0
	.uleb128 0x1c
	.long	0x410
	.long	.LBB47
	.long	.LBE47
	.byte	0x1
	.byte	0xbd
	.uleb128 0x1d
	.long	0x3ec
	.long	.LBB49
	.long	.LBE49
	.byte	0x1
	.byte	0xbd
	.uleb128 0x19
	.long	0x3f9
	.byte	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1496
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
	.long	.LASF55
	.byte	0x5
	.byte	0x43
	.byte	0x1
	.byte	0x3
	.uleb128 0x1e
	.byte	0x1
	.long	.LASF58
	.byte	0x3
	.byte	0x7c
	.byte	0x1
	.long	.LFB87
	.long	.LFE87
	.long	.LLST1
	.byte	0x1
	.long	0x674
	.uleb128 0x1f
	.long	0x578
	.long	.LBB55
	.long	.LBE55
	.byte	0x3
	.byte	0x83
	.long	0x65b
	.uleb128 0x20
	.long	0x585
	.long	0x1c200
	.uleb128 0x21
	.long	0x590
	.byte	0x1
	.byte	0
	.uleb128 0x1c
	.long	0x615
	.long	.LBB57
	.long	.LBE57
	.byte	0x3
	.byte	0x84
	.uleb128 0x22
	.long	.LVL6
	.long	0xc20
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF62
	.byte	0x3
	.byte	0x65
	.byte	0x1
	.long	0x42
	.long	.LFB86
	.long	.LFE86
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x742
	.uleb128 0x1f
	.long	0x495
	.long	.LBB68
	.long	.LBE68
	.byte	0x3
	.byte	0x69
	.long	0x6f9
	.uleb128 0x19
	.long	0x4a2
	.byte	0x6
	.byte	0x3
	.long	USARTtoUSB_Buffer
	.byte	0x9f
	.uleb128 0x1a
	.long	.LBB69
	.long	.LBE69
	.uleb128 0x1b
	.long	0x4ae
	.long	.LLST2
	.uleb128 0x1b
	.long	0x4b9
	.long	.LLST3
	.uleb128 0x1c
	.long	0x410
	.long	.LBB70
	.long	.LBE70
	.byte	0x1
	.byte	0x57
	.uleb128 0x1d
	.long	0x3ec
	.long	.LBB72
	.long	.LBE72
	.byte	0x1
	.byte	0x57
	.uleb128 0x19
	.long	0x3f9
	.byte	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1722
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	0x55f
	.long	.LBB74
	.long	.LBE74
	.byte	0x3
	.byte	0x75
	.long	0x713
	.uleb128 0x21
	.long	0x56c
	.byte	0x20
	.byte	0
	.uleb128 0x22
	.long	.LVL7
	.long	0x61e
	.uleb128 0x24
	.long	.LVL12
	.long	0xc2b
	.long	0x738
	.uleb128 0x25
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	Joystick_HID_Interface
	.byte	0
	.uleb128 0x22
	.long	.LVL13
	.long	0xc3f
	.byte	0
	.uleb128 0x26
	.byte	0x1
	.long	.LASF56
	.byte	0x3
	.byte	0x8b
	.byte	0x1
	.long	.LFB88
	.long	.LFE88
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x26
	.byte	0x1
	.long	.LASF57
	.byte	0x3
	.byte	0x91
	.byte	0x1
	.long	.LFB89
	.long	.LFE89
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.uleb128 0x27
	.byte	0x1
	.long	.LASF59
	.byte	0x3
	.byte	0x96
	.byte	0x1
	.long	.LFB90
	.long	.LFE90
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x7b0
	.uleb128 0x1c
	.long	0x468
	.long	.LBB76
	.long	.LBE76
	.byte	0x3
	.byte	0x9a
	.uleb128 0x28
	.long	.LVL15
	.long	0xc49
	.uleb128 0x25
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	Joystick_HID_Interface
	.byte	0
	.byte	0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF60
	.byte	0x3
	.byte	0x9e
	.byte	0x1
	.long	.LFB91
	.long	.LFE91
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x7e4
	.uleb128 0x29
	.long	.LVL16
	.byte	0x1
	.long	0xc61
	.uleb128 0x25
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x3
	.long	Joystick_HID_Interface
	.byte	0
	.byte	0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF61
	.byte	0x3
	.byte	0xa4
	.byte	0x1
	.long	.LFB92
	.long	.LFE92
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x81b
	.uleb128 0x1d
	.long	0x471
	.long	.LBB78
	.long	.LBE78
	.byte	0x3
	.byte	0xa6
	.uleb128 0x19
	.long	0x47e
	.byte	0x6
	.byte	0x3
	.long	Joystick_HID_Interface
	.byte	0x9f
	.byte	0
	.byte	0
	.uleb128 0x2a
	.byte	0x1
	.long	.LASF63
	.byte	0x3
	.byte	0xb3
	.byte	0x1
	.long	0x119
	.long	.LFB93
	.long	.LFE93
	.long	.LLST4
	.byte	0x1
	.long	0x9fb
	.uleb128 0x2b
	.long	.LASF42
	.byte	0x3
	.byte	0xb4
	.long	0x48a
	.long	.LLST5
	.uleb128 0x2b
	.long	.LASF64
	.byte	0x3
	.byte	0xb5
	.long	0x9fb
	.long	.LLST6
	.uleb128 0x2b
	.long	.LASF65
	.byte	0x3
	.byte	0xb6
	.long	0x40b
	.long	.LLST7
	.uleb128 0x2b
	.long	.LASF66
	.byte	0x3
	.byte	0xb7
	.long	0xba
	.long	.LLST8
	.uleb128 0x2b
	.long	.LASF67
	.byte	0x3
	.byte	0xb8
	.long	0xa00
	.long	.LLST9
	.uleb128 0x2c
	.long	.Ldebug_ranges0+0
	.long	0x93b
	.uleb128 0x2d
	.long	.LASF69
	.byte	0x3
	.byte	0xbb
	.long	0xa0b
	.long	.LLST10
	.uleb128 0x14
	.long	.LASF68
	.byte	0x3
	.byte	0xbc
	.long	0x30
	.uleb128 0x2e
	.long	0x41d
	.long	.LBB99
	.long	.Ldebug_ranges0+0x18
	.byte	0x3
	.byte	0xbc
	.long	0x90f
	.uleb128 0x2f
	.long	0x42e
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x18
	.uleb128 0x1b
	.long	0x439
	.long	.LLST11
	.uleb128 0x30
	.long	.Ldebug_ranges0+0x18
	.uleb128 0x1b
	.long	0x445
	.long	.LLST12
	.uleb128 0x1b
	.long	0x450
	.long	.LLST13
	.uleb128 0x1c
	.long	0x410
	.long	.LBB102
	.long	.LBE102
	.byte	0x1
	.byte	0x6f
	.uleb128 0x1d
	.long	0x3ec
	.long	.LBB104
	.long	.LBE104
	.byte	0x1
	.byte	0x6f
	.uleb128 0x31
	.long	0x3f9
	.long	.LLST14
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	.LBB109
	.long	.LBE109
	.uleb128 0x32
	.string	"ind"
	.byte	0x3
	.byte	0xbf
	.long	0x30
	.long	.LLST15
	.uleb128 0x22
	.long	.LVL23
	.long	0x5a6
	.uleb128 0x22
	.long	.LVL25
	.long	0x5a6
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	.LBB111
	.long	.LBE111
	.uleb128 0x2d
	.long	.LASF69
	.byte	0x3
	.byte	0xce
	.long	0xa11
	.long	.LLST16
	.uleb128 0x14
	.long	.LASF68
	.byte	0x3
	.byte	0xcf
	.long	0x30
	.uleb128 0x1f
	.long	0x41d
	.long	.LBB112
	.long	.LBE112
	.byte	0x3
	.byte	0xcf
	.long	0x9ce
	.uleb128 0x2f
	.long	0x42e
	.uleb128 0x1a
	.long	.LBB113
	.long	.LBE113
	.uleb128 0x1b
	.long	0x439
	.long	.LLST17
	.uleb128 0x1a
	.long	.LBB114
	.long	.LBE114
	.uleb128 0x1b
	.long	0x445
	.long	.LLST18
	.uleb128 0x1b
	.long	0x450
	.long	.LLST19
	.uleb128 0x1c
	.long	0x410
	.long	.LBB115
	.long	.LBE115
	.byte	0x1
	.byte	0x6f
	.uleb128 0x1d
	.long	0x3ec
	.long	.LBB117
	.long	.LBE117
	.byte	0x1
	.byte	0x6f
	.uleb128 0x31
	.long	0x3f9
	.long	.LLST20
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.long	.LBB119
	.long	.LBE119
	.uleb128 0x32
	.string	"ind"
	.byte	0x3
	.byte	0xd2
	.long	0x30
	.long	.LLST21
	.uleb128 0x22
	.long	.LVL30
	.long	0x5a6
	.uleb128 0x22
	.long	.LVL32
	.long	0x5a6
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x1db
	.uleb128 0xa
	.long	0xa05
	.uleb128 0xe
	.byte	0x2
	.long	0x49
	.uleb128 0xe
	.byte	0x2
	.long	0x3e1
	.uleb128 0xe
	.byte	0x2
	.long	0x365
	.uleb128 0x27
	.byte	0x1
	.long	.LASF70
	.byte	0x3
	.byte	0xec
	.byte	0x1
	.long	.LFB94
	.long	.LFE94
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0xa82
	.uleb128 0x33
	.long	.LASF42
	.byte	0x3
	.byte	0xec
	.long	0x48a
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x33
	.long	.LASF64
	.byte	0x3
	.byte	0xed
	.long	0x40b
	.byte	0x1
	.byte	0x66
	.uleb128 0x33
	.long	.LASF65
	.byte	0x3
	.byte	0xee
	.long	0x40b
	.byte	0x1
	.byte	0x64
	.uleb128 0x33
	.long	.LASF66
	.byte	0x3
	.byte	0xef
	.long	0xa82
	.byte	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x33
	.long	.LASF67
	.byte	0x3
	.byte	0xf0
	.long	0xa89
	.byte	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.byte	0
	.uleb128 0xe
	.byte	0x2
	.long	0xa88
	.uleb128 0x34
	.uleb128 0xa
	.long	0x49
	.uleb128 0x1e
	.byte	0x1
	.long	.LASF71
	.byte	0x3
	.byte	0xf8
	.byte	0x1
	.long	.LFB95
	.long	.LFE95
	.long	.LLST22
	.byte	0x1
	.long	0xb9f
	.uleb128 0x2d
	.long	.LASF72
	.byte	0x3
	.byte	0xfa
	.long	0x30
	.long	.LLST23
	.uleb128 0x1f
	.long	0x4c6
	.long	.LBB136
	.long	.LBE136
	.byte	0x3
	.byte	0xfd
	.long	0xb3c
	.uleb128 0x2f
	.long	0x4d7
	.uleb128 0x1d
	.long	0x41d
	.long	.LBB137
	.long	.LBE137
	.byte	0x1
	.byte	0x81
	.uleb128 0x2f
	.long	0x42e
	.uleb128 0x1a
	.long	.LBB138
	.long	.LBE138
	.uleb128 0x1b
	.long	0x439
	.long	.LLST24
	.uleb128 0x1a
	.long	.LBB139
	.long	.LBE139
	.uleb128 0x1b
	.long	0x445
	.long	.LLST25
	.uleb128 0x1b
	.long	0x450
	.long	.LLST26
	.uleb128 0x1c
	.long	0x410
	.long	.LBB140
	.long	.LBE140
	.byte	0x1
	.byte	0x6f
	.uleb128 0x1d
	.long	0x3ec
	.long	.LBB142
	.long	.LBE142
	.byte	0x1
	.byte	0x6f
	.uleb128 0x31
	.long	0x3f9
	.long	.LLST27
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1d
	.long	0x4e3
	.long	.LBB144
	.long	.LBE144
	.byte	0x3
	.byte	0xfe
	.uleb128 0x2f
	.long	0x4f0
	.uleb128 0x31
	.long	0x4fb
	.long	.LLST28
	.uleb128 0x1a
	.long	.LBB146
	.long	.LBE146
	.uleb128 0x1b
	.long	0x507
	.long	.LLST29
	.uleb128 0x1b
	.long	0x512
	.long	.LLST30
	.uleb128 0x1c
	.long	0x410
	.long	.LBB147
	.long	.LBE147
	.byte	0x1
	.byte	0xa6
	.uleb128 0x1d
	.long	0x3ec
	.long	.LBB149
	.long	.LBE149
	.byte	0x1
	.byte	0xa6
	.uleb128 0x31
	.long	0x3f9
	.long	.LLST31
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x30
	.long	0xbaf
	.uleb128 0xd
	.long	0x82
	.byte	0x1a
	.byte	0
	.uleb128 0x35
	.long	.LASF73
	.byte	0x3
	.byte	0x41
	.long	0xb9f
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	PrevJoystickHIDReportBuffer
	.uleb128 0x35
	.long	.LASF74
	.byte	0x3
	.byte	0x47
	.long	0x17d
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	Joystick_HID_Interface
	.uleb128 0x35
	.long	.LASF75
	.byte	0x3
	.byte	0x5a
	.long	0x1e1
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	USARTtoUSB_Buffer
	.uleb128 0x35
	.long	.LASF76
	.byte	0x3
	.byte	0x5c
	.long	0x365
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	joyReport
	.uleb128 0x35
	.long	.LASF77
	.byte	0x3
	.byte	0x5d
	.long	0x3e1
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	joyReportBack
	.uleb128 0x35
	.long	.LASF78
	.byte	0x3
	.byte	0x60
	.long	0xc1b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	led1_ticks
	.uleb128 0x36
	.long	0x42
	.uleb128 0x37
	.byte	0x1
	.long	.LASF79
	.byte	0xa
	.word	0x123
	.byte	0x1
	.byte	0x1
	.uleb128 0x38
	.byte	0x1
	.long	.LASF86
	.byte	0x7
	.byte	0x95
	.byte	0x1
	.byte	0x1
	.long	0xc3f
	.uleb128 0x39
	.long	0x48a
	.byte	0
	.uleb128 0x3a
	.byte	0x1
	.long	.LASF80
	.byte	0xb
	.byte	0xb2
	.byte	0x1
	.byte	0x1
	.uleb128 0x3b
	.byte	0x1
	.long	.LASF87
	.byte	0x7
	.byte	0x87
	.byte	0x1
	.long	0x119
	.byte	0x1
	.long	0xc61
	.uleb128 0x39
	.long	0x48a
	.byte	0
	.uleb128 0x3c
	.byte	0x1
	.long	.LASF88
	.byte	0x7
	.byte	0x8e
	.byte	0x1
	.byte	0x1
	.uleb128 0x39
	.long	0x48a
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x1d
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0xc
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LVL3
	.long	.LVL4
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL4
	.long	.LFE101
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST1:
	.long	.LFB87
	.long	.LCFI0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI0
	.long	.LCFI1
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI1
	.long	.LFE87
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
.LLST2:
	.long	.LVL8
	.long	.LVL11
	.word	0x1
	.byte	0x62
	.long	0
	.long	0
.LLST3:
	.long	.LVL9
	.long	.LVL10
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL10
	.long	.LFE86
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST4:
	.long	.LFB93
	.long	.LCFI2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI2
	.long	.LCFI3
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI3
	.long	.LCFI4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI4
	.long	.LCFI5
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI5
	.long	.LCFI6
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI6
	.long	.LCFI7
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI7
	.long	.LFE93
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
	.long	0
	.long	0
.LLST5:
	.long	.LVL18
	.long	.LVL21
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL21
	.long	.LVL26
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	.LVL26
	.long	.LVL28
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL28
	.long	.LFE93
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST6:
	.long	.LVL18
	.long	.LVL22
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL22
	.long	.LVL26
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x66
	.byte	0x9f
	.long	.LVL26
	.long	.LVL29
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL29
	.long	.LFE93
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x66
	.byte	0x9f
	.long	0
	.long	0
.LLST7:
	.long	.LVL18
	.long	.LVL22
	.word	0x1
	.byte	0x64
	.long	.LVL22
	.long	.LVL26
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x64
	.byte	0x9f
	.long	.LVL26
	.long	.LVL29
	.word	0x1
	.byte	0x64
	.long	.LVL29
	.long	.LFE93
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x64
	.byte	0x9f
	.long	0
	.long	0
.LLST8:
	.long	.LVL18
	.long	.LVL22
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL22
	.long	.LVL35
	.word	0x6
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL35
	.long	.LFE93
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x62
	.byte	0x9f
	.long	0
	.long	0
.LLST9:
	.long	.LVL18
	.long	.LVL34
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL34
	.long	.LFE93
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST10:
	.long	.LVL19
	.long	.LVL22
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL22
	.long	.LVL26
	.word	0x6
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST11:
	.long	.LVL21
	.long	.LVL22
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST12:
	.long	.LVL19
	.long	.LVL22
	.word	0x1
	.byte	0x69
	.long	0
	.long	0
.LLST13:
	.long	.LVL20
	.long	.LVL21
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL21
	.long	.LVL26
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST14:
	.long	.LVL21
	.long	.LVL26
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2258
	.sleb128 0
	.long	0
	.long	0
.LLST15:
	.long	.LVL22
	.long	.LVL25
	.word	0x9
	.byte	0x8c
	.sleb128 0
	.byte	0x3
	.long	joyReportBack
	.byte	0x1c
	.byte	0x9f
	.long	0
	.long	0
.LLST16:
	.long	.LVL26
	.long	.LVL33
	.word	0x6
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST17:
	.long	.LVL28
	.long	.LVL29
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST18:
	.long	.LVL26
	.long	.LVL29
	.word	0x1
	.byte	0x69
	.long	0
	.long	0
.LLST19:
	.long	.LVL27
	.long	.LVL28
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL28
	.long	.LVL33
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST20:
	.long	.LVL28
	.long	.LVL33
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2449
	.sleb128 0
	.long	0
	.long	0
.LLST21:
	.long	.LVL29
	.long	.LVL32
	.word	0x9
	.byte	0x8c
	.sleb128 0
	.byte	0x3
	.long	joyReport
	.byte	0x1c
	.byte	0x9f
	.long	0
	.long	0
.LLST22:
	.long	.LFB95
	.long	.LCFI8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI8
	.long	.LCFI9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI9
	.long	.LCFI10
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI10
	.long	.LCFI11
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI11
	.long	.LCFI12
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI12
	.long	.LCFI13
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI13
	.long	.LCFI14
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
	.long	.LCFI14
	.long	.LFE95
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 9
	.long	0
	.long	0
.LLST23:
	.long	.LVL37
	.long	.LVL43
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST24:
	.long	.LVL41
	.long	.LVL45
	.word	0x1
	.byte	0x69
	.long	0
	.long	0
.LLST25:
	.long	.LVL39
	.long	.LVL44
	.word	0x1
	.byte	0x62
	.long	0
	.long	0
.LLST26:
	.long	.LVL40
	.long	.LVL41
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL41
	.long	.LVL48
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST27:
	.long	.LVL41
	.long	.LVL47
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2814
	.sleb128 0
	.long	.LVL47
	.long	.LVL48
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2914
	.sleb128 0
	.long	0
	.long	0
.LLST28:
	.long	.LVL42
	.long	.LVL43
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST29:
	.long	.LVL45
	.long	.LVL48
	.word	0x1
	.byte	0x69
	.long	0
	.long	0
.LLST30:
	.long	.LVL46
	.long	.LVL47
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL47
	.long	.LVL48
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST31:
	.long	.LVL47
	.long	.LVL48
	.word	0x6
	.byte	0xf2
	.long	.Ldebug_info0+2914
	.sleb128 0
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x6c
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.LFB101
	.long	.LFE101-.LFB101
	.long	.LFB87
	.long	.LFE87-.LFB87
	.long	.LFB86
	.long	.LFE86-.LFB86
	.long	.LFB88
	.long	.LFE88-.LFB88
	.long	.LFB89
	.long	.LFE89-.LFB89
	.long	.LFB90
	.long	.LFE90-.LFB90
	.long	.LFB91
	.long	.LFE91-.LFB91
	.long	.LFB92
	.long	.LFE92-.LFB92
	.long	.LFB93
	.long	.LFE93-.LFB93
	.long	.LFB94
	.long	.LFE94-.LFB94
	.long	.LFB95
	.long	.LFE95-.LFB95
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LBB98
	.long	.LBE98
	.long	.LBB110
	.long	.LBE110
	.long	0
	.long	0
	.long	.LBB99
	.long	.LBE99
	.long	.LBB108
	.long	.LBE108
	.long	0
	.long	0
	.long	.LFB101
	.long	.LFE101
	.long	.LFB87
	.long	.LFE87
	.long	.LFB86
	.long	.LFE86
	.long	.LFB88
	.long	.LFE88
	.long	.LFB89
	.long	.LFE89
	.long	.LFB90
	.long	.LFE90
	.long	.LFB91
	.long	.LFE91
	.long	.LFB92
	.long	.LFE92
	.long	.LFB93
	.long	.LFE93
	.long	.LFB94
	.long	.LFE94
	.long	.LFB95
	.long	.LFE95
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF78:
	.string	"led1_ticks"
.LASF71:
	.string	"__vector_23"
.LASF27:
	.string	"Config"
.LASF29:
	.string	"USB_ClassInfo_HID_Device_t"
.LASF81:
	.string	"GNU C 4.8.1 -mmcu=atmega8u2 -gdwarf-2 -Os -std=gnu99 -funsigned-char -funsigned-bitfields -ffunction-sections -fno-inline-small-functions -fpack-struct -fshort-enums -fno-strict-aliasing"
.LASF75:
	.string	"USARTtoUSB_Buffer"
.LASF34:
	.string	"buttons"
.LASF10:
	.string	"sizetype"
.LASF60:
	.string	"EVENT_USB_Device_UnhandledControlRequest"
.LASF52:
	.string	"BaudRate"
.LASF35:
	.string	"buttons2"
.LASF62:
	.string	"main"
.LASF66:
	.string	"ReportData"
.LASF36:
	.string	"USB_JoystickReport_Data_t"
.LASF11:
	.string	"DEVICE_STATE_Unattached"
.LASF18:
	.string	"ReportINEndpointNumber"
.LASF2:
	.string	"uint8_t"
.LASF53:
	.string	"DoubleSpeed"
.LASF63:
	.string	"CALLBACK_HID_Device_CreateHIDReport"
.LASF87:
	.string	"HID_Device_ConfigureEndpoints"
.LASF6:
	.string	"uint32_t"
.LASF42:
	.string	"HIDInterfaceInfo"
.LASF22:
	.string	"PrevReportINBufferSize"
.LASF56:
	.string	"EVENT_USB_Device_Connect"
.LASF68:
	.string	"BufferCount"
.LASF38:
	.string	"sreg_save"
.LASF17:
	.string	"InterfaceNumber"
.LASF57:
	.string	"EVENT_USB_Device_Disconnect"
.LASF8:
	.string	"long long int"
.LASF28:
	.string	"State"
.LASF88:
	.string	"HID_Device_ProcessControlRequest"
.LASF5:
	.string	"long int"
.LASF82:
	.string	"Arduino-joystick.c"
.LASF24:
	.string	"UsingReportProtocol"
.LASF19:
	.string	"ReportINEndpointSize"
.LASF41:
	.string	"HID_Device_MillisecondElapsed"
.LASF43:
	.string	"RingBuffer_InitBuffer"
.LASF69:
	.string	"reportp"
.LASF20:
	.string	"ReportINEndpointDoubleBank"
.LASF21:
	.string	"PrevReportINBuffer"
.LASF65:
	.string	"ReportType"
.LASF1:
	.string	"unsigned char"
.LASF39:
	.string	"__ToDo"
.LASF40:
	.string	"__iRestore"
.LASF0:
	.string	"signed char"
.LASF74:
	.string	"Joystick_HID_Interface"
.LASF9:
	.string	"long long unsigned int"
.LASF4:
	.string	"unsigned int"
.LASF25:
	.string	"IdleCount"
.LASF45:
	.string	"RingBuffer_IsFull"
.LASF15:
	.string	"DEVICE_STATE_Configured"
.LASF86:
	.string	"HID_Device_USBTask"
.LASF31:
	.string	"Count"
.LASF47:
	.string	"Data"
.LASF44:
	.string	"RingBuffer_GetCount"
.LASF61:
	.string	"EVENT_USB_Device_StartOfFrame"
.LASF33:
	.string	"char"
.LASF3:
	.string	"uint16_t"
.LASF32:
	.string	"RingBuff_t"
.LASF55:
	.string	"LEDs_Init"
.LASF80:
	.string	"USB_USBTask"
.LASF23:
	.string	"_Bool"
.LASF72:
	.string	"ReceivedByte"
.LASF26:
	.string	"IdleMSRemaining"
.LASF67:
	.string	"ReportSize"
.LASF7:
	.string	"long unsigned int"
.LASF51:
	.string	"Serial_Init"
.LASF84:
	.string	"USB_Device_States_t"
.LASF76:
	.string	"joyReport"
.LASF85:
	.string	"__iCliRetVal"
.LASF70:
	.string	"CALLBACK_HID_Device_ProcessHIDReport"
.LASF64:
	.string	"ReportID"
.LASF37:
	.string	"USB_JoystickReport_Data_t_GetFeature"
.LASF12:
	.string	"DEVICE_STATE_Powered"
.LASF14:
	.string	"DEVICE_STATE_Addressed"
.LASF48:
	.string	"RingBuffer_Remove"
.LASF49:
	.string	"LEDs_TurnOffLEDs"
.LASF46:
	.string	"RingBuffer_Insert"
.LASF73:
	.string	"PrevJoystickHIDReportBuffer"
.LASF59:
	.string	"EVENT_USB_Device_ConfigurationChanged"
.LASF30:
	.string	"Buffer"
.LASF77:
	.string	"joyReportBack"
.LASF16:
	.string	"DEVICE_STATE_Suspended"
.LASF54:
	.string	"USB_Device_EnableSOFEvents"
.LASF58:
	.string	"SetupHardware"
.LASF79:
	.string	"USB_Init"
.LASF50:
	.string	"LEDMask"
.LASF13:
	.string	"DEVICE_STATE_Default"
.LASF83:
	.string	"/home/jason/LUFA100807/Projects/arduino-guitarFULL"
	.ident	"GCC: (GNU) 4.8.1"
.global __do_copy_data
.global __do_clear_bss
