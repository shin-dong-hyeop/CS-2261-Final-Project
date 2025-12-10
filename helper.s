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
	.file	"helper.c"
	.text
	.align	2
	.global	colorAt
	.syntax unified
	.arm
	.type	colorAt, %function
colorAt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L9
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L7
	cmp	r3, #2
	beq	.L8
	cmp	r3, #3
	ldreq	r3, .L9+4
	addeq	r0, r0, r1, lsl #9
	ldrbeq	r0, [r3, r0]	@ zero_extendqisi2
	movne	r0, #0
	bx	lr
.L7:
	ldr	r3, .L9+8
	add	r0, r0, r1, lsl #9
	ldrb	r0, [r3, r0]	@ zero_extendqisi2
	bx	lr
.L8:
	ldr	r3, .L9+12
	add	r0, r0, r1, lsl #9
	ldrb	r0, [r3, r0]	@ zero_extendqisi2
	bx	lr
.L10:
	.align	2
.L9:
	.word	level
	.word	collision3Bitmap
	.word	collision1Bitmap
	.word	collision2Bitmap
	.size	colorAt, .-colorAt
	.align	2
	.global	goThrough
	.syntax unified
	.arm
	.type	goThrough, %function
goThrough:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #255
	cmpls	r0, #512
	bcc	.L18
.L16:
	mov	r0, #0
	bx	lr
.L18:
	ldr	r2, .L21
	ldr	r2, [r2]
	cmp	r2, #1
	beq	.L19
	cmp	r2, #2
	beq	.L20
	cmp	r2, #3
	bne	.L16
	ldr	r3, .L21+4
	add	r0, r0, r1, lsl #9
	ldrb	r0, [r3, r0]	@ zero_extendqisi2
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L19:
	ldr	r3, .L21+8
	add	r0, r0, r1, lsl #9
	ldrb	r0, [r3, r0]	@ zero_extendqisi2
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L20:
	ldr	r3, .L21+12
	add	r0, r0, r1, lsl #9
	ldrb	r0, [r3, r0]	@ zero_extendqisi2
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L22:
	.align	2
.L21:
	.word	level
	.word	collision3Bitmap
	.word	collision1Bitmap
	.word	collision2Bitmap
	.size	goThrough, .-goThrough
	.align	2
	.global	getTile
	.syntax unified
	.arm
	.type	getTile, %function
getTile:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	ldr	r2, .L26
	addlt	r0, r0, #7
	add	r3, r1, #7
	cmp	r0, #255
	cmpls	r3, r2
	asr	r0, r0, #3
	bhi	.L25
	cmp	r1, #0
	movge	r3, r1
	asr	r3, r3, #3
	ldr	r2, .L26+4
	add	r0, r0, r3, lsl #5
	lsl	r0, r0, #1
	ldrh	r0, [r2, r0]
	bx	lr
.L25:
	ldr	r0, .L26+8
	bx	lr
.L27:
	.align	2
.L26:
	.word	262
	.word	100704256
	.word	65535
	.size	getTile, .-getTile
	.align	2
	.global	checkCollisionHardBlock
	.syntax unified
	.arm
	.type	checkCollisionHardBlock, %function
checkCollisionHardBlock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	cmp	r0, #0
	add	lr, r0, #7
	movge	r3, r0
	movlt	r3, lr
	cmn	r1, #7
	movge	ip, #0
	movlt	ip, #1
	add	r4, r1, #7
	cmp	r1, #0
	movge	r2, r1
	movlt	r2, r4
	cmp	r3, #255
	asr	r5, r3, #3
	movls	r3, #0
	movhi	r3, #1
	orrs	r6, r3, ip
	mov	r7, r5
	asr	r2, r2, #3
	bne	.L29
	cmp	r1, #255
	bgt	.L48
	add	ip, r5, r2, lsl #5
	ldr	r5, .L57
	lsl	ip, ip, #1
	ldrh	ip, [r5, ip]
	sub	ip, ip, #1
	cmp	ip, #2
	lsl	r2, r2, #5
	bls	.L47
	cmp	lr, #0
	addlt	lr, r0, #14
	cmp	lr, #255
	movhi	r0, #1
	asr	lr, lr, #3
	asrhi	r3, r4, #3
	bhi	.L34
