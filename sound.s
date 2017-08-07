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
	.file	"sound.c"
	.text
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r2, #1264
	mov	r3, #67108864
	sub	r2, r2, #1
	mov	r1, #128	@ movhi
	strh	r1, [r3, #132]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #128]	@ movhi
	bx	lr
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L3+8
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	ip, [r3, #0]
	mov	r8, r0
	mov	r6, #0
	mov	r4, #67108864
	add	ip, ip, #12
	add	r9, r4, #256
	mov	r5, r2
	mov	sl, r1
	add	r2, r4, #160
	mov	r1, r8
	mov	r3, #910163968
	mov	r0, #1
	str	r6, [ip, #8]
	ldr	ip, .L3+12
	mov	lr, pc
	bx	ip
	mov	r1, r5
	strh	r6, [r9, #2]	@ movhi
	ldr	r3, .L3+16
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r4, .L3+20
	mov	r3, r3, lsr #16
	strh	r3, [r9, #0]	@ movhi
	mov	r3, #128	@ movhi
	str	r8, [r4, #0]
	ldr	r7, .L3+24
	strh	r3, [r9, #2]	@ movhi
	mov	r0, sl
	str	r6, [r4, #28]
	mov	lr, pc
	bx	r7
	adr	r3, .L3
	ldmia	r3, {r2-r3}
	ldr	ip, .L3+28
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r5
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	ip, .L3+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L3+36
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r0, [r4, #20]
	str	sl, [r4, #4]
	str	r5, [r4, #8]
	str	r3, [r4, #12]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L4:
	.align	3
.L3:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playWinMusic
	.type	playWinMusic, %function
playWinMusic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #33536
	mov	r2, #11008
	stmfd	sp!, {r3, lr}
	add	r2, r2, #17
	ldr	r0, .L6
	add	r1, r1, #3
	bl	playSoundA
	ldr	r3, .L6+4
	mov	r2, #0
	str	r2, [r3, #16]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	winMusic2
	.word	soundA
	.size	playWinMusic, .-playWinMusic
	.align	2
	.global	playGameMusic
	.type	playGameMusic, %function
playGameMusic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #88064
	mov	r2, #11008
	stmfd	sp!, {r3, lr}
	add	r2, r2, #17
	ldr	r0, .L9
	add	r1, r1, #276
	bl	playSoundA
	ldr	r3, .L9+4
	mov	r2, #1
	str	r2, [r3, #16]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	drum1
	.word	soundA
	.size	playGameMusic, .-playGameMusic
	.align	2
	.global	playMenuMusic
	.type	playMenuMusic, %function
playMenuMusic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #22016
	mov	r2, #11008
	stmfd	sp!, {r3, lr}
	add	r2, r2, #17
	ldr	r0, .L12
	add	r1, r1, #164
	bl	playSoundA
	ldr	r3, .L12+4
	mov	r2, #1
	str	r2, [r3, #16]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	drum2
	.word	soundA
	.size	playMenuMusic, .-playMenuMusic
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L15+8
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	ip, [r3, #0]
	mov	r8, r0
	mov	r6, #0
	mov	r4, #67108864
	add	ip, ip, #24
	add	r9, r4, #256
	mov	r5, r2
	mov	sl, r1
	add	r2, r4, #164
	mov	r1, r8
	mov	r3, #910163968
	mov	r0, #2
	str	r6, [ip, #8]
	ldr	ip, .L15+12
	mov	lr, pc
	bx	ip
	mov	r1, r5
	strh	r6, [r9, #6]	@ movhi
	ldr	r3, .L15+16
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r4, .L15+20
	mov	r3, r3, lsr #16
	strh	r3, [r9, #4]	@ movhi
	mov	r3, #128	@ movhi
	str	r8, [r4, #0]
	ldr	r7, .L15+24
	strh	r3, [r9, #6]	@ movhi
	mov	r0, sl
	str	r6, [r4, #28]
	mov	lr, pc
	bx	r7
	adr	r3, .L15
	ldmia	r3, {r2-r3}
	ldr	ip, .L15+28
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r5
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	ip, .L15+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L15+36
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r0, [r4, #20]
	str	sl, [r4, #4]
	str	r5, [r4, #8]
	str	r3, [r4, #12]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L16:
	.align	3
.L15:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r3, #67108864
	add	r3, r3, #512
	ldrh	r2, [r3, #2]
	tst	r2, #1
	mov	r2, #0	@ movhi
	strh	r2, [r3, #8]	@ movhi
	beq	.L18
	ldr	r3, .L27
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L19
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	blt	.L19
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L24
	ldr	r1, .L27+4
	ldr	r0, [r1, #0]
	mov	r1, #67108864
	add	r0, r0, #12
	add	r1, r1, #256
	str	r2, [r0, #8]
	str	r2, [r3, #12]
	strh	r2, [r1, #2]	@ movhi
.L19:
	ldr	r3, .L27+8
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L25
.L21:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L18:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r3, lr}
	bx	lr
.L25:
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	blt	.L21
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L26
	ldr	r1, .L27+4
	ldr	r0, [r1, #0]
	mov	r1, #67108864
	add	r0, r0, #24
	add	r1, r1, #256
	str	r2, [r0, #8]
	str	r2, [r3, #12]
	strh	r2, [r1, #6]	@ movhi
	b	.L21
.L24:
	ldmia	r3, {r0, r1, r2}	@ phole ldm
	bl	playSoundA
	b	.L19
.L26:
	ldmia	r3, {r0, r1, r2}	@ phole ldm
	bl	playSoundB
	b	.L21
.L28:
	.align	2
.L27:
	.word	soundA
	.word	dma
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	playLoseSound
	.type	playLoseSound, %function
playLoseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #9856
	mov	r2, #11008
	stmfd	sp!, {r3, lr}
	add	r2, r2, #17
	ldr	r0, .L30
	add	r1, r1, #59
	bl	playSoundB
	ldr	r3, .L30+4
	mov	r2, #0
	str	r2, [r3, #16]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	crash
	.word	soundB
	.size	playLoseSound, .-playLoseSound
	.align	2
	.global	playPauseSound
	.type	playPauseSound, %function
playPauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #3408
	mov	r2, #11008
	stmfd	sp!, {r3, lr}
	add	r2, r2, #17
	ldr	r0, .L33
	add	r1, r1, #3
	bl	playSoundB
	ldr	r3, .L33+4
	mov	r2, #0
	str	r2, [r3, #16]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	pom
	.word	soundB
	.size	playPauseSound, .-playPauseSound
	.align	2
	.global	playRestoreHealthSound
	.type	playRestoreHealthSound, %function
playRestoreHealthSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #3920
	mov	r2, #11008
	stmfd	sp!, {r3, lr}
	add	r2, r2, #17
	ldr	r0, .L36
	add	r1, r1, #9
	bl	playSoundB
	ldr	r3, .L36+4
	mov	r2, #0
	str	r2, [r3, #16]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	bling
	.word	soundB
	.size	playRestoreHealthSound, .-playRestoreHealthSound
	.align	2
	.global	playerHitSound
	.type	playerHitSound, %function
playerHitSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #2528
	mov	r2, #11008
	stmfd	sp!, {r3, lr}
	add	r2, r2, #17
	ldr	r0, .L39
	add	r1, r1, #7
	bl	playSoundB
	ldr	r3, .L39+4
	mov	r2, #0
	str	r2, [r3, #16]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	blam
	.word	soundB
	.size	playerHitSound, .-playerHitSound
	.align	2
	.global	playerShotSound
	.type	playerShotSound, %function
playerShotSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #2800
	mov	r2, #11008
	stmfd	sp!, {r3, lr}
	add	r2, r2, #17
	ldr	r0, .L42
	add	r1, r1, #1
	bl	playSoundB
	ldr	r3, .L42+4
	mov	r2, #0
	str	r2, [r3, #16]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	boom
	.word	soundB
	.size	playerShotSound, .-playerShotSound
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L45
	mov	r2, #0
	str	r2, [r1, #12]
	mov	r3, #67108864
	ldr	r1, .L45+4
	add	r3, r3, #256
	strh	r2, [r3, #2]	@ movhi
	str	r2, [r1, #12]
	strh	r2, [r3, #6]	@ movhi
	bx	lr
.L46:
	.align	2
.L45:
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L48
	mov	r2, #1
	str	r2, [r1, #12]
	mov	r3, #67108864
	ldr	r1, .L48+4
	add	r3, r3, #256
	strh	r2, [r3, #2]	@ movhi
	str	r2, [r1, #12]
	strh	r2, [r3, #6]	@ movhi
	bx	lr
.L49:
	.align	2
.L48:
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L51
	ldr	r1, [r3, #0]
	mov	r3, #0
	add	r0, r1, #12
	str	r3, [r0, #8]
	mov	r2, #67108864
	ldr	r0, .L51+4
	add	r2, r2, #256
	add	r1, r1, #24
	str	r3, [r0, #12]
	strh	r3, [r2, #2]	@ movhi
	str	r3, [r1, #8]
	ldr	r1, .L51+8
	str	r3, [r1, #12]
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L52:
	.align	2
.L51:
	.word	dma
	.word	soundA
	.word	soundB
	.size	stopSound, .-stopSound
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	add	r3, r2, #512
	str	r4, [sp, #-4]!
	ldrh	r0, [r2, #4]
	ldrh	ip, [r3, #0]
	mov	r1, #50331648
	ldr	r4, .L54
	add	r1, r1, #28672
	orr	ip, ip, #1
	orr	r0, r0, #8
	str	r4, [r1, #4092]
	strh	ip, [r3, #0]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r4}
	bx	lr
.L55:
	.align	2
.L54:
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.comm	soundA,32,4
	.comm	soundB,32,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
