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
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	mov	r6, #4608
	mov	ip, #67108864
	mov	lr, #23552
	ldr	r5, .L4+8
	strh	r6, [ip]	@ movhi
	ldr	r4, .L4+12
	strh	r5, [ip, #8]	@ movhi
	mov	r3, #16384
	strh	lr, [ip, #10]	@ movhi
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+36
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+40
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r2, #1
	mov	r4, #0
	ldr	r3, .L4+44
	ldr	r1, .L4+48
	str	r0, [r3]
	ldr	r3, .L4+52
	ldr	r5, .L4+40
	str	r2, [r3]
	ldr	r1, [r1]
	ldr	r0, .L4+56
	ldr	r3, .L4+60
	str	r4, [r5, #1024]
	mov	lr, pc
	bx	r3
	str	r4, [r5, #1028]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	setupSounds
	.word	24068
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	startMusic_length
	.word	level
	.word	startMusic_data
	.word	playSoundA
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #3
	push	{r4, r5, r6, lr}
	mov	r2, #1
	mov	r5, #0
	ldr	r3, .L8
	ldr	r1, .L8+4
	ldr	r4, .L8+8
	ldr	ip, .L8+12
	str	r0, [r3]
	ldr	r1, [r1]
	ldr	r0, .L8+16
	ldr	r3, .L8+20
	str	r5, [r4, #1024]
	str	r2, [ip]
	mov	lr, pc
	bx	r3
	str	r5, [r4, #1028]
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR1
	.word	startMusic_length
	.word	.LANCHOR0
	.word	level
	.word	startMusic_data
	.word	playSoundA
	.size	goToStart, .-goToStart
	.align	2
	.global	start
	.syntax unified
	.arm
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r1, #0
	mov	r5, #512
	ldr	r2, .L16
	strh	r5, [r3]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r4, .L16+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+8
	mov	lr, pc
	bx	r4
	mov	r3, #976
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L16+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L16+16
	ldr	r1, .L16+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L16+24
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, r5
	ldr	r1, .L16+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r1, .L16+28
	add	r3, r1, #1024
	ldrh	r2, [r3, #8]
	tst	r2, #8
	beq	.L10
	ldrh	r3, [r3, #10]
	tst	r3, #8
	moveq	r3, #1
	streq	r3, [r1, #1028]
.L10:
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	waitForVBlank
	.word	DMANow
	.word	startPal
	.word	startTiles
	.word	100720640
	.word	startMap
	.word	hideSprites
	.word	.LANCHOR0
	.size	start, .-start
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L19
	str	r2, [r3, #1028]
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToGame1
	.syntax unified
	.arm
	.type	goToGame1, %function
goToGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r0, #4864
	mov	r2, #2
	push	{r4, r5, r6, lr}
	ldr	r5, .L25
	strh	r0, [r1]	@ movhi
	ldr	r3, .L25+4
	ldr	r4, .L25+8
	str	r2, [r5, #1028]
	mov	lr, pc
	bx	r3
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L25+12
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L25+16
	ldr	r1, .L25+20
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L25+24
	ldr	r1, .L25+28
	mov	lr, pc
	bx	r4
	mov	r3, #112
	mov	r0, #3
	ldr	r2, .L25+32
	ldr	r1, .L25+36
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L25+40
	ldr	r1, .L25+44
	mov	lr, pc
	bx	r4
	ldr	r3, [r5, #1024]
	cmp	r3, #0
	beq	.L24
	pop	{r4, r5, r6, lr}
	bx	lr
.L24:
	mov	r4, #1
	ldr	r2, .L25+48
	ldr	r3, .L25+52
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+60
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L25+64
	ldr	r3, .L25+68
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	DMANow
	.word	background1Pal
	.word	11888
	.word	background1Tiles
	.word	100720640
	.word	background1Map
	.word	100679680
	.word	map1Tiles
	.word	100724736
	.word	map1Map
	.word	level
	.word	initializePlayer
	.word	initializeBanana
	.word	game1Music_length
	.word	game1Music_data
	.word	playSoundA
	.size	goToGame1, .-goToGame1
	.align	2
	.global	game1
	.syntax unified
	.arm
	.type	game1, %function
game1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L40
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+4
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	ldr	r4, .L40+8
	ldr	r3, [r4, #1036]
	add	r2, r3, r3, lsr #31
	asr	r2, r2, #1
	lsl	r2, r2, #16
	lsl	r3, r3, #16
	lsr	r2, r2, #16
	lsr	r3, r3, #16
	strh	r2, [r1, #20]	@ movhi
	ldr	r0, .L40+12
	strh	r3, [r1, #16]	@ movhi
	mov	lr, pc
	bx	r0
	add	r3, r4, #1024
	ldrh	r2, [r3, #8]
	tst	r2, #8
	beq	.L28
	ldrh	r1, [r3, #10]
	ands	r1, r1, #8
	beq	.L38
.L28:
	tst	r2, #2
	beq	.L29
	ldrh	r3, [r3, #10]
	tst	r3, #2
	moveq	r3, #1
	streq	r3, [r4, #1028]
.L29:
	ldr	r3, .L40+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L39
	pop	{r4, lr}
	bx	lr
.L39:
	mov	r2, #7
	ldr	r3, .L40+20
	str	r2, [r4, #1028]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L38:
	mov	r0, #5
	ldr	r2, [r4, #1036]
	ldr	ip, [r4, #1048]
	str	r2, [r4, #1040]
	ldr	r2, .L40+20
	str	r1, [r4, #1036]
	str	r1, [r4, #1048]
	str	ip, [r4, #1044]
	str	r0, [r4, #1028]
	mov	lr, pc
	bx	r2
	add	r3, r4, #1024
	ldrh	r2, [r3, #8]
	b	.L28
.L41:
	.align	2
.L40:
	.word	updateGame1
	.word	drawGame1
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	.LANCHOR1
	.word	pauseSounds
	.size	game1, .-game1
	.align	2
	.global	goToGame2
	.syntax unified
	.arm
	.type	goToGame2, %function
goToGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #4864
	push	{r4, lr}
	ldr	r3, .L46
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r4, .L46+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L46+8
	mov	lr, pc
	bx	r4
	mov	r3, #12416
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L46+12
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L46+16
	ldr	r1, .L46+20
	mov	lr, pc
	bx	r4
	mov	r3, #112
	mov	r0, #3
	ldr	r2, .L46+24
	ldr	r1, .L46+28
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L46+32
	ldr	r1, .L46+36
	mov	lr, pc
	bx	r4
	ldr	r4, .L46+40
	ldr	r3, [r4, #1024]
	cmp	r3, #0
	beq	.L45
	mov	r3, #3
	str	r3, [r4, #1028]
	pop	{r4, lr}
	bx	lr
.L45:
	mov	r1, #2
	ldr	r2, .L46+44
	ldr	r3, .L46+48
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+56
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L46+60
	ldr	r3, .L46+64
	mov	lr, pc
	bx	r3
	mov	r3, #3
	str	r3, [r4, #1028]
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	waitForVBlank
	.word	DMANow
	.word	background2Pal
	.word	background2Tiles
	.word	100720640
	.word	background2Map
	.word	100679680
	.word	map2Tiles
	.word	100724736
	.word	map2Map
	.word	.LANCHOR0
	.word	level
	.word	initializePlayer
	.word	initializeBear
	.word	game2Music_length
	.word	game2Music_data
	.word	playSoundA
	.size	goToGame2, .-goToGame2
	.align	2
	.global	game2
	.syntax unified
	.arm
	.type	game2, %function
game2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L61
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+4
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	ldr	r4, .L61+8
	ldr	r3, [r4, #1036]
	add	r2, r3, r3, lsr #31
	asr	r2, r2, #1
	lsl	r2, r2, #16
	lsl	r3, r3, #16
	lsr	r2, r2, #16
	lsr	r3, r3, #16
	strh	r2, [r1, #20]	@ movhi
	ldr	r0, .L61+12
	strh	r3, [r1, #16]	@ movhi
	mov	lr, pc
	bx	r0
	add	r3, r4, #1024
	ldrh	r2, [r3, #8]
	tst	r2, #8
	beq	.L49
	ldrh	r1, [r3, #10]
	ands	r1, r1, #8
	beq	.L59
.L49:
	tst	r2, #2
	beq	.L50
	ldrh	r3, [r3, #10]
	tst	r3, #2
	moveq	r3, #1
	streq	r3, [r4, #1028]
.L50:
	ldr	r3, .L61+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L60
	pop	{r4, lr}
	bx	lr
.L60:
	mov	r2, #7
	ldr	r3, .L61+20
	str	r2, [r4, #1028]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L59:
	mov	r0, #5
	ldr	r2, [r4, #1036]
	ldr	ip, [r4, #1048]
	str	r2, [r4, #1040]
	ldr	r2, .L61+20
	str	r1, [r4, #1036]
	str	r1, [r4, #1048]
	str	ip, [r4, #1044]
	str	r0, [r4, #1028]
	mov	lr, pc
	bx	r2
	add	r3, r4, #1024
	ldrh	r2, [r3, #8]
	b	.L49
.L62:
	.align	2
.L61:
	.word	updateGame2
	.word	drawGame2
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	.LANCHOR1
	.word	pauseSounds
	.size	game2, .-game2
	.align	2
	.global	goToGame3
	.syntax unified
	.arm
	.type	goToGame3, %function
goToGame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #4864
	push	{r4, lr}
	ldr	r3, .L67
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r4, .L67+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L67+8
	mov	lr, pc
	bx	r4
	mov	r3, #12416
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L67+12
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L67+16
	ldr	r1, .L67+20
	mov	lr, pc
	bx	r4
	mov	r3, #112
	mov	r0, #3
	ldr	r2, .L67+24
	ldr	r1, .L67+28
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L67+32
	ldr	r1, .L67+36
	mov	lr, pc
	bx	r4
	ldr	r4, .L67+40
	ldr	r3, [r4, #1024]
	cmp	r3, #0
	beq	.L66
	mov	r3, #4
	str	r3, [r4, #1028]
	pop	{r4, lr}
	bx	lr
.L66:
	mov	r1, #3
	ldr	r2, .L67+44
	ldr	r3, .L67+48
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L67+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L67+56
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L67+60
	ldr	r3, .L67+64
	mov	lr, pc
	bx	r3
	mov	r3, #4
	str	r3, [r4, #1028]
	pop	{r4, lr}
	bx	lr
.L68:
	.align	2
.L67:
	.word	waitForVBlank
	.word	DMANow
	.word	background2Pal
	.word	background2Tiles
	.word	100720640
	.word	background2Map
	.word	100679680
	.word	map2Tiles
	.word	100724736
	.word	map2Map
	.word	.LANCHOR0
	.word	level
	.word	initializePlayer
	.word	initializeCrown
	.word	game3Music_length
	.word	game3Music_data
	.word	playSoundA
	.size	goToGame3, .-goToGame3
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r1, #0
	mov	r5, #512
	ldr	r2, .L80
	strh	r5, [r3]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r4, .L80+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L80+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L80+12
	ldr	r1, .L80+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L80+20
	ldr	r1, .L80+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L80+28
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, r5
	mov	r0, #3
	ldr	r1, .L80+32
	mov	lr, pc
	bx	r4
	ldr	r3, .L80+36
	ldrh	r2, [r3, #8]
	tst	r2, #8
	beq	.L69
	ldrh	r3, [r3, #10]
	tst	r3, #8
	bne	.L69
	ldr	r2, .L80+32
	mov	r0, r2
	ldr	r3, .L80+40
	ldr	r3, [r3]
	ldr	r1, [r2, #1040]
	ldr	r2, [r2, #1044]
	cmp	r3, #1
	str	r1, [r0, #1036]
	str	r2, [r0, #1048]
	beq	.L78
	cmp	r3, #2
	beq	.L79
	bl	goToGame3
.L72:
	mov	r3, #0
	ldr	r2, .L80+32
	str	r3, [r2, #1024]
.L69:
	pop	{r4, r5, r6, lr}
	bx	lr
.L78:
	bl	goToGame1
	b	.L72
.L79:
	bl	goToGame2
	b	.L72
.L81:
	.align	2
.L80:
	.word	waitForVBlank
	.word	DMANow
	.word	instructionPal
	.word	4256
	.word	instructionTiles
	.word	100720640
	.word	instructionMap
	.word	hideSprites
	.word	.LANCHOR0
	.word	.LANCHOR0+1024
	.word	level
	.size	instructions, .-instructions
	.align	2
	.global	game3
	.syntax unified
	.arm
	.type	game3, %function
game3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L95
	mov	lr, pc
	bx	r3
	ldr	r3, .L95+4
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	ldr	r4, .L95+8
	ldr	r3, [r4, #1036]
	add	r2, r3, r3, lsr #31
	asr	r2, r2, #1
	lsl	r2, r2, #16
	lsl	r3, r3, #16
	lsr	r2, r2, #16
	lsr	r3, r3, #16
	strh	r2, [r1, #20]	@ movhi
	ldr	r0, .L95+12
	strh	r3, [r1, #16]	@ movhi
	mov	lr, pc
	bx	r0
	add	r3, r4, #1024
	ldrh	r2, [r3, #8]
	tst	r2, #8
	beq	.L83
	ldrh	r1, [r3, #10]
	ands	r1, r1, #8
	beq	.L93
.L83:
	tst	r2, #2
	beq	.L84
	ldrh	r3, [r3, #10]
	tst	r3, #2
	moveq	r3, #1
	streq	r3, [r4, #1028]
.L84:
	ldr	r3, .L95+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L94
	pop	{r4, lr}
	bx	lr
.L94:
	mov	r2, #7
	ldr	r3, .L95+20
	str	r2, [r4, #1028]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L93:
	mov	r0, #5
	ldr	r2, [r4, #1036]
	ldr	ip, [r4, #1048]
	str	r2, [r4, #1040]
	ldr	r2, .L95+20
	str	r1, [r4, #1036]
	str	r1, [r4, #1048]
	str	ip, [r4, #1044]
	str	r0, [r4, #1028]
	mov	lr, pc
	bx	r2
	add	r3, r4, #1024
	ldrh	r2, [r3, #8]
	b	.L83
.L96:
	.align	2
.L95:
	.word	updateGame3
	.word	drawGame3
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	.LANCHOR1
	.word	pauseSounds
	.size	game3, .-game3
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	mov	r0, #5
	ldr	r3, .L99
	push	{r4, lr}
	ldr	ip, [r3, #1036]
	str	ip, [r3, #1040]
	ldr	ip, [r3, #1048]
	ldr	r1, .L99+4
	str	ip, [r3, #1044]
	str	r2, [r3, #1036]
	str	r2, [r3, #1048]
	str	r0, [r3, #1028]
	mov	lr, pc
	bx	r1
	pop	{r4, lr}
	bx	lr
.L100:
	.align	2
.L99:
	.word	.LANCHOR0
	.word	pauseSounds
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r0, #0
	mov	r5, #512
	mov	r1, #1
	ldr	r6, .L118
	strh	r5, [r3]	@ movhi
	ldr	r2, .L118+4
	strh	r0, [r3, #20]	@ movhi
	ldr	r4, .L118+8
	str	r1, [r6, #1024]
	mov	lr, pc
	bx	r2
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L118+12
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L118+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L118+20
	ldr	r1, .L118+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L118+28
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	mov	r1, r6
	mov	lr, pc
	bx	r4
	add	r3, r6, #1024
	ldrh	r2, [r3, #8]
	tst	r2, #8
	beq	.L102
	ldrh	r1, [r3, #10]
	tst	r1, #8
	beq	.L114
.L102:
	tst	r2, #4
	beq	.L101
	ldrh	r3, [r3, #10]
	ands	r4, r3, #4
	beq	.L115
.L101:
	pop	{r4, r5, r6, lr}
	bx	lr
.L114:
	ldr	r3, .L118+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L118+36
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L116
	cmp	r3, #2
	beq	.L117
	bl	goToGame3
.L104:
	mov	r3, #0
	ldr	r2, .L118
	pop	{r4, r5, r6, lr}
	str	r3, [r2, #1024]
	bx	lr
.L115:
	mov	r0, #3
	mov	r2, #1
	ldr	r3, .L118+40
	ldr	r1, .L118+44
	str	r0, [r3]
	ldr	r3, .L118+36
	ldr	r5, .L118
	str	r2, [r3]
	ldr	r1, [r1]
	ldr	r0, .L118+48
	ldr	r3, .L118+52
	str	r4, [r5, #1024]
	mov	lr, pc
	bx	r3
	str	r4, [r5, #1028]
	pop	{r4, r5, r6, lr}
	bx	lr
.L117:
	bl	goToGame2
	b	.L104
.L116:
	bl	goToGame1
	b	.L104
.L119:
	.align	2
.L118:
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	DMANow
	.word	pausePal
	.word	pauseTiles
	.word	100720640
	.word	pauseMap
	.word	hideSprites
	.word	unpauseSounds
	.word	level
	.word	.LANCHOR1
	.word	startMusic_length
	.word	startMusic_data
	.word	playSoundA
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #7
	push	{r4, lr}
	ldr	r2, .L122
	ldr	r3, .L122+4
	str	r1, [r2, #1028]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L123:
	.align	2
.L122:
	.word	.LANCHOR0
	.word	pauseSounds
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r0, #0
	mov	r5, #512
	mov	r1, #7
	ldr	r6, .L131
	strh	r5, [r3]	@ movhi
	ldr	r2, .L131+4
	strh	r0, [r3, #20]	@ movhi
	ldr	r4, .L131+8
	str	r1, [r6, #1028]
	mov	lr, pc
	bx	r2
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L131+12
	mov	lr, pc
	bx	r4
	mov	r3, #1120
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L131+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L131+20
	ldr	r1, .L131+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L131+28
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	mov	r1, r6
	mov	lr, pc
	bx	r4
	add	r3, r6, #1024
	ldrh	r2, [r3, #8]
	tst	r2, #4
	beq	.L124
	ldrh	r3, [r3, #10]
	ands	r4, r3, #4
	beq	.L130
.L124:
	pop	{r4, r5, r6, lr}
	bx	lr
.L130:
	mov	r0, #3
	mov	r2, #1
	ldr	r3, .L131+32
	ldr	r1, .L131+36
	str	r0, [r3]
	ldr	r3, .L131+40
	ldr	r1, [r1]
	str	r2, [r3]
	ldr	r0, .L131+44
	ldr	r3, .L131+48
	str	r4, [r6, #1024]
	mov	lr, pc
	bx	r3
	str	r4, [r6, #1028]
	pop	{r4, r5, r6, lr}
	bx	lr
.L132:
	.align	2
.L131:
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	DMANow
	.word	losePal
	.word	loseTiles
	.word	100720640
	.word	loseMap
	.word	hideSprites
	.word	.LANCHOR1
	.word	startMusic_length
	.word	level
	.word	startMusic_data
	.word	playSoundA
	.size	lose, .-lose
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #6
	ldr	r3, .L135
	ldr	ip, .L135+4
	ldr	r1, [r3]
	mov	r2, #0
	ldr	r0, .L135+8
	ldr	r3, .L135+12
	str	lr, [ip, #1028]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L136:
	.align	2
.L135:
	.word	winMusic_length
	.word	.LANCHOR0
	.word	winMusic_data
	.word	playSoundA
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r0, #0
	mov	r5, #512
	mov	r1, #6
	ldr	r6, .L145
	strh	r5, [r3]	@ movhi
	ldr	r2, .L145+4
	strh	r0, [r3, #20]	@ movhi
	ldr	r4, .L145+8
	str	r1, [r6, #1028]
	mov	lr, pc
	bx	r2
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L145+12
	mov	lr, pc
	bx	r4
	mov	r3, #1312
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L145+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L145+20
	ldr	r1, .L145+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L145+28
	mov	lr, pc
	bx	r3
	mov	r1, r6
	mov	r0, #3
	mov	r3, r5
	mov	r2, #117440512
	mov	lr, pc
	bx	r4
	add	r2, r6, #1024
	ldrh	r3, [r2, #10]
	tst	r3, #1
	moveq	r1, #1
	ldreq	r0, .L145+32
	ldreq	ip, .L145+36
	strheq	r1, [ip]	@ movhi
	strheq	r1, [r0, #2]	@ movhi
	ldrh	r2, [r2, #8]
	tst	r2, #4
	beq	.L137
	ands	r4, r3, #4
	beq	.L144
.L137:
	pop	{r4, r5, r6, lr}
	bx	lr
.L144:
	mov	r0, #3
	mov	r2, #1
	ldr	r3, .L145+40
	ldr	r1, .L145+44
	str	r0, [r3]
	ldr	r3, .L145+48
	ldr	r5, .L145
	str	r2, [r3]
	ldr	r1, [r1]
	ldr	r0, .L145+52
	ldr	r3, .L145+56
	str	r4, [r5, #1024]
	mov	lr, pc
	bx	r3
	str	r4, [r5, #1028]
	pop	{r4, r5, r6, lr}
	bx	lr
.L146:
	.align	2
.L145:
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	DMANow
	.word	winPal
	.word	winTiles
	.word	100720640
	.word	winMap
	.word	hideSprites
	.word	100721172
	.word	100721188
	.word	.LANCHOR1
	.word	startMusic_length
	.word	level
	.word	startMusic_data
	.word	playSoundA
	.size	win, .-win
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L161
	ldr	r5, .L161+4
	mov	lr, pc
	bx	r3
	ldr	fp, .L161+8
	ldr	r8, .L161+12
	ldr	r10, .L161+16
	ldr	r9, .L161+20
	ldr	r7, .L161+24
	ldr	r6, .L161+28
	add	r4, r5, #1024
.L158:
	ldrh	r3, [r4, #10]
	strh	r3, [r4, #8]	@ movhi
	ldrh	r3, [r6, #48]
	strh	r3, [r4, #10]	@ movhi
	ldr	r3, [r5, #1028]
	cmp	r3, #7
	bhi	.L148
	ldrb	r3, [r8, r3]
	add	pc, pc, r3, lsl #2
.Lrtx150:
	nop
	.section	.rodata
.L150:
	.byte	(.L157-.Lrtx150-4)/4
	.byte	(.L156-.Lrtx150-4)/4
	.byte	(.L155-.Lrtx150-4)/4
	.byte	(.L154-.Lrtx150-4)/4
	.byte	(.L153-.Lrtx150-4)/4
	.byte	(.L152-.Lrtx150-4)/4
	.byte	(.L151-.Lrtx150-4)/4
	.byte	(.L149-.Lrtx150-4)/4
	.section	.text.startup
	.p2align 2
.L149:
	ldr	r3, .L161+32
	mov	lr, pc
	bx	r3
.L148:
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r5
	mov	r0, #3
	mov	lr, pc
	bx	r7
	b	.L158
.L151:
	ldr	r3, .L161+36
	mov	lr, pc
	bx	r3
	b	.L148
.L152:
	ldr	r3, .L161+40
	mov	lr, pc
	bx	r3
	b	.L148
.L153:
	ldr	r3, .L161+44
	mov	lr, pc
	bx	r3
	b	.L148
.L154:
	ldr	r3, .L161+48
	mov	lr, pc
	bx	r3
	b	.L148
.L155:
	mov	lr, pc
	bx	r9
	b	.L148
.L157:
	mov	lr, pc
	bx	fp
	b	.L148
.L156:
	mov	lr, pc
	bx	r10
	b	.L148
.L162:
	.align	2
.L161:
	.word	initialize
	.word	.LANCHOR0
	.word	start
	.word	.L150
	.word	instructions
	.word	game1
	.word	DMANow
	.word	67109120
	.word	lose
	.word	win
	.word	pause
	.word	game3
	.word	game2
	.size	main, .-main
	.global	buttons
	.global	oldButtons
	.global	savedVOff
	.global	savedHOff
	.global	vOff
	.global	hOff
	.global	paused
	.global	lives
	.global	state
	.global	shadowOAM
	.global	soundB
	.global	soundA
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	lives, %object
	.size	lives, 4
lives:
	.word	3
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	shadowOAM, %object
	.size	shadowOAM, 1024
shadowOAM:
	.space	1024
	.type	paused, %object
	.size	paused, 4
paused:
	.space	4
	.type	state, %object
	.size	state, 4
state:
	.space	4
	.type	oldButtons, %object
	.size	oldButtons, 2
oldButtons:
	.space	2
	.type	buttons, %object
	.size	buttons, 2
buttons:
	.space	2
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	savedHOff, %object
	.size	savedHOff, 4
savedHOff:
	.space	4
	.type	savedVOff, %object
	.size	savedVOff, 4
savedVOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.type	soundB, %object
	.size	soundB, 24
soundB:
	.space	24
	.type	soundA, %object
	.size	soundA, 24
soundA:
	.space	24
	.ident	"GCC: (devkitARM release 66) 15.1.0"
