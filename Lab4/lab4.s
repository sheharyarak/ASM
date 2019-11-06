#defining constants
.equ		WRITE, 1
.equ		READ, 0
.equ		STDOUT, 1
.equ		STDIN,	0
.equ		EXIT, 60
.equ		localSize, 64
.equ		num1, -8
.equ		num2, -16
.equ		num1str, -32
.equ		num2str, -48
.equ		name, -64

.section .rodata
GET_NAME:
	.string "Please enter your name: "
	.equ GET_NAMESz,.-GET_NAME-1
ERROR_NAME:
	.string "Please enter alphabets only: "
	.equ	ERROR_NAMESz,.-ERROR_NAME-1
GREETING:
	.string "Hello "
	.equ	GREETINGSz,.-GREETING-1
EXCLAMATION_MARK:
	.string "! "
	.equ	EXCLAMATION_MARKSz,.-EXCLAMATION_MARK-1
.text
.globl	_start
_start:
	pushq		%rbp
	movq		%rsp,					%rbp
	subq		$localSize, 			%rsp
#Asking for the user's name 
	movq		$STDOUT, 			%rdi
	movq		$GET_NAME,		%rsi
	movq		$GET_NAMESz,	%rdx
	movq		$WRITE,				%rax
	syscall
#Reading the name entered by the user
	movq		$STDIN,				%rdi
	leaq			name(%rbp),		%rsi
	movq		$10,						%rdx
	movq		$READ,				%rax
	syscall
#Writing back the name user entered to the console
	movq		$STDOUT, 			%rdi
	leaq			name(%rbp),		%rsi
	movq		%rax,					%rdx
	movq		$WRITE,				%rax
	syscall
#Epilogue
	movq		%rbp,					%rsp
	popq		%rbp
	movq		$EXIT,					%rax
	syscall
		
