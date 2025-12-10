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
	mov	r0, #32
	mov	r1, #32
	ldr	r3, .L15
	ldr	r3, [r3]
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r8, .L15+4
	cmp	r3, #2
	moveq	r5, #112
	str	r0, [r8, #16]
	str	r1, [r8, #20]
	beq	.L2
	cmp	r3, #3
	moveq	r5, #24
	movne	r5, #8
.L2:
	mov	r4, #0
	str	r5, [r8]
	ldr	r6, .L15+8
	b	.L5
.L3:
	cmp	r4, #159
	beq	.L14
.L5:
	mov	r1, r4
	mov	r0, r5
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	mov	r7, r4
	add	r4, r4, #1
	beq	.L3
	mov	r1, r4
	mov	r0, r5
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L3
	ldr	r3, [r8, #20]
	sub	r3, r3, #1
	sub	r7, r7, r3
	bic	r7, r7, r7, asr #31
.L4:
	mov	r3, #0
	mov	r0, #4
	mov	r1, #15
	mov	r2, #2
	strb	r3, [r8, #64]
	str	r7, [r8, #4]
	str	r3, [r8, #36]
	str	r3, [r8, #28]
	str	r3, [r8, #32]
	str	r0, [r8, #40]
	str	r1, [r8, #24]
	str	r3, [r8, #48]
	str	r3, [r8, #52]
	str	r3, [r8, #56]
	str	r2, [r8, #60]
	str	r3, [r8, #76]
	str	r3, [r8, #80]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L14:
	mov	r7, #0
	b	.L4
.L16:
	.align	2
.L15:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	colorAt
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
	ldr	r4, .L92
	ldr	r3, [r4]
	cmp	r3, r0
	movle	r1, #0
	movgt	r1, #1
	ldr	r7, .L92+4
	sub	sp, sp, #20
	add	r2, r3, #11
	ldr	r10, [r4, #16]
	str	r2, [sp, #4]
	ldr	fp, [r4, #4]
	ldr	r9, [r4, #20]
	ldrh	r2, [r7]
	add	r10, r3, r10
	add	r9, fp, r9
	bics	r1, r1, r2, lsr #5
	sub	r1, r10, #11
	str	r0, [r4, #32]
	str	r1, [sp, #8]
	sub	r8, r9, #2
	bne	.L78
	ldr	r6, .L92+8
	ldr	r5, .L92+12
.L18:
	ands	r3, r2, #16
	bne	.L22
	ldr	r2, [r4]
	ldr	r1, [r4, #16]
	add	r2, r2, r1
	cmp	r2, #512
	blt	.L85
.L22:
	mov	r1, r9
	ldr	r0, [sp, #4]
	ldr	r2, [r6]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L24
.L26:
	mov	r3, #0
	mov	r2, #1
	str	r3, [r4, #48]
	str	r3, [r4, #56]
.L25:
	ldr	r3, .L92+16
	ldrh	r3, [r3]
	tst	r3, #1
	str	r2, [r4, #52]
	beq	.L27
	ldrh	r3, [r7]
	ands	r3, r3, #1
	beq	.L86
.L27:
	ldr	r3, [r4, #48]
	add	r3, r3, #256
	cmp	r3, #2560
	ble	.L29
	mov	r3, #2560
	str	r3, [r4, #48]
	mov	r3, #10
	mov	r7, #1
	str	r3, [sp, #12]
.L28:
	mov	r10, #0
	ldr	r8, .L92+20
	b	.L41
.L33:
	mov	r1, fp
	ldr	r0, [sp, #8]
	ldr	r2, [r6]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L36
	mov	r1, r9
	ldr	r0, [r4]
	str	r9, [r4, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	add	r10, r10, #1
	bne	.L83
	ldr	r3, [sp, #12]
	cmp	r3, r10
	ble	.L32
.L41:
	ldr	r9, [r4, #4]
	ldr	r1, [r4, #20]
	add	r9, r7, r9
	add	r1, r9, r1
	sub	fp, r1, #1
	mov	r1, fp
	ldr	r0, [sp, #4]
	ldr	r2, [r6]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L33
.L36:
	mov	r1, #0
	cmp	r7, #1
	str	r1, [r4, #48]
	beq	.L87
.L32:
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L83
	ldr	r3, [r4, #32]
	cmp	r3, #0
	streq	r3, [r4, #36]
	beq	.L45
	ldr	r3, [r4, #24]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #24]
	ble	.L88
.L45:
	add	r0, r4, #16
	ldm	r0, {r0, ip}
	ldr	r1, [r4]
	rsb	r3, r0, #240
	cmp	r1, #0
	add	r3, r3, r3, lsr #31
	sub	r3, r1, r3, asr #1
	movlt	r1, #0
	ldr	lr, [r4, #4]
	rsb	r5, ip, #160
	strlt	r1, [r4]
	addge	r1, r1, r0
	movlt	r1, r0
	add	r2, r5, r5, lsr #31
	cmp	lr, #0
	sub	r2, lr, r2, asr #1
	movlt	lr, #0
	addge	ip, ip, lr
	strlt	lr, [r4, #4]
	cmp	r1, #512
	rsbgt	r0, r0, #512
	strgt	r0, [r4]
	cmp	ip, #160
	strgt	r5, [r4, #4]
	cmp	r3, #0
	str	r3, [r4, #76]
	str	r2, [r4, #80]
	blt	.L89
	cmp	r2, #0
	blt	.L90
	cmp	r3, #272
	movgt	r3, #272
	strgt	r3, [r4, #76]
.L58:
	cmp	r2, #0
	ble	.L17
	mov	r3, #0
.L84:
	str	r3, [r4, #80]
.L17:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L86:
	ldr	r2, [r4, #56]
	ldr	r1, [r4, #60]
	cmp	r2, r1
	bge	.L27
	str	r3, [r4, #52]
	ldr	r3, .L92+24
	str	r3, [r4, #48]
	mov	r3, #7
	add	r2, r2, #1
	mvn	r7, #0
	str	r2, [r4, #56]
	str	r3, [sp, #12]
	b	.L28
.L89:
	mov	r3, #0
	cmp	r2, r3
	str	r3, [r4, #76]
	bge	.L58
	b	.L84
.L83:
	ldr	r2, .L92+28
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	ble	.L91
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	initializePlayer
.L29:
	asrs	fp, r3, #8
	movne	r1, #1
	moveq	r1, #0
	cmp	r3, #0
	movgt	r7, #1
	bgt	.L30
	moveq	r1, #0
	mvnne	r7, #0
	moveq	r7, #0
	andne	r1, r1, #1
.L30:
	cmp	r1, #0
	str	r3, [r4, #48]
	ldreq	r8, .L92+20
	beq	.L32
	eor	r3, fp, fp, asr #31
	sub	r3, r3, fp, asr #31
	str	r3, [sp, #12]
	b	.L28
.L24:
	mov	r1, r9
	ldr	r0, [sp, #8]
	ldr	r2, [r6]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L26
	mov	r2, #0
	b	.L25
.L78:
	ldr	r6, .L92+8
	add	r3, r3, #10
	mov	r1, fp
	mov	r0, r3
	ldr	r2, [r6]
	ldr	r5, .L92+12
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L19
.L81:
	ldrh	r2, [r7]
	b	.L18
.L91:
	ldr	r3, .L92+32
	mov	lr, pc
	bx	r3
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L87:
	str	r7, [r4, #52]
	str	r1, [r4, #56]
	b	.L32
.L85:
	mov	r1, fp
	ldr	r2, [r6]
	sub	r0, r10, #10
	str	r3, [sp, #12]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L22
	mov	r1, r8
	ldr	r2, [r6]
	sub	r0, r10, #10
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L22
	ldr	r3, [sp, #12]
	str	r3, [r4, #28]
	mov	r3, #1
	str	r3, [r4, #32]
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	b	.L22
.L90:
	cmp	r3, #272
	mov	r2, #0
	movgt	r3, #272
	str	r2, [r4, #80]
	strgt	r3, [r4, #76]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L88:
	ldr	r0, [r4, #36]
	ldr	r3, .L92+36
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r3, #15
	str	r1, [r4, #36]
	str	r3, [r4, #24]
	b	.L45
.L19:
	mov	r1, r8
	ldr	r0, [sp, #12]
	ldr	r2, [r6]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L81
	ldr	r3, .L92+40
	ldr	r0, .L92+44
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r3, [r4, #32]
	str	r3, [r4, #28]
	ldr	r3, [r4]
	sub	r3, r3, #1
	str	r3, [r4]
	b	.L81
.L93:
	.align	2
.L92:
	.word	.LANCHOR0
	.word	buttons
	.word	.LANCHOR1
	.word	goThrough
	.word	oldButtons
	.word	checkCollisionLose
	.word	-1792
	.word	lives
	.word	goToLose
	.word	__aeabi_idivmod
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
	ldr	r2, .L96
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
	ldr	ip, .L96+4
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
.L97:
	.align	2
.L96:
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
	ldr	r3, .L100
	mov	lr, #1
	ldr	fp, .L100+4
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
.L101:
	.align	2
.L100:
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
	ldr	r3, .L104
	mov	lr, #1
	ldr	fp, .L104+4
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
.L105:
	.align	2
.L104:
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
	ldr	r3, .L108
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
.L109:
	.align	2
.L108:
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
	ldr	r3, .L117
	ldr	r2, [r3, #120]
	ldr	r1, .L117+4
	cmp	r2, #0
	str	r0, [r1]
	beq	.L111
	ldr	r2, [r3, #112]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #112]
	bxne	lr
	ldr	r0, [r3, #124]
	push	{r4, lr}
	ldr	r2, .L117+8
	ldr	r1, [r3, #128]
	add	r0, r0, #1
	mov	lr, pc
	bx	r2
	mov	r2, #15
	ldr	r3, .L117
	pop	{r4, lr}
	str	r1, [r3, #124]
	str	r2, [r3, #112]
	bx	lr
.L111:
	str	r2, [r3, #124]
	bx	lr
.L118:
	.align	2
.L117:
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
	ldr	r3, .L126
	ldr	r2, [r3, #200]
	ldr	r1, .L126+4
	cmp	r2, #0
	str	r0, [r1]
	beq	.L120
	ldr	r2, [r3, #192]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #192]
	bxne	lr
	ldr	r0, [r3, #204]
	push	{r4, lr}
	ldr	r2, .L126+8
	ldr	r1, [r3, #208]
	add	r0, r0, #1
	mov	lr, pc
	bx	r2
	mov	r2, #15
	ldr	r3, .L126
	pop	{r4, lr}
	str	r1, [r3, #204]
	str	r2, [r3, #192]
	bx	lr
.L120:
	str	r2, [r3, #204]
	bx	lr
.L127:
	.align	2
.L126:
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
	ldr	r3, .L135
	ldr	r2, [r3, #280]
	ldr	r1, .L135+4
	cmp	r2, #0
	str	r0, [r1]
	beq	.L129
	ldr	r2, [r3, #272]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #272]
	bxne	lr
	ldr	r0, [r3, #284]
	push	{r4, lr}
	ldr	r2, .L135+8
	ldr	r1, [r3, #288]
	add	r0, r0, #1
	mov	lr, pc
	bx	r2
	mov	r2, #15
	ldr	r3, .L135
	pop	{r4, lr}
	str	r1, [r3, #284]
	str	r2, [r3, #272]
	bx	lr
.L129:
	str	r2, [r3, #284]
	bx	lr
.L136:
	.align	2
.L135:
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
	ldr	r2, .L145
	ldr	r2, [r2]
	ldr	r3, .L145+4
	cmp	r2, #1
	str	lr, [sp, #-4]!
	ldrh	r0, [r3, #80]
	ldrh	r1, [r3, #76]
	beq	.L143
	cmp	r2, #2
	beq	.L144
	ldr	r2, [r3, #248]
	sub	r2, r2, r1
	ldr	r1, [r3, #252]
	lsl	r2, r2, #23
	sub	r1, r1, r0
	ldr	r0, [r3, #284]
	lsr	r2, r2, #23
	ldr	lr, .L145+8
	ldrb	ip, [r3, #312]	@ zero_extendqisi2
	orr	r2, r2, #16384
	and	r3, r1, #255
	add	r0, r0, #192
.L142:
	ldr	r1, .L145+12
	and	r1, r1, r0, lsl #1
	add	r0, lr, ip, lsl #3
	lsl	ip, ip, #3
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0, #4]	@ movhi
	strh	r3, [lr, ip]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L144:
	ldr	r2, [r3, #168]
	sub	r2, r2, r1
	ldr	r1, [r3, #172]
	lsl	r2, r2, #23
	sub	r1, r1, r0
	ldr	r0, [r3, #204]
	lsr	r2, r2, #23
	ldrb	ip, [r3, #232]	@ zero_extendqisi2
	ldr	lr, .L145+8
	orr	r2, r2, #16384
	and	r3, r1, #255
	add	r0, r0, #160
	b	.L142
.L143:
	ldr	r2, [r3, #88]
	sub	r2, r2, r1
	ldr	r1, [r3, #92]
	lsl	r2, r2, #23
	sub	r1, r1, r0
	ldr	r0, [r3, #124]
	lsr	r2, r2, #23
	ldrb	ip, [r3, #152]	@ zero_extendqisi2
	ldr	lr, .L145+8
	orr	r2, r2, #16384
	and	r3, r1, #255
	add	r0, r0, #128
	b	.L142
.L146:
	.align	2
.L145:
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
	ldr	r4, .L162
	ldr	r3, [r4]
	cmp	r3, #1
	sub	sp, sp, #140
	beq	.L160
	cmp	r3, #2
	beq	.L161
.L151:
	cmp	r3, #3
	beq	.L154
.L155:
	mov	r0, #0
.L147:
	add	sp, sp, #140
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L160:
	ldr	r5, .L162+4
	mov	r2, #76
	ldr	r3, .L162+8
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
	ldr	ip, .L162+12
	ldm	r5, {r0, r1, r2, r3}
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L149
	ldr	r3, [r4]
	cmp	r3, #2
	bne	.L151
.L161:
	ldr	r5, .L162+4
	mov	r2, #76
	ldr	r3, .L162+8
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
	ldr	ip, .L162+12
	ldm	r5, {r0, r1, r2, r3}
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L152
	ldr	r3, [r4]
	cmp	r3, #3
	bne	.L155
.L154:
	ldr	r4, .L162+4
	mov	r2, #76
	ldr	r3, .L162+8
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
	ldr	ip, .L162+12
	ldm	r4, {r0, r1, r2, r3}
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L155
	ldr	r3, .L162+16
	mov	lr, pc
	bx	r3
	b	.L150
.L149:
	ldr	r3, .L162+20
	mov	lr, pc
	bx	r3
.L150:
	mov	r0, #1
	b	.L147
.L152:
	ldr	r3, .L162+24
	mov	lr, pc
	bx	r3
	b	.L150
.L163:
	.align	2
.L162:
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
