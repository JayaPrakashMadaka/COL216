	.equ SWI_EXIT, 0x11
	.equ Stdout,1
	.equ SWI_PrStr,0x69
	.text
	.global _start
	.equ SWI_RdStr,0x6a
	.equ Stdin,2
_start:	
	mov	r0,#1
	ldr	r1,=input1		@Prompting the user for input 1
	swi	0x69
	mov	r0,#2			@Storing input 1 in String 1 of data part
	ldr	r1,=String1
	mov	r2,#100
	swi	0x6a
	
	mov	r0,#1
	ldr	r1,=input2		@Prompting the user for input 2
	swi	0x69
	mov	r0,#2
	ldr	r1,=String2		@Storing input 2 in String 2 of data part
	mov	r2,#100
	swi	0x6a
	
	mov	r0,#1
	ldr	r1,=input3		@Prompting the user for input 2
	swi	0x69
	mov	r0,#2
	ldr	r1,=String3		@Storing input 2 in String 2 of data part
	mov	r2,#100
	swi	0x6a
	
	ldr	r0,[r1,#0]		@ if given input is 0 case sensiive comparision takes if it is 1 case insensitive comparision proceeds
	cmp	r0,#'0
	bne	main2			@branch for case insensitive
	beq	main1			@branch for case sensitive

@case sensitive comparision of given strings

main1:
	ldr	r0,=String1
	ldr	lr,=mov1
	bl	strlen
	
mov1:	mov	r4,r0			@computing the string length of string1 and storing in r4
	ldr	r0,=String2
	ldr	lr,=mov2
	bl strlen
	
mov2:	mov	r5,r0			@computing the string length of string2 and storing in r5
	
	cmp	r4,r5
	movle	r8,r4			@The minimum of these are stored in r8
	movgt	r8,r5
	
	ldr	r2,=String1		@r2 and r3 points to the adress of strings which are stored
	ldr	r3,=String2
	mov	r1,#0			@r1 is the pointer to bytes

A:	cmp	r1,r8
	beq	step	
	ldrb	r6,[r2,r1]		@storing bytes in r6 and r7 and comparing
	ldrb	r7,[r3,r1]
	cmp	r6,r7
	blt	FC1			@if 1 char ascii value is less than 2 char ascii value goes to print output
	bgt	FC2			@if 2 char ascii value is less than 1 char ascii value goes to print output
	add	r1,r1,#1
	beq	A			@if the chars are equal incrementing r1 and going back to loop to check further

@ comparing strings in case insensitive manner
	
main2:
	mov	r2,#'A
	mov	r3,#'a
	sub	r9,r2,r3		@r9 stores the values of A-a ascii values ie(32)

	ldr	r0,=String1
	ldr	lr,=mov11
	bl	strlen
	
mov11:	mov	r4,r0
	
	ldr	r0,=String2		@computing the string length of string1 and storing in r4
	ldr	lr,=mov21
	bl	strlen
	
mov21:	mov	r5,r0			@computing the string length of string2 and storing in r5
	
	cmp	r4,r5
	movle	r8,r4
	movgt	r8,r5			@The minimum of these are stored in r8
	
	ldr	r2,=String1		@r2 and r3 points to the adress of strings which are stored
	ldr	r3,=String2
	mov	r1,#0			@r1 is the pointer to bytes

A1:	cmp	r1,r8
	beq	step	
	ldrb	r6,[r2,r1]
	ldrb	r7,[r3,r1]
	sub	r0,r6,r7
	cmp	r0,r9
	beq	go
	sub	r0,r7,r6
	cmp	r0,r9
	beq	go			@if the ascii difference is 32 or -32 it considers as aqual (A-a) or (a-A) 
	cmp	r6,r7
	blt	FC1			@if 1 char ascii value is less than 2 char ascii value goes to print output
	bgt	FC2			@if 2 char ascii value is less than 1 char ascii value goes to print output
	beq	go
go:	add	r1,r1,#1
	bl	A1			@if the chars are equal incrementing r1 and going back to loop to check further

	
step:	cmp	r4,r5
	beq	True			@if all chars compared are same and also strings lengths are equal it goes ti True
	blt	FC1			
	bgt	FC2			@if all chars compared are equal but lengths are different goes to particular false output
	
True:
	mov	r0,#1
	ldr	r1,=T1			@output when both are same strings
	swi	0x69
	swi	0x11

	
FC1:	
	mov	r0,#1
	ldr	r1,=F1			@output when string 1 is less than string 2
	swi	0x69
	swi	0x11
	
FC2:
	mov	r0,#1
	ldr	r1,=F2			@output when string 2 is less than string 1
	swi	0x69
	swi	0x11
	
strlen:
	mov	r1, #0
	mov	r3, r0
1:	ldrb	r2, [r3], #1
	cmp	r2, #0			@Helper function to get length of string taken from Usefulfunctions.s which was shared on moodle
	bne	1b
	sub	r0, r3, r0
	mov	pc,lr	

@Corresponding data part used for the program
	
	.data

String1:	.space	100
String2:	.space  100
String3:	.space  100

T1:		.asciz  "Both are Same Strings \r\n"

F1:		.asciz  "String 1 is less than String 2 \r\n "

F2:		.asciz  "String 1 is greater than String 2 \r\n"

input1:	.asciz	"Please enter String 1 :  \r\n"
input2:	.asciz  "Please enter String 2:   \r\n"
input3:	.asciz  "Please enter 0 for case-sensitive comparision 1 for case-insensitive comparision : \r\n"
