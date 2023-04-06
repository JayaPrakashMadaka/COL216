	.equ SWI_EXIT, 0x11
	.equ Stdout,1
	.equ SWI_PrStr,0x69
	.equ SWI_RdStr,0x6a
	.equ Stdin,2
	.text
	.extern	compare1,compare2,strlen,atoi,edit,div,copy,merge,CS,CIS
	.global	_start

_start:
	mov	r0,#1
	ldr	r1,=output1
	swi	0x69
	mov	r0,#2
	ldr	r1,=len
	mov	r2,#64
	swi	0x6a
	ldr	r0,=len		@Input for lenght of the list and then used atoi which is useful functions stored it in [sp,#0]
	ldr	lr,=x
	b	atoi
x:	str	r0,[sp,#0]
	mov	r0,#1
	ldr	r1,=output2
	swi	0x69
	mov	r4,#0
	mov	r6,#0
	ldr	r8,=store
	ldr	r9,=list
	ldr	r7,[sp,#0]
loop:	cmp	r6,r7
	beq	main
	mov	r0,#2
	mov	r1,r8			@Input List strings are stored in store their lengths are exactly edited to multiple of 4 
	mov	r2,#100		@ The string adresses are in list.
	swi	0x6a
	str	r8,[r9,r4]
	add	r4,r4,#4
	add	r6,r6,#1
	mov	r0,r8
	ldr	lr,=y
	b	strlen
y:	ldr	lr,=z
	b	edit
z:	add	r8,r8,r0
	b	loop
	
main:	ldr	r0,[sp,#0]
	cmp	r0,#1
	beq	out1
	
	mov	r0,#1
	ldr	r1,=output3
	swi	0x69
	mov	r0,#2
	ldr	r1,=cbit
	mov	r2,#64			@Input for cbit (comparision mode bit) The program diverts to required comparision mode
	swi	0x6a
	ldr	r0,=cbit
	ldr	lr,=l
	b	atoi
l:	str	r0,[sp,#-4]
	
	ldr	r4,=list		@The algorithm for merge sort starts here which is explained in report.
	mov	r5,#1
	mov	r7,#1
	mov	r2,#4
	ldr	r3,[sp,#0]
	mul	r3,r3,r2
	add	r9,r4,r3
	mul	r2,r5,r2
	add	r6,r4,r2
	
	mov	r8,r9
	
f:	cmp	r4,r8
	bne	m3
	mov	r8,r9
	mov	r1,#2
	mul	r5,r5,r1
	mul	r7,r7,r1
	mov	r1,#4
	mul	r1,r1,r5
	add	r6,r4,r1
		
m3:	sub	r1,r8,r6
	mov	r2,#4
	mul	r2,r5,r2
	cmp	r1,r2
	bge	case1
	cmp	r1,#0			@Based on the comparisions the program is diverted recursively in case1,case2,case3 as explained in Report
	ble	case2
	cmp	r1,r2
	blt	case3
	
case1:  mov	r0,r4
	mov	r1,r5
	mov	r2,r6
	mov	r3,r7
	ldr	lr,=m1
	b	merge
m1:	ldr	lr,=m2
	b	copy
m2:	ldr	r2,[sp,#0]		@First Case just mergeing two entries and copying them size(s) >= 2^(k+1)
	cmp	r1,r2
	bge	out
	add	r1,r5,r7
	mov	r2,#4
	mul	r2,r2,r1
	add	r4,r4,r2
	add	r6,r6,r2
	b	f
	
case2:
	sub	r0,r8,r4
	mov	r1,#4
	ldr	lr,=m4
	b	div
m4:	mov	r1,r3
	mov	r0,r4
	ldr	lr,=m5
	b	copy			@Second case copying the left out entry whose size is less than or equal to 2^k where k is number of recursive calls
m5:	mov	r4,r8
	mov	r8,r9
	add	r1,r5,r7
	mov	r2,#4
	mul	r2,r2,r1
	add	r6,r4,r2
	mov	r2,#2
	mul	r5,r5,r2
	mul	r7,r7,r2
	b	f
	
case3:
	sub	r2,r8,r6
	mov	r0,r2
	mov	r1,#4
	ldr	lr,=m6
	b	div
m6:	mov	r0,r4
	mov	r1,r5
	mov	r2,r6
	ldr	lr,=m7
	b	merge
m7:	ldr	lr,=m8
	b	copy			@Merging and copying of left out entry whose size is 2^k < s < 2^(k+1) where k is number of recursive class
m8:	ldr	r2,[sp,#0]
	cmp	r1,r2
	bge	out
	mov	r4,r8
	mov	r8,r9
	add	r1,r5,r5
	mov	r2,#4
	mul	r2,r2,r1
	add	r6,r4,r2
	mov	r2,#2
	mul	r5,r5,r2
	mul	r7,r7,r2
	b	f
	
	
out:	
	ldr	r3,[sp,#0]
	mov	r0,#1
	ldr	r1,=output4
	swi	0x69
	mov	r0,#2
	ldr	r1,=dbit
	mov	r2,#64
	swi	0x6a
	ldr	r1,[r1,#0]
	cmp	r1,#'0					@ Duplicate removal option recovered list will be in listd.
	beq	print
	mov	r6,#0
	mov	r9,#4
	mov	r5,#0
	mov	r3,#0
	ldr	r7,=listd
	ldr	r4,[sp,#0]
	mov	r2,#4
	mul	r4,r4,r2
d:	cmp	r6,r4
	beq	exi
	ldr	r0,[r8,r6]
	ldr	r1,[r8,r9]
	ldr	r2,[sp,#-4]
	cmp	r2,#0
	beq	cs
	bne	cis
cs:	ldr	lr,=h1
	b	compare1
h1:	cmp	r0,#0
	beq	h2
	ldr	r0,[r8,r6]
	str	r0,[r7,r5]
	add	r6,r6,#4				@Comparision Mode for duplicate removal option
	add	r5,r5,#4
	add	r9,r9,#4
	add	r3,r3,#1
	b	d
h2:	add	r6,r6,#4
	add	r9,r9,#4
	b	d
cis:	ldr	lr,=h11
	b	compare2
h11:	cmp	r0,#0
	beq	h21
	ldr	r0,[r8,r6]
	str	r0,[r7,r5]
	add	r6,r6,#4
	add	r5,r5,#4
	add	r9,r9,#4
	add	r3,r3,#1
	b	d
h21:	add	r6,r6,#4
	add	r9,r9,#4
	b	d

exi:
	ldr	r8,=listd
	b	print	
	
	
	
print:
	mov	r7,r3
	mov	r0,#1
	mov	r2,#4
	sub	r7,r7,#1
	mul	r7,r7,r2
	mov	r2,#0
	ldr	r1,=output6
	swi	0x69
p:	cmp	r2,r7					@Code part for printing list in stdout
	beq	o1
	ldr	r1,[r8,r2]
	swi	0x69
	ldr	r1,=output5
	swi	0x69
	add	r2,r2,#4
	b	p
o1:
	ldr	r1,[r8,r2]
	swi	0x69
	ldr	r1,=output7
	swi	0x69
	swi	0x11
	
	
	
	

out1:
	ldr	r3,=list
	mov	r0,#1
	ldr	r1,=output6				@Printing base case if n=1 to stdout
	swi	0x69
	ldr	r1,[r3,#0]
	swi	0x69
	ldr	r1,=output7
	swi	0x69
	swi	0x11
	
	.data
len:		.word 0,0
store:		.space 1000
list:		.space 1000
listd:		.space 100
cbit:		.word 0,0
dbit:		.word 0,0
output1:	.asciz "Please enter the length of string : \r\n"
output2:	.asciz "Please enter the elements in the string : \r\n"
output3:	.asciz "Type of comparision (0 for case sensitive 1 for insensitive): \r\n"
output4:	.asciz "Do you want to remove duplicates(0 for No 1 for Yes): \r\n"
output5:	.asciz ","
output6:	.asciz "["
output7:	.asciz "]"

.end
