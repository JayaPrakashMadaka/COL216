	.equ SWI_EXIT, 0x11
	.equ Stdout,1
	.equ SWI_PrStr,0x69
	.equ SWI_RdStr,0x6a
	.equ Stdin,2
	.text
	.extern	compare1,compare2,strlen,atoi,edit
	.global	_start

_start:
	mov	r0,#1
	ldr	r1,=output1
	swi	0x69
	mov	r0,#2
	ldr	r1,=length1
	mov	r2,#64
	swi	0x6a
	
	ldr	r0,=length1
	ldr	lr,=x
	bl	atoi
x:	str	r0,[sp,#0]

	cmp	r0,#0
	beq	B	

	mov	r0,#1
	ldr	r1,=output3
	swi	0x69
	
	ldr	r8,[sp,#0]
	mov	r7,#0
	mov	r5,#0
	mov	r4,#-8
	
A:	
	mov	r0,#2
	ldr	r1,=st1
	mov	r2,#100
	swi	0x6a
	ldr	r2,[r1]
	ldr	r1,=list1
	str	r2,[r1,r5]
	add	r2,r1,r5
	str	r2,[sp,r4]
	sub	r4,r4,#4
	
	ldr	r0,=st1
	ldr	lr,=a
	bl	strlen
a:	sub	r0,r0,#1
	ldr	lr,=b
	bl	edit
b:	add	r5,r5,r0
	add	r7,r7,#1
	cmp	r7,r8
	blt	A
	
B:	mov	r0,#1
	ldr	r1,=output2
	swi	0x69
	mov	r0,#2
	ldr	r1,=length2
	mov	r2,#64
	swi	0x6a
	
	ldr	r0,=length2
	ldr	lr,=y
	bl	atoi
y:	str	r0,[sp,#-4]

	cmp	r0,#0
	beq	case

	mov	r0,#1
	ldr	r1,=output4
	swi	0x69
	
	ldr	r8,[sp,#-4]
	mov	r7,#0
	mov	r5,#0
	mov	r4,#4
	
A1:	mov	r0,#2
	ldr	r1,=st1
	mov	r2,#100
	swi	0x6a
	ldr	r2,[r1]
	ldr	r1,=list2
	str	r2,[r1,r5]
	add	r2,r1,r5
	str	r2,[sp,r4]
	add	r4,r4,#4
	
	ldr	r0,=st1
	ldr	lr,=a1
	bl	strlen
a1:	sub	r0,r0,#1
	ldr	lr,=b1
	bl	edit
b1:	add	r5,r5,r0
	add	r7,r7,#1
	cmp	r7,r8
	blt	A1

case:	mov	r0,#1
	ldr	r1,=output5
	swi	0x69
	
	mov	r9,#0
	
	mov	r0,#1
	ldr	r1,=output6
	swi	0x69
	
	mov	r0,#2
	ldr	r1,=lt
	mov	r2,#64
	swi	0x6a
	
	ldr	r0,[r1]
	cmp	r0,#'0
	beq	CS
	cmp	r0,#'1
	beq	CIS
CS:
	ldr	r6,=mergedlist
	mov	r2,#-8
	mov	r3,#4
	mov	r4,#0
loop1:	ldr	r0,[sp,r2]
	ldr	r1,[sp,r3]
	cmp	r0,#0
	beq	Ret1
	cmp	r1,#0
	beq	Ret2
	ldr	lr,=m1
	bl	compare1	
m1:	cmp	r0,#1
	beq	m2
	bne	m3
m2:	ldr	r1,[sp,r3]
	str	r1,[r6,r4]
	add	r9,r9,#1
	add	r4,r4,#4
	add	r3,r3,#4
	b	loop1
m3:	cmp	r0,#-1
	beq	m4
	bne	m5
m4:	ldr	r1,[sp,r2]
	str	r1,[r6,r4]
	add	r9,r9,#1
	add	r4,r4,#4
	sub	r2,r2,#4
	b	loop1
m5:	ldr	r1,[sp,r2]
	str	r1,[r6,r4]
	add	r9,r9,#1
	add	r4,r4,#4
	ldr	r1,[sp,r3]
	str	r1,[r6,r4]
	add	r9,r9,#1
	add	r4,r4,#4
	add	r3,r3,#4
	sub	r2,r2,#4
	b	loop1
	

CIS:
	ldr	r6,=mergedlist
	mov	r2,#-8
	mov	r3,#4
	mov	r4,#0
loop11:ldr	r0,[sp,r2]
	ldr	r1,[sp,r3]
	cmp	r0,#0
	beq	Ret1
	cmp	r1,#0
	beq	Ret2
	ldr	lr,=m11
	bl	compare2	
m11:	cmp	r0,#1
	beq	m21
	bne	m31
m21:	ldr	r1,[sp,r3]
	str	r1,[r6,r4]
	add	r9,r9,#1
	add	r4,r4,#4
	add	r3,r3,#4
	b	loop11
m31:	cmp	r0,#-1
	beq	m41
	bne	m51
m41:	ldr	r1,[sp,r2]
	str	r1,[r6,r4]
	add	r9,r9,#1
	add	r4,r4,#4
	sub	r2,r2,#4
	b	loop11
m51:	ldr	r1,[sp,r2]
	str	r1,[r6,r4]
	add	r9,r9,#1
	add	r4,r4,#4
	ldr	r1,[sp,r3]
	str	r1,[r6,r4]
	add	r9,r9,#1
	add	r4,r4,#4
	add	r3,r3,#4
	sub	r2,r2,#4
	b	loop11
	


Ret1:
r1:	ldr	r0,[sp,r3]
	cmp	r0,#0
	beq	dup
	str	r0,[r6,r4]
	add	r9,r9,#1
	add	r4,r4,#4
	add	r3,r3,#4
	b	r1
Ret2:
r2:	ldr	r0,[sp,r2]
	cmp	r0,#0
	beq	dup
	str	r0,[r6,r4]
	add	r9,r9,#1
	add	r4,r4,#4
	sub	r2,r2,#4
	b	r2
	
dup:	
	mov	r0,#1
	ldr	r1,=output7
	swi	0x69
	mov	r0,#2
	ldr	r1,=lt
	mov	r2,#64
	swi	0x6a
	ldr	r0,[r1]
	cmp	r0,#'1
	beq	dup1
	bne	o2
dup1:	ldr	r5,=mergedlist
	ldr	r6,=mergedlistr 	
	mov	r2,#0
	mov	r3,#0
	mov	r4,#0
	mov	r8,#4
	mul	r9,r9,r8
dup2:	ldr	r1,[r5,r2]
	add	r8,r2,#4
	ldr	r0,[r5,r8]
	ldr	r7,=lt
	ldr	r7,[r7]
	cmp	r7,#'0
	beq	s1
	bne	s3
s1:	ldr	lr,=s2	
	b	compare1
s2:	cmp	r0,#0
	bne	o1
	beq	s5
s3:	ldr	lr,=s4
	b	compare2
s4:	cmp	r0,#0	
	bne	o1
	beq	s5
s5:	add	r2,r2,#4
	bl	dup2
o1:	str	r1,[r6,r3]
	add	r2,r2,#4
	add	r3,r3,#4	
	add	r4,r4,#1
	cmp	r2,r9
	blt	dup2
	
	mov	r0,#0
	ldr	r2,=mergedlistr
	mov	r3,#0
	mov	r9,r4
	mov	r4,#1
	ldr	r1,=output9
	swi	0x69
print2:ldr	r1,[r2,r3]
	swi	0x69
	ldr	r1,=output8
	swi	0x69
	add	r4,r4,#1
	add	r3,r3,#4
	cmp	r4,r9
	blt	print2
	ldr	r1,[r2,r3]
	swi	0x69
	ldr	r1,=output10
	swi	0x69
	ldr	r0,=mergedlistr
	mov	r1,r9
	swi	0x11
	
o2:	mov	r0,#0
	ldr	r2,=mergedlist
	mov	r3,#0
	mov	r4,#1
	ldr	r1,=output9
	swi	0x69
print1:ldr	r1,[r2,r3]
	swi	0x69
	ldr	r1,=output8
	swi	0x69
	add	r4,r4,#1
	add	r3,r3,#4
	cmp	r4,r9
	blt	print1
	ldr	r1,[r2,r3]
	swi	0x69
	ldr	r1,=output10
	swi	0x69
	ldr	r0,=mergedlist
	mov	r1,r9
	swi	0x11
	
	
	
	
	.data
lt:		.word 0,0
length1:	.word 0,0
length2:	.word 0,0
st1:		.space 100
list1:		.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
list2:		.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	
mergedlist:	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
mergedlistr:	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
output1:	.asciz "Please enter length of list 1 : \r\n"
output2:	.asciz "Please enter length of list 2 : \r\n"
output3:	.asciz "Please enter elements of list 1 : \r\n"
output4:	.asciz "Please enter elements of list 2 : \r\n"
output5:	.asciz "Element entries are completed see stack view \r\n"
output6:	.asciz " enter type of comparision( 0 - case sensitive ,1-case insensitive ) : \r\n"
output7:	.asciz " do we need to remove duplicates ? (type 1 for removing duplicates) \r\n"
output8:	.asciz ","
output9:	.asciz "["
output10:	.asciz "]"
