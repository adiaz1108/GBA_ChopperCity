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
	.file	"game.c"
	.text
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #40]
	cmp	r3, #249
	ldrle	r2, [r0, #36]
	addle	r3, r2, r3
	strle	r3, [r0, #40]
	mov	r2, #67108864
	ldr	r1, [r2, #304]
	tst	r1, #32
	beq	.L3
	ldr	r2, [r2, #304]
	tst	r2, #16
	beq	.L3
.L4:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #16
	bne	.L5
	ldr	r2, [r0, #4]
	cmp	r2, #119
	addle	r2, r2, #2
	strle	r2, [r0, #4]
.L5:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #64
	ldrne	r2, [r0, #0]
	bne	.L7
	ldr	r2, [r0, #0]
	mov	r1, r2, asr #8
	cmp	r1, #0
	ble	.L7
	cmn	r3, #249
	subge	r3, r3, #20
	strge	r3, [r0, #40]
.L7:
	mov	r1, #67108864
	ldr	r1, [r1, #304]
	tst	r1, #128
	bne	.L9
	mov	r1, r2, asr #8
	cmp	r1, #143
	ldrgt	r3, [r0, #40]
	ble	.L13
.L9:
	add	r3, r3, r2
	cmp	r3, #0
	str	r3, [r0, #0]
	movlt	r3, #0
	strlt	r3, [r0, #0]
	bx	lr
.L3:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #32
	bne	.L4
	ldr	r2, [r0, #4]
	cmp	r2, #0
	subgt	r2, r2, #2
	strgt	r2, [r0, #4]
	b	.L4
.L13:
	cmp	r3, #249
	addle	r3, r3, #10
	strle	r3, [r0, #40]
	add	r3, r3, r2
	cmp	r3, #0
	str	r3, [r0, #0]
	movlt	r3, #0
	strlt	r3, [r0, #0]
	bx	lr
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	animatePlayer
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	moveq	r0, #2
	bxeq	lr
	cmp	r0, #2
	moveq	r0, #4
	bxeq	lr
	cmp	r0, #4
	moveq	r0, #6
	bxeq	lr
	cmp	r0, #6
	beq	.L19
	bx	lr
.L19:
	mov	r0, #0
	bx	lr
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	chargePlayer
	.type	chargePlayer, %function
chargePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #44]
	cmp	r3, #4
	addle	r3, r3, #1
	strle	r3, [r0, #44]
	bx	lr
	.size	chargePlayer, .-chargePlayer
	.align	2
	.global	killPlayer
	.type	killPlayer, %function
killPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #0]
	mov	r3, r2, asr #8
	cmp	r3, #147
	ldrgt	r3, [r0, #40]
	bgt	.L24
	ldr	r3, [r0, #40]
	mov	r1, #848
	add	r1, r1, #1
	cmp	r3, r1
	addle	r3, r3, #30
	strle	r3, [r0, #40]
.L24:
	add	r3, r3, r2
	str	r3, [r0, #0]
	bx	lr
	.size	killPlayer, .-killPlayer
	.align	2
	.global	spawnPlayerBullet
	.type	spawnPlayerBullet, %function
spawnPlayerBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	ldr	r4, [r1, #0]
	ldr	r3, [r1, #20]
	ldr	ip, [r1, #4]
	ldr	r2, [r1, #16]
	mov	r5, #1
	mov	r1, r4, asr #8
	add	r3, r3, #24
	str	r5, [r0, #24]
	mov	r5, #4
	mov	r4, #0
	add	r1, r1, #4
	add	ip, ip, #24
	add	r2, r2, #4
	str	r5, [r0, #20]
	str	r3, [r0, #12]
	mov	r5, #6
	mov	r3, #8
	str	r5, [r0, #16]
	stmia	r0, {r1, ip}	@ phole stm
	str	r4, [r0, #28]
	str	r4, [r0, #32]
	str	r2, [r0, #8]
	str	r3, [r0, #36]
	str	r4, [r0, #40]
	ldmfd	sp!, {r4, r5}
	bx	lr
	.size	spawnPlayerBullet, .-spawnPlayerBullet
	.align	2
	.global	updatePlayerBullet
	.type	updatePlayerBullet, %function
updatePlayerBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #16]
	add	r3, r3, #6
	add	r2, r3, r2
	cmp	r2, #240
	str	r3, [r0, #4]
	movgt	r3, #0
	strgt	r3, [r0, #24]
	movgt	r3, #1
	strgt	r3, [r0, #32]
	bx	lr
	.size	updatePlayerBullet, .-updatePlayerBullet
	.align	2
	.global	spawnPlayerBeam
	.type	spawnPlayerBeam, %function
spawnPlayerBeam:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldmia	r1, {r2, r3}	@ phole ldm
	mov	ip, #1
	mov	r2, r2, asr #8
	str	ip, [r0, #24]
	mov	ip, #5
	mov	r1, #8
	add	r2, r2, #4
	add	r3, r3, #20
	str	ip, [r0, #12]
	mov	ip, #16
	str	ip, [r0, #8]
	str	r1, [r0, #16]
	str	r1, [r0, #20]
	stmia	r0, {r2, r3}	@ phole stm
	bx	lr
	.size	spawnPlayerBeam, .-spawnPlayerBeam
	.align	2
	.global	updatePlayerBeam
	.type	updatePlayerBeam, %function
updatePlayerBeam:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	add	r3, r3, #3
	cmp	r3, #240
	str	r3, [r0, #4]
	movgt	r3, #0
	strgt	r3, [r0, #24]
	bx	lr
	.size	updatePlayerBeam, .-updatePlayerBeam
	.align	2
	.global	spawnTank
	.type	spawnTank, %function
spawnTank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1
	str	r3, [r0, #32]
	mov	r3, #137
	str	r3, [r0, #0]
	mvn	r3, #31
	str	r3, [r0, #4]
	mov	r3, #15
	str	r3, [r0, #12]
	mov	r3, #18
	str	r3, [r0, #8]
	mov	r3, #14
	str	r3, [r0, #16]
	mov	r3, #13
	str	r3, [r0, #20]
	mov	r3, #4
	str	r3, [r0, #24]
	mov	r3, #9
	str	r3, [r0, #28]
	bx	lr
	.size	spawnTank, .-spawnTank
	.align	2
	.global	updateTank
	.type	updateTank, %function
updateTank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	add	r3, r3, #1
	cmp	r3, #240
	str	r3, [r0, #4]
	movgt	r3, #0
	strgt	r3, [r0, #32]
	bx	lr
	.size	updateTank, .-updateTank
	.align	2
	.global	animateTank
	.type	animateTank, %function
animateTank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #9
	moveq	r0, #13
	bxeq	lr
	cmp	r0, #13
	beq	.L37
	bx	lr
.L37:
	mov	r0, #9
	bx	lr
	.size	animateTank, .-animateTank
	.align	2
	.global	spawnBomb
	.type	spawnBomb, %function
spawnBomb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6}
	ldmia	r1, {r4, ip}	@ phole ldm
	add	r2, r1, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	mov	r1, r4, asr #8
	mov	r5, #1
	mov	r4, #8
	mov	r6, #0
	add	r1, r1, #4
	add	ip, ip, #16
	add	r2, r2, #4
	add	r3, r3, #20
	str	r5, [r0, #24]
	str	r4, [r0, #20]
	str	r4, [r0, #16]
	stmia	r0, {r1, ip}	@ phole stm
	str	r6, [r0, #28]
	str	r6, [r0, #32]
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	str	r4, [r0, #36]
	str	r5, [r0, #40]
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
	.size	spawnBomb, .-spawnBomb
	.align	2
	.global	updateBomb
	.type	updateBomb, %function
updateBomb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #0]
	add	r3, r3, #3
	cmp	r3, #160
	str	r3, [r0, #0]
	movgt	r3, #0
	strgt	r3, [r0, #24]
	bx	lr
	.size	updateBomb, .-updateBomb
	.align	2
	.global	spawnTankBullet
	.type	spawnTankBullet, %function
spawnTankBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldmia	r1, {r2, r3}	@ phole ldm
	str	r3, [r0, #12]
	str	r3, [r0, #4]
	mov	r3, #8
	mov	ip, #0
	mov	r1, #5
	mov	r4, #1
	str	r3, [r0, #36]
	mov	r3, #7
	str	r4, [r0, #24]
	str	r2, [r0, #0]
	str	r2, [r0, #8]
	str	r3, [r0, #40]
	str	ip, [r0, #28]
	str	ip, [r0, #32]
	str	r1, [r0, #16]
	str	r1, [r0, #20]
	ldmfd	sp!, {r4}
	bx	lr
	.size	spawnTankBullet, .-spawnTankBullet
	.align	2
	.global	updateTankBullet
	.type	updateTankBullet, %function
updateTankBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #0]
	ldr	r2, [r0, #4]
	sub	r3, r3, #3
	sub	r2, r2, #3
	cmp	r3, #0
	str	r3, [r0, #0]
	str	r2, [r0, #4]
	blt	.L43
	cmp	r2, #0
	bxge	lr
.L43:
	mov	r3, #0
	str	r3, [r0, #24]
	bx	lr
	.size	updateTankBullet, .-updateTankBullet
	.align	2
	.global	spawnAirship
	.type	spawnAirship, %function
spawnAirship:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1
	stmfd	sp!, {r4, lr}
	mov	r3, #300
	str	r2, [r0, #16]
	mov	r2, #26
	add	r3, r3, #2
	str	r2, [r0, #28]
	mov	r2, #62
	str	r2, [r0, #32]
	str	r3, [r0, #4]
	ldr	r3, .L46
	mov	r4, r0
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+4
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #1
	add	r3, r3, r3, asl #2
	rsb	r0, r3, r0
	mov	r3, #3
	rsb	r0, r0, r0, asl #4
	str	r3, [r4, #20]
	mov	r3, #0
	mov	r0, r0, asl #1
	str	r3, [r4, #8]
	mov	r3, #4
	str	r0, [r4, #0]
	str	r3, [r4, #12]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	rand
	.word	1717986919
	.size	spawnAirship, .-spawnAirship
	.align	2
	.global	spawnMedkit
	.type	spawnMedkit, %function
spawnMedkit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r2, #1
	mov	r3, #8
	str	r2, [r0, #24]
	str	r3, [r0, #20]
	str	r3, [r0, #16]
	ldr	r5, .L49
	mov	r4, r0
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r5
	ldr	r3, .L49+4
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #1
	add	r3, r3, r3, asl #2
	rsb	r0, r3, r0
	mov	r2, #240
	add	r0, r0, r0, asl #2
	mov	r3, #0
	mov	r0, r0, asl #1
	str	r2, [r4, #4]
	mov	r2, #9
	str	r0, [r4, #0]
	str	r3, [r4, #28]
	str	r3, [r4, #32]
	str	r2, [r4, #36]
	str	r3, [r4, #40]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	rand
	.word	1717986919
	.size	spawnMedkit, .-spawnMedkit
	.align	2
	.global	updateMedkit
	.type	updateMedkit, %function
updateMedkit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #4]
	ldr	r3, [r0, #0]
	sub	r2, r2, #3
	add	r3, r3, #1
	cmp	r3, #144
	movle	r1, #0
	movgt	r1, #1
	cmn	r2, #16
	movge	r1, #0
	cmp	r1, #0
	str	r3, [r0, #0]
	movne	r3, #1
	strne	r3, [r0, #32]
	movne	r3, #0
	str	r2, [r0, #4]
	strne	r3, [r0, #24]
	bx	lr
	.size	updateMedkit, .-updateMedkit
	.align	2
	.global	updateAirship
	.type	updateAirship, %function
updateAirship:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	sub	r3, r3, #2
	cmn	r3, #62
	str	r3, [r0, #4]
	blt	.L54
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bxne	lr
.L54:
	mov	r3, #1
	str	r3, [r0, #24]
	mov	r3, #0
	str	r3, [r0, #16]
	bx	lr
	.size	updateAirship, .-updateAirship
	.align	2
	.global	collideLeft
	.type	collideLeft, %function
collideLeft:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	ldr	ip, [sp, #12]
	add	r3, r3, r1
	cmp	r3, ip
	ldr	r1, [sp, #8]
	ldr	r4, [sp, #16]
	blt	.L65
	ldr	r5, [sp, #20]
	add	ip, r5, ip
	cmp	r3, ip
	bgt	.L65
	cmp	r0, r1
	addlt	r4, r4, r1
	bge	.L66
.L59:
	add	r2, r2, r0
	cmp	r2, r4
	bgt	.L60
	cmp	r1, r2
	ble	.L64
.L60:
	cmp	r0, r1
	ble	.L67
.L65:
	mov	r0, #0
.L57:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L66:
	add	r4, r4, r1
	cmp	r0, r4
	bgt	.L59
.L64:
	mov	r0, #1
	b	.L57
.L67:
	cmp	r2, r4
	movlt	r0, #0
	movge	r0, #1
	b	.L57
	.size	collideLeft, .-collideLeft
	.align	2
	.global	bossHitCheck
	.type	bossHitCheck, %function
bossHitCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	sub	sp, sp, #16
	ldr	r6, [r1, #16]
	cmp	r6, #0
	mov	r5, r1
	mov	r4, r0
	ble	.L68
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L68
	add	ip, r5, #8
	ldmia	ip, {ip, lr}	@ phole ldm
	ldr	r8, [r5, #0]
	ldr	r7, [r5, #4]
	ldr	r0, [r0, #0]
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	str	r8, [sp, #0]
	stmib	sp, {r7, lr}	@ phole stm
	str	ip, [sp, #12]
	bl	collideLeft
	cmp	r0, #0
	beq	.L68
	mov	r3, #1
	sub	r6, r6, #1
	str	r6, [r5, #16]
	str	r3, [r4, #28]
	mov	r3, #0
	str	r3, [r4, #24]
.L68:
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
	.size	bossHitCheck, .-bossHitCheck
	.align	2
	.global	beamHitCheck
	.type	beamHitCheck, %function
beamHitCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #20
	ldr	r3, [r1, #20]
	cmp	r3, #0
	mov	r4, r1
	mov	r5, r2
	ble	.L70
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L70
	ldr	r3, [r0, #8]
	ldr	ip, [r0, #0]
	ldr	r2, [r0, #12]
	ldr	r1, [r0, #4]
	ldr	lr, [r4, #28]
	ldr	r0, [r4, #32]
	ldr	r7, [r4, #0]
	ldr	r6, [r4, #4]
	str	r0, [sp, #12]
	str	r7, [sp, #0]
	stmib	sp, {r6, lr}	@ phole stm
	mov	r0, ip
	bl	collideLeft
	cmp	r0, #0
	ldrne	r3, [r5, #48]
	movne	r2, #0
	addne	r3, r3, #1
	strne	r2, [r4, #20]
	strne	r3, [r5, #48]
.L70:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
	.size	beamHitCheck, .-beamHitCheck
	.align	2
	.global	enemyHitCheck
	.type	enemyHitCheck, %function
enemyHitCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	sub	sp, sp, #20
	ldr	r6, [r1, #20]
	cmp	r6, #0
	mov	r5, r1
	mov	r4, r0
	mov	r7, r2
	ble	.L72
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L72
	ldr	lr, [r5, #28]
	ldr	ip, [r5, #32]
	ldr	sl, [r5, #0]
	ldr	r8, [r5, #4]
	ldr	r0, [r0, #0]
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	str	sl, [sp, #0]
	stmib	sp, {r8, lr}	@ phole stm
	str	ip, [sp, #12]
	bl	collideLeft
	cmp	r0, #0
	beq	.L72
	sub	r6, r6, #1
	mov	r3, #1
	cmp	r6, #0
	str	r6, [r5, #20]
	str	r3, [r4, #28]
	mov	r3, #0
	str	r3, [r4, #24]
	ldreq	r3, [r7, #48]
	addeq	r3, r3, #1
	streq	r3, [r7, #48]
.L72:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	bx	lr
	.size	enemyHitCheck, .-enemyHitCheck
	.align	2
	.global	collideUp
	.type	collideUp, %function
collideUp:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	ldr	ip, [sp, #8]
	add	r2, r2, r0
	cmp	r2, ip
	ldr	r0, [sp, #12]
	ldr	r4, [sp, #20]
	blt	.L83
	ldr	r5, [sp, #16]
	add	ip, r5, ip
	cmp	r2, ip
	bgt	.L83
	cmp	r1, r0
	addlt	r4, r4, r0
	bge	.L84
.L77:
	add	r3, r3, r1
	cmp	r3, r4
	bgt	.L78
	cmp	r0, r3
	ble	.L82
.L78:
	cmp	r1, r0
	ble	.L85
.L83:
	mov	r0, #0
.L75:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L84:
	add	r4, r4, r0
	cmp	r1, r4
	bgt	.L77
.L82:
	mov	r0, #1
	b	.L75
.L85:
	cmp	r3, r4
	movlt	r0, #0
	movge	r0, #1
	b	.L75
	.size	collideUp, .-collideUp
	.align	2
	.global	bombHitCheck
	.type	bombHitCheck, %function
bombHitCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #36
	ldr	r3, [r1, #32]
	cmp	r3, #0
	mov	r4, r1
	mov	r5, r0
	mov	r6, r2
	beq	.L86
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L86
	ldr	r3, [r0, #16]
	ldr	ip, [r1, #20]
	ldr	r9, [r0, #4]
	ldr	fp, [r0, #20]
	ldr	sl, [r0, #0]
	ldmia	r1, {r7, r8}	@ phole ldm
	str	r3, [sp, #28]
	ldr	r3, [r1, #16]
	mov	r0, sl
	str	r3, [sp, #24]
	str	ip, [sp, #8]
	str	r3, [sp, #12]
	stmia	sp, {r7, r8}	@ phole stm
	mov	r1, r9
	mov	r2, fp
	ldr	r3, [sp, #28]
	str	ip, [sp, #20]
	bl	collideLeft
	cmp	r0, #0
	ldr	ip, [sp, #20]
	bne	.L88
	ldr	r3, [sp, #24]
	str	r7, [sp, #0]
	str	r3, [sp, #12]
	stmib	sp, {r8, ip}	@ phole stm
	mov	r0, sl
	mov	r1, r9
	mov	r2, fp
	ldr	r3, [sp, #28]
	bl	collideUp
	cmp	r0, #0
	bne	.L88
	add	r3, r4, #8
	ldmia	r3, {r3, ip}	@ phole ldm
	add	r7, r7, #8
	add	r8, r8, #8
	str	r3, [sp, #24]
	str	ip, [sp, #8]
	str	r3, [sp, #12]
	stmia	sp, {r7, r8}	@ phole stm
	mov	r0, sl
	mov	r1, r9
	mov	r2, fp
	ldr	r3, [sp, #28]
	str	ip, [sp, #20]
	bl	collideLeft
	cmp	r0, #0
	ldr	ip, [sp, #20]
	beq	.L89
.L88:
	ldr	r2, [r6, #48]
	mov	r3, #0
	add	r2, r2, #2
	str	r3, [r4, #32]
	str	r3, [r5, #24]
	str	r2, [r6, #48]
.L86:
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L89:
	ldr	r3, [sp, #24]
	str	r7, [sp, #0]
	str	r3, [sp, #12]
	stmib	sp, {r8, ip}	@ phole stm
	mov	r0, sl
	mov	r1, r9
	mov	r2, fp
	ldr	r3, [sp, #28]
	bl	collideUp
	cmp	r0, #0
	bne	.L88
	b	.L86
	.size	bombHitCheck, .-bombHitCheck
	.align	2
	.global	beamHitBossCheck
	.type	beamHitBossCheck, %function
beamHitBossCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #36
	ldr	r6, [r1, #16]
	cmp	r6, #0
	mov	r4, r1
	mov	r5, r0
	ble	.L90
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L90
	ldr	r3, [r1, #4]
	str	r3, [sp, #20]
	ldr	r3, [r1, #12]
	str	r3, [sp, #24]
	ldr	r3, [r1, #8]
	str	r3, [sp, #28]
	ldr	r3, [sp, #20]
	ldmia	r0, {r7, r8, r9, sl}	@ phole ldm
	ldr	fp, [r1, #0]
	str	r3, [sp, #4]
	ldr	r3, [sp, #24]
	str	r3, [sp, #8]
	ldr	r3, [sp, #28]
	str	fp, [sp, #0]
	str	r3, [sp, #12]
	mov	r0, r7
	mov	r1, r8
	mov	r2, sl
	mov	r3, r9
	bl	collideLeft
	cmp	r0, #0
	bne	.L92
	ldr	r3, [sp, #20]
	str	r3, [sp, #4]
	ldr	r3, [sp, #24]
	str	r3, [sp, #8]
	ldr	r3, [sp, #28]
	str	fp, [sp, #0]
	str	r3, [sp, #12]
	mov	r0, r7
	mov	r1, r8
	mov	r2, sl
	mov	r3, r9
	bl	collideUp
	cmp	r0, #0
	beq	.L95
.L92:
	cmp	r6, #2
	movle	r3, #0
	strle	r3, [r4, #16]
	subgt	r6, r6, #3
	mov	r3, #0
	strgt	r6, [r4, #16]
	str	r3, [r5, #24]
.L90:
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L95:
	stmia	sp, {r7, r8, sl}	@ phole stm
	str	r9, [sp, #12]
	mov	r0, fp
	add	r1, sp, #20
	ldmia	r1, {r1, r2, r3}	@ phole ldm
	bl	collideUp
	cmp	r0, #0
	bne	.L92
	b	.L90
	.size	beamHitBossCheck, .-beamHitBossCheck
	.align	2
	.global	playerHitCheck
	.type	playerHitCheck, %function
playerHitCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #36
	ldr	r3, [r1, #24]
	cmp	r3, #0
	mov	r4, r1
	mov	r5, r0
	ble	.L96
	ldr	r3, [r0, #16]
	cmp	r3, #0
	beq	.L96
	ldr	r3, [r1, #12]
	ldmia	r1, {r9, fp}	@ phole ldm
	ldr	r7, [r0, #0]
	ldr	r6, [r0, #4]
	str	r3, [sp, #20]
	mov	r9, r9, asr #8
	ldr	r3, [r1, #8]
	mov	r8, #24
	mov	sl, #62
	str	r7, [sp, #0]
	stmib	sp, {r6, r8, sl}	@ phole stm
	mov	r0, r9
	mov	r1, fp
	ldr	r2, [sp, #20]
	str	r3, [sp, #24]
	bl	collideUp
	cmp	r0, #0
	bne	.L98
	ldr	r3, [sp, #20]
	str	r3, [sp, #8]
	ldr	r3, [sp, #24]
	str	r9, [sp, #0]
	str	r3, [sp, #12]
	str	fp, [sp, #4]
	mov	r0, r7
	mov	r1, r6
	mov	r2, r8
	mov	r3, sl
	bl	collideUp
	cmp	r0, #0
	str	r0, [sp, #28]
	bne	.L98
	str	r7, [sp, #0]
	stmib	sp, {r6, r8, sl}	@ phole stm
	mov	r0, r9
	mov	r1, fp
	add	r2, sp, #20
	ldmia	r2, {r2, r3}	@ phole ldm
	bl	collideLeft
	cmp	r0, #0
	bne	.L100
.L96:
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L98:
	ldr	r3, .L101
	mov	lr, pc
	bx	r3
	ldr	r2, [r4, #24]
	mov	r3, #0
	sub	r2, r2, #1
	str	r2, [r4, #24]
	str	r3, [r5, #16]
	str	r3, [r5, #20]
	b	.L96
.L100:
	ldr	r3, .L101
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #24]
	sub	r3, r3, #1
	str	r3, [r4, #24]
	ldr	r3, [sp, #28]
	str	r3, [r5, #16]
	str	r3, [r5, #20]
	b	.L96
.L102:
	.align	2
.L101:
	.word	playerHitSound
	.size	playerHitCheck, .-playerHitCheck
	.align	2
	.global	playerHitByBossCheck
	.type	playerHitByBossCheck, %function
playerHitByBossCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #36
	ldr	r3, [r1, #24]
	cmp	r3, #0
	mov	r4, r1
	mov	r5, r0
	ble	.L103
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L103
	ldr	r3, [r1, #12]
	ldmia	r1, {r9, fp}	@ phole ldm
	ldr	r7, [r0, #0]
	ldr	r6, [r0, #4]
	str	r3, [sp, #20]
	mov	r9, r9, asr #8
	ldr	r3, [r1, #8]
	mov	r8, #8
	mov	sl, #16
	str	r7, [sp, #0]
	stmib	sp, {r6, r8, sl}	@ phole stm
	mov	r0, r9
	mov	r1, fp
	ldr	r2, [sp, #20]
	str	r3, [sp, #24]
	bl	collideUp
	cmp	r0, #0
	bne	.L105
	ldr	r3, [sp, #20]
	str	r3, [sp, #8]
	ldr	r3, [sp, #24]
	str	r9, [sp, #0]
	str	r3, [sp, #12]
	str	fp, [sp, #4]
	mov	r0, r7
	mov	r1, r6
	mov	r2, r8
	mov	r3, sl
	bl	collideUp
	cmp	r0, #0
	str	r0, [sp, #28]
	bne	.L105
	str	r7, [sp, #0]
	stmib	sp, {r6, r8, sl}	@ phole stm
	mov	r0, r9
	mov	r1, fp
	add	r2, sp, #20
	ldmia	r2, {r2, r3}	@ phole ldm
	bl	collideLeft
	cmp	r0, #0
	bne	.L107
.L103:
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L105:
	ldr	r3, .L108
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #24]
	sub	r3, r3, #1
	str	r3, [r4, #24]
	mov	r3, #0
	str	r3, [r5, #24]
	b	.L103
.L107:
	ldr	r3, .L108
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #24]
	sub	r3, r3, #1
	str	r3, [r4, #24]
	ldr	r3, [sp, #28]
	str	r3, [r5, #24]
	b	.L103
.L109:
	.align	2
.L108:
	.word	playerHitSound
	.size	playerHitByBossCheck, .-playerHitByBossCheck
	.align	2
	.global	playerHitByTankCheck
	.type	playerHitByTankCheck, %function
playerHitByTankCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #28
	ldr	r3, [r1, #24]
	cmp	r3, #0
	mov	r4, r1
	mov	r5, r0
	ble	.L110
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L110
	ldr	sl, [r1, #0]
	ldr	fp, [r1, #12]
	ldr	r9, [r1, #4]
	ldmia	r0, {r7, r8}	@ phole ldm
	ldr	r3, [r1, #8]
	mov	r6, #5
	mov	sl, sl, asr #8
	stmia	sp, {r7, r8}	@ phole stm
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	mov	r0, sl
	mov	r1, r9
	mov	r2, fp
	str	r3, [sp, #16]
	bl	collideUp
	cmp	r0, #0
	bne	.L112
	ldr	r3, [sp, #16]
	str	sl, [sp, #0]
	str	r3, [sp, #12]
	stmib	sp, {r9, fp}	@ phole stm
	mov	r0, r7
	mov	r1, r8
	mov	r2, r6
	mov	r3, r6
	bl	collideUp
	cmp	r0, #0
	str	r0, [sp, #20]
	bne	.L112
	stmia	sp, {r7, r8}	@ phole stm
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	mov	r0, sl
	mov	r1, r9
	mov	r2, fp
	ldr	r3, [sp, #16]
	bl	collideLeft
	cmp	r0, #0
	bne	.L114
.L110:
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L112:
	ldr	r3, .L115
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #24]
	sub	r3, r3, #1
	str	r3, [r4, #24]
	mov	r3, #0
	str	r3, [r5, #24]
	b	.L110
.L114:
	ldr	r3, .L115
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #24]
	sub	r3, r3, #1
	str	r3, [r4, #24]
	ldr	r3, [sp, #20]
	str	r3, [r5, #24]
	b	.L110
.L116:
	.align	2
.L115:
	.word	playerHitSound
	.size	playerHitByTankCheck, .-playerHitByTankCheck
	.align	2
	.global	healthUpCheck
	.type	healthUpCheck, %function
healthUpCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #36
	ldr	r6, [r1, #24]
	cmp	r6, #4
	mov	r4, r1
	mov	r5, r0
	bgt	.L117
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L117
	ldr	r3, [r1, #12]
	ldr	r9, [r1, #0]
	ldmia	r0, {r8, sl}	@ phole ldm
	ldr	fp, [r1, #4]
	str	r3, [sp, #20]
	mov	r7, #8
	ldr	r3, [r1, #8]
	mov	r9, r9, asr #8
	add	r8, r8, #8
	add	sl, sl, #2
	stmia	sp, {r8, sl}	@ phole stm
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	mov	r0, r9
	mov	r1, fp
	ldr	r2, [sp, #20]
	str	r3, [sp, #24]
	bl	collideUp
	cmp	r0, #0
	bne	.L119
	ldr	r3, [sp, #20]
	str	r3, [sp, #8]
	ldr	r3, [sp, #24]
	str	r9, [sp, #0]
	str	r3, [sp, #12]
	str	fp, [sp, #4]
	mov	r0, r8
	mov	r1, sl
	mov	r2, r7
	mov	r3, r7
	bl	collideUp
	cmp	r0, #0
	str	r0, [sp, #28]
	bne	.L119
	stmia	sp, {r8, sl}	@ phole stm
	str	r7, [sp, #8]
	str	r7, [sp, #12]
	mov	r0, r9
	mov	r1, fp
	add	r2, sp, #20
	ldmia	r2, {r2, r3}	@ phole ldm
	bl	collideLeft
	cmp	r0, #0
	beq	.L117
	add	r6, r6, #1
	ldr	r3, .L121
	str	r6, [r4, #24]
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r3, [r5, #28]
	ldr	r3, [sp, #28]
	str	r3, [r5, #24]
.L117:
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L119:
	add	r6, r6, #1
	ldr	r3, .L121
	str	r6, [r4, #24]
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r3, [r5, #28]
	mov	r3, #0
	str	r3, [r5, #24]
	b	.L117
.L122:
	.align	2
.L121:
	.word	playRestoreHealthSound
	.size	healthUpCheck, .-healthUpCheck
	.align	2
	.global	spawnBoss
	.type	spawnBoss, %function
spawnBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	str	r2, [r0, #32]
	mov	r2, #32
	str	r2, [r0, #0]
	mov	r2, #240
	str	r2, [r0, #4]
	mov	r2, #12
	str	r2, [r0, #24]
	mov	r2, #10
	str	r2, [r0, #16]
	mov	r2, #62
	mov	r3, #0
	str	r2, [r0, #8]
	mov	r2, #29
	str	r3, [r0, #20]
	str	r2, [r0, #12]
	str	r3, [r0, #28]
	bx	lr
	.size	spawnBoss, .-spawnBoss
	.align	2
	.global	updateBoss
	.type	updateBoss, %function
updateBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r5, .L128
	mov	r4, r0
	ldr	r6, [r0, #0]
	mov	lr, pc
	bx	r5
	mov	r2, r0, asr #31
	mov	r2, r2, lsr #30
	add	r3, r0, r2
	and	r3, r3, #3
	rsb	r3, r2, r3
	add	r3, r3, #1
	add	r3, r3, r3, asl #2
	cmp	r6, r3, asl #1
	movlt	r3, #1
	strlt	r3, [r4, #28]
	ldr	r6, [r4, #0]
	mov	lr, pc
	bx	r5
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #30
	add	r0, r0, r3
	and	r0, r0, #3
	rsb	r0, r3, r0
	add	r0, r0, r0, asl #2
	mov	r0, r0, asl #1
	add	r0, r0, #90
	cmp	r6, r0
	ldr	r2, [r4, #0]
	ldrle	r3, [r4, #28]
	mvngt	r3, #0
	strgt	r3, [r4, #28]
	add	r3, r2, r3
	str	r3, [r4, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L129:
	.align	2
.L128:
	.word	rand
	.size	updateBoss, .-updateBoss
	.align	2
	.global	killBoss
	.type	killBoss, %function
killBoss:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #0]
	cmp	r3, #164
	addle	r3, r3, #2
	movgt	r3, #0
	strle	r3, [r0, #0]
	strgt	r3, [r0, #32]
	bx	lr
	.size	killBoss, .-killBoss
	.align	2
	.global	spawnBeam
	.type	spawnBeam, %function
spawnBeam:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #0]
	ldr	r2, [r1, #4]
	add	r3, r3, #11
	str	r3, [r0, #0]
	mov	r3, #4
	mov	r1, #8
	add	r2, r2, #3
	mov	ip, #1
	str	r3, [r0, #20]
	mov	r3, #16
	str	ip, [r0, #24]
	str	r2, [r0, #4]
	str	r1, [r0, #16]
	str	r3, [r0, #8]
	str	r1, [r0, #12]
	bx	lr
	.size	spawnBeam, .-spawnBeam
	.align	2
	.global	updateBeam
	.type	updateBeam, %function
updateBeam:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	sub	r3, r3, #3
	cmn	r3, #16
	str	r3, [r0, #4]
	movlt	r3, #0
	strlt	r3, [r0, #24]
	bx	lr
	.size	updateBeam, .-updateBeam
	.ident	"GCC: (devkitARM release 31) 4.5.0"
