	.file	"app.c"
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC2:
	.ascii "Assembly : %f\12\0"
.LC3:
	.ascii "Memcpy : %f\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$96, %rsp
	.seh_stackalloc	96
	movaps	%xmm6, 80(%rsp)
	.seh_savexmm	%xmm6, 80
	.seh_endprologue
	call	__main
	movl	$1000000000, %ecx
	call	malloc
	movl	$1000000000, %ecx
	movq	%rax, %rbx
	movq	%rax, 32(%rsp)
	call	malloc
	movdqa	.LC0(%rip), %xmm0
	movb	$0, (%rbx)
	movq	%rax, 40(%rsp)
	movb	$0, (%rax)
	movl	$1, %eax
	movaps	%xmm0, 48(%rsp)
	movq	$0, 64(%rsp)
	movq	$0, 72(%rsp)
	.p2align 4,,10
	.p2align 3
.L2:
	movq	32(%rsp), %rdx
	movb	%al, (%rdx,%rax)
	movq	40(%rsp), %rdx
	movb	$0, (%rdx,%rax)
	addq	$1, %rax
	cmpq	$1000000000, %rax
	jne	.L2
	call	clock
	leaq	32(%rsp), %rcx
	movl	%eax, %ebx
	call	SomeFunction
	call	clock
	pxor	%xmm1, %xmm1
	movsd	.LC1(%rip), %xmm6
	leaq	.LC2(%rip), %rcx
	subl	%ebx, %eax
	cvtsi2sdl	%eax, %xmm1
	divsd	%xmm6, %xmm1
	movq	%xmm1, %rdx
	call	printf
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	movq	32(%rsp), %rdx
	movb	%al, (%rdx,%rax)
	movq	40(%rsp), %rdx
	movb	$0, (%rdx,%rax)
	addq	$1, %rax
	cmpq	$1000000000, %rax
	jne	.L3
	call	clock
	movq	32(%rsp), %rdx
	movl	$1000000000, %r8d
	movq	40(%rsp), %rcx
	movl	%eax, %ebx
	call	memcpy
	call	clock
	pxor	%xmm1, %xmm1
	leaq	.LC3(%rip), %rcx
	subl	%ebx, %eax
	cvtsi2sdl	%eax, %xmm1
	divsd	%xmm6, %xmm1
	movq	%xmm1, %rdx
	call	printf
	nop
	movaps	80(%rsp), %xmm6
	xorl	%eax, %eax
	addq	$96, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 16
.LC0:
	.quad	1000000000
	.quad	1000000000
	.align 8
.LC1:
	.long	0
	.long	1083129856
	.ident	"GCC: (x86_64-posix-seh-rev1, Built by MinGW-Builds project) 13.1.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	clock;	.scl	2;	.type	32;	.endef
	.def	SomeFunction;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	memcpy;	.scl	2;	.type	32;	.endef
