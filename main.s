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
	mov	r6, #4864
	mov	ip, #67108864
	mov	r5, #5120
	ldr	lr, .L4+4
	strh	r6, [ip]	@ movhi
	ldr	r4, .L4+8
	strh	r5, [ip, #10]	@ movhi
	mov	r3, #16384
	strh	lr, [ip, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+36
	mov	lr, pc
	bx	r4
	mov	r1, #3
	mov	ip, #1
	mov	r3, #0
	ldr	r2, .L4+40
	ldr	r0, .L4+44
	str	r1, [r2]
	ldr	r2, .L4+36
	str	ip, [r0]
	str	r3, [r2, #1024]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	23556
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	level
	.size	initialize, .-initialize
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
	ldr	r3, .L7
	str	r2, [r3, #1024]
	bx	lr
.L8:
	.align	2
.L7:
	.word	.LANCHOR0
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r0, #3
	mov	lr, #0
	mov	r2, #1
	ldr	r1, .L11
	ldr	r3, .L11+4
	ldr	ip, .L11+8
	str	r0, [r1]
	str	lr, [ip, #1024]
	str	r2, [r3]
	ldr	lr, [sp], #4
	bx	lr
.L12:
	.align	2
.L11:
	.word	.LANCHOR1
	.word	level
	.word	.LANCHOR0
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
	push	{r4, lr}
	mov	r3, #1024
	ldr	r4, .L19
	mov	r0, #3
	ldr	r2, .L19+4
	ldr	r1, .L19+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L19+12
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	ldr	r1, .L19+16
	mov	r3, #976
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L19+20
	mov	lr, pc
	bx	r3
	ldr	r2, .L19+24
	add	r3, r2, #1024
	ldrh	r1, [r3, #4]
	tst	r1, #8
	beq	.L13
	ldrh	r3, [r3, #6]
	tst	r3, #8
	moveq	r3, #1
	streq	r3, [r2, #1024]
.L13:
	pop	{r4, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	DMANow
	.word	100704256
	.word	startMap
	.word	startPal
	.word	startTiles
	.word	hideSprites
	.word	.LANCHOR0
	.size	start, .-start
	.align	2
	.global	goToGame1
	.syntax unified
	.arm
	.type	goToGame1, %function
goToGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #2
	push	{r4, r5, r6, lr}
	ldr	r4, .L25
	ldr	r5, .L25+4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L25+8
	ldr	r1, .L25+12
	str	ip, [r4, #1024]
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L25+16
	mov	lr, pc
	bx	r5
	mov	r3, #512
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L25+20
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #1032]
	cmp	r3, #0
	beq	.L24
	mov	r3, #0
	str	r3, [r4, #1032]
	pop	{r4, r5, r6, lr}
	bx	lr
.L24:
	mov	ip, #3
	mov	r1, #1
	ldr	r0, .L25+24
	ldr	r2, .L25+28
	ldr	r3, .L25+32
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+36
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [r4, #1032]
	pop	{r4, r5, r6, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	.LANCHOR0
	.word	DMANow
	.word	100704256
	.word	map1Map
	.word	tilesetPal
	.word	tilesetTiles
	.word	.LANCHOR1
	.word	level
	.word	initializePlayer
	.word	initializeBanana
	.size	goToGame1, .-goToGame1
	.align	2
	.global	goToGame2
	.syntax unified
	.arm
	.type	goToGame2, %function
goToGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #2048
	ldr	r4, .L31
	mov	r0, #3
	ldr	r2, .L31+4
	ldr	r1, .L31+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L31+12
	mov	lr, pc
	bx	r4
	mov	r3, #512
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L31+16
	mov	lr, pc
	bx	r4
	ldr	r4, .L31+20
	ldr	r3, [r4, #1032]
	cmp	r3, #0
	beq	.L30
	mov	r3, #3
	str	r3, [r4, #1024]
	pop	{r4, lr}
	bx	lr
.L30:
	mov	ip, #3
	mov	r1, #2
	ldr	r0, .L31+24
	ldr	r2, .L31+28
	ldr	r3, .L31+32
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+36
	mov	lr, pc
	bx	r3
	mov	r3, #3
	str	r3, [r4, #1024]
	pop	{r4, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	DMANow
	.word	100704256
	.word	map2Map
	.word	tilesetPal
	.word	tilesetTiles
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	level
	.word	initializePlayer
	.word	initializeBear
	.size	goToGame2, .-goToGame2
	.align	2
	.global	goToGame3
	.syntax unified
	.arm
	.type	goToGame3, %function
goToGame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #2048
	ldr	r4, .L37
	mov	r0, #3
	ldr	r2, .L37+4
	ldr	r1, .L37+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L37+12
	mov	lr, pc
	bx	r4
	mov	r3, #512
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L37+16
	mov	lr, pc
	bx	r4
	ldr	r4, .L37+20
	ldr	r3, [r4, #1032]
	cmp	r3, #0
	beq	.L36
	mov	r3, #4
	str	r3, [r4, #1024]
	pop	{r4, lr}
	bx	lr
.L36:
	mov	r3, #3
	ldr	r0, .L37+24
	ldr	r1, .L37+28
	ldr	r2, .L37+32
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	ldr	r3, .L37+36
	mov	lr, pc
	bx	r3
	mov	r3, #4
	str	r3, [r4, #1024]
	pop	{r4, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	DMANow
	.word	100704256
	.word	map3Map
	.word	tilesetPal
	.word	tilesetTiles
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	level
	.word	initializePlayer
	.word	initializeCrown
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
	push	{r4, lr}
	mov	r3, #1024
	ldr	r4, .L49
	mov	r0, #3
	ldr	r2, .L49+4
	ldr	r1, .L49+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L49+12
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L49+16
	ldr	r1, .L49+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L49+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+28
	ldrh	r2, [r3, #4]
	tst	r2, #8
	beq	.L39
	ldrh	r3, [r3, #6]
	tst	r3, #8
	bne	.L39
	ldr	r3, .L49+32
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L47
	cmp	r3, #2
	beq	.L48
	pop	{r4, lr}
	b	goToGame3
.L39:
	pop	{r4, lr}
	bx	lr
.L47:
	pop	{r4, lr}
	b	goToGame1
.L48:
	pop	{r4, lr}
	b	goToGame2
.L50:
	.align	2
.L49:
	.word	DMANow
	.word	100704256
	.word	instructionMap
	.word	instructionPal
	.word	4256
	.word	instructionTiles
	.word	hideSprites
	.word	.LANCHOR0+1024
	.word	level
	.size	instructions, .-instructions
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	mov	ip, #5
	ldr	r0, .L52
	ldr	r3, .L52+4
	ldr	r2, .L52+8
	str	ip, [r3, #1024]
	ldr	ip, [r0]
	str	r1, [r0]
	ldr	r0, [r2]
	str	ip, [r3, #1036]
	str	r1, [r2]
	str	r0, [r3, #1040]
	bx	lr
.L53:
	.align	2
.L52:
	.word	hOff
	.word	.LANCHOR0
	.word	vOff
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
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #1
	push	{r4, r5, r6, lr}
	ldr	r5, .L73
	strh	r2, [r3, #20]	@ movhi
	ldr	r1, .L73+4
	strh	r2, [r3, #22]	@ movhi
	ldr	r4, .L73+8
	str	r0, [r5, #1032]
	mov	lr, pc
	bx	r1
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L73+12
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L73+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L73+20
	ldr	r1, .L73+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L73+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	r1, r5
	mov	lr, pc
	bx	r4
	add	r2, r5, #1024
	ldrh	r3, [r2, #4]
	tst	r3, #8
	beq	.L55
	ldrh	r1, [r2, #6]
	tst	r1, #8
	bne	.L55
	ldr	r3, .L73+32
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L71
	cmp	r3, #2
	beq	.L72
	bl	goToGame3
.L57:
	mov	r3, #0
	ldr	r2, .L73
	str	r3, [r2, #1032]
.L54:
	pop	{r4, r5, r6, lr}
	bx	lr
.L55:
	tst	r3, #4
	beq	.L60
	ldrh	r1, [r2, #6]
	ands	r1, r1, #4
	bne	.L60
	mov	ip, #3
	mov	r2, #1
	ldr	r3, .L73
	ldr	r0, .L73+36
	str	r1, [r3, #1024]
	ldr	r3, .L73+32
	str	ip, [r0]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L60:
	tst	r3, #1
	beq	.L54
	ldrh	r3, [r2, #6]
	tst	r3, #1
	moveq	r3, #1
	ldreq	r2, .L73
	pop	{r4, r5, r6, lr}
	streq	r3, [r2, #1024]
	bx	lr
.L71:
	bl	goToGame1
	b	.L57
.L72:
	bl	goToGame2
	b	.L57
.L74:
	.align	2
.L73:
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	DMANow
	.word	pausePal
	.word	pauseTiles
	.word	100704256
	.word	pauseMap
	.word	hideSprites
	.word	level
	.word	.LANCHOR1
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
	@ link register save eliminated.
	mov	r2, #7
	ldr	r3, .L76
	str	r2, [r3, #1024]
	bx	lr
.L77:
	.align	2
.L76:
	.word	.LANCHOR0
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
	push	{r4, lr}
	ldr	r3, .L84
	mov	lr, pc
	bx	r3
	ldr	r4, .L84+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L84+8
	mov	lr, pc
	bx	r4
	mov	r3, #1120
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L84+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L84+16
	ldr	r1, .L84+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L84+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L84+28
	mov	lr, pc
	bx	r4
	ldr	ip, .L84+28
	add	r3, ip, #1024
	ldrh	r2, [r3, #4]
	tst	r2, #4
	beq	.L78
	ldrh	r3, [r3, #6]
	ands	r3, r3, #4
	bne	.L78
	mov	r0, #3
	mov	r2, #1
	ldr	r1, .L84+32
	str	r3, [ip, #1024]
	ldr	r3, .L84+36
	str	r0, [r1]
	str	r2, [r3]
.L78:
	pop	{r4, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	waitForVBlank
	.word	DMANow
	.word	losePal
	.word	loseTiles
	.word	100704256
	.word	loseMap
	.word	hideSprites
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	level
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
	@ link register save eliminated.
	mov	r2, #6
	ldr	r3, .L87
	str	r2, [r3, #1024]
	bx	lr
.L88:
	.align	2
.L87:
	.word	.LANCHOR0
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
	push	{r4, lr}
	ldr	r3, .L95
	mov	lr, pc
	bx	r3
	ldr	r4, .L95+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L95+8
	mov	lr, pc
	bx	r4
	mov	r3, #1312
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L95+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L95+16
	ldr	r1, .L95+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L95+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L95+28
	mov	lr, pc
	bx	r4
	ldr	ip, .L95+28
	add	r3, ip, #1024
	ldrh	r2, [r3, #4]
	tst	r2, #4
	beq	.L89
	ldrh	r3, [r3, #6]
	ands	r3, r3, #4
	bne	.L89
	mov	r0, #3
	mov	r2, #1
	ldr	r1, .L95+32
	str	r3, [ip, #1024]
	ldr	r3, .L95+36
	str	r0, [r1]
	str	r2, [r3]
.L89:
	pop	{r4, lr}
	bx	lr
.L96:
	.align	2
.L95:
	.word	waitForVBlank
	.word	DMANow
	.word	winPal
	.word	winTiles
	.word	100704256
	.word	winMap
	.word	hideSprites
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	level
	.size	win, .-win
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Level: %d  Lives: %d\000"
	.text
	.align	2
	.global	reportHud
	.syntax unified
	.arm
	.type	reportHud, %function
reportHud:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L101
	push	{r4, lr}
	ldr	r4, .L101+4
	ldr	r0, [r3, #4]
	ldr	r1, [r4]
	cmp	r0, r1
	ldr	r2, [r3]
	bne	.L98
	ldr	r0, [r3, #8]
	cmp	r0, r2
	beq	.L97
.L98:
	ldr	r3, .L101+8
	ldr	r0, .L101+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L101
	ldr	r1, [r4]
	ldr	r2, [r3]
	stmib	r3, {r1, r2}
.L97:
	pop	{r4, lr}
	bx	lr
.L102:
	.align	2
.L101:
	.word	.LANCHOR1
	.word	level
	.word	mgba_printf
	.word	.LC0
	.size	reportHud, .-reportHud
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
	ldr	r3, .L109
	mov	lr, pc
	bx	r3
	ldr	r3, .L109+4
	mov	lr, pc
	bx	r3
	bl	reportHud
	ldr	r3, .L109+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L109+12
	add	r2, r3, #1024
	ldrh	ip, [r2, #4]
	ldr	r1, [r3, #1036]
	ldr	r0, .L109+16
	tst	ip, #8
	str	r1, [r0]
	ldr	ip, [r3, #1040]
	ldr	r1, .L109+20
	str	ip, [r1]
	beq	.L103
	ldrh	r2, [r2, #6]
	ands	r2, r2, #8
	moveq	ip, #5
	streq	r2, [r0]
	streq	r2, [r1]
	streq	ip, [r3, #1024]
.L103:
	pop	{r4, lr}
	bx	lr
.L110:
	.align	2
.L109:
	.word	updateGame1
	.word	drawGame1
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	hOff
	.word	vOff
	.size	game1, .-game1
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
	ldr	r3, .L117
	mov	lr, pc
	bx	r3
	ldr	r3, .L117+4
	mov	lr, pc
	bx	r3
	bl	reportHud
	ldr	r3, .L117+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L117+12
	add	r2, r3, #1024
	ldrh	r1, [r2, #4]
	tst	r1, #8
	beq	.L111
	ldrh	r2, [r2, #6]
	ands	r2, r2, #8
	bne	.L111
	ldr	r0, .L117+16
	ldr	ip, [r0]
	str	r2, [r0]
	mov	r0, #5
	ldr	r1, .L117+20
	str	ip, [r3, #1036]
	ldr	ip, [r1]
	str	r0, [r3, #1024]
	str	r2, [r1]
	str	ip, [r3, #1040]
.L111:
	pop	{r4, lr}
	bx	lr
.L118:
	.align	2
.L117:
	.word	updateGame2
	.word	drawGame2
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	hOff
	.word	vOff
	.size	game2, .-game2
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
	ldr	r3, .L125
	mov	lr, pc
	bx	r3
	ldr	r3, .L125+4
	mov	lr, pc
	bx	r3
	bl	reportHud
	ldr	r3, .L125+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L125+12
	add	r2, r3, #1024
	ldrh	r1, [r2, #4]
	tst	r1, #8
	beq	.L119
	ldrh	r2, [r2, #6]
	ands	r2, r2, #8
	bne	.L119
	ldr	r0, .L125+16
	ldr	ip, [r0]
	str	r2, [r0]
	mov	r0, #5
	ldr	r1, .L125+20
	str	ip, [r3, #1036]
	ldr	ip, [r1]
	str	r0, [r3, #1024]
	str	r2, [r1]
	str	ip, [r3, #1040]
.L119:
	pop	{r4, lr}
	bx	lr
.L126:
	.align	2
.L125:
	.word	updateGame3
	.word	drawGame3
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	hOff
	.word	vOff
	.size	game3, .-game3
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
	ldr	r3, .L141
	ldr	r5, .L141+4
	mov	lr, pc
	bx	r3
	ldr	fp, .L141+8
	ldr	r8, .L141+12
	ldr	r10, .L141+16
	ldr	r9, .L141+20
	ldr	r7, .L141+24
	ldr	r6, .L141+28
	add	r4, r5, #1024
.L138:
	ldrh	r3, [r4, #6]
	strh	r3, [r4, #4]	@ movhi
	ldrh	r3, [r6, #48]
	strh	r3, [r4, #6]	@ movhi
	ldr	r3, [r5, #1024]
	cmp	r3, #7
	bhi	.L128
	ldrb	r3, [r8, r3]
	add	pc, pc, r3, lsl #2
.Lrtx130:
	nop
	.section	.rodata
.L130:
	.byte	(.L137-.Lrtx130-4)/4
	.byte	(.L136-.Lrtx130-4)/4
	.byte	(.L135-.Lrtx130-4)/4
	.byte	(.L134-.Lrtx130-4)/4
	.byte	(.L133-.Lrtx130-4)/4
	.byte	(.L132-.Lrtx130-4)/4
	.byte	(.L131-.Lrtx130-4)/4
	.byte	(.L129-.Lrtx130-4)/4
	.section	.text.startup
	.p2align 2
.L129:
	ldr	r3, .L141+32
	mov	lr, pc
	bx	r3
.L128:
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r5
	mov	r0, #3
	mov	lr, pc
	bx	r7
	b	.L138
.L131:
	ldr	r3, .L141+36
	mov	lr, pc
	bx	r3
	b	.L128
.L132:
	ldr	r3, .L141+40
	mov	lr, pc
	bx	r3
	b	.L128
.L133:
	ldr	r3, .L141+44
	mov	lr, pc
	bx	r3
	b	.L128
.L134:
	ldr	r3, .L141+48
	mov	lr, pc
	bx	r3
	b	.L128
.L135:
	mov	lr, pc
	bx	r9
	b	.L128
.L137:
	mov	lr, pc
	bx	fp
	b	.L128
.L136:
	mov	lr, pc
	bx	r10
	b	.L128
.L142:
	.align	2
.L141:
	.word	initialize
	.word	.LANCHOR0
	.word	start
	.word	.L130
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
	.global	paused
	.global	lives
	.global	state
	.global	shadowOAM
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	lives, %object
	.size	lives, 4
lives:
	.word	3
	.type	reportedLevel, %object
	.size	reportedLevel, 4
reportedLevel:
	.word	-1
	.type	reportedLives, %object
	.size	reportedLives, 4
reportedLives:
	.word	-1
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	shadowOAM, %object
	.size	shadowOAM, 1024
shadowOAM:
	.space	1024
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
	.type	paused, %object
	.size	paused, 4
paused:
	.space	4
	.type	savedHOff, %object
	.size	savedHOff, 4
savedHOff:
	.space	4
	.type	savedVOff, %object
	.size	savedVOff, 4
savedVOff:
	.space	4
	.ident	"GCC: (devkitARM release 66) 15.1.0"
