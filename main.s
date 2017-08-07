	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L2
	stmfd	sp!, {r4, lr}
	mov	r4, #0
	str	r4, [r3, #48]
	ldr	r3, .L2+4
	str	r4, [r3, #0]
	ldr	r3, .L2+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r1, #7168	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r2, .L2+12
	ldr	r1, .L2+16
	str	r4, [r1, #0]
	strh	r4, [r3, #16]	@ movhi
	str	r4, [r2, #0]
	str	r4, [r2, #4]
	mov	r2, #4352	@ movhi
	strh	r2, [r3, #0]	@ movhi
	strh	r4, [r3, #18]	@ movhi
	ldr	r0, .L2+20
	ldr	r3, .L2+24
	mov	lr, pc
	bx	r3
	mov	r3, #4480
	mov	r0, #3
	ldr	r1, .L2+28
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r4, .L2+32
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L2+36
	add	r2, r2, #57344
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	player
	.word	timer
	.word	playMenuMusic
	.word	.LANCHOR0
	.word	state
	.word	startPal
	.word	loadPalette
	.word	startTiles
	.word	DMANow
	.word	startMap
	.size	goToStart, .-goToStart
	.align	2
	.global	init
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	goToStart
	.size	init, .-init
	.align	2
	.global	goToInstructions
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L6
	mov	r3, #1
	stmfd	sp!, {r4, lr}
	str	r3, [r2, #0]
	ldr	r2, .L6+4
	ldr	r0, .L6+8
	str	r3, [r2, #0]
	ldr	r3, .L6+12
	mov	lr, pc
	bx	r3
	mov	ip, #67108864
	mov	lr, #6912	@ movhi
	mov	r3, #4800
	mov	r0, #3
	ldr	r1, .L6+16
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r4, .L6+20
	strh	lr, [ip, #8]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L6+24
	add	r2, r2, #55296
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	state
	.word	page
	.word	instructions1Pal
	.word	loadPalette
	.word	instructions1Tiles
	.word	DMANow
	.word	instructions1Map
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, .L14
	mov	lr, pc
	bx	r3
	ldr	r6, .L14+4
	mov	r3, #7424
	mov	r5, #67108864
	add	r3, r3, #2
	ldr	r0, [r6, #0]
	strh	r3, [r5, #8]	@ movhi
	ldr	r3, .L14+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L14+12
	mov	r2, #2
	str	r2, [r3, #0]
	ldr	r0, .L14+16
	ldr	r3, .L14+20
	ldr	r4, .L14+24
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L14+28
	mov	r2, #100663296
	mov	r3, #1440
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L14+32
	add	r2, r2, #59392
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L14+36
	add	r2, r2, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L14+40
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldrh	ip, [r5, #0]
	mov	r2, #100663296
	orr	ip, ip, #512
	mov	r0, #3
	ldr	r1, .L14+44
	add	r2, r2, #16384
	mov	r3, #1232
	strh	ip, [r5, #0]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L14+48
	mov	lr, pc
	bx	r4
	ldr	r2, .L14+52
	mov	r3, #0
.L9:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L9
	ldr	r1, .L14+56
	mov	r4, #20480
	ldr	r0, .L14+60
	str	r4, [r1, #0]
	mov	r4, #13
	mov	r2, #0
	str	r4, [r1, #12]
	ldr	r3, .L14+64
	mov	r4, #29
	mov	ip, #5
	str	r4, [r1, #8]
	str	r2, [r0, #24]
	mov	r4, #80
	str	r2, [r0, #68]
	str	r2, [r0, #112]
	str	r2, [r1, #4]
	str	r2, [r1, #28]
	str	r2, [r1, #32]
	str	ip, [r1, #24]
	str	r4, [r1, #16]
	str	r2, [r1, #20]
	str	ip, [r1, #36]
	str	r2, [r1, #40]
	str	r2, [r1, #44]
	str	r2, [r1, #48]
	str	r2, [r1, #52]
	add	r1, r3, #576
.L10:
	str	r2, [r3, #16]
	add	r3, r3, #36
	cmp	r3, r1
	bne	.L10
	ldr	r0, .L14+68
	ldr	r1, .L14+72
	ldr	r3, .L14+76
	ldr	r4, .L14+80
	ldr	ip, .L14+84
	str	r2, [r0, #24]
	str	r2, [r0, #68]
	str	r2, [r0, #112]
	str	r2, [r4, #24]
	str	r2, [r4, #52]
	str	r2, [ip, #32]
	str	r2, [ip, #68]
	str	r2, [r1, #24]
	str	r2, [r1, #68]
	str	r2, [r1, #112]
	str	r2, [r3, #24]
	str	r2, [r3, #68]
	str	r2, [r3, #112]
	str	r2, [r6, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	playGameMusic
	.word	timer
	.word	srand
	.word	state
	.word	cityPal
	.word	loadPalette
	.word	DMANow
	.word	cityTiles
	.word	cityMap
	.word	chopperSpritesTiles
	.word	chopperSpritesPal
	.word	skyTiles
	.word	skyMap
	.word	shadowOAM
	.word	player
	.word	bullets
	.word	airships
	.word	medkits
	.word	rounds
	.word	bombs
	.word	playerBeams
	.word	tanks
	.size	goToGame, .-goToGame
	.align	2
	.global	instructions
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r4, .L32
	ldr	r3, [r4, #0]
	tst	r3, #1
	beq	.L17
	ldr	r2, .L32+4
	ldr	r2, [r2, #0]
	tst	r2, #1
	bne	.L17
	ldr	r6, .L32+8
	ldr	r5, [r6, #0]
	cmp	r5, #1
	beq	.L26
	cmp	r5, #2
	beq	.L27
	cmp	r5, #3
	beq	.L28
	cmp	r5, #4
	beq	.L29
	cmp	r5, #5
	beq	.L30
.L19:
	cmp	r5, #4
	addle	r5, r5, #1
	strle	r5, [r6, #0]
	ldr	r3, [r4, #0]
.L17:
	tst	r3, #2
	beq	.L16
	ldr	r3, .L32+4
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L31
.L16:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L31:
	bl	goToStart
	ldr	r3, .L32+8
	mov	r2, #1
	str	r2, [r3, #0]
	b	.L16
.L27:
	ldr	r0, .L32+12
	ldr	r3, .L32+16
	mov	lr, pc
	bx	r3
	mov	r3, #5248
	ldr	r5, .L32+20
	mov	r0, #3
	ldr	r1, .L32+24
	mov	r2, #100663296
	add	r3, r3, #16
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L32+28
	add	r2, r2, #55296
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	ldr	r5, [r6, #0]
	b	.L19
.L26:
	ldr	r0, .L32+32
	ldr	r3, .L32+16
	mov	lr, pc
	bx	r3
	ldr	r5, .L32+20
	mov	r0, #3
	ldr	r1, .L32+36
	mov	r2, #100663296
	mov	r3, #3104
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L32+40
	add	r2, r2, #55296
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	ldr	r5, [r6, #0]
	b	.L19
.L28:
	ldr	r0, .L32+44
	ldr	r3, .L32+16
	mov	lr, pc
	bx	r3
	mov	r3, #4928
	mov	r0, r5
	ldr	r1, .L32+48
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r7, .L32+20
	mov	lr, pc
	bx	r7
	mov	r2, #100663296
	mov	r0, r5
	ldr	r1, .L32+52
	add	r2, r2, #55296
	mov	r3, #1024
	mov	lr, pc
	bx	r7
	ldr	r5, [r6, #0]
	b	.L19
.L29:
	ldr	r0, .L32+56
	ldr	r3, .L32+16
	mov	lr, pc
	bx	r3
	mov	r3, #5440
	ldr	r5, .L32+20
	mov	r0, #3
	ldr	r1, .L32+60
	mov	r2, #100663296
	add	r3, r3, #48
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L32+64
	add	r2, r2, #55296
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	ldr	r5, [r6, #0]
	b	.L19
.L30:
	bl	goToGame
	ldr	r5, [r6, #0]
	b	.L19
.L33:
	.align	2
.L32:
	.word	oldButtons
	.word	buttons
	.word	page
	.word	instructions3Pal
	.word	loadPalette
	.word	DMANow
	.word	instructions3Tiles
	.word	instructions3Map
	.word	instructions2Pal
	.word	instructions2Tiles
	.word	instructions2Map
	.word	instructions4Pal
	.word	instructions4Tiles
	.word	instructions4Map
	.word	instructions5Pal
	.word	instructions5Tiles
	.word	instructions5Map
	.size	instructions, .-instructions
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r2, .L39
	ldr	r4, .L39+4
	ldr	r1, [r2, #0]
	ldr	r3, [r4, #0]
	add	r1, r1, #1
	tst	r3, #1
	str	r1, [r2, #0]
	beq	.L35
	ldr	r2, .L39+8
	ldr	r2, [r2, #0]
	tst	r2, #1
	beq	.L37
.L35:
	tst	r3, #8
	beq	.L34
	ldr	r3, .L39+8
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L38
.L34:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L37:
	bl	goToInstructions
	ldr	r3, [r4, #0]
	b	.L35
.L38:
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L40:
	.align	2
.L39:
	.word	timer
	.word	oldButtons
	.word	buttons
	.size	start, .-start
	.align	2
	.global	goToBossLvl
	.type	goToBossLvl, %function
goToBossLvl:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L42
	mov	r2, #5
	stmfd	sp!, {r4, lr}
	str	r2, [r3, #0]
	ldr	r3, .L42+4
	mov	r4, #0
	ldr	r0, .L42+8
	str	r4, [r3, #0]
	ldr	r3, .L42+12
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L42+16
	mov	r2, #117440512
	ldr	ip, .L42+20
	mov	lr, pc
	bx	ip
	ldr	r3, .L42+24
	str	r4, [r3, #24]
	str	r4, [r3, #68]
	str	r4, [r3, #112]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	state
	.word	timer
	.word	boss
	.word	spawnBoss
	.word	shadowOAM
	.word	DMANow
	.word	bombs
	.size	goToBossLvl, .-goToBossLvl
	.align	2
	.global	goToBossPause
	.type	goToBossPause, %function
goToBossPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L47
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+4
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r1, #4352	@ movhi
	strh	r1, [r2, #0]	@ movhi
	mov	r1, #6912	@ movhi
	ldr	r3, .L47+8
	strh	r1, [r2, #8]	@ movhi
	mov	r4, #0
.L45:
	mov	r2, #512	@ movhi
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L45
	ldr	r5, .L47+12
	ldr	r1, .L47+8
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #67108864
	mov	r1, #0	@ movhi
	ldr	r2, .L47+16
	strh	r1, [r3, #16]	@ movhi
	mov	r1, #6
	str	r1, [r2, #0]
	mov	r2, #0	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r0, .L47+20
	ldr	r3, .L47+24
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L47+28
	mov	r2, #100663296
	mov	r3, #4736
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L47+32
	add	r2, r2, #55296
	mov	r3, r4
	mov	lr, pc
	bx	r5
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	pauseSound
	.word	playPauseSound
	.word	shadowOAM
	.word	DMANow
	.word	state
	.word	pausePal
	.word	loadPalette
	.word	pauseTiles
	.word	pauseMap
	.size	goToBossPause, .-goToBossPause
	.align	2
	.global	bossUnpause
	.type	bossUnpause, %function
bossUnpause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L50
	mov	lr, pc
	bx	r3
	ldr	r2, .L50+4
	mov	r3, #67108864
	ldrh	r1, [r2, #0]
	mov	r2, #7424
	ldrh	ip, [r3, #0]
	add	r2, r2, #2
	strh	r2, [r3, #8]	@ movhi
	ldr	r2, .L50+8
	strh	r1, [r3, #16]	@ movhi
	orr	ip, ip, #512
	mov	r1, #5
	strh	ip, [r3, #0]	@ movhi
	str	r1, [r2, #0]
	mov	r2, #80	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r0, .L50+12
	ldr	r3, .L50+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L50+20
	mov	r0, #3
	ldr	r1, .L50+24
	mov	r2, #100663296
	mov	r3, #1440
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L50+28
	add	r2, r2, #59392
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	playGameMusic
	.word	.LANCHOR0
	.word	state
	.word	cityPal
	.word	loadPalette
	.word	DMANow
	.word	cityTiles
	.word	cityMap
	.size	bossUnpause, .-bossUnpause
	.align	2
	.global	bossPause
	.type	bossPause, %function
bossPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L56
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L53
	ldr	r2, .L56+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L55
.L53:
	tst	r3, #4
	beq	.L52
	ldr	r3, .L56+4
	ldr	r3, [r3, #0]
	ands	r3, r3, #4
	bne	.L52
	ldr	r1, .L56+8
	ldr	r2, .L56+12
	str	r3, [r1, #32]
	str	r3, [r1, #16]
	str	r3, [r2, #24]
	str	r3, [r2, #52]
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L52:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L55:
	bl	bossUnpause
	ldr	r3, [r4, #0]
	b	.L53
.L57:
	.align	2
.L56:
	.word	oldButtons
	.word	buttons
	.word	boss
	.word	beams
	.size	bossPause, .-bossPause
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, .L61
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+4
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r1, #4352	@ movhi
	strh	r1, [r2, #0]	@ movhi
	mov	r1, #6912	@ movhi
	ldr	r3, .L61+8
	strh	r1, [r2, #8]	@ movhi
	mov	r4, #0
.L59:
	mov	r2, #512	@ movhi
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L59
	ldr	r5, .L61+12
	ldr	r1, .L61+8
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r2, .L61+16
	mov	r6, #3
	mov	r1, #0	@ movhi
	mov	r3, #67108864
	strh	r1, [r3, #16]	@ movhi
	ldr	r0, .L61+20
	str	r6, [r2, #0]
	strh	r1, [r3, #18]	@ movhi
	ldr	r3, .L61+24
	mov	lr, pc
	bx	r3
	mov	r0, r6
	ldr	r1, .L61+28
	mov	r2, #100663296
	mov	r3, #4736
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, r6
	ldr	r1, .L61+32
	add	r2, r2, #55296
	mov	r3, r4
	mov	lr, pc
	bx	r5
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	pauseSound
	.word	playPauseSound
	.word	shadowOAM
	.word	DMANow
	.word	state
	.word	pausePal
	.word	loadPalette
	.word	pauseTiles
	.word	pauseMap
	.size	goToPause, .-goToPause
	.align	2
	.global	unpause
	.type	unpause, %function
unpause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L64
	mov	lr, pc
	bx	r3
	ldr	r2, .L64+4
	mov	r3, #67108864
	ldrh	r1, [r2, #0]
	mov	r2, #7424
	ldrh	ip, [r3, #0]
	add	r2, r2, #2
	strh	r2, [r3, #8]	@ movhi
	ldr	r2, .L64+8
	strh	r1, [r3, #16]	@ movhi
	orr	ip, ip, #512
	mov	r1, #2
	strh	ip, [r3, #0]	@ movhi
	str	r1, [r2, #0]
	mov	r2, #80	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r0, .L64+12
	ldr	r3, .L64+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L64+20
	mov	r0, #3
	ldr	r1, .L64+24
	mov	r2, #100663296
	mov	r3, #1440
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L64+28
	add	r2, r2, #59392
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	playGameMusic
	.word	.LANCHOR0
	.word	state
	.word	cityPal
	.word	loadPalette
	.word	DMANow
	.word	cityTiles
	.word	cityMap
	.size	unpause, .-unpause
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L71
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L67
	ldr	r2, .L71+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L69
.L67:
	tst	r3, #4
	beq	.L66
	ldr	r3, .L71+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L70
.L66:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L70:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L69:
	bl	unpause
	ldr	r3, [r4, #0]
	b	.L67
.L72:
	.align	2
.L71:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L76
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+4
	mov	lr, pc
	bx	r3
	ldr	r1, .L76+8
	mov	r4, #0
	ldr	r3, .L76+12
	str	r4, [r1, #32]
	str	r4, [r1, #16]
	mov	r2, #67108864
	mov	r1, #4352	@ movhi
	str	r4, [r3, #24]
	str	r4, [r3, #52]
	strh	r1, [r2, #0]	@ movhi
	mov	r1, #7168	@ movhi
	ldr	r3, .L76+16
	strh	r1, [r2, #8]	@ movhi
.L74:
	mov	r2, #512	@ movhi
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L74
	ldr	r5, .L76+20
	ldr	r1, .L76+16
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #67108864
	mov	r1, #0	@ movhi
	ldr	r2, .L76+24
	strh	r1, [r3, #16]	@ movhi
	mov	r1, #4
	str	r1, [r2, #0]
	mov	r2, #0	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r0, .L76+28
	ldr	r3, .L76+32
	mov	lr, pc
	bx	r3
	mov	r3, #8704
	mov	r0, #3
	ldr	r1, .L76+36
	mov	r2, #100663296
	add	r3, r3, #16
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L76+40
	add	r2, r2, #57344
	mov	r3, r4
	mov	lr, pc
	bx	r5
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	stopSound
	.word	playLoseSound
	.word	boss
	.word	beams
	.word	shadowOAM
	.word	DMANow
	.word	state
	.word	losePal
	.word	loadPalette
	.word	loseTiles
	.word	loseMap
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L80
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L80+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L81:
	.align	2
.L80:
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L85
	mov	lr, pc
	bx	r3
	ldr	r3, .L85+4
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r1, #4352	@ movhi
	strh	r1, [r2, #0]	@ movhi
	mov	r1, #7168	@ movhi
	ldr	r3, .L85+8
	strh	r1, [r2, #8]	@ movhi
	mov	r4, #0
.L83:
	mov	r2, #512	@ movhi
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L83
	ldr	r5, .L85+12
	ldr	r1, .L85+8
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #67108864
	mov	r1, #0	@ movhi
	ldr	r2, .L85+16
	strh	r1, [r3, #16]	@ movhi
	mov	r1, #4
	str	r1, [r2, #0]
	mov	r2, #0	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r0, .L85+20
	ldr	r3, .L85+24
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L85+28
	mov	r2, #100663296
	mov	r3, #9216
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L85+32
	add	r2, r2, #57344
	mov	r3, r4
	mov	lr, pc
	bx	r5
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	stopSound
	.word	playWinMusic
	.word	shadowOAM
	.word	DMANow
	.word	state
	.word	heliPal
	.word	loadPalette
	.word	heliTiles
	.word	heliMap
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L89
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L89+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L90:
	.align	2
.L89:
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	updateOAM
	.type	updateOAM, %function
updateOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	lr, .L152
	ldrb	r0, [lr, #4]	@ zero_extendqisi2
	ldr	r1, [lr, #28]
	ldrb	ip, [lr, #1]	@ zero_extendqisi2
	ldr	r2, [lr, #32]
	ldr	r3, .L152+4
	mvn	r0, r0, asl #17
	add	r2, r2, r1, asl #5
	orr	ip, ip, #16384
	mvn	r0, r0, lsr #17
	mov	r1, r3
	strh	ip, [r3, #0]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	ldr	r3, .L152+8
	mov	r2, r1
	mov	ip, r1
	mov	r0, #1
	mov	r5, #0
.L96:
	ldr	r4, [r3, #24]
	cmp	r4, #0
	beq	.L93
	ldr	r6, [r3, #4]
	ldrb	r7, [r3, #0]	@ zero_extendqisi2
	bic	r6, r6, #65024
	strh	r6, [ip, #10]	@ movhi
	mov	r6, #256	@ movhi
	strh	r7, [ip, #8]	@ movhi
	strh	r6, [ip, #12]	@ movhi
.L93:
	ldr	r6, [r3, #32]
	cmp	r6, #0
	bne	.L94
	ldr	r6, [r3, #28]
	cmp	r6, #0
	bne	.L94
	cmp	r4, #0
	bne	.L95
.L94:
	mov	r4, r0, asl #3
	mov	r7, #512	@ movhi
	str	r5, [r3, #32]
	str	r5, [r3, #28]
	strh	r7, [r2, r4]	@ movhi
.L95:
	add	r0, r0, #1
	cmp	r0, #4
	add	r3, r3, #44
	add	ip, ip, #8
	bne	.L96
	ldr	r3, .L152+12
	mov	r5, #1024
	add	ip, r3, #576
	add	r5, r5, #4
.L99:
	ldr	r0, [r3, #0]
	cmp	r0, #0
	moveq	r8, #512	@ movhi
	streqh	r8, [r1, #32]	@ movhi
	beq	.L98
	ldr	r0, [r3, #-12]
	ldrb	r4, [r3, #-16]	@ zero_extendqisi2
	mov	r0, r0, asl #23
	mvn	r0, r0, lsr #5
	orr	r4, r4, #16384
	mvn	r0, r0, lsr #18
	strh	r4, [r1, #32]	@ movhi
	strh	r0, [r1, #34]	@ movhi
	strh	r5, [r1, #36]	@ movhi
.L98:
	add	r3, r3, #36
	cmp	r3, ip
	add	r1, r1, #8
	bne	.L99
	mov	r6, #256
	ldr	r4, [lr, #24]
	mov	r0, #10
	mov	r1, #0
	mov	r3, #1
	add	r6, r6, #3
.L102:
	sub	ip, r3, #1
	cmp	r4, ip
	addgt	ip, r2, r1
	bicgt	r5, r0, #65024
	addle	ip, r2, r1
	movgt	r7, #4	@ movhi
	movle	r8, #512	@ movhi
	add	r0, r0, #10
	add	r3, r3, #1
	strgth	r7, [ip, #160]	@ movhi
	strgth	r5, [ip, #162]	@ movhi
	strgth	r6, [ip, #164]	@ movhi
	strleh	r8, [ip, #160]	@ movhi
	mov	r0, r0, asl #16
	cmp	r3, #7
	add	r1, r1, #8
	mov	r0, r0, lsr #16
	bne	.L102
	ldr	r3, .L152+16
	ldr	r3, [r3, #0]
	add	r1, r3, #7
	cmp	r3, #0
	movlt	r3, r1
	mov	r1, r3, asr #3
	mov	r3, #260
	add	r3, r3, #2
	add	r1, r1, #10
	mov	ip, #152	@ movhi
	bic	r1, r1, #65024
	strh	r3, [r2, #212]	@ movhi
	strh	ip, [r2, #208]	@ movhi
	ldr	r3, .L152+20
	strh	r1, [r2, #210]	@ movhi
	mov	r1, #0
.L105:
	ldr	r0, [r3, #0]
	cmp	r0, #0
	addeq	r0, r2, r1
	moveq	r4, #512	@ movhi
	streqh	r4, [r0, #216]	@ movhi
	beq	.L104
	ldr	r4, [r3, #-20]
	ldr	r6, [r3, #12]
	mov	r4, r4, asl #23
	ldr	ip, [r3, #16]
	ldrb	r5, [r3, #-24]	@ zero_extendqisi2
	mov	r4, r4, lsr #23
	add	r0, r2, r1
	orr	r4, r4, #16384
	add	ip, ip, r6, asl #5
	strh	r5, [r0, #216]	@ movhi
	strh	r4, [r0, #218]	@ movhi
	strh	ip, [r0, #220]	@ movhi
.L104:
	add	r1, r1, #8
	cmp	r1, #24
	add	r3, r3, #44
	bne	.L105
	ldr	r3, .L152+24
	ldr	r1, [r3, #32]
	cmp	r1, #0
	moveq	r5, #512	@ movhi
	streqh	r5, [r2, #240]	@ movhi
	beq	.L107
	ldr	r0, [r3, #4]
	ldr	r4, [r3, #20]
	ldr	r1, [r3, #24]
	ldrb	ip, [r3, #0]	@ zero_extendqisi2
	mov	r0, r0, asl #23
	mvn	r0, r0, lsr #5
	add	r1, r1, r4, asl #5
	orr	ip, ip, #16384
	mvn	r0, r0, lsr #18
	orr	r1, r1, #2048
	strh	ip, [r2, #240]	@ movhi
	strh	r0, [r2, #242]	@ movhi
	strh	r1, [r2, #244]	@ movhi
.L107:
	mov	r6, #256
	ldr	r4, [r3, #16]
	mov	r1, #0
	mov	r0, #10
	mov	r3, #1
	add	r6, r6, #3
.L110:
	sub	ip, r3, #1
	cmp	r4, ip
	addgt	ip, r2, r1
	andgt	r5, r0, #255
	addle	ip, r2, r1
	movgt	r7, #232	@ movhi
	movle	r8, #512	@ movhi
	add	r0, r0, #10
	add	r3, r3, #1
	strgth	r5, [ip, #248]	@ movhi
	strgth	r7, [ip, #250]	@ movhi
	strgth	r6, [ip, #252]	@ movhi
	strleh	r8, [ip, #248]	@ movhi
	mov	r0, r0, asl #16
	cmp	r3, #12
	mov	r0, r0, lsr #16
	add	r1, r1, #8
	bne	.L110
	ldr	r3, .L152+28
	ldr	r1, [r3, #24]
	cmp	r1, #0
	moveq	r1, #336
	moveq	ip, #512	@ movhi
	streqh	ip, [r2, r1]	@ movhi
	beq	.L112
	ldr	r0, [r3, #4]
	ldrb	r4, [r3, #0]	@ zero_extendqisi2
	mov	r1, #336
	add	r1, r1, #2
	bic	r0, r0, #65024
	strh	r0, [r2, r1]	@ movhi
	orr	r4, r4, #16384
	mov	ip, #336
	mov	r1, #340
	mov	r0, #260	@ movhi
	strh	r4, [r2, ip]	@ movhi
	strh	r0, [r2, r1]	@ movhi
.L112:
	ldr	r3, [r3, #52]
	cmp	r3, #0
	ldr	r3, .L152+28
	moveq	r1, #512	@ movhi
	moveq	r3, #344
	streqh	r1, [r2, r3]	@ movhi
	beq	.L114
	ldr	r1, [r3, #32]
	ldrb	ip, [r3, #28]	@ zero_extendqisi2
	mov	r3, #344
	add	r3, r3, #2
	bic	r1, r1, #65024
	strh	r1, [r2, r3]	@ movhi
	orr	ip, ip, #16384
	mov	r0, #344
	mov	r3, #348
	mov	r4, #260	@ movhi
	strh	ip, [r2, r0]	@ movhi
	strh	r4, [r2, r3]	@ movhi
.L114:
	ldr	r3, .L152+32
	ldr	r1, [r3, #24]
	cmp	r1, #0
	moveq	r1, #352
	moveq	r5, #512	@ movhi
	streqh	r5, [r2, r1]	@ movhi
	beq	.L116
	ldr	r0, [r3, #4]
	ldrb	r4, [r3, #0]	@ zero_extendqisi2
	mov	r1, #352
	add	r1, r1, #2
	bic	r0, r0, #65024
	strh	r0, [r2, r1]	@ movhi
	orr	r4, r4, #16384
	mov	ip, #352
	mov	r1, #356
	mov	r6, #264	@ movhi
	strh	r4, [r2, ip]	@ movhi
	strh	r6, [r2, r1]	@ movhi
.L116:
	ldr	r3, [r3, #52]
	cmp	r3, #0
	ldr	r3, .L152+32
	bne	.L117
	mov	r3, #360
	mov	r7, #512	@ movhi
	strh	r7, [r2, r3]	@ movhi
.L119:
	mov	r6, #264
	ldr	r5, [lr, #44]
	mov	r0, #10
	mov	r1, #0
	mov	r3, #1
	add	r6, r6, #2
	b	.L118
.L151:
	add	r4, r2, r1
	bic	r7, r0, #65024
	add	r3, r3, #1
	add	r0, r0, #10
	add	ip, r4, #368
	mov	r8, #12	@ movhi
	add	r4, r4, #372
	mov	r0, r0, asl #16
	cmp	r3, #7
	strh	r8, [ip, #0]	@ movhi
	strh	r7, [ip, #2]	@ movhi
	strh	r6, [r4, #0]	@ movhi
	add	r1, r1, #8
	mov	r0, r0, lsr #16
	beq	.L150
.L118:
	sub	ip, r3, #1
	cmp	r5, ip
	bgt	.L151
	add	ip, r2, r1
	add	r0, r0, #10
	add	r3, r3, #1
	add	ip, ip, #368
	mov	r4, #512	@ movhi
	mov	r0, r0, asl #16
	cmp	r3, #7
	strh	r4, [ip, #0]	@ movhi
	add	r1, r1, #8
	mov	r0, r0, lsr #16
	bne	.L118
.L150:
	ldr	r3, [lr, #24]
	cmp	r3, #0
	movle	r3, #416
	movle	r7, #512	@ movhi
	strleh	r7, [r2, r3]	@ movhi
	ble	.L123
	mov	r1, #416
	add	r1, r1, #2
	mov	r3, #264
	mov	r6, #230	@ movhi
	strh	r6, [r2, r1]	@ movhi
	add	r3, r3, #3
	mov	r0, #416
	mov	r5, #152	@ movhi
	mov	r1, #420
	strh	r5, [r2, r0]	@ movhi
	strh	r3, [r2, r1]	@ movhi
.L123:
	ldr	r1, [lr, #48]
	mov	ip, #424
	mov	r3, #424
	mov	r8, #2	@ movhi
	tst	r1, #1
	add	r3, r3, #2
	strh	r8, [r2, ip]	@ movhi
	mov	ip, #96	@ movhi
	strh	ip, [r2, r3]	@ movhi
	ldr	r0, .L152+4
	movne	r3, #356
	moveq	r3, #428
	addne	r3, r3, #1
	movne	ip, #428
	moveq	lr, #352	@ movhi
	strneh	r3, [r0, ip]	@ movhi
	streqh	lr, [r0, r3]	@ movhi
	mov	r0, #432
	add	r0, r0, #2
	mov	ip, #432
	mov	r4, #2	@ movhi
	mov	r5, #88	@ movhi
	cmp	r1, #19
	ldr	r3, .L152+4
	strh	r4, [r2, ip]	@ movhi
	strh	r5, [r2, r0]	@ movhi
	bgt	.L126
	add	r1, r1, r1, lsr #31
	mov	ip, r1, asr #1
	add	ip, ip, #352
	mov	r1, #436
	strh	ip, [r3, r1]	@ movhi
	mov	r0, #440
	mov	r1, #440
	strh	r4, [r3, r1]	@ movhi
	add	r0, r0, #2
	mov	r6, #80	@ movhi
	mov	r1, #444
	mov	r7, #352	@ movhi
	strh	r6, [r3, r0]	@ movhi
	strh	r7, [r3, r1]	@ movhi
.L127:
	ldr	r3, .L152+36
	mov	ip, #448
	mvn	lr, #32512
	add	ip, ip, #2
	sub	lr, lr, #119
	mov	r0, #288
	strh	lr, [r2, ip]	@ movhi
	ldr	r1, [r3, #0]
	add	r0, r0, #2
	mov	ip, #452
	strh	r0, [r2, ip]	@ movhi
	mov	r3, #456
	mov	r0, #456
	mov	lr, #2	@ movhi
	tst	r1, #1
	add	r3, r3, #2
	strh	lr, [r2, r0]	@ movhi
	mov	r0, #192	@ movhi
	strh	r0, [r2, r3]	@ movhi
	ldr	r5, .L152+4
	movne	r3, #356
	mov	r4, #16384
	add	r4, r4, #2
	addne	r3, r3, #1
	movne	r0, #460
	mov	r6, #448
	strneh	r3, [r5, r0]	@ movhi
	moveq	r3, #460
	strh	r4, [r2, r6]	@ movhi
	mov	r0, #464
	moveq	r4, #352	@ movhi
	streqh	r4, [r5, r3]	@ movhi
	add	r0, r0, #2
	mov	ip, #464
	mov	r5, #2	@ movhi
	mov	r6, #184	@ movhi
	cmp	r1, #19
	ldr	r3, .L152+4
	strh	r5, [r2, ip]	@ movhi
	strh	r6, [r2, r0]	@ movhi
	bgt	.L130
	add	r1, r1, r1, lsr #31
	mov	ip, r1, asr #1
	add	ip, ip, #352
	mov	r1, #468
	strh	ip, [r3, r1]	@ movhi
	mov	r0, #472
	mov	r1, #472
	strh	r5, [r3, r1]	@ movhi
	add	r0, r0, #2
	mov	r7, #176	@ movhi
	mov	r1, #476
	mov	r8, #352	@ movhi
	strh	r7, [r3, r0]	@ movhi
	strh	r8, [r3, r1]	@ movhi
.L131:
	ldr	r3, .L152+40
	mov	lr, #480
	ldr	r4, [r3, #32]
	add	lr, lr, #2
	mov	r7, #0	@ movhi
	mov	r0, #488
	strh	r7, [r2, lr]	@ movhi
	add	r0, r0, #2
	mov	lr, #484
	mov	ip, #16384
	mov	r1, #268
	mov	r8, #268	@ movhi
	cmp	r4, #0
	add	ip, ip, #12
	add	r1, r1, #1
	strh	r8, [r2, lr]	@ movhi
	strh	r7, [r2, r0]	@ movhi
	ldr	r4, .L152+4
	mov	lr, #488
	mov	r0, #492
	mov	r5, #480
	mov	r6, #2	@ movhi
	strh	ip, [r2, lr]	@ movhi
	strh	r1, [r2, r0]	@ movhi
	moveq	ip, #512	@ movhi
	moveq	r1, #496
	strh	r6, [r2, r5]	@ movhi
	streqh	ip, [r4, r1]	@ movhi
	beq	.L133
	ldr	ip, [r3, #4]
	mov	ip, ip, asl #23
	ldr	r0, [r3, #28]
	mov	r1, #496
	mvn	ip, ip, lsr #6
	add	r1, r1, #2
	ldrb	r5, [r3, #0]	@ zero_extendqisi2
	mvn	ip, ip, lsr #17
	strh	ip, [r4, r1]	@ movhi
	add	r0, r0, #128
	mov	lr, #496
	mov	r1, #500
	strh	r5, [r4, lr]	@ movhi
	strh	r0, [r4, r1]	@ movhi
.L133:
	ldr	r3, [r3, #68]
	cmp	r3, #0
	ldr	r3, .L152+40
	bne	.L134
	mov	r3, #504
	mov	lr, #512	@ movhi
	strh	lr, [r2, r3]	@ movhi
.L136:
	ldr	r3, .L152+44
	mov	r1, #0
.L135:
	ldr	r0, [r3, #0]
	cmp	r0, #0
	beq	.L137
	ldr	r4, [r3, #-20]
	add	r6, r3, #12
	ldmia	r6, {r6, lr}	@ phole ldm
	add	ip, r2, r1
	ldrb	r5, [r3, #-24]	@ zero_extendqisi2
	add	r0, ip, #512
	bic	r4, r4, #65024
	add	ip, ip, #516
	add	lr, lr, r6, asl #5
	strh	r5, [r0, #0]	@ movhi
	strh	r4, [r0, #2]	@ movhi
	strh	lr, [ip, #0]	@ movhi
.L138:
	add	r1, r1, #8
	cmp	r1, #24
	add	r3, r3, #44
	bne	.L135
	ldr	r3, .L152+48
	mov	r1, #0
.L141:
	ldr	r0, [r3, #0]
	cmp	r0, #0
	beq	.L139
	ldr	r4, [r3, #-20]
	add	r6, r3, #12
	ldmia	r6, {r6, lr}	@ phole ldm
	add	ip, r2, r1
	ldrb	r5, [r3, #-24]	@ zero_extendqisi2
	add	r0, ip, #536
	bic	r4, r4, #65024
	add	ip, ip, #540
	add	lr, lr, r6, asl #5
	strh	r5, [r0, #0]	@ movhi
	strh	r4, [r0, #2]	@ movhi
	strh	lr, [ip, #0]	@ movhi
.L140:
	add	r1, r1, #8
	cmp	r1, #24
	add	r3, r3, #44
	bne	.L141
	mov	r0, #3
	ldr	r1, .L152+4
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L152+52
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L139:
	add	r0, r2, r1
	add	r0, r0, #536
	mov	r5, #512	@ movhi
	strh	r5, [r0, #0]	@ movhi
	b	.L140
.L137:
	add	r0, r2, r1
	add	r0, r0, #512
	mov	r4, #512	@ movhi
	strh	r4, [r0, #0]	@ movhi
	b	.L138
.L134:
	ldr	r0, [r3, #40]
	mov	r0, r0, asl #23
	ldr	r1, [r3, #64]
	ldrb	lr, [r3, #36]	@ zero_extendqisi2
	mvn	r0, r0, lsr #6
	mov	r3, #504
	add	r3, r3, #2
	mvn	r0, r0, lsr #17
	strh	r0, [r2, r3]	@ movhi
	add	r1, r1, #128
	mov	ip, #504
	mov	r3, #508
	strh	lr, [r2, ip]	@ movhi
	strh	r1, [r2, r3]	@ movhi
	b	.L136
.L130:
	mov	lr, r1, asr #1
	add	lr, lr, #340
	add	lr, lr, #2
	mov	ip, #468
	mov	r0, #352
	strh	lr, [r3, ip]	@ movhi
	add	r0, r0, #1
	mov	ip, #476
	mov	r1, #472
	strh	r0, [r3, ip]	@ movhi
	add	r1, r1, #2
	mov	r0, #472
	mov	ip, #2	@ movhi
	mov	lr, #176	@ movhi
	strh	ip, [r3, r0]	@ movhi
	strh	lr, [r3, r1]	@ movhi
	b	.L131
.L126:
	mov	lr, r1, asr #1
	add	lr, lr, #340
	mov	ip, #436
	mov	r0, #352
	add	lr, lr, #2
	add	r0, r0, #1
	strh	lr, [r3, ip]	@ movhi
	mov	r1, #440
	mov	ip, #444
	strh	r0, [r3, ip]	@ movhi
	add	r1, r1, #2
	mov	r0, #440
	mov	r8, #2	@ movhi
	mov	ip, #80	@ movhi
	strh	r8, [r3, r0]	@ movhi
	strh	ip, [r3, r1]	@ movhi
	b	.L127
.L117:
	ldr	r1, [r3, #32]
	ldrb	ip, [r3, #28]	@ zero_extendqisi2
	mov	r3, #360
	add	r3, r3, #2
	bic	r1, r1, #65024
	strh	r1, [r2, r3]	@ movhi
	orr	ip, ip, #16384
	mov	r0, #360
	mov	r3, #364
	mov	r8, #264	@ movhi
	strh	ip, [r2, r0]	@ movhi
	strh	r8, [r2, r3]	@ movhi
	b	.L119
.L153:
	.align	2
.L152:
	.word	player
	.word	shadowOAM
	.word	bullets
	.word	airships+16
	.word	.LANCHOR0
	.word	medkits+24
	.word	boss
	.word	beams
	.word	playerBeams
	.word	highScore
	.word	tanks
	.word	rounds+24
	.word	bombs+24
	.word	DMANow
	.size	updateOAM, .-updateOAM
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L314
	ldr	r4, .L314+4
	sub	sp, sp, #28
	ldr	r2, [sl, #0]
	ldr	r3, [r4, #20]
	add	r2, r2, #1
	add	r3, r3, #1
	ldr	r8, .L314+8
	str	r2, [sl, #0]
	str	r3, [r4, #20]
	bl	updateOAM
	ldr	r3, [r8, #0]
	add	r0, r3, r3, lsr #31
	mov	r2, #1792
	mov	r0, r0, asl #15
	add	r1, r3, #1
	add	r2, r2, #8
	mov	r3, #67108864
	mov	r0, r0, lsr #16
	strh	r0, [r3, #16]	@ movhi
	cmp	r1, r2
	str	r1, [r8, #0]
	mov	r2, #0	@ movhi
	mov	r1, #90	@ movhi
	strh	r1, [r3, #18]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	bgt	.L287
.L155:
	ldr	r3, [r4, #0]
	mov	r3, r3, asr #8
	cmp	r3, #144
	bgt	.L288
.L156:
	ldr	r7, .L314+12
	ldr	r3, [r7, #0]
	tst	r3, #1
	beq	.L280
	ldr	r2, .L314+16
	ldr	r2, [r2, #0]
	tst	r2, #1
	bne	.L289
	ldr	r2, [r4, #24]
	cmp	r2, #0
	ble	.L280
	ldr	r2, .L314+20
	ldr	r5, [r2, #24]
	cmp	r5, #0
	str	r2, [sp, #4]
	beq	.L158
	ldr	r2, [r2, #68]
	cmp	r2, #0
	beq	.L224
	ldr	r1, [sp, #4]
	ldr	r2, [r1, #112]
	cmp	r2, #0
	moveq	r5, #2
	bne	.L157
.L158:
	ldr	r3, .L314+24
	mov	lr, pc
	bx	r3
	ldr	r2, [sp, #4]
	mov	r0, #44
	ldr	r3, .L314+28
	mla	r0, r5, r0, r2
	ldr	r1, .L314+4
	mov	lr, pc
	bx	r3
	ldr	r3, [r7, #0]
	b	.L157
.L280:
	ldr	r1, .L314+20
	str	r1, [sp, #4]
.L157:
	tst	r3, #2
	bne	.L266
	ldr	r3, .L314+32
	str	r3, [sp, #16]
.L159:
	ldr	r3, [sl, #0]
	tst	r3, #3
	beq	.L290
.L161:
	ldr	r1, .L314+36
	smull	r2, r1, r3, r1
	mov	r2, r3, asr #31
	rsb	r2, r2, r1, asr #1
	add	r2, r2, r2, asl #1
	cmp	r3, r2, asl #2
	beq	.L269
	ldr	r3, .L314+40
	str	r3, [sp, #8]
.L162:
	ldr	r3, [r4, #20]
	cmp	r3, #400
	ble	.L282
	ldr	r3, [r8, #0]
	cmp	r3, #1600
	bge	.L281
	ldr	r3, [sl, #0]
	ldr	r1, .L314+44
	smull	r2, r1, r3, r1
	mov	r2, r3, asr #31
	rsb	r2, r2, r1, asr #5
	add	r2, r2, r2, asl #2
	rsb	r2, r2, r2, asl #4
	cmp	r3, r2, asl #2
	bne	.L281
	ldr	r2, [sp, #8]
	ldr	r3, [r2, #32]
	cmp	r3, #0
	beq	.L168
	ldr	r2, .L314+40
	ldr	r2, [r2, #68]
	cmp	r2, #0
	bne	.L165
	mov	r3, #1
.L168:
	ldr	r1, [sp, #8]
	mov	r0, #36
	mla	r0, r3, r0, r1
	ldr	r3, .L314+48
	mov	lr, pc
	bx	r3
.L282:
	ldr	r2, [sp, #8]
	ldr	r3, [r2, #32]
.L165:
	ldr	r6, .L314+40
	ldr	fp, .L314+52
	ldr	ip, .L314+56
	ldr	r9, .L314+60
	mov	r5, #0
.L172:
	cmp	r3, #0
	beq	.L169
	ldr	r3, [r6, #4]
	smull	r2, r1, fp, r3
	mov	r2, r3, asr #31
	rsb	r2, r2, r1, asr #4
	add	r2, r2, r2, asl #2
	add	r2, r2, r2, asl #2
	cmp	r3, r2, asl #1
	bne	.L169
	cmp	r3, #0
	ble	.L169
	ldr	r1, .L314+60
	ldr	r3, [r1, #24]
	cmp	r3, #0
	beq	.L170
	ldr	r3, [r9, #68]
	cmp	r3, #0
	beq	.L229
	ldr	r3, [r9, #112]
	cmp	r3, #0
	addeq	r3, r3, #2
	beq	.L170
.L169:
	add	r5, r5, #1
	cmp	r5, #2
	add	r6, r6, #36
	ldrne	r3, [r6, #32]
	bne	.L172
.L171:
	ldr	r3, [sl, #0]
	tst	r3, #63
	beq	.L291
.L173:
	ldr	r3, [r7, #0]
	tst	r3, #8
	beq	.L174
	ldr	r2, .L314+16
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L292
.L174:
	tst	r3, #256
	bne	.L270
	ldr	r1, .L314+64
	str	r1, [sp, #20]
.L175:
	ldr	r3, [r8, #0]
	cmp	r3, #1600
	bge	.L177
	ldr	r3, [r4, #20]
	cmp	r3, #800
	ble	.L178
	ldr	r0, [sl, #0]
	ldr	r3, .L314+68
	smull	r1, r3, r0, r3
	mov	ip, r0, asr #31
	add	r3, r3, r0
	rsb	r3, ip, r3, asr #4
	rsb	r3, r3, r3, asl #3
	subs	r3, r0, r3, asl #2
	ldrne	r6, .L314+72
	bne	.L179
	ldr	r6, .L314+72
	mov	r2, r6
.L181:
	ldr	r1, [r2, #16]
	cmp	r1, #0
	beq	.L293
	add	r3, r3, #1
	cmp	r3, #16
	add	r2, r2, #36
	bne	.L181
.L179:
	ldr	r3, .L314+52
	smull	r2, r3, r0, r3
	rsb	r3, ip, r3, asr #5
	add	r3, r3, r3, asl #2
	add	r3, r3, r3, asl #2
	subs	r3, r0, r3, asl #2
	bne	.L284
	ldr	r1, .L314+76
	str	r1, [sp, #12]
	mov	r2, r1
	b	.L184
.L183:
	add	r3, r3, #1
	cmp	r3, #16
	add	r2, r2, #44
	beq	.L182
.L184:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	bne	.L183
	add	r2, r3, r3, asl #2
	add	r3, r3, r2, asl #1
	ldr	r2, [sp, #12]
	add	r0, r2, r3, asl #2
	ldr	r3, .L314+80
	mov	lr, pc
	bx	r3
	b	.L182
.L269:
	ldr	r1, .L314+40
	ldr	r3, [r1, #32]
	cmp	r3, #0
	str	r1, [sp, #8]
	bne	.L294
	ldr	r1, [sp, #8]
	ldr	r3, [r1, #68]
	cmp	r3, #0
	ldr	r5, .L314+40
	beq	.L162
.L311:
	ldr	r0, [r5, #64]
	ldr	r3, .L314+84
	mov	lr, pc
	bx	r3
	str	r0, [r5, #64]
	b	.L162
.L266:
	ldr	r3, .L314+16
	ldr	r3, [r3, #0]
	tst	r3, #2
	bne	.L295
	ldr	r3, [r4, #24]
	cmp	r3, #0
	ble	.L296
	ldr	r3, .L314+32
	ldr	r5, [r3, #24]
	cmp	r5, #0
	str	r3, [sp, #16]
	beq	.L160
	ldr	r3, [r3, #68]
	cmp	r3, #0
	beq	.L226
	ldr	r1, [sp, #16]
	ldr	r3, [r1, #112]
	cmp	r3, #0
	moveq	r5, #2
	bne	.L159
.L160:
	ldr	r3, .L314+24
	mov	lr, pc
	bx	r3
	ldr	r2, [sp, #16]
	mov	r0, #44
	mla	r0, r5, r0, r2
	ldr	r1, .L314+4
	ldr	r3, .L314+88
	mov	lr, pc
	bx	r3
	b	.L159
.L177:
	ldr	r3, [sl, #0]
	ldr	r1, .L314+52
	smull	r2, r1, r3, r1
	mov	r2, r3, asr #31
	rsb	r2, r2, r1, asr #6
	add	r2, r2, r2, asl #2
	add	r2, r2, r2, asl #2
	subs	r3, r3, r2, asl #3
	beq	.L279
	ldr	r6, .L314+72
.L284:
	ldr	r3, .L314+76
	str	r3, [sp, #12]
.L182:
	ldr	r3, [r7, #0]
	tst	r3, #512
	beq	.L198
	ldr	r3, .L314+16
	ldr	r3, [r3, #0]
	tst	r3, #512
	beq	.L297
.L198:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	ldr	r4, .L314+4
	ble	.L199
	ldr	r3, .L314+92
	mov	r0, r4
	mov	lr, pc
	bx	r3
	ldr	r1, [sp, #4]
	ldr	r3, [r1, #24]
.L201:
	ldr	r4, .L314+20
	cmp	r3, #0
	mov	r5, #0
	str	r4, [sp, #4]
	mov	r7, r4
	ldr	r8, .L314+96
	bne	.L298
.L202:
	add	r5, r5, #1
	cmp	r5, #3
	add	r7, r7, #44
	beq	.L299
.L203:
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L202
.L298:
	add	r0, r5, r5, asl #2
	ldr	r3, [sp, #4]
	add	r0, r5, r0, asl #1
	add	r0, r3, r0, asl #2
	add	r5, r5, #1
	mov	lr, pc
	bx	r8
	cmp	r5, #3
	add	r7, r7, #44
	bne	.L203
.L299:
	ldr	r9, .L314+64
	ldr	r8, .L314+100
	mov	fp, #0
	mov	r7, r4
.L206:
	ldr	r3, [r9, #24]
	cmp	r3, #0
	bne	.L300
.L204:
	add	fp, fp, #1
	cmp	fp, #2
	add	r9, r9, #28
	bne	.L206
	ldr	r6, .L314+72
	mov	r4, r7
	ldr	r9, .L314+104
	ldr	r8, .L314+108
	mov	r7, r6
	mov	r5, #0
	b	.L208
.L207:
	add	r5, r5, #1
	cmp	r5, #16
	add	r7, r7, #36
	beq	.L301
.L208:
	ldr	r3, [r7, #16]
	cmp	r3, #0
	beq	.L207
	add	fp, r5, r5, asl #3
	add	fp, r6, fp, asl #2
	mov	r0, fp
	mov	lr, pc
	bx	r9
	add	r5, r5, #1
	mov	r0, fp
	ldr	r1, .L314+4
	mov	lr, pc
	bx	r8
	cmp	r5, #16
	add	r7, r7, #36
	bne	.L208
.L301:
	ldr	r7, .L314+76
	ldr	r8, .L314+112
	ldr	fp, .L314+116
	ldr	r9, [sp, #12]
	mov	r5, #0
.L212:
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L209
	ldr	r2, [sl, #0]
	mov	r3, r2, lsr #31
	add	r2, r2, r3
	and	r2, r2, #1
	rsb	r3, r3, r2
	cmp	r3, #0
	movgt	r3, r5, asl #2
	ble	.L302
.L211:
	add	r3, r3, r5
	add	r0, r5, r3, asl #1
	add	r0, r9, r0, asl #2
	ldr	r1, .L314+4
	mov	lr, pc
	bx	r8
.L209:
	add	r5, r5, #1
	cmp	r5, #3
	add	r7, r7, #44
	bne	.L212
	ldr	r9, .L314+120
	ldr	fp, [sp, #4]
	mov	r8, #0
	mov	sl, r6
.L213:
	add	r7, r8, r8, asl #2
	add	r7, r8, r7, asl #1
	ldr	r6, .L314+72
	mov	r5, #0
	add	r7, fp, r7, asl #2
	b	.L215
.L214:
	add	r5, r5, #1
	cmp	r5, #16
	add	r6, r6, #36
	beq	.L303
.L215:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L214
	ldr	r3, [r6, #16]
	cmp	r3, #0
	beq	.L214
	add	r1, r5, r5, asl #3
	mov	r0, r7
	add	r1, sl, r1, asl #2
	ldr	r2, .L314+4
	add	r5, r5, #1
	mov	lr, pc
	bx	r9
	cmp	r5, #16
	add	r6, r6, #36
	bne	.L215
.L303:
	add	r8, r8, #1
	cmp	r8, #3
	add	r4, r4, #44
	bne	.L213
	ldr	r1, [sp, #8]
	ldr	r3, [r1, #32]
	cmp	r3, #0
	bne	.L304
.L217:
	ldr	r2, [sp, #8]
	ldr	r3, [r2, #68]
	cmp	r3, #0
	bne	.L305
.L218:
	ldr	r5, .L314+60
	ldr	r7, .L314+124
	ldr	r6, .L314+128
	mov	r4, #0
.L220:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L306
.L219:
	add	r4, r4, #1
	cmp	r4, #3
	add	r5, r5, #44
	bne	.L220
	ldr	r5, .L314+32
	ldr	r8, .L314+132
	ldr	r7, .L314+136
	mov	r4, #0
.L222:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L307
.L221:
	add	r4, r4, #1
	cmp	r4, #3
	add	r5, r5, #44
	bne	.L222
	ldr	r3, .L314+140
	mov	lr, pc
	bx	r3
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L270:
	ldr	r3, .L314+16
	ldr	r3, [r3, #0]
	tst	r3, #256
	bne	.L308
	ldr	r3, [r4, #44]
	cmp	r3, #5
	beq	.L272
	ldr	r3, .L314+64
	str	r3, [sp, #20]
	b	.L175
.L281:
	ldr	r1, [sp, #8]
	ldr	r3, [r1, #32]
	b	.L165
.L289:
	ldr	r2, .L314+20
	str	r2, [sp, #4]
	b	.L157
.L308:
	ldr	r2, .L314+64
	str	r2, [sp, #20]
	b	.L175
.L279:
	ldr	r1, .L314+76
	str	r1, [sp, #12]
	mov	r2, r1
.L197:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	beq	.L309
	add	r3, r3, #1
	cmp	r3, #16
	add	r2, r2, #44
	bne	.L197
	ldr	r6, .L314+72
	b	.L182
.L295:
	ldr	r3, [sl, #0]
	ldr	r1, .L314+32
	tst	r3, #3
	str	r1, [sp, #16]
	bne	.L161
.L290:
	ldr	r3, .L314+144
	ldr	r0, [r4, #28]
	mov	lr, pc
	bx	r3
	ldr	r3, .L314
	str	r0, [r4, #28]
	ldr	r3, [r3, #0]
	b	.L161
.L178:
	cmp	r3, #500
	ble	.L185
	ldr	r0, [sl, #0]
	ands	r3, r0, #31
	ldrne	r6, .L314+72
	bne	.L186
	ldr	r6, .L314+72
	mov	r2, r6
.L188:
	ldr	r1, [r2, #16]
	cmp	r1, #0
	beq	.L310
	add	r3, r3, #1
	cmp	r3, #16
	add	r2, r2, #36
	bne	.L188
.L186:
	ldr	r2, .L314+44
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, asl #2
	rsb	r3, r3, r3, asl #4
	subs	r3, r0, r3, asl #1
	bne	.L283
	ldr	r2, .L314+76
	str	r2, [sp, #12]
	b	.L190
.L189:
	add	r3, r3, #1
	cmp	r3, #16
	add	r2, r2, #44
	beq	.L182
.L190:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	bne	.L189
	ldr	r1, [sp, #12]
	mov	r0, #44
	mla	r0, r3, r0, r1
	ldr	r3, .L314+80
	mov	lr, pc
	bx	r3
	b	.L182
.L307:
	ldr	r1, [sp, #16]
	add	r6, r4, r4, asl #2
	add	r6, r4, r6, asl #1
	add	r6, r1, r6, asl #2
	mov	r0, r6
	mov	lr, pc
	bx	r8
	mov	r0, r6
	ldr	r1, .L314+40
	ldr	r2, .L314+4
	mov	lr, pc
	bx	r7
	mov	r0, r6
	ldr	r1, .L314+148
	ldr	r2, .L314+4
	mov	lr, pc
	bx	r7
	b	.L221
.L306:
	ldr	r3, .L314+60
	add	r8, r4, r4, asl #2
	add	r8, r4, r8, asl #1
	add	r8, r3, r8, asl #2
	mov	r0, r8
	mov	lr, pc
	bx	r7
	mov	r0, r8
	ldr	r1, .L314+4
	mov	lr, pc
	bx	r6
	b	.L219
.L300:
	ldr	r1, [sp, #20]
	rsb	r5, fp, fp, asl #3
	add	r5, r1, r5, asl #2
	mov	r0, r5
	ldr	r2, .L314+152
	mov	lr, pc
	bx	r2
	mov	r4, #0
.L205:
	add	r1, r4, r4, asl #3
	mov	r0, r5
	add	r1, r6, r1, asl #2
	ldr	r2, .L314+4
	add	r4, r4, #1
	mov	lr, pc
	bx	r8
	cmp	r4, #16
	bne	.L205
	b	.L204
.L305:
	ldr	r0, .L314+148
	ldr	r3, .L314+156
	mov	lr, pc
	bx	r3
	b	.L218
.L304:
	ldr	r0, .L314+40
	ldr	r3, .L314+156
	mov	lr, pc
	bx	r3
	b	.L217
.L291:
	ldr	r0, .L314+4
	ldr	r3, .L314+160
	mov	lr, pc
	bx	r3
	b	.L173
.L288:
	bl	goToLose
	b	.L156
.L287:
	bl	goToBossLvl
	b	.L155
.L199:
	ldr	r3, .L314+164
	mov	r0, r4
	mov	lr, pc
	bx	r3
	ldr	r2, [r4, #0]
	mov	r2, r2, asr #8
	cmp	r2, #148
	ldr	r2, [sp, #4]
	mov	r3, #0
	str	r3, [r2, #24]
	str	r3, [r2, #68]
	str	r3, [r2, #112]
	ble	.L201
	bl	goToLose
	ldr	r3, .L314+20
	ldr	r3, [r3, #24]
	b	.L201
.L302:
	mov	r3, r5, asl #2
	add	r0, r3, r5
	add	r0, r5, r0, asl #1
	str	r3, [sp, #0]
	add	r0, r9, r0, asl #2
	mov	lr, pc
	bx	fp
	ldr	r3, [sp, #0]
	b	.L211
.L294:
	ldr	r0, [r1, #28]
	ldr	r3, .L314+84
	mov	lr, pc
	bx	r3
	ldr	r1, [sp, #8]
	ldr	r3, [r1, #68]
	ldr	r2, [sp, #8]
	cmp	r3, #0
	str	r0, [r2, #28]
	ldr	r5, .L314+40
	beq	.L162
	b	.L311
.L292:
	bl	goToPause
	ldr	r3, .L314+12
	ldr	r3, [r3, #0]
	b	.L174
.L185:
	cmp	r3, #200
	ble	.L191
	ldr	r3, [sl, #0]
	ldr	r1, .L314+36
	smull	r2, r1, r3, r1
	mov	r2, r3, asr #31
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, asl #1
	subs	r3, r3, r2, asl #4
	ldreq	r6, .L314+72
	moveq	r2, r6
	bne	.L286
.L193:
	ldr	r1, [r2, #16]
	cmp	r1, #0
	beq	.L312
	add	r3, r3, #1
	cmp	r3, #16
	add	r2, r2, #36
	bne	.L193
.L285:
	ldr	r2, .L314+76
	str	r2, [sp, #12]
	b	.L182
.L272:
	ldr	r1, .L314+64
	ldr	r5, [r1, #24]
	cmp	r5, #0
	str	r1, [sp, #20]
	beq	.L176
	ldr	r3, [r1, #52]
	cmp	r3, #0
	bne	.L175
	mov	r5, #1
.L176:
	ldr	r3, .L314+24
	mov	lr, pc
	bx	r3
	ldr	r2, [sp, #20]
	mov	r0, #28
	ldr	r3, .L314+168
	mla	r0, r5, r0, r2
	ldr	r1, .L314+4
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [r4, #44]
	b	.L175
.L296:
	ldr	r2, .L314+32
	str	r2, [sp, #16]
	b	.L159
.L191:
	ldr	r3, [sl, #0]
	ldr	r1, .L314+172
	smull	r2, r1, r3, r1
	mov	r2, r3, asr #31
	rsb	r2, r2, r1, asr #4
	add	r2, r2, r2, asl #3
	subs	r3, r3, r2, asl #3
	ldreq	r6, .L314+72
	moveq	r2, r6
	beq	.L195
.L286:
	ldr	r3, .L314+76
	ldr	r6, .L314+72
	str	r3, [sp, #12]
	b	.L182
.L229:
	mov	r3, #1
.L170:
	ldr	r1, .L314+60
	mov	r2, #44
	mla	r0, r2, r3, r1
	ldr	r3, [sp, #8]
	mov	r2, #36
	str	ip, [sp, #0]
	mla	r1, r2, r5, r3
	mov	lr, pc
	bx	ip
	ldr	ip, [sp, #0]
	b	.L169
.L297:
	mov	r3, #5
	str	r3, [r4, #24]
	ldr	r3, .L314+176
	mov	lr, pc
	bx	r3
	b	.L198
.L309:
	add	r2, r3, r3, asl #2
	add	r3, r3, r2, asl #1
	ldr	r2, [sp, #12]
	add	r0, r2, r3, asl #2
	ldr	r3, .L314+80
	mov	lr, pc
	bx	r3
	ldr	r6, .L314+72
	b	.L182
.L313:
	mov	r0, #36
	mla	r0, r3, r0, r6
	ldr	r3, .L314+180
	mov	lr, pc
	bx	r3
.L283:
	ldr	r1, .L314+76
	str	r1, [sp, #12]
	b	.L182
.L195:
	ldr	r1, [r2, #16]
	cmp	r1, #0
	beq	.L313
	add	r3, r3, #1
	cmp	r3, #16
	add	r2, r2, #36
	bne	.L195
	b	.L285
.L293:
	add	r3, r3, r3, asl #3
	add	r0, r6, r3, asl #2
	ldr	r3, .L314+180
	mov	lr, pc
	bx	r3
	ldr	r0, [sl, #0]
	mov	ip, r0, asr #31
	b	.L179
.L310:
	mov	r0, #36
	mla	r0, r3, r0, r6
	ldr	r3, .L314+180
	mov	lr, pc
	bx	r3
	ldr	r0, [sl, #0]
	b	.L186
.L312:
	mov	r0, #36
	mla	r0, r3, r0, r6
	ldr	r3, .L314+180
	mov	lr, pc
	bx	r3
	ldr	r1, .L314+76
	str	r1, [sp, #12]
	b	.L182
.L224:
	mov	r5, #1
	b	.L158
.L226:
	mov	r5, #1
	b	.L160
.L315:
	.align	2
.L314:
	.word	timer
	.word	player
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.word	bullets
	.word	playerShotSound
	.word	spawnPlayerBullet
	.word	bombs
	.word	715827883
	.word	tanks
	.word	458129845
	.word	spawnTank
	.word	1374389535
	.word	spawnTankBullet
	.word	rounds
	.word	playerBeams
	.word	-1840700269
	.word	airships
	.word	medkits
	.word	spawnMedkit
	.word	animateTank
	.word	spawnBomb
	.word	updatePlayer
	.word	updatePlayerBullet
	.word	beamHitCheck
	.word	updateAirship
	.word	playerHitCheck
	.word	healthUpCheck
	.word	updateMedkit
	.word	enemyHitCheck
	.word	updateTankBullet
	.word	playerHitByTankCheck
	.word	updateBomb
	.word	bombHitCheck
	.word	waitForVblank
	.word	animatePlayer
	.word	tanks+36
	.word	updatePlayerBeam
	.word	updateTank
	.word	chargePlayer
	.word	killPlayer
	.word	spawnPlayerBeam
	.word	954437177
	.word	playRestoreHealthSound
	.word	spawnAirship
	.size	game, .-game
	.align	2
	.global	bossLvl
	.type	bossLvl, %function
bossLvl:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r7, .L384
	ldr	r4, .L384+4
	sub	sp, sp, #12
	bl	updateOAM
	ldr	r2, [r7, #0]
	ldr	r3, [r4, #4]
	add	r2, r2, #1
	cmp	r3, #160
	str	r2, [r7, #0]
	ble	.L317
	sub	r3, r3, #1
	str	r3, [r4, #4]
	ldr	r6, .L384+8
.L318:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	moveq	r2, #1
	streq	r2, [r6, #52]
	ldr	r2, [r6, #24]
	cmp	r2, #0
	ble	.L329
	ldr	r0, .L384+8
	ldr	r3, .L384+12
	mov	lr, pc
	bx	r3
	ldr	r8, .L384+16
.L330:
	ldr	sl, .L384+20
	ldr	r3, [sl, #0]
	tst	r3, #512
	beq	.L334
	ldr	r2, .L384+24
	ldr	r2, [r2, #0]
	tst	r2, #512
	beq	.L374
.L334:
	tst	r3, #256
	beq	.L372
	ldr	r3, .L384+24
	ldr	r3, [r3, #0]
	tst	r3, #256
	beq	.L367
.L372:
	ldr	r9, .L384+28
.L335:
	ldr	r3, [r6, #0]
	mov	r3, r3, asr #8
	cmp	r3, #144
	bgt	.L375
.L337:
	ldr	r3, [sl, #0]
	tst	r3, #1
	beq	.L373
	ldr	r3, .L384+24
	ldr	r3, [r3, #0]
	tst	r3, #1
	beq	.L340
.L373:
	ldr	r3, [r8, #24]
.L339:
	cmp	r3, #0
	ldr	r5, .L384+16
	ldr	fp, .L384+32
	mov	r4, #0
	bne	.L376
.L343:
	add	r4, r4, #1
	cmp	r4, #3
	add	r5, r5, #44
	beq	.L344
.L377:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	beq	.L343
.L376:
	add	r3, r4, r4, asl #2
	add	r3, r4, r3, asl #1
	add	r3, r8, r3, asl #2
	mov	r0, r3
	str	r3, [sp, #4]
	mov	lr, pc
	bx	fp
	ldr	r3, [sp, #4]
	ldr	r1, .L384+4
	mov	r0, r3
	ldr	r2, .L384+36
	add	r4, r4, #1
	mov	lr, pc
	bx	r2
	cmp	r4, #3
	add	r5, r5, #44
	bne	.L377
.L344:
	ldr	r3, [r9, #24]
	cmp	r3, #0
	bne	.L378
	ldr	r3, [r9, #52]
	cmp	r3, #0
	bne	.L379
.L347:
	ldr	r3, [r7, #0]
	tst	r3, #3
	beq	.L380
.L348:
	tst	r3, #63
	beq	.L381
.L349:
	ldr	r3, [sl, #0]
	tst	r3, #8
	beq	.L350
	ldr	r3, .L384+24
	ldr	r3, [r3, #0]
	ands	r3, r3, #8
	bne	.L350
	ldr	r2, .L384+40
.L351:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L351
	bl	goToBossPause
.L350:
	ldr	r3, .L384+44
	mov	lr, pc
	bx	r3
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L317:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	ble	.L319
	ldr	r3, .L384+48
	mov	r0, r4
	mov	lr, pc
	bx	r3
	ldr	r3, [r7, #0]
	ldr	r1, .L384+52
	smull	r2, r1, r3, r1
	mov	r2, r3, asr #31
	rsb	r2, r2, r1, asr #5
	add	r2, r2, r2, asl #2
	add	r2, r2, r2, asl #2
	cmp	r3, r2, asl #2
	bne	.L382
	ldr	r5, .L384+56
	ldr	r3, [r5, #24]
	cmp	r3, #0
	beq	.L322
	ldr	r3, [r5, #52]
	cmp	r3, #0
	beq	.L383
.L323:
	ldr	r3, .L384+60
	ldr	r0, .L384+56
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #16]
	cmp	r3, #0
	ble	.L324
	ldr	r0, .L384+56
	ldr	r1, .L384+8
	ldr	r3, .L384+64
	mov	lr, pc
	bx	r3
	b	.L324
.L340:
	ldr	r3, [r6, #24]
	cmp	r3, #0
	ble	.L373
	ldr	r3, [r8, #24]
	cmp	r3, #0
	ldr	r2, .L384+16
	beq	.L354
	ldr	r1, [r2, #68]
	cmp	r1, #0
	beq	.L355
	ldr	r2, [r2, #112]
	cmp	r2, #0
	moveq	r4, #2
	bne	.L339
.L342:
	ldr	r3, .L384+68
	mov	lr, pc
	bx	r3
	mov	r0, #44
	mla	r0, r4, r0, r8
	ldr	r1, .L384+8
	ldr	r3, .L384+72
	mov	lr, pc
	bx	r3
	b	.L373
.L367:
	ldr	r3, [r6, #44]
	cmp	r3, #5
	bne	.L372
	ldr	r9, .L384+28
	ldr	r4, [r9, #24]
	cmp	r4, #0
	beq	.L336
	ldr	r3, [r9, #52]
	cmp	r3, #0
	bne	.L335
	mov	r4, #1
.L336:
	ldr	r3, .L384+68
	mov	lr, pc
	bx	r3
	mov	r0, #28
	ldr	r3, .L384+76
	mla	r0, r4, r0, r9
	ldr	r1, .L384+8
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [r6, #44]
	b	.L335
.L329:
	cmp	r3, #0
	ldrgt	r0, .L384+8
	ldrgt	r3, .L384+80
	movgt	lr, pc
	bxgt	r3
.L331:
	ldr	r2, [r6, #0]
	ldr	r8, .L384+16
	mov	r2, r2, asr #8
	mov	r3, #0
	cmp	r2, #148
	str	r3, [r8, #24]
	str	r3, [r8, #68]
	str	r3, [r8, #112]
	ble	.L330
	ldr	r2, .L384+40
.L332:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L332
	ldr	r1, [r6, #52]
	mov	r3, #0
	ldr	r2, .L384+56
	cmp	r1, r3
	str	r3, [r2, #24]
	str	r3, [r2, #52]
	str	r3, [r4, #32]
	bne	.L333
	bl	goToLose
	b	.L330
.L381:
	ldr	r0, .L384+8
	ldr	r3, .L384+84
	mov	lr, pc
	bx	r3
	b	.L349
.L378:
	ldr	r0, .L384+28
	ldr	r3, .L384+88
	mov	lr, pc
	bx	r3
	ldr	r3, .L384+92
	ldr	r0, .L384+28
	ldr	r1, .L384+4
	mov	lr, pc
	bx	r3
	ldr	r3, [r9, #52]
	cmp	r3, #0
	beq	.L347
.L379:
	ldr	r0, .L384+96
	ldr	r3, .L384+88
	mov	lr, pc
	bx	r3
	ldr	r3, .L384+92
	ldr	r0, .L384+96
	ldr	r1, .L384+4
	mov	lr, pc
	bx	r3
	ldr	r3, [r7, #0]
	tst	r3, #3
	bne	.L348
.L380:
	ldr	r3, .L384+100
	ldr	r0, [r6, #28]
	mov	lr, pc
	bx	r3
	ldr	r3, .L384
	str	r0, [r6, #28]
	ldr	r3, [r3, #0]
	b	.L348
.L375:
	bl	goToLose
	b	.L337
.L382:
	ldr	r5, .L384+56
	ldr	r3, [r5, #24]
.L321:
	cmp	r3, #0
	bne	.L323
.L324:
	ldr	r3, [r5, #52]
	cmp	r3, #0
	bne	.L364
.L370:
	ldr	r6, .L384+8
	b	.L318
.L374:
	mov	r3, #5
	str	r3, [r6, #24]
	ldr	r3, .L384+104
	mov	lr, pc
	bx	r3
	ldr	r3, [sl, #0]
	b	.L334
.L319:
	ldr	r3, .L384+108
	mov	r0, r4
	mov	lr, pc
	bx	r3
	ldr	r6, .L384+8
	ldr	r3, .L384+112
	ldr	r2, [r6, #48]
	ldr	r1, [r3, #0]
	cmp	r2, r1
	strgt	r2, [r3, #0]
	ldr	r3, [r4, #32]
	mov	r1, #0
	ldr	r2, .L384+56
	cmp	r3, r1
	str	r1, [r2, #24]
	str	r1, [r2, #52]
	bne	.L318
	ldr	r2, .L384+40
.L327:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L327
	bl	goToWin
	b	.L318
.L333:
	bl	goToWin
	b	.L330
.L364:
	ldr	r3, .L384+60
	ldr	r0, .L384+116
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #16]
	cmp	r3, #0
	ble	.L370
	ldr	r0, .L384+116
	ldr	r1, .L384+8
	ldr	r3, .L384+64
	mov	lr, pc
	bx	r3
	ldr	r6, .L384+8
	b	.L318
.L383:
	add	r3, r3, #1
.L322:
	mov	r0, #28
	mla	r0, r3, r0, r5
	ldr	r1, .L384+4
	ldr	r3, .L384+120
	mov	lr, pc
	bx	r3
	ldr	r3, [r5, #24]
	b	.L321
.L355:
	mov	r4, #1
	b	.L342
.L354:
	mov	r4, r3
	b	.L342
.L385:
	.align	2
.L384:
	.word	timer
	.word	boss
	.word	player
	.word	updatePlayer
	.word	bullets
	.word	oldButtons
	.word	buttons
	.word	playerBeams
	.word	updatePlayerBullet
	.word	bossHitCheck
	.word	shadowOAM
	.word	waitForVblank
	.word	updateBoss
	.word	1374389535
	.word	beams
	.word	updateBeam
	.word	playerHitByBossCheck
	.word	playerShotSound
	.word	spawnPlayerBullet
	.word	spawnPlayerBeam
	.word	killPlayer
	.word	chargePlayer
	.word	updatePlayerBeam
	.word	beamHitBossCheck
	.word	playerBeams+28
	.word	animatePlayer
	.word	playRestoreHealthSound
	.word	killBoss
	.word	highScore
	.word	beams+28
	.word	spawnBeam
	.size	bossLvl, .-bossLvl
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	mov	r5, #67108864
	mov	r3, #4352	@ movhi
	strh	r3, [r5, #0]	@ movhi
	ldr	r3, .L401
	mov	lr, pc
	bx	r3
	ldr	r3, .L401+4
	mov	lr, pc
	bx	r3
	mov	r2, #23808
	mov	r3, #7936
	add	r2, r2, #2
	add	r3, r3, #7
	strh	r2, [r5, #8]	@ movhi
	strh	r3, [r5, #10]	@ movhi
	bl	goToStart
	ldr	r4, .L401+8
	ldr	r7, .L401+12
	ldr	r6, .L401+16
.L400:
	ldr	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L388:
	str	r3, [r6, #0]
	ldr	r3, [r5, #304]
	str	r3, [r4, #0]
	cmp	r2, #7
	ldrls	pc, [pc, r2, asl #2]
	b	.L388
.L397:
	.word	.L389
	.word	.L390
	.word	.L391
	.word	.L392
	.word	.L393
	.word	.L394
	.word	.L395
	.word	.L396
.L396:
	bl	win
	b	.L400
.L395:
	bl	bossPause
	b	.L400
.L394:
	bl	bossLvl
	b	.L400
.L393:
	bl	lose
	b	.L400
.L392:
	bl	pause
	b	.L400
.L391:
	bl	game
	b	.L400
.L390:
	bl	instructions
	b	.L400
.L389:
	bl	start
	b	.L400
.L402:
	.align	2
.L401:
	.word	setupSounds
	.word	setupInterrupts
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L406
	mov	r3, #0
.L404:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L404
	bx	lr
.L407:
	.align	2
.L406:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.global	hOff
	.global	vOff
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	shadowOAM,1024,4
	.comm	timer,4,4
	.comm	page,4,4
	.comm	charBuffer,41,4
	.comm	state,4,4
	.comm	highScore,4,4
	.comm	player,56,4
	.comm	bullets,132,4
	.comm	airships,576,4
	.comm	medkits,132,4
	.comm	boss,36,4
	.comm	beams,56,4
	.comm	playerBeams,56,4
	.comm	tanks,72,4
	.comm	rounds,132,4
	.comm	bombs,132,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
