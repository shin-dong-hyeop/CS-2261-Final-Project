	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	initializePlayer
	.syntax unified
	.arm
	.type	initializePlayer, %function
initializePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	mov	r2, #0
	mov	r0, #8
	mov	r1, #90
	mov	fp, #0
	mov	ip, #0
	ldr	r3, .L4
	stm	r3, {r0-r1}
	str	fp, [r3, #32]
	str	ip, [r3, #36]
	mov	r1, #32
	strb	r2, [r3, #64]
	mov	ip, #4
	mov	r0, #15
	str	r2, [r3, #28]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #56]
	str	r2, [r3, #76]
	str	r2, [r3, #80]
	mov	r2, #2
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	ip, [r3, #40]
	str	r0, [r3, #24]
	str	r2, [r3, #60]
	ldr	fp, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LANCHOR0
	.size	initializePlayer, .-initializePlayer
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Left button held\000"
	.text
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r9, .L79
	ldr	r5, [r9]
	cmp	r5, r0
	movle	r1, #0
	movgt	r1, #1
	ldr	r8, .L79+4
	ldr	r10, [r9, #16]
	ldr	fp, [r9, #4]
	ldr	r4, [r9, #20]
	ldrh	r2, [r8]
	sub	sp, sp, #20
	add	r3, r5, #11
	add	r10, r5, r10
	str	r3, [sp, #4]
	add	r4, fp, r4
	sub	r3, r10, #11
	bics	r1, r1, r2, lsr #5
	str	r3, [sp, #8]
	str	r0, [r9, #32]
	sub	r3, r4, #1
	bne	.L65
	ldr	r7, .L79+8
	ldr	r6, .L79+12
.L7:
	ands	r5, r2, #16
	bne	.L11
	ldr	r2, [r9]
	ldr	r1, [r9, #16]
	add	r2, r2, r1
	cmp	r2, #512
	blt	.L70
.L11:
	mov	r1, r4
	ldr	r0, [sp, #4]
	ldr	r2, [r7]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L13
.L15:
	mov	r2, #0
	mov	r1, #1
	str	r2, [r9, #48]
	str	r2, [r9, #56]
.L14:
	ldr	r2, .L79+16
	ldrh	r2, [r2]
	tst	r2, #1
	str	r1, [r9, #52]
	beq	.L16
	ldrh	r2, [r8]
	ands	r2, r2, #1
	beq	.L71
.L16:
	ldr	r1, [r9, #48]
	add	r1, r1, #256
	cmp	r1, #2560
	ble	.L18
	mov	r2, #2560
	mov	r3, #10
	mov	r8, #1
	str	r2, [r9, #48]
	str	r3, [sp, #12]
.L17:
	mov	r5, #0
	ldr	fp, .L79+20
	b	.L30
.L22:
	mov	r1, r10
	ldr	r0, [sp, #8]
	ldr	r2, [r7]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L25
	mov	r1, r4
	ldr	r0, [r9]
	str	r4, [r9, #4]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	add	r5, r5, #1
	bne	.L72
	ldr	r3, [sp, #12]
	cmp	r5, r3
	bge	.L21
.L30:
	ldr	r4, [r9, #4]
	ldr	r1, [r9, #20]
	add	r4, r8, r4
	add	r1, r4, r1
	sub	r10, r1, #1
	mov	r1, r10
	ldr	r0, [sp, #4]
	ldr	r2, [r7]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L22
.L25:
	mov	r1, #0
	cmp	r8, #1
	str	r1, [r9, #48]
	beq	.L73
.L21:
	ldr	r2, [r9, #32]
	cmp	r2, #0
	streq	r2, [r9, #36]
	beq	.L32
.L78:
	ldr	r2, [r9, #24]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r9, #24]
	ble	.L74
.L32:
	add	ip, r9, #16
	ldm	ip, {ip, lr}
	ldr	r0, [r9]
	rsb	r2, ip, #240
	cmp	r0, #0
	add	r2, r2, r2, lsr #31
	sub	r2, r0, r2, asr #1
	movlt	r0, #0
	ldr	r4, [r9, #4]
	rsb	r5, lr, #160
	strlt	r0, [r9]
	addge	r0, r0, ip
	movlt	r0, ip
	add	r1, r5, r5, lsr #31
	cmp	r4, #0
	sub	r1, r4, r1, asr #1
	movlt	r4, #0
	addge	lr, lr, r4
	strlt	r4, [r9, #4]
	cmp	r0, #512
	rsbgt	ip, ip, #512
	strgt	ip, [r9]
	cmp	lr, #160
	strgt	r5, [r9, #4]
	cmp	r2, #0
	str	r2, [r9, #76]
	str	r1, [r9, #80]
	blt	.L75
	cmp	r1, #0
	blt	.L76
	cmp	r2, #272
	movgt	r2, #272
	strgt	r2, [r9, #76]
.L45:
	cmp	r1, #0
	ble	.L6
	mov	r2, #0
.L69:
	str	r2, [r9, #80]
.L6:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L75:
	mov	r2, #0
	cmp	r1, r2
	str	r2, [r9, #76]
	bge	.L45
	b	.L69
.L71:
	ldr	r1, [r9, #56]
	ldr	r0, [r9, #60]
	cmp	r1, r0
	bge	.L16
	mov	r3, #3
	str	r2, [r9, #52]
	ldr	r2, .L79+24
	add	r1, r1, #1
	mvn	r8, #0
	str	r1, [r9, #56]
	str	r2, [r9, #48]
	str	r3, [sp, #12]
	b	.L17
.L18:
	asrs	r10, r1, #8
	movne	r0, #1
	moveq	r0, #0
	cmp	r1, #0
	movgt	r8, #1
	bgt	.L19
	moveq	r0, #0
	mvnne	r8, #0
	moveq	r8, #0
	andne	r0, r0, #1
.L19:
	cmp	r0, #0
	str	r1, [r9, #48]
	beq	.L21
	eor	r3, r10, r10, asr #31
	sub	r3, r3, r10, asr #31
	str	r3, [sp, #12]
	b	.L17
.L13:
	mov	r1, r4
	ldr	r0, [sp, #8]
	ldr	r2, [r7]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L15
	mov	r1, #0
	b	.L14
.L72:
	ldr	r2, .L79+28
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	ble	.L77
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	initializePlayer
.L65:
	ldr	r7, .L79+8
	add	r5, r5, #10
	mov	r1, fp
	mov	r0, r5
	ldr	r2, [r7]
	ldr	r6, .L79+12
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldr	r3, [sp, #12]
	bne	.L8
.L68:
	ldrh	r2, [r8]
	b	.L7
.L73:
	ldr	r2, [r9, #32]
	cmp	r2, #0
	str	r8, [r9, #52]
	str	r1, [r9, #56]
	streq	r2, [r9, #36]
	beq	.L32
	b	.L78
.L70:
	mov	r1, fp
	ldr	r2, [r7]
	sub	r0, r10, #10
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L11
	ldr	r1, [sp, #12]
	ldr	r2, [r7]
	sub	r0, r10, #10
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L11
	mov	r2, #1
	str	r2, [r9, #32]
	ldr	r2, [r9]
	add	r2, r2, #1
	str	r5, [r9, #28]
	str	r2, [r9]
	b	.L11
.L74:
	ldr	r0, [r9, #36]
	ldr	r2, .L79+32
	ldr	r1, [r9, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r2
	mov	r2, #15
	str	r1, [r9, #36]
	str	r2, [r9, #24]
	b	.L32
.L77:
	ldr	r3, .L79+36
	mov	lr, pc
	bx	r3
	b	.L6
.L8:
	mov	r1, r3
	mov	r0, r5
	ldr	r2, [r7]
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldr	r3, [sp, #12]
	beq	.L68
	ldr	r2, .L79+40
	ldr	r0, .L79+44
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r2
	mov	r2, #1
	str	r2, [r9, #32]
	str	r2, [r9, #28]
	ldr	r2, [r9]
	sub	r2, r2, #1
	str	r2, [r9]
	ldr	r3, [sp, #12]
	ldrh	r2, [r8]
	b	.L7
.L76:
	cmp	r2, #272
	mov	r1, #0
	movgt	r2, #272
	str	r1, [r9, #80]
	strgt	r2, [r9, #76]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	.LANCHOR0
	.word	buttons
	.word	.LANCHOR1
	.word	goThrough
	.word	oldButtons
	.word	checkCollisionLose
	.word	-768
	.word	lives
	.word	__aeabi_idivmod
	.word	goToLose
	.word	mgba_printf
	.word	.LC0
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L83
	str	lr, [sp, #-4]!
	ldr	r3, [r2]
	ldr	lr, [r2, #76]
	sub	r3, r3, lr
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	ldr	lr, [r2, #28]
	subs	lr, lr, #0
	movne	lr, #1
	mvn	r3, r3, lsr #17
	ldr	r0, [r2, #80]
	ldr	r1, [r2, #4]
	sub	r1, r1, r0
	ldrb	r0, [r2, #64]	@ zero_extendqisi2
	ldr	r2, [r2, #36]
	ldr	ip, .L83+4
	add	r2, r2, lr, lsl #5
	lsl	r2, r2, #2
	add	lr, ip, r0, lsl #3
	and	r1, r1, #255
	and	r2, r2, #1020
	lsl	r0, r0, #3
	strh	r2, [lr, #4]	@ movhi
	strh	r3, [lr, #2]	@ movhi
	strh	r1, [ip, r0]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L84:
	.align	2
.L83:
	.word	.LANCHOR0
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initializeBanana
	.syntax unified
	.arm
	.type	initializeBanana, %function
initializeBanana:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #97
	mov	r0, #8
	mov	r1, #8
	push	{fp, lr}
	ldr	r3, .L87
	mov	lr, #1
	ldr	fp, .L87+4
	str	r0, [r3, #104]
	str	r1, [r3, #108]
	str	fp, [r3, #88]
	str	ip, [r3, #92]
	mov	r0, #1
	mov	ip, #4
	mov	r1, #0
	mov	r2, #15
	strb	lr, [r3, #152]
	str	r0, [r3, #120]
	str	r1, [r3, #124]
	str	ip, [r3, #128]
	str	r2, [r3, #112]
	pop	{fp, lr}
	bx	lr
.L88:
	.align	2
.L87:
	.word	.LANCHOR0
	.word	478
	.size	initializeBanana, .-initializeBanana
	.align	2
	.global	initializeBear
	.syntax unified
	.arm
	.type	initializeBear, %function
initializeBear:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #97
	mov	r0, #8
	mov	r1, #8
	push	{fp, lr}
	ldr	r3, .L91
	mov	lr, #1
	ldr	fp, .L91+4
	str	r0, [r3, #184]
	str	r1, [r3, #188]
	str	fp, [r3, #168]
	str	ip, [r3, #172]
	mov	r0, #1
	mov	ip, #4
	mov	r1, #0
	mov	r2, #15
	strb	lr, [r3, #232]
	str	r0, [r3, #200]
	str	r1, [r3, #204]
	str	ip, [r3, #208]
	str	r2, [r3, #192]
	pop	{fp, lr}
	bx	lr
.L92:
	.align	2
.L91:
	.word	.LANCHOR0
	.word	470
	.size	initializeBear, .-initializeBear
	.align	2
	.global	initializeCrown
	.syntax unified
	.arm
	.type	initializeCrown, %function
initializeCrown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{fp, lr}
	mov	ip, #43
	mov	fp, #488
	mov	r0, #8
	mov	r1, #8
	ldr	r3, .L95
	mov	lr, #1
	str	fp, [r3, #248]
	str	ip, [r3, #252]
	str	r0, [r3, #264]
	str	r1, [r3, #268]
	mov	ip, #4
	mov	r0, #1
	mov	r1, #0
	mov	r2, #15
	strb	lr, [r3, #312]
	str	r0, [r3, #280]
	str	r1, [r3, #284]
	str	ip, [r3, #288]
	str	r2, [r3, #272]
	pop	{fp, lr}
	bx	lr
.L96:
	.align	2
.L95:
	.word	.LANCHOR0
	.size	initializeCrown, .-initializeCrown
	.align	2
	.global	updateBanana
	.syntax unified
	.arm
	.type	updateBanana, %function
updateBanana:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #1
	ldr	r3, .L104
	ldr	r2, [r3, #120]
	ldr	r1, .L104+4
	cmp	r2, #0
	str	r0, [r1]
	beq	.L98
	ldr	r2, [r3, #112]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #112]
	bxne	lr
	ldr	r0, [r3, #124]
	push	{r4, lr}
	ldr	r2, .L104+8
	ldr	r1, [r3, #128]
	add	r0, r0, #1
	mov	lr, pc
	bx	r2
	mov	r2, #15
	ldr	r3, .L104
	pop	{r4, lr}
	str	r1, [r3, #124]
	str	r2, [r3, #112]
	bx	lr
.L98:
	str	r2, [r3, #124]
	bx	lr
.L105:
	.align	2
.L104:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	__aeabi_idivmod
	.size	updateBanana, .-updateBanana
	.align	2
	.global	updateBear
	.syntax unified
	.arm
	.type	updateBear, %function
updateBear:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #2
	ldr	r3, .L113
	ldr	r2, [r3, #200]
	ldr	r1, .L113+4
	cmp	r2, #0
	str	r0, [r1]
	beq	.L107
	ldr	r2, [r3, #192]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #192]
	bxne	lr
	ldr	r0, [r3, #204]
	push	{r4, lr}
	ldr	r2, .L113+8
	ldr	r1, [r3, #208]
	add	r0, r0, #1
	mov	lr, pc
	bx	r2
	mov	r2, #15
	ldr	r3, .L113
	pop	{r4, lr}
	str	r1, [r3, #204]
	str	r2, [r3, #192]
	bx	lr
.L107:
	str	r2, [r3, #204]
	bx	lr
.L114:
	.align	2
.L113:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	__aeabi_idivmod
	.size	updateBear, .-updateBear
	.align	2
	.global	updateCrown
	.syntax unified
	.arm
	.type	updateCrown, %function
updateCrown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #3
	ldr	r3, .L122
	ldr	r2, [r3, #280]
	ldr	r1, .L122+4
	cmp	r2, #0
	str	r0, [r1]
	beq	.L116
	ldr	r2, [r3, #272]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #272]
	bxne	lr
	ldr	r0, [r3, #284]
	push	{r4, lr}
	ldr	r2, .L122+8
	ldr	r1, [r3, #288]
	add	r0, r0, #1
	mov	lr, pc
	bx	r2
	mov	r2, #15
	ldr	r3, .L122
	pop	{r4, lr}
	str	r1, [r3, #284]
	str	r2, [r3, #272]
	bx	lr
.L116:
	str	r2, [r3, #284]
	bx	lr
.L123:
	.align	2
.L122:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	__aeabi_idivmod
	.size	updateCrown, .-updateCrown
	.align	2
	.global	drawCollection
	.syntax unified
	.arm
	.type	drawCollection, %function
drawCollection:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L132
	ldr	r2, [r2]
	ldr	r3, .L132+4
	cmp	r2, #1
	str	lr, [sp, #-4]!
	ldrh	r0, [r3, #80]
	ldrh	r1, [r3, #76]
	beq	.L130
	cmp	r2, #2
	beq	.L131
	ldr	r2, [r3, #248]
	sub	r2, r2, r1
	ldr	r1, [r3, #252]
	lsl	r2, r2, #23
	sub	r1, r1, r0
	ldr	r0, [r3, #284]
	lsr	r2, r2, #23
	ldr	lr, .L132+8
	ldrb	ip, [r3, #312]	@ zero_extendqisi2
	orr	r2, r2, #16384
	and	r3, r1, #255
	add	r0, r0, #192
.L129:
	ldr	r1, .L132+12
	and	r1, r1, r0, lsl #1
	add	r0, lr, ip, lsl #3
	lsl	ip, ip, #3
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0, #4]	@ movhi
	strh	r3, [lr, ip]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L131:
	ldr	r2, [r3, #168]
	sub	r2, r2, r1
	ldr	r1, [r3, #172]
	lsl	r2, r2, #23
	sub	r1, r1, r0
	ldr	r0, [r3, #204]
	lsr	r2, r2, #23
	ldrb	ip, [r3, #232]	@ zero_extendqisi2
	ldr	lr, .L132+8
	orr	r2, r2, #16384
	and	r3, r1, #255
	add	r0, r0, #160
	b	.L129
.L130:
	ldr	r2, [r3, #88]
	sub	r2, r2, r1
	ldr	r1, [r3, #92]
	lsl	r2, r2, #23
	sub	r1, r1, r0
	ldr	r0, [r3, #124]
	lsr	r2, r2, #23
	ldrb	ip, [r3, #152]	@ zero_extendqisi2
	ldr	lr, .L132+8
	orr	r2, r2, #16384
	and	r3, r1, #255
	add	r0, r0, #128
	b	.L129
.L133:
	.align	2
.L132:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	shadowOAM
	.word	1022
	.size	drawCollection, .-drawCollection
	.align	2
	.global	winCondition
	.syntax unified
	.arm
	.type	winCondition, %function
winCondition:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L149
	ldr	r3, [r4]
	cmp	r3, #1
	sub	sp, sp, #140
	beq	.L147
	cmp	r3, #2
	beq	.L148
.L138:
	cmp	r3, #3
	beq	.L141
.L142:
	mov	r0, #0
.L134:
	add	sp, sp, #140
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L147:
	ldr	r5, .L149+4
	mov	r2, #76
	ldr	r3, .L149+8
	add	r1, r5, #88
	add	r0, sp, #60
	mov	lr, pc
	bx	r3
	mov	ip, sp
	add	lr, r5, #16
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2}
	stm	ip, {r0, r1, r2}
	ldr	ip, .L149+12
	ldm	r5, {r0, r1, r2, r3}
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L136
	ldr	r3, [r4]
	cmp	r3, #2
	bne	.L138
.L148:
	ldr	r5, .L149+4
	mov	r2, #76
	ldr	r3, .L149+8
	add	r1, r5, #168
	add	r0, sp, #60
	mov	lr, pc
	bx	r3
	mov	ip, sp
	add	lr, r5, #16
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2}
	stm	ip, {r0, r1, r2}
	ldr	ip, .L149+12
	ldm	r5, {r0, r1, r2, r3}
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L139
	ldr	r3, [r4]
	cmp	r3, #3
	bne	.L142
.L141:
	ldr	r4, .L149+4
	mov	r2, #76
	ldr	r3, .L149+8
	add	r1, r4, #248
	add	r0, sp, #60
	mov	lr, pc
	bx	r3
	mov	ip, sp
	add	lr, r4, #16
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2}
	stm	ip, {r0, r1, r2}
	ldr	ip, .L149+12
	ldm	r4, {r0, r1, r2, r3}
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L142
	ldr	r3, .L149+16
	mov	lr, pc
	bx	r3
	b	.L137
.L136:
	ldr	r3, .L149+20
	mov	lr, pc
	bx	r3
.L137:
	mov	r0, #1
	b	.L134
.L139:
	ldr	r3, .L149+24
	mov	lr, pc
	bx	r3
	b	.L137
.L150:
	.align	2
.L149:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	memcpy
	.word	checkCollisionSprite
	.word	goToWin
	.word	goToGame2
	.word	goToGame3
	.size	winCondition, .-winCondition
	.global	crown
	.global	bear
	.global	banana
	.global	player
	.global	level
	.global	vOff
	.global	hOff
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	level, %object
	.size	level, 4
level:
	.word	1
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	player, %object
	.size	player, 76
player:
	.space	76
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.space	4
	.type	banana, %object
	.size	banana, 76
banana:
	.space	76
	.space	4
	.type	bear, %object
	.size	bear, 76
bear:
	.space	76
	.space	4
	.type	crown, %object
	.size	crown, 76
crown:
	.space	76
	.global	__aeabi_idivmod
	.ident	"GCC: (devkitARM release 66) 15.1.0"
