	.equ SWI_EXIT, 0x11
	.equ Stdout,1
	.equ SWI_PrStr,0x69
	.equ SWI_RdStr,0x6a
	.equ Stdin,2
	.text
	.global	compare1,compare2,strlen,atoi,edit,div,copy


@case-sensitive comparision
@ input r0 : pointer to string1
@	r1 : pointer to string2
@output  r0 :	0 : if both are equal
@		1 : if string1 is greater
@	       -1 : if string2 is greater

compare1:
	str	r7,[sp,#120]
	str	r2,[sp,#100]
	str	r3,[sp,#104]
	str	r4,[sp,#108]
	str	r5,[sp,#112]
	str	r6,[sp,#116]
	str	lr,[sp,#-100]
	str	r9,[sp,#-108]	
	str	r8,[sp,#-112]	
	mov	r2,r0
	mov	r3,r1
	ldr	lr,=mov1
	b	strlen
	
mov1:	mov	r4,r0
	mov	r0,r1
	ldr	lr,=mov2
	bl	strlen
	
mov2:	mov	r5,r0			
	
	cmp	r4,r5
	movle	r8,r4			
	movgt	r8,r5

	mov	r1,#0			

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
	str	r7,[sp,#120]
	str	r2,[sp,#100]
	str	r3,[sp,#104]
	str	r4,[sp,#108]
	str	r5,[sp,#112]
	str	r6,[sp,#116]
	str	lr,[sp,#-100]
	str	r9,[sp,#-108]	
	str	r8,[sp,#-112]
	mov	r9,#94	
	mov	r2,r0
	mov	r3,r1	

	ldr	lr,=mov11
	bl	strlen
	
mov11:	mov	r4,r0
	mov	r0,r1		
	ldr	lr,=mov21
	b 	strlen
	
mov21:	mov	r5,r0			
	
	cmp	r4,r5
	movle	r8,r4
	movgt	r8,r5			
	
	
	mov	r1,#0			
	
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
	b	A1			


step:	cmp	r4,r5
	beq	True			
	blt	FC1			
	bgt	FC2			
	
True:
	mov	r0,#0
	ldr	r7,[sp,#120]
	ldr	r2,[sp,#100]
	ldr	r3,[sp,#104]
	ldr	r4,[sp,#108]
	ldr	r5,[sp,#112]
	ldr	r6,[sp,#116]
	ldr	lr,[sp,#-100]
	ldr	r9,[sp,#-108]	
	ldr	r8,[sp,#-112]
	mov	pc,lr
	
FC1:	
	mov	r0,#-1
	ldr	r7,[sp,#120]
	ldr	r2,[sp,#100]
	ldr	r3,[sp,#104]
	ldr	r4,[sp,#108]
	ldr	r5,[sp,#112]
	ldr	r6,[sp,#116]
	ldr	lr,[sp,#-100]
	ldr	r9,[sp,#-108]	
	ldr	r8,[sp,#-112]
	mov	pc,lr
	
FC2:
	mov	r0,#1
	ldr	r7,[sp,#120]
	ldr	r2,[sp,#100]
	ldr	r3,[sp,#104]
	ldr	r4,[sp,#108]
	ldr	r5,[sp,#112]
	ldr	r6,[sp,#116]
	ldr	lr,[sp,#-100]
	ldr	r9,[sp,#-108]	
	ldr	r8,[sp,#-112]
	mov	pc,lr


@code to find string length input r0 string output r0=length(r0)	

strlen:
	str	r1,[sp,#-76]
	str	r2,[sp,#-72]
	str	r3,[sp,#76]
	mov	r1, #0
	mov	r3, r0
1:	ldrb	r2, [r3], #1
	cmp	r2, #0			
	bne	1b
	sub	r0, r3, r0
	sub	r0,r0,#1
	ldr	r1,[sp,#-76]
	ldr	r2,[sp,#-72]
	ldr	r3,[sp,#76]
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


@code to edit a string exactly to 4k size
@input r0: size of string
@output r1: edited size
	
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

@code for dividing two numbers
@input	r0:	number1
@	r1:	number2
@output r3:	answer (r3 is used for convinience in code)


div:
	mov	r3,#0
di:	cmp	r0,r1
	blt	out
	sub	r0,r0,r1
	add	r3,r3,#1
	b	di
out:
	mov	pc,lr


@code to copy a list to another position
@input : 	r0 : 1 list pointer
@		r1 : number of elements need to copy
@		r9 : pointer to list need to be placed
@output :	r9 : updated pointer

copy:
	str	r2,[sp,#-96]
	str	r3,[sp,#96]
	str	r1,[sp,#76]
	mov	r2,#4
	mul	r1,r1,r2
	mov	r2,#0
c:	cmp	r2,r1
	beq	out1
	ldr	r3,[r0,r2]
	str	r3,[r9],#4
	add	r2,r2,#4
	b	c
out1:
	ldr	r1,[sp,#76]
	ldr	r2,[sp,#-96]
	ldr	r3,[sp,#96]
	mov	pc,lr

.end
