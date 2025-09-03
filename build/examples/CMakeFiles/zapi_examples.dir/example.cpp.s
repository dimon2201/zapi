	.file	"example.cpp"
	.text
	.section	.text$_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0,"x"
	.align 2
	.p2align 4
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0:
.LFB2603:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%r8, %rbx
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	subq	%rdx, %rbx
	cmpq	$15, %rbx
	movq	%rbx, 40(%rsp)
	ja	.L10
	movq	(%rcx), %rdx
	cmpq	$1, %rbx
	movq	%rdx, %rcx
	jne	.L4
	movzbl	(%rdi), %eax
	movb	%al, (%rdx)
	movq	(%rsi), %rdx
.L5:
	movq	40(%rsp), %rax
	movq	%rax, 8(%rsi)
	movb	$0, (%rdx,%rax)
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L4:
	testq	%rbx, %rbx
	je	.L5
	jmp	.L3
.L10:
	leaq	40(%rsp), %rdx
	xorl	%r8d, %r8d
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	%rax, %rcx
	movq	%rax, (%rsi)
	movq	40(%rsp), %rax
	movq	%rax, 16(%rsi)
.L3:
	movq	%rdi, %rdx
	movq	%rbx, %r8
	call	memcpy
	movq	(%rsi), %rdx
	jmp	.L5
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "C:/DDD/zapi/data/enwik8\0"
.LC1:
	.ascii "C:/DDD/zapi/data/enwik8_out\0"
.LC2:
	.ascii "pause\0"
	.section	.text.startup.main,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB2214:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$2104, %rsp
	.seh_stackalloc	2104
	.seh_endprologue
	call	__main
	leaq	1104(%rsp), %rbx
	leaq	23+.LC0(%rip), %r8
	movq	%rbx, %rcx
	leaq	1120(%rsp), %rax
	leaq	-23(%r8), %rdx
	movq	%rax, 1104(%rsp)
.LEHB0:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0
.LEHE0:
	leaq	112(%rsp), %rbp
	movq	%rbx, %rdx
	movq	%rbp, %rcx
.LEHB1:
	call	_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.LEHE1:
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	1080(%rsp), %rcx
	xorl	%edx, %edx
.LEHB2:
	call	_ZN4zapi7storage8AllocateEyj
	movq	1080(%rsp), %r9
	movq	%rax, %rsi
	movl	$0, 48(%rsp)
	movq	1088(%rsp), %rdx
	leaq	71(%rsp), %r12
	movq	%rsi, %r8
	movq	$0, 72(%rsp)
	leaq	72(%rsp), %rax
	movq	%r12, %rcx
	movq	%rax, 32(%rsp)
	movq	%r9, 40(%rsp)
	call	_ZN4zapi5codec10ZapEncoderC1EPKvPvyRyyNS1_5CodecE
.LEHE2:
	leaq	80(%rsp), %rdi
	movq	72(%rsp), %r13
	leaq	27+.LC1(%rip), %r8
	movq	%rdi, %rcx
	leaq	96(%rsp), %rax
	leaq	-27(%r8), %rdx
	movq	%rax, 80(%rsp)
.LEHB3:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0
.LEHE3:
	movq	%r13, %r9
	movq	%rsi, %r8
	movq	%rdi, %rdx
	movq	%rbx, %rcx
.LEHB4:
	call	_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy
.LEHE4:
	movq	%rdi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	leaq	.LC2(%rip), %rcx
.LEHB5:
	call	system
.LEHE5:
	movq	%rbx, %rcx
	call	_ZN4zapi2io4FileD1Ev
	movq	%r12, %rcx
	call	_ZN4zapi5codec10ZapEncoderD1Ev
	movq	%rbp, %rcx
	call	_ZN4zapi2io4FileD1Ev
	xorl	%eax, %eax
	addq	$2104, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L17:
	movq	%rax, %rsi
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rsi, %rcx
.LEHB6:
	call	_Unwind_Resume
.L21:
	movq	%rax, %rsi
	movq	%rbx, %rcx
	call	_ZN4zapi2io4FileD1Ev
	movq	%rsi, %rbx
	jmp	.L14
.L19:
	movq	%rdi, %rcx
	movq	%rax, %rbx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L14:
	movq	%r12, %rcx
	call	_ZN4zapi5codec10ZapEncoderD1Ev
.L16:
	movq	%rbp, %rcx
	call	_ZN4zapi2io4FileD1Ev
	movq	%rbx, %rcx
	call	_Unwind_Resume
.LEHE6:
.L20:
	movq	%rax, %rbx
	jmp	.L14
.L18:
	movq	%rax, %rbx
	jmp	.L16
	.def	__gxx_personality_seh0;	.scl	2;	.type	32;	.endef
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA2214:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2214-.LLSDACSB2214
.LLSDACSB2214:
	.uleb128 .LEHB0-.LFB2214
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB2214
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L17-.LFB2214
	.uleb128 0
	.uleb128 .LEHB2-.LFB2214
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L18-.LFB2214
	.uleb128 0
	.uleb128 .LEHB3-.LFB2214
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L20-.LFB2214
	.uleb128 0
	.uleb128 .LEHB4-.LFB2214
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L19-.LFB2214
	.uleb128 0
	.uleb128 .LEHB5-.LFB2214
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L21-.LFB2214
	.uleb128 0
	.uleb128 .LEHB6-.LFB2214
	.uleb128 .LEHE6-.LEHB6
	.uleb128 0
	.uleb128 0
.LLSDACSE2214:
	.section	.text.startup.main,"x"
	.seh_endproc
	.ident	"GCC: (x86_64-posix-seh-rev1, Built by MinGW-Builds project) 13.1.0"
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy;	.scl	2;	.type	32;	.endef
	.def	memcpy;	.scl	2;	.type	32;	.endef
	.def	_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv;	.scl	2;	.type	32;	.endef
	.def	_ZN4zapi7storage8AllocateEyj;	.scl	2;	.type	32;	.endef
	.def	_ZN4zapi5codec10ZapEncoderC1EPKvPvyRyyNS1_5CodecE;	.scl	2;	.type	32;	.endef
	.def	_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy;	.scl	2;	.type	32;	.endef
	.def	system;	.scl	2;	.type	32;	.endef
	.def	_ZN4zapi2io4FileD1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZN4zapi5codec10ZapEncoderD1Ev;	.scl	2;	.type	32;	.endef
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