.L38:
	ldr	r0, .L57
	add	r2, r2, lr
	lsl	r2, r2, #1
	ldrh	r2, [r0, r2]
	sub	r2, r2, #1
	cmp	r2, #2
	bls	.L47
	mov	r0, #0
.L33:
	cmp	r4, #0
	addlt	r2, r1, #14
	movge	r2, r4
	cmn	r4, #7
	movge	r1, #0
	movlt	r1, #1
	asr	r2, r2, #3
	orrs	r3, r3, r1
	mov	r3, r2
	bne	.L56
.L34:
	cmp	r4, #255
	bgt	.L48
	add	r2, r7, r3, lsl #5
	ldr	r1, .L57
	lsl	r2, r2, #1
	ldrh	r2, [r1, r2]
	sub	r2, r2, #1
	cmp	r2, #2
	lsl	r3, r3, #5
	bls	.L47
	cmp	r0, #0
	bne	.L48
.L37:
	ldr	r2, .L57
	add	r3, r3, lr
	lsl	r3, r3, #1
	ldrh	r0, [r2, r3]
	sub	r3, r0, #1
	cmp	r3, #1
	bls	.L47
	sub	r3, r0, #3
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	b	.L28
.L47:
	mov	r0, #1
.L28:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L48:
	mov	r0, #0
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L56:
	orrs	r0, r1, r0
	bne	.L48
	cmp	r4, #255
	bgt	.L28
	lsl	r3, r2, #5
	b	.L37
.L29:
	cmp	lr, #0
	addlt	lr, r0, #14
	cmp	lr, #255
	movls	r0, #0
	movhi	r0, #1
	orrs	ip, ip, r0
	asr	lr, lr, #3
	bne	.L33
	cmp	r1, #255
	bgt	.L48
	lsl	r2, r2, #5
	b	.L38
.L58:
	.align	2
.L57:
	.word	100704256
	.size	checkCollisionHardBlock, .-checkCollisionHardBlock
	.align	2
	.global	checkCollisionTransparentBlock
	.syntax unified
	.arm
	.type	checkCollisionTransparentBlock, %function
checkCollisionTransparentBlock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	push	{r4, r5, r6, lr}
	add	lr, r0, #7
	movge	ip, r0
	movlt	ip, lr
	ldr	r3, .L88
	add	r4, r1, #7
	cmp	r4, r3
	movls	r3, #0
	movhi	r3, #1
	cmp	r1, #0
	mov	r5, r0
	movge	r0, r1
	movlt	r0, r4
	cmp	ip, #255
	movls	r2, #0
	movhi	r2, #1
	orrs	r6, r2, r3
	asr	r0, r0, #3
	asr	ip, ip, #3
	bne	.L60
	ldr	r2, .L88+4
	add	r3, ip, r0, lsl #5
	lsl	r3, r3, #1
	ldrh	r3, [r2, r3]
	cmp	r3, #0
	bne	.L86
.L80:
	mov	r0, #1
.L59:
	pop	{r4, r5, r6, lr}
	bx	lr
.L60:
	cmp	lr, #0
	addlt	lr, r5, #14
	cmp	lr, #255
	movls	r6, #0
	movhi	r6, #1
	orrs	r3, r6, r3
	asr	r5, lr, #3
	bne	.L63
	ldr	r2, .L88+4
	add	r0, r5, r0, lsl #5
	lsl	r0, r0, #1
	ldrh	r2, [r2, r0]
	cmp	r2, #0
	beq	.L80
	cmp	r4, #0
	addlt	r4, r1, #14
	asr	r2, r4, #3
	add	r1, r1, #14
