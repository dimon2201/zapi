	.file	"test.c"
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "%s\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	32(%rsp), %rbp
	.seh_setframe	%rbp, 32
	.seh_endprologue
	call	__main
	movl	$1000000000, %ecx
	call	malloc
	movl	$1000000000, %ecx
	movq	%rax, %rsi
	call	malloc
	movq	%rsi, %rdx
	movl	$1000000000, %r8d
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rbx
	movq	%rax, %rcx
	call	memcpy
	leaq	1000000000(%rbx), %rdi
	.p2align 4,,10
	.p2align 3
.L2:
	movsbl	(%rbx), %edx
	movq	%rsi, %rcx
	addq	$1, %rbx
	call	printf
	cmpq	%rdi, %rbx
	jne	.L2
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-posix-seh-rev1, Built by MinGW-Builds project) 13.1.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	memcpy;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
