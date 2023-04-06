	.equ SWI_EXIT, 0x11
	.equ Stdout,1
	.equ SWI_PrStr,0x69
	.equ SWI_RdStr,0x6a
	.equ Stdin,2
	.text
	.extern	compare1,compare2,strlen,atoi,edit,div,copy
	.global	merge,CS,CIS

@input: r0:pointer to list 1
@	r1:length of list1
@	r2:pointer to list2
@	r3:length of list2
@	[sp,#-4]:comparision mode
@output:r0: pointer to mergedlist
@	r1:length of merged list

merge:
	str	r0,[sp,#-52]
	ldr	r0,[sp,#-4]
	cmp	r0,#1
	beq	d
	bne	d1
d:	ldr	r0,[sp,#-52]
	b	CIS
d1:	ldr	r0,[sp,#-52]
	b	CS



CS:
	str	r4,[sp,#92]
	str	r5,[sp,#88]
	str	r6,[sp,#84]
	str	r7,[sp,#80]
	str	r8,[sp,#-84]
	str	r9,[sp,#-88]
	str	lr,[sp,#-92]
	ldr	r9,=mergedlist
	mov	r7,r0
	mov	r8,r2
	mov	r4,#4
	mul	r1,r1,r4
	mul	r3,r3,r4
	str	r1,[sp,#-8]
	str	r3,[sp,#8]
	mov	r4,#0
	mov	r5,#0
	mov	r6,#0
main:	ldr	r2,[sp,#-8]
	cmp	r4,r2
	beq	Ret1
	ldr	r3,[sp,#8]
	cmp	r5,r3
	beq	Ret2
	ldr	r0,[r7,r4]
	ldr	r1,[r8,r5]
	ldr	lr,=x
	b	compare1	
x:	cmp	r0,#-1
	beq	case1
	cmp	r0,#1
	beq	case2
	cmp	r0,#0
	beq	case3
case1:	ldr	r2,[r7,r4]
	str	r2,[r9,r6]
	add	r6,r6,#4
	add	r4,r4,#4
	b	main	
case2:  ldr	r3,[r8,r5]
	str	r3,[r9,r6]
	add	r6,r6,#4
	add	r5,r5,#4
	b	main
case3:  ldr	r2,[r7,r4]
	ldr	r3,[r8,r5]
	str	r2,[r9,r6]
	add	r6,r6,#4
	add	r4,r4,#4
	str	r3,[r9,r6]
	add	r6,r6,#4
	add	r5,r5,#4
	b	main

CIS:
	str	r4,[sp,#92]
	str	r5,[sp,#88]
	str	r6,[sp,#84]
	str	r7,[sp,#80]
	str	r8,[sp,#-84]
	str	r9,[sp,#-88]
	str	lr,[sp,#-92]
	ldr	r9,=mergedlist
	mov	r7,r0
	mov	r8,r2
	mov	r4,#4
	mul	r1,r1,r4
	mul	r3,r3,r4
	str	r1,[sp,#-8]
	str	r3,[sp,#8]
	mov	r4,#0
	mov	r5,#0
	mov	r6,#0
main1:	ldr	r2,[sp,#-8]
	cmp	r4,r2
	beq	Ret1
	ldr	r3,[sp,#8]
	cmp	r5,r3
	beq	Ret2
	ldr	r0,[r7,r4]
	ldr	r1,[r8,r5]
	ldr	lr,=x1
	b	compare2	
x1:	cmp	r0,#-1
	beq	case11
	cmp	r0,#1
	beq	case21
	cmp	r0,#0
	beq	case31
case11:ldr	r2,[r7,r4]
	str	r2,[r9,r6]
	add	r6,r6,#4
	add	r4,r4,#4
	b	main1	
case21: ldr	r3,[r8,r5]
	str	r3,[r9,r6]
	add	r6,r6,#4
	add	r5,r5,#4
	b	main1
case31: ldr	r2,[r7,r4]
	ldr	r3,[r8,r5]
	str	r2,[r9,r6]
	add	r6,r6,#4
	add	r4,r4,#4
	str	r3,[r9,r6]
	add	r6,r6,#4
	add	r5,r5,#4
	b	main1



Ret1:	ldr	r3,[sp,#8]
	cmp	r5,r3
	beq	output
	ldr	r3,[r8,r5]
	str	r3,[r9,r6]
	add	r5,r5,#4
	add	r6,r6,#4
	b	Ret1
	
Ret2:	ldr	r2,[sp,#-8]
	cmp	r4,r2
	beq	output
	ldr	r2,[r7,r4]
	str	r2,[r9,r6]
	add	r4,r4,#4
	add	r6,r6,#4
	b	Ret2
	
output: mov	r0,r6
	mov	r1,#4
	ldr	lr,=y
	b	div
y:	mov	r1,r3
	mov	r0,r9
	ldr	r4,[sp,#92]
	ldr	r5,[sp,#88]
	ldr	r6,[sp,#84]
	ldr	r7,[sp,#80]
	ldr	r8,[sp,#-84]
	ldr	r9,[sp,#-88]
	ldr	lr,[sp,#-92]
	mov	pc,lr
	
	
	.data	
mergedlist:	.space 1000


.end