.L65:
	ldr	r0, .L88
	cmp	r1, r0
	orrhi	r3, r3, #1
	cmp	r3, #0
	bne	.L76
	lsl	r2, r2, #5
	b	.L66
.L86:
	cmp	lr, #0
	addlt	lr, r5, #14
	asr	lr, lr, #3
	cmp	lr, #31
	mov	r5, lr
	bhi	.L87
	add	lr, lr, r0, lsl #5
	lsl	r3, lr, #1
	ldrh	r3, [r2, r3]
	cmp	r3, #0
	beq	.L80
	cmp	r4, #255
	bgt	.L76
	asr	r3, r4, #3
	add	r1, ip, r3, lsl #5
	lsl	r1, r1, #1
	ldrh	r1, [r2, r1]
	cmp	r1, #0
	lsl	r2, r3, #5
	beq	.L80
	b	.L66
.L63:
	cmp	r4, #0
	addlt	r3, r1, #14
	movge	r3, r4
	cmn	r4, #7
	movge	r0, #0
	movlt	r0, #1
	orrs	r0, r2, r0
	add	r1, r1, #14
	asr	r2, r3, #3
	bne	.L72
	cmp	r4, #255
	bgt	.L59
	add	ip, ip, r2, lsl #5
	ldr	r3, .L88+4
	lsl	ip, ip, #1
	ldrh	r3, [r3, ip]
	cmp	r3, #0
	lsl	r2, r2, #5
	beq	.L80
	cmp	r5, #31
	bhi	.L59
.L66:
	ldr	r3, .L88+4
	add	r2, r5, r2
	lsl	r2, r2, #1
	ldrh	r0, [r3, r2]
	rsbs	r0, r0, #1
	movcc	r0, #0
	b	.L59
.L87:
	cmp	r4, #255
	bgt	.L76
	asr	r3, r4, #3
	add	r3, ip, r3, lsl #5
	lsl	r3, r3, #1
	ldrh	r0, [r2, r3]
	rsbs	r0, r0, #1
	movcc	r0, #0
	b	.L59
.L76:
	mov	r0, #0
	b	.L59
.L72:
	mov	r3, r6
	b	.L65
.L89:
	.align	2
.L88:
	.word	262
	.word	100704256
	.size	checkCollisionTransparentBlock, .-checkCollisionTransparentBlock
	.align	2
	.global	checkCollisionLose
	.syntax unified
	.arm
	.type	checkCollisionLose, %function
checkCollisionLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	lr, .L98
	ldr	r2, [lr, #16]
	add	r2, r0, r2
	sub	r2, r2, #1
	cmp	r2, #512
	movlt	r3, #0
	movge	r3, #1
	orrs	r3, r3, r0, lsr #31
	bne	.L92
	ldr	lr, [lr, #20]
	add	lr, r1, lr
	sub	r5, lr, #1
	cmp	r5, #255
	movle	lr, #0
	movgt	lr, #1
	orrs	lr, lr, r1, lsr #31
	bne	.L92
	mov	r4, r0
	bl	colorAt
	cmp	r0, #2
	beq	.L96
	mov	r0, r2
	bl	colorAt
	cmp	r0, #2
	beq	.L96
	mov	r1, r5
	mov	r0, r4
	bl	colorAt
	cmp	r0, #2
	beq	.L96
	mov	r0, r2
	bl	colorAt
	sub	r3, r0, #2
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L92:
	mov	r0, #0
	pop	{r4, r5, r6, lr}
	bx	lr
.L96:
	mov	r0, #1
	pop	{r4, r5, r6, lr}
	bx	lr
.L99:
	.align	2
.L98:
	.word	player
	.size	checkCollisionLose, .-checkCollisionLose
	.align	2
	.global	checkCollisionSprite
	.syntax unified
	.arm
	.type	checkCollisionSprite, %function
checkCollisionSprite:
	@ Function supports interworking.
	@ args = 152, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
	stm	sp, {r0, r1, r2, r3}
	ldr	r1, [sp, #76]
	ldr	r3, [sp, #92]
	add	r3, r1, r3
	cmp	r3, r0
	ble	.L104
	ldr	r3, [sp, #16]
	add	r2, r0, r3
	cmp	r2, r1
	bgt	.L106
.L104:
	mov	r0, #0
	add	sp, sp, #16
	bx	lr
.L106:
	ldr	r2, [sp, #80]
	ldr	r3, [sp, #96]
	ldr	r0, [sp, #4]
	add	r3, r2, r3
	cmp	r3, r0
	ble	.L104
	ldr	r3, [sp, #20]
	add	r0, r0, r3
	cmp	r0, r2
	movle	r0, #0
	movgt	r0, #1
	add	sp, sp, #16
	bx	lr
	.size	checkCollisionSprite, .-checkCollisionSprite
	.align	2
	.global	updateGame1
	.syntax unified
	.arm
	.type	updateGame1, %function
updateGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L109
	mov	lr, pc
	bx	r3
	ldr	r3, .L109+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L109+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L110:
	.align	2
.L109:
	.word	updatePlayer
	.word	updateBanana
	.word	winCondition
	.size	updateGame1, .-updateGame1
	.align	2
	.global	drawGame1
	.syntax unified
	.arm
	.type	drawGame1, %function
drawGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L113
	mov	lr, pc
	bx	r3
	ldr	r3, .L113+4
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r1, .L113+8
	ldr	r2, .L113+12
	ldrh	r1, [r1]
	ldrh	r2, [r2]
	strh	r1, [r3, #20]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #22]	@ movhi
	bx	lr
.L114:
	.align	2
.L113:
	.word	drawPlayer
	.word	drawCollection
	.word	hOff
	.word	vOff
	.size	drawGame1, .-drawGame1
	.align	2
	.global	updateGame2
	.syntax unified
	.arm
	.type	updateGame2, %function
updateGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L117
	mov	lr, pc
	bx	r3
	ldr	r3, .L117+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L117+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L118:
	.align	2
.L117:
	.word	updatePlayer
	.word	updateBear
	.word	winCondition
	.size	updateGame2, .-updateGame2
	.align	2
	.global	drawGame2
	.syntax unified
	.arm
	.type	drawGame2, %function
drawGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L121
	mov	lr, pc
	bx	r3
	ldr	r3, .L121+4
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r1, .L121+8
	ldr	r2, .L121+12
	ldrh	r1, [r1]
	ldrh	r2, [r2]
	strh	r1, [r3, #20]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #22]	@ movhi
	bx	lr
.L122:
	.align	2
.L121:
	.word	drawPlayer
	.word	drawCollection
	.word	hOff
	.word	vOff
	.size	drawGame2, .-drawGame2
	.align	2
	.global	updateGame3
	.syntax unified
	.arm
	.type	updateGame3, %function
updateGame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L125
	mov	lr, pc
	bx	r3
	ldr	r3, .L125+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L125+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L126:
	.align	2
.L125:
	.word	updatePlayer
	.word	updateCrown
	.word	winCondition
	.size	updateGame3, .-updateGame3
	.align	2
	.global	drawGame3
	.syntax unified
	.arm
	.type	drawGame3, %function
drawGame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L129
	mov	lr, pc
	bx	r3
	ldr	r3, .L129+4
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r1, .L129+8
	ldr	r2, .L129+12
	ldrh	r1, [r1]
	ldrh	r2, [r2]
	strh	r1, [r3, #20]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #22]	@ movhi
	bx	lr
.L130:
	.align	2
.L129:
	.word	drawPlayer
	.word	drawCollection
	.word	hOff
	.word	vOff
	.size	drawGame3, .-drawGame3
	.ident	"GCC: (devkitARM release 66) 15.1.0"
