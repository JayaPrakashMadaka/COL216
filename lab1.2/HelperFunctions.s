	.equ SWI_EXIT, 0x11
	.equ Stdout,1
	.equ SWI_PrStr,0x69
	.equ SWI_RdStr,0x6a
	.equ Stdin,2
	.text
	.global	compare1,compare2,strlen,atoi,edit


@case-sensitive comparision
@ input r0 : pointer to string1
@	r1 : pointer to string2
@output  r0 :	0 : if both are equal
@		1 : if string1 is greater
@	       -1 : if string2 is greater

compare1:
	str	r1,[sp,#120]
	str	r2,[sp,#100]
	str	r3,[sp,#104]
	str	r4,[sp,#108]
	str	r5,[sp,#112]
	str	r6,[sp,#116]
	str	lr,[sp,#-100]
	str	r0,[sp,#-104]
	str	r1,[sp,#-108]
	str	r9,[sp,#-112]	
	str	r8,[sp,#-116]	
	ldr	lr,=mov1
	bl	strlen
	
mov1:	mov	r4,r0
	ldr	r0,[sp,#-108]			
	ldr	lr,=mov2
	bl strlen
	
mov2:	mov	r5,r0			
	
	cmp	r4,r5
	movle	r8,r4			
	movgt	r8,r5

	mov	r1,#0			

	ldr	r2,[sp,#-104]
	ldr	r3,[sp,#-108]
A:	cmp	r1,r8
	beq	step	
	ldrb	r6,[r2,r1]		
	ldrb	r7,[r3,r1]
	cmp	r6,r7
	blt	FC1			
	bgt	FC2			
	add	r1,r1,#1
	beq	A			

@case-insensitive comparision
@ input r0 : pointer to string1
@	r1 : pointer to string2
@output  r0 :	0 : if both are equal
@		1 : if string1 is greater
@	       -1 : if string2 is greater


compare2:
	str	r1,[sp,#120]
	str	r2,[sp,#100]
	str	r3,[sp,#104]
	str	r4,[sp,#108]
	str	r5,[sp,#112]
	str	r6,[sp,#116]
	str	lr,[sp,#-100]
	str	r0,[sp,#-104]
	str	r1,[sp,#-108]
	str	r9,[sp,#-112]
	str	r8,[sp,#-116]
	mov	r9,#95		

	ldr	lr,=mov11
	bl	strlen
	
mov11:	mov	r4,r0
	ldr	r0,[sp,#-108]		
	ldr	lr,=mov21
	bl 	strlen
	
mov21:	mov	r5,r0			
	
	cmp	r4,r5
	movle	r8,r4
	movgt	r8,r5			
	
	
	mov	r1,#0			

	ldr	r2,[sp,#-104]
	ldr	r3,[sp,#-108]	
A1:	cmp	r1,r8
	beq	step	
	ldrb	r6,[r2,r1]
	ldrb	r7,[r3,r1]
	cmp	r6,r9
	blt	w
	bgt	v
w:	add	r6,r6,#32
v:	cmp	r7,r9
	blt	q
	bgt	p
q:	add	r7,r7,#32
p:	cmp	r6,r7
	blt	FC1
	bgt	FC2				
	beq	go
go:	add	r1,r1,#1
	bl	A1			


step:	cmp	r4,r5
	beq	True			
	blt	FC1			
	bgt	FC2			
	
True:
	mov	r0,#0
	ldr	r1,[sp,#120]
	ldr	r2,[sp,#100]
	ldr	r3,[sp,#104]
	ldr	r4,[sp,#108]
	ldr	r5,[sp,#112]
	ldr	r6,[sp,#116]
	ldr	r9,[sp,#-112]
	ldr	r8,[sp,#-116]	
	ldr	lr,[sp,#-100]
	mov	pc,lr
	
FC1:	
	mov	r0,#-1
	ldr	r1,[sp,#120]
	ldr	r2,[sp,#100]
	ldr	r3,[sp,#104]
	ldr	r4,[sp,#108]
	ldr	r5,[sp,#112]
	ldr	r6,[sp,#116]	
	ldr	lr,[sp,#-100]
	ldr	r9,[sp,#-112]
	ldr	r8,[sp,#-116]
	mov	pc,lr
	
FC2:
	mov	r0,#1
	ldr	r1,[sp,#120]
	ldr	r2,[sp,#100]
	ldr	r3,[sp,#104]
	ldr	r4,[sp,#108]
	ldr	r5,[sp,#112]
	ldr	r6,[sp,#116]	
	ldr	lr,[sp,#-100]	
	ldr	r9,[sp,#-112]
	ldr	r8,[sp,#-116]	
	mov	pc,lr


	

strlen:
	mov	r1, #0
	mov	r3, r0
1:	ldrb	r2, [r3], #1
	cmp	r2, #0			
	bne	1b
	sub	r0, r3, r0
	mov	pc,lr	
	
@ atoi: ASCII string to integer conversion
@
@ Usage:
@    r0 = atoi(r0)
@ Input parameters:
@    r0: the address of a null-terminated ASCII string
@ Result:
@    r0: the value of the converted integer
atoi:
	mov	r2, #0		
	mov	r3, #0		
	mov	r4, #10
1:	ldrb	r1, [r0], #1	
	cmp	r1, #0
	beq	4f
	cmp	r1, #' '
	beq	1b
	cmp	r1, #'-'
	moveq	r3, #1
	ldreqb	r1, [r0], #1
	b	3f
2:	cmp	r1, #9
	bgt	4f
	mul	r2, r4, r2
	add	r2, r2, r1
	ldrb	r1, [r0], #1
3:	subs	r1, r1, #'0'
	bge	2b
4:	cmp	r3, #0
	moveq	r0, r2
	mvnne	r0, r2
	mov	pc,lr
	
edit:
	mov	r2,#0
e2:	cmp	r0,#-1
	blt	e1
	add	r2,r2,#1
	sub	r0,r0,#4
	b	e2
e1:	mov	r1,#4
	mul	r0,r2,r1 
	mov	pc,lr	

.end
