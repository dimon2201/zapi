	.file	"zapi.cpp"
	.text
	.section	.text$_ZNKSt5ctypeIcE8do_widenEc,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt5ctypeIcE8do_widenEc
	.def	_ZNKSt5ctypeIcE8do_widenEc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt5ctypeIcE8do_widenEc
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1566:
	.seh_endprologue
	movl	%edx, %eax
	ret
	.seh_endproc
	.section	.text$_ZN4zapi7storage8AllocateEyj,"x"
	.p2align 4
	.globl	_ZN4zapi7storage8AllocateEyj
	.def	_ZN4zapi7storage8AllocateEyj;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN4zapi7storage8AllocateEyj
_ZN4zapi7storage8AllocateEyj:
.LFB2214:
	.seh_endprologue
	testq	%rcx, %rcx
	je	.L4
	jmp	malloc
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%eax, %eax
	ret
	.seh_endproc
	.section	.text$_ZN4zapi7storage10DeallocateEPv,"x"
	.p2align 4
	.globl	_ZN4zapi7storage10DeallocateEPv
	.def	_ZN4zapi7storage10DeallocateEPv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN4zapi7storage10DeallocateEPv
_ZN4zapi7storage10DeallocateEPv:
.LFB2215:
	.seh_endprologue
	testq	%rcx, %rcx
	je	.L5
	jmp	free
	.p2align 4,,10
	.p2align 3
.L5:
	ret
	.seh_endproc
	.section	.text$_ZN4zapi2io4FileD2Ev,"x"
	.align 2
	.p2align 4
	.globl	_ZN4zapi2io4FileD2Ev
	.def	_ZN4zapi2io4FileD2Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN4zapi2io4FileD2Ev
_ZN4zapi2io4FileD2Ev:
.LFB2223:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	movaps	%xmm6, 32(%rsp)
	.seh_savexmm	%xmm6, 32
	.seh_endprologue
	movq	.refptr._ZTVSt13basic_filebufIcSt11char_traitsIcEE(%rip), %rbp
	movq	.refptr._ZTVSt14basic_ofstreamIcSt11char_traitsIcEE(%rip), %rsi
	leaq	16(%rbp), %rax
	leaq	24(%rsi), %rdi
	movq	%rax, %xmm0
	movq	%rcx, %rbx
	movq	976(%rcx), %rcx
	movq	%rdi, %xmm6
	punpcklqdq	%xmm0, %xmm6
	testq	%rcx, %rcx
	je	.L8
	call	free
.L8:
	addq	$64, %rsi
	movups	%xmm6, 488(%rbx)
	movq	%rsi, 704(%rbx)
	leaq	496(%rbx), %rcx
.LEHB0:
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv
.LEHE0:
.L11:
	leaq	568(%rbx), %rcx
	addq	$16, %rbp
	call	_ZNSt12__basic_fileIcED1Ev
	movq	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rsi
	leaq	552(%rbx), %rcx
	leaq	16(%rsi), %rax
	movq	%rax, 496(%rbx)
	call	_ZNSt6localeD1Ev
	movq	.refptr._ZTTSt14basic_ofstreamIcSt11char_traitsIcEE(%rip), %rax
	leaq	704(%rbx), %rcx
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rdi
	movq	8(%rax), %rdx
	movq	16(%rax), %rax
	movq	%rdx, 488(%rbx)
	movq	-24(%rdx), %rdx
	movq	%rax, 488(%rbx,%rdx)
	leaq	16(%rdi), %rax
	movq	%rax, 704(%rbx)
	call	_ZNSt8ios_baseD2Ev
	movq	.refptr._ZTVSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rax
	movq	%rbp, 16(%rbx)
	leaq	16(%rbx), %rcx
	leaq	24(%rax), %rdx
	addq	$64, %rax
	movq	%rdx, (%rbx)
	movq	%rax, 224(%rbx)
.LEHB1:
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv
.LEHE1:
.L9:
	leaq	88(%rbx), %rcx
	addq	$16, %rsi
	addq	$16, %rdi
	call	_ZNSt12__basic_fileIcED1Ev
	leaq	72(%rbx), %rcx
	movq	%rsi, 16(%rbx)
	call	_ZNSt6localeD1Ev
	movq	.refptr._ZTTSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rax
	leaq	224(%rbx), %rcx
	movq	8(%rax), %rdx
	movq	16(%rax), %rax
	movq	%rdx, (%rbx)
	movq	-24(%rdx), %rdx
	movq	%rax, (%rbx,%rdx)
	movq	$0, 8(%rbx)
	movq	%rdi, 224(%rbx)
	movaps	32(%rsp), %xmm6
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	_ZNSt8ios_baseD2Ev
.L13:
	movq	%rax, %rcx
	call	__cxa_begin_catch
	call	__cxa_end_catch
	jmp	.L11
.L14:
	movq	%rax, %rcx
	call	__cxa_begin_catch
	call	__cxa_end_catch
	jmp	.L9
	.def	__gxx_personality_seh0;	.scl	2;	.type	32;	.endef
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
	.align 4
.LLSDA2223:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT2223-.LLSDATTD2223
.LLSDATTD2223:
	.byte	0x1
	.uleb128 .LLSDACSE2223-.LLSDACSB2223
.LLSDACSB2223:
	.uleb128 .LEHB0-.LFB2223
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L13-.LFB2223
	.uleb128 0x1
	.uleb128 .LEHB1-.LFB2223
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L14-.LFB2223
	.uleb128 0x1
.LLSDACSE2223:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT2223:
	.section	.text$_ZN4zapi2io4FileD2Ev,"x"
	.seh_endproc
	.globl	_ZN4zapi2io4FileD1Ev
	.def	_ZN4zapi2io4FileD1Ev;	.scl	2;	.type	32;	.endef
	.set	_ZN4zapi2io4FileD1Ev,_ZN4zapi2io4FileD2Ev
	.section	.text$_ZN4zapi5codec10ZapEncoderD2Ev,"x"
	.align 2
	.p2align 4
	.globl	_ZN4zapi5codec10ZapEncoderD2Ev
	.def	_ZN4zapi5codec10ZapEncoderD2Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN4zapi5codec10ZapEncoderD2Ev
_ZN4zapi5codec10ZapEncoderD2Ev:
.LFB2229:
	.seh_endprologue
	ret
	.seh_endproc
	.globl	_ZN4zapi5codec10ZapEncoderD1Ev
	.def	_ZN4zapi5codec10ZapEncoderD1Ev;	.scl	2;	.type	32;	.endef
	.set	_ZN4zapi5codec10ZapEncoderD1Ev,_ZN4zapi5codec10ZapEncoderD2Ev
	.section .rdata,"dr"
.LC0:
	.ascii " ms\0"
	.section	.text$_ZN4zapi5codec10ZapEncoder6EncodeEPKvPvyRyyNS1_5CodecE,"x"
	.align 2
	.p2align 4
	.globl	_ZN4zapi5codec10ZapEncoder6EncodeEPKvPvyRyyNS1_5CodecE
	.def	_ZN4zapi5codec10ZapEncoder6EncodeEPKvPvyRyyNS1_5CodecE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN4zapi5codec10ZapEncoder6EncodeEPKvPvyRyyNS1_5CodecE
_ZN4zapi5codec10ZapEncoder6EncodeEPKvPvyRyyNS1_5CodecE:
.LFB2231:
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
	.seh_endprologue
	movq	%r9, %rbx
	movq	%rdx, %rsi
	movq	%r8, %rdi
	call	_ZNSt6chrono3_V212system_clock3nowEv
	testq	%rbx, %rbx
	movq	%rax, %rbp
	je	.L27
	leaq	-1(%rbx), %rdx
	cmpq	$6, %rdx
	jbe	.L35
	leaq	1(%rsi), %rax
	movq	%rdi, %rcx
	subq	%rax, %rcx
	xorl	%eax, %eax
	cmpq	$14, %rcx
	ja	.L45
	.p2align 4,,10
	.p2align 3
.L31:
	movzbl	(%rsi,%rax), %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpq	%rax, %rbx
	jne	.L31
.L27:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	pxor	%xmm1, %xmm1
	movabsq	$4835703278458516699, %rdx
	subq	%rbp, %rax
	movq	%rax, %rcx
	imulq	%rdx
	sarq	$63, %rcx
	sarq	$18, %rdx
	subq	%rcx, %rdx
	movq	.refptr._ZSt4cout(%rip), %rcx
	cvtsi2sdq	%rdx, %xmm1
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$3, %r8d
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rsi
	movq	%rax, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	(%rsi), %rax
	movq	-24(%rax), %rax
	movq	240(%rsi,%rax), %rdi
	testq	%rdi, %rdi
	je	.L46
	cmpb	$0, 56(%rdi)
	je	.L33
	movsbl	67(%rdi), %edx
.L34:
	movq	%rsi, %rcx
	call	_ZNSo3putEc
	movq	%rax, %rcx
	call	_ZNSo5flushEv
	movq	112(%rsp), %rax
	movq	%rbx, (%rax)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L45:
	cmpq	$14, %rdx
	jbe	.L37
	movq	%rbx, %rdx
	andq	$-16, %rdx
	.p2align 4,,10
	.p2align 3
.L25:
	movdqu	(%rsi,%rax), %xmm0
	movups	%xmm0, (%rdi,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L25
	cmpq	%rdx, %rbx
	je	.L27
	movq	%rbx, %rax
	subq	%rdx, %rax
	leaq	-1(%rax), %rcx
	cmpq	$6, %rcx
	jbe	.L29
.L24:
	movq	(%rsi,%rdx), %rcx
	movq	%rcx, (%rdi,%rdx)
	movq	%rax, %rcx
	andq	$-8, %rcx
	addq	%rcx, %rdx
	testb	$7, %al
	je	.L27
.L29:
	movzbl	(%rsi,%rdx), %eax
	movb	%al, (%rdi,%rdx)
	leaq	1(%rdx), %rax
	cmpq	%rbx, %rax
	jnb	.L27
	movzbl	1(%rsi,%rdx), %eax
	movb	%al, 1(%rdi,%rdx)
	leaq	2(%rdx), %rax
	cmpq	%rbx, %rax
	jnb	.L27
	movzbl	2(%rsi,%rdx), %eax
	movb	%al, 2(%rdi,%rdx)
	leaq	3(%rdx), %rax
	cmpq	%rbx, %rax
	jnb	.L27
	movzbl	3(%rsi,%rdx), %eax
	movb	%al, 3(%rdi,%rdx)
	leaq	4(%rdx), %rax
	cmpq	%rbx, %rax
	jnb	.L27
	movzbl	4(%rsi,%rdx), %eax
	movb	%al, 4(%rdi,%rdx)
	leaq	5(%rdx), %rax
	cmpq	%rbx, %rax
	jnb	.L27
	movzbl	5(%rsi,%rdx), %eax
	movb	%al, 5(%rdi,%rdx)
	leaq	6(%rdx), %rax
	cmpq	%rbx, %rax
	jnb	.L27
	movzbl	6(%rsi,%rdx), %eax
	movb	%al, 6(%rdi,%rdx)
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L33:
	movq	%rdi, %rcx
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rdi), %rax
	movl	$10, %edx
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rcx
	movq	48(%rax), %rax
	cmpq	%rcx, %rax
	je	.L34
	movq	%rdi, %rcx
	call	*%rax
	movsbl	%al, %edx
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L35:
	xorl	%eax, %eax
	movzbl	(%rsi,%rax), %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpq	%rax, %rbx
	jne	.L31
	jmp	.L27
.L37:
	movq	%rbx, %rax
	xorl	%edx, %edx
	jmp	.L24
.L46:
	call	_ZSt16__throw_bad_castv
	nop
	.seh_endproc
	.section	.text$_ZN4zapi5codec10ZapEncoderC2EPKvPvyRyyNS1_5CodecE,"x"
	.align 2
	.p2align 4
	.globl	_ZN4zapi5codec10ZapEncoderC2EPKvPvyRyyNS1_5CodecE
	.def	_ZN4zapi5codec10ZapEncoderC2EPKvPvyRyyNS1_5CodecE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN4zapi5codec10ZapEncoderC2EPKvPvyRyyNS1_5CodecE
_ZN4zapi5codec10ZapEncoderC2EPKvPvyRyyNS1_5CodecE:
.LFB2226:
	.seh_endprologue
	jmp	_ZN4zapi5codec10ZapEncoder6EncodeEPKvPvyRyyNS1_5CodecE
	.seh_endproc
	.globl	_ZN4zapi5codec10ZapEncoderC1EPKvPvyRyyNS1_5CodecE
	.def	_ZN4zapi5codec10ZapEncoderC1EPKvPvyRyyNS1_5CodecE;	.scl	2;	.type	32;	.endef
	.set	_ZN4zapi5codec10ZapEncoderC1EPKvPvyRyyNS1_5CodecE,_ZN4zapi5codec10ZapEncoderC2EPKvPvyRyyNS1_5CodecE
	.section	.text$_ZN4zapi2io4FileC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,"x"
	.align 2
	.p2align 4
	.globl	_ZN4zapi2io4FileC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.def	_ZN4zapi2io4FileC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN4zapi2io4FileC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
_ZN4zapi2io4FileC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB2217:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
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
	subq	$584, %rsp
	.seh_stackalloc	584
	.seh_endprologue
	leaq	224(%rcx), %rbp
	movq	%rcx, %rbx
	movq	%rdx, 664(%rsp)
	movq	%rbp, %rcx
	call	_ZNSt8ios_baseC2Ev
	xorl	%r10d, %r10d
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	xorl	%edx, %edx
	movw	%r10w, 448(%rbx)
	pxor	%xmm0, %xmm0
	movups	%xmm0, 456(%rbx)
	movups	%xmm0, 472(%rbx)
	movq	$0, 440(%rbx)
	addq	$16, %rax
	movq	%rax, 224(%rbx)
	movq	.refptr._ZTTSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rax
	movq	8(%rax), %rsi
	movq	16(%rax), %r13
	movq	-24(%rsi), %rax
	movq	%rsi, (%rbx)
	movq	%r13, (%rbx,%rax)
	movq	$0, 8(%rbx)
	movq	-24(%rsi), %rcx
	addq	%rbx, %rcx
.LEHB2:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE2:
	movq	.refptr._ZTVSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rdi
	leaq	24(%rdi), %rax
	movq	%rax, (%rbx)
	leaq	64(%rdi), %rax
	movq	%rax, 224(%rbx)
	leaq	16(%rbx), %rax
	movq	%rax, %rcx
	movq	%rax, %r14
	movq	%rax, 40(%rsp)
.LEHB3:
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEEC1Ev
.LEHE3:
	movq	%r14, %rdx
	movq	%rbp, %rcx
.LEHB4:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE4:
	leaq	704(%rbx), %r12
	leaq	488(%rbx), %r14
	movq	%r12, %rcx
	movq	%r14, 56(%rsp)
	call	_ZNSt8ios_baseC2Ev
	xorl	%r8d, %r8d
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	xorl	%edx, %edx
	movw	%r8w, 928(%rbx)
	pxor	%xmm0, %xmm0
	movups	%xmm0, 936(%rbx)
	movups	%xmm0, 952(%rbx)
	movq	$0, 920(%rbx)
	addq	$16, %rax
	movq	%rax, 704(%rbx)
	movq	.refptr._ZTTSt14basic_ofstreamIcSt11char_traitsIcEE(%rip), %rax
	movq	8(%rax), %rbp
	movq	-24(%rbp), %rcx
	movq	%rbp, 488(%rbx)
	addq	%r14, %rcx
	movq	16(%rax), %r14
	movq	%r14, (%rcx)
.LEHB5:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE5:
	movq	.refptr._ZTVSt14basic_ofstreamIcSt11char_traitsIcEE(%rip), %rax
	leaq	496(%rbx), %r15
	movq	%r15, %rcx
	leaq	24(%rax), %rdx
	addq	$64, %rax
	movq	%rdx, 488(%rbx)
	movq	%rax, 704(%rbx)
.LEHB6:
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEEC1Ev
.LEHE6:
	movq	%r15, %rdx
	movq	%r12, %rcx
.LEHB7:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE7:
	movq	$0, 968(%rbx)
	leaq	304(%rsp), %r15
	movq	%r15, 48(%rsp)
	leaq	80(%rsp), %r14
	movq	%r15, %rcx
	movq	$0, 976(%rbx)
	call	_ZNSt8ios_baseC2Ev
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	movw	%cx, 528(%rsp)
	pxor	%xmm0, %xmm0
	movups	%xmm0, 536(%rsp)
	movups	%xmm0, 552(%rsp)
	addq	$16, %rax
	movq	%rsi, 80(%rsp)
	movq	%rax, 304(%rsp)
	movq	-24(%rsi), %rax
	movq	$0, 520(%rsp)
	movq	%r13, 80(%rsp,%rax)
	movq	$0, 88(%rsp)
	movq	-24(%rsi), %rcx
	addq	%r14, %rcx
.LEHB8:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE8:
	leaq	24(%rdi), %rax
	leaq	96(%rsp), %rbp
	movq	%rax, 80(%rsp)
	leaq	64(%rdi), %rax
	movq	%rbp, %rcx
	movq	%rax, 304(%rsp)
.LEHB9:
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEEC1Ev
.LEHE9:
	movq	%rbp, %rdx
	movq	%r15, %rcx
.LEHB10:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
	movq	664(%rsp), %rax
	movl	$12, %r8d
	movq	%rbp, %rcx
	movq	(%rax), %rdx
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode
	movq	80(%rsp), %rdx
	movq	-24(%rdx), %rcx
	addq	%r14, %rcx
	testq	%rax, %rax
	je	.L89
	xorl	%edx, %edx
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE10:
.L59:
	movq	(%rbx), %rax
	movq	-24(%rax), %r12
	movq	80(%rsp), %rax
	addq	%rbx, %r12
	movq	-24(%rax), %r15
	movq	%r12, %rcx
	addq	%r14, %r15
	movq	%r15, %rdx
	call	_ZNSt8ios_base7_M_swapERS_
	leaq	208(%r12), %rdx
	movq	%r12, %rcx
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE15_M_cache_localeERKSt6locale
	leaq	208(%r15), %rdx
	movq	%r15, %rcx
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE15_M_cache_localeERKSt6locale
	movq	216(%r12), %rdx
	movq	216(%r15), %rcx
	movq	%rdx, 216(%r15)
	movzbl	224(%r12), %edx
	movq	%rcx, 216(%r12)
	movzbl	224(%r15), %ecx
	movb	%dl, 224(%r15)
	movzbl	225(%r12), %edx
	movb	%cl, 224(%r12)
	movzbl	225(%r15), %ecx
	movq	8(%rbx), %rax
	movb	%dl, 225(%r15)
	movq	88(%rsp), %rdx
	movb	%cl, 225(%r12)
	movq	40(%rsp), %rcx
	movq	%rax, 88(%rsp)
	movq	%rdx, 8(%rbx)
	movq	%rbp, %rdx
.LEHB11:
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEEaSEOS2_
.LEHE11:
	leaq	24(%rdi), %rax
	movq	%rbp, %rcx
	addq	$64, %rdi
	movq	%rax, 80(%rsp)
	movq	.refptr._ZTVSt13basic_filebufIcSt11char_traitsIcEE(%rip), %rax
	movq	%rdi, 304(%rsp)
	addq	$16, %rax
	movq	%rax, 96(%rsp)
.LEHB12:
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv
.LEHE12:
.L67:
	leaq	168(%rsp), %rcx
	call	_ZNSt12__basic_fileIcED1Ev
	movq	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	leaq	152(%rsp), %rcx
	addq	$16, %rax
	movq	%rax, 96(%rsp)
	call	_ZNSt6localeD1Ev
	movq	-24(%rsi), %rax
	movq	%rsi, 80(%rsp)
	movq	48(%rsp), %rcx
	movq	%r13, 80(%rsp,%rax)
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	$0, 88(%rsp)
	addq	$16, %rax
	movq	%rax, 304(%rsp)
	call	_ZNSt8ios_baseD2Ev
	movl	$2, %r8d
	xorl	%edx, %edx
	movq	%rbx, %rcx
.LEHB13:
	call	_ZNSi5seekgExSt12_Ios_Seekdir
	leaq	64(%rsp), %rcx
	movq	%rbx, %rdx
	call	_ZNSi5tellgEv
	movq	64(%rsp), %rax
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%rbx, %rcx
	movq	%rax, 968(%rbx)
	call	_ZNSi5seekgExSt12_Ios_Seekdir
	movq	968(%rbx), %rsi
	xorl	%edx, %edx
	testq	%rsi, %rsi
	je	.L68
	movq	%rsi, %rcx
	call	malloc
	movq	%rax, %rdx
.L68:
	movq	%rdx, 976(%rbx)
	movq	%rsi, %r8
	movq	%rbx, %rcx
	call	_ZNSi4readEPcx
	movq	40(%rsp), %rcx
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv
.LEHE13:
	testq	%rax, %rax
	je	.L90
.L48:
	addq	$584, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L89:
	movl	32(%rcx), %edx
	orl	$4, %edx
.LEHB14:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE14:
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L90:
	movq	(%rbx), %rax
	movq	-24(%rax), %rcx
	addq	%rbx, %rcx
	movl	32(%rcx), %edx
	orl	$4, %edx
.LEHB15:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE15:
	jmp	.L48
.L77:
	movq	%rax, %rsi
.L52:
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	%rbp, %rcx
	addq	$16, %rax
	movq	%rax, 224(%rbx)
	call	_ZNSt8ios_baseD2Ev
	movq	%rsi, %rcx
.LEHB16:
	call	_Unwind_Resume
.L81:
.L62:
	movq	-24(%rsi), %rdx
	movq	%rsi, 80(%rsp)
	movq	%rax, %rsi
	movq	%r13, 80(%rsp,%rdx)
	xorl	%edx, %edx
	movq	%rdx, 88(%rsp)
.L63:
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	48(%rsp), %rcx
	addq	$16, %rax
	movq	%rax, 304(%rsp)
	call	_ZNSt8ios_baseD2Ev
.L64:
	movq	56(%rsp), %rcx
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev
.L57:
	movq	%rbx, %rcx
	call	_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev
	movq	%rsi, %rcx
	call	_Unwind_Resume
.LEHE16:
.L80:
	movq	%rax, %rsi
	jmp	.L63
.L76:
	movq	%r15, %rcx
	movq	%rax, %rsi
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev
.L55:
	movq	-24(%rbp), %rax
	movq	%rbp, 488(%rbx)
	movq	%r14, 488(%rbx,%rax)
.L56:
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	%r12, %rcx
	addq	$16, %rax
	movq	%rax, 704(%rbx)
	call	_ZNSt8ios_baseD2Ev
	jmp	.L57
.L75:
	movq	%rax, %rsi
	jmp	.L55
.L82:
	movq	%rax, %rdi
	movq	%rbp, %rcx
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev
	movq	%rdi, %rax
	jmp	.L62
.L73:
	movq	%rax, %rsi
	jmp	.L64
.L83:
	movq	%rax, %rcx
	call	__cxa_begin_catch
	call	__cxa_end_catch
	jmp	.L67
.L72:
	movq	%r14, %rcx
	movq	%rax, %rsi
	call	_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev
	jmp	.L64
.L74:
	movq	%rax, %rsi
	jmp	.L56
.L79:
	movq	40(%rsp), %rcx
	movq	%rax, %rdi
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev
	movq	%rdi, %rax
.L51:
	movq	-24(%rsi), %rdx
	xorl	%r9d, %r9d
	movq	%rsi, (%rbx)
	movq	%rax, %rsi
	movq	%r13, (%rbx,%rdx)
	movq	%r9, 8(%rbx)
	jmp	.L52
.L78:
	jmp	.L51
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
	.align 4
.LLSDA2217:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT2217-.LLSDATTD2217
.LLSDATTD2217:
	.byte	0x1
	.uleb128 .LLSDACSE2217-.LLSDACSB2217
.LLSDACSB2217:
	.uleb128 .LEHB2-.LFB2217
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L77-.LFB2217
	.uleb128 0
	.uleb128 .LEHB3-.LFB2217
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L78-.LFB2217
	.uleb128 0
	.uleb128 .LEHB4-.LFB2217
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L79-.LFB2217
	.uleb128 0
	.uleb128 .LEHB5-.LFB2217
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L74-.LFB2217
	.uleb128 0
	.uleb128 .LEHB6-.LFB2217
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L75-.LFB2217
	.uleb128 0
	.uleb128 .LEHB7-.LFB2217
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L76-.LFB2217
	.uleb128 0
	.uleb128 .LEHB8-.LFB2217
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L80-.LFB2217
	.uleb128 0
	.uleb128 .LEHB9-.LFB2217
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L81-.LFB2217
	.uleb128 0
	.uleb128 .LEHB10-.LFB2217
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L82-.LFB2217
	.uleb128 0
	.uleb128 .LEHB11-.LFB2217
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L72-.LFB2217
	.uleb128 0
	.uleb128 .LEHB12-.LFB2217
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L83-.LFB2217
	.uleb128 0x1
	.uleb128 .LEHB13-.LFB2217
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L73-.LFB2217
	.uleb128 0
	.uleb128 .LEHB14-.LFB2217
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L82-.LFB2217
	.uleb128 0
	.uleb128 .LEHB15-.LFB2217
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L73-.LFB2217
	.uleb128 0
	.uleb128 .LEHB16-.LFB2217
	.uleb128 .LEHE16-.LEHB16
	.uleb128 0
	.uleb128 0
.LLSDACSE2217:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT2217:
	.section	.text$_ZN4zapi2io4FileC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,"x"
	.seh_endproc
	.globl	_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.def	_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE;	.scl	2;	.type	32;	.endef
	.set	_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,_ZN4zapi2io4FileC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.section	.text$_ZN4zapi2io4FileC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy,"x"
	.align 2
	.p2align 4
	.globl	_ZN4zapi2io4FileC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy
	.def	_ZN4zapi2io4FileC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN4zapi2io4FileC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy
_ZN4zapi2io4FileC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy:
.LFB2220:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
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
	subq	$568, %rsp
	.seh_stackalloc	568
	movaps	%xmm6, 544(%rsp)
	.seh_savexmm	%xmm6, 544
	.seh_endprologue
	leaq	224(%rcx), %rdi
	movq	%rcx, %rbx
	movq	%rdx, %r15
	movq	%r8, 656(%rsp)
	movq	%rdi, %rcx
	movq	%r9, 664(%rsp)
	call	_ZNSt8ios_baseC2Ev
	xorl	%r8d, %r8d
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	xorl	%edx, %edx
	movw	%r8w, 448(%rbx)
	pxor	%xmm0, %xmm0
	movups	%xmm0, 456(%rbx)
	movups	%xmm0, 472(%rbx)
	movq	$0, 440(%rbx)
	addq	$16, %rax
	movq	%rax, 224(%rbx)
	movq	.refptr._ZTTSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rax
	movq	8(%rax), %rsi
	movq	16(%rax), %r12
	movq	-24(%rsi), %rax
	movq	%rsi, (%rbx)
	movq	%r12, (%rbx,%rax)
	movq	$0, 8(%rbx)
	movq	-24(%rsi), %rcx
	addq	%rbx, %rcx
.LEHB17:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE17:
	movq	.refptr._ZTVSt14basic_ifstreamIcSt11char_traitsIcEE(%rip), %rax
	leaq	16(%rbx), %rbp
	movq	%rbp, %rcx
	leaq	24(%rax), %rdx
	addq	$64, %rax
	movq	%rdx, (%rbx)
	movq	%rax, 224(%rbx)
.LEHB18:
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEEC1Ev
.LEHE18:
	movq	%rbp, %rdx
	movq	%rdi, %rcx
.LEHB19:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE19:
	leaq	704(%rbx), %rbp
	leaq	488(%rbx), %r12
	movq	%rbp, %rcx
	call	_ZNSt8ios_baseC2Ev
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	xorl	%edx, %edx
	pxor	%xmm0, %xmm0
	movw	%dx, 928(%rbx)
	xorl	%edx, %edx
	movups	%xmm0, 936(%rbx)
	movups	%xmm0, 952(%rbx)
	movq	$0, 920(%rbx)
	addq	$16, %rax
	movq	%rax, 704(%rbx)
	movq	.refptr._ZTTSt14basic_ofstreamIcSt11char_traitsIcEE(%rip), %rax
	movq	8(%rax), %rdi
	movq	16(%rax), %r13
	movq	-24(%rdi), %rcx
	movq	%rdi, 488(%rbx)
	addq	%r12, %rcx
	movq	%r13, (%rcx)
.LEHB20:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE20:
	movq	.refptr._ZTVSt14basic_ofstreamIcSt11char_traitsIcEE(%rip), %rsi
	leaq	24(%rsi), %rax
	movq	%rax, 488(%rbx)
	leaq	64(%rsi), %rax
	movq	%rax, 704(%rbx)
	leaq	496(%rbx), %rax
	movq	%rax, %rcx
	movq	%rax, %r14
	movq	%rax, 40(%rsp)
.LEHB21:
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEEC1Ev
.LEHE21:
	movq	%r14, %rdx
	movq	%rbp, %rcx
.LEHB22:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE22:
	movq	$0, 968(%rbx)
	leaq	280(%rsp), %rax
	movq	%rax, 56(%rsp)
	leaq	64(%rsp), %r14
	movq	%rax, %rcx
	movq	$0, 976(%rbx)
	call	_ZNSt8ios_baseC2Ev
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rdx
	pxor	%xmm0, %xmm0
	movaps	%xmm0, 512(%rsp)
	movaps	%xmm0, 528(%rsp)
	movq	$0, 496(%rsp)
	movq	%rdi, 64(%rsp)
	leaq	16(%rdx), %rax
	movq	%rax, 280(%rsp)
	xorl	%eax, %eax
	movw	%ax, 504(%rsp)
	movq	-24(%rdi), %rdx
	addq	%r14, %rdx
	movq	%rdx, %rcx
	movq	%r13, (%rdx)
	xorl	%edx, %edx
.LEHB23:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE23:
	leaq	24(%rsi), %rax
	leaq	72(%rsp), %rbp
	movq	%rax, 64(%rsp)
	leaq	64(%rsi), %rax
	movq	%rbp, %rcx
	movq	%rbp, 48(%rsp)
	movq	%rax, 280(%rsp)
.LEHB24:
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEEC1Ev
.LEHE24:
	movq	56(%rsp), %rcx
	movq	%rbp, %rdx
.LEHB25:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
	movq	(%r15), %rdx
	movl	$20, %r8d
	movq	%rbp, %rcx
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode
	movq	64(%rsp), %rdx
	movq	-24(%rdx), %rcx
	addq	%r14, %rcx
	testq	%rax, %rax
	je	.L129
	xorl	%edx, %edx
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE25:
.L102:
	movq	.refptr._ZTVSt13basic_filebufIcSt11char_traitsIcEE(%rip), %rax
	leaq	24(%rsi), %rdx
	movq	%rdx, %xmm6
	movq	64(%rsp), %rdx
	addq	$16, %rax
	movq	%rax, %xmm1
	movq	488(%rbx), %rax
	movq	-24(%rdx), %r15
	punpcklqdq	%xmm1, %xmm6
	movq	-24(%rax), %rbp
	addq	%r14, %r15
	movq	%r15, %rdx
	addq	%r12, %rbp
	movq	%rbp, %rcx
	call	_ZNSt8ios_base7_M_swapERS_
	leaq	208(%rbp), %rdx
	movq	%rbp, %rcx
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE15_M_cache_localeERKSt6locale
	leaq	208(%r15), %rdx
	movq	%r15, %rcx
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE15_M_cache_localeERKSt6locale
	movq	216(%rbp), %rdx
	movq	216(%r15), %rcx
	movq	%rdx, 216(%r15)
	movzbl	224(%rbp), %edx
	movq	%rcx, 216(%rbp)
	movzbl	224(%r15), %ecx
	movb	%dl, 224(%r15)
	movzbl	225(%rbp), %edx
	movb	%cl, 224(%rbp)
	movzbl	225(%r15), %ecx
	movb	%dl, 225(%r15)
	movq	48(%rsp), %rdx
	movb	%cl, 225(%rbp)
	movq	40(%rsp), %rcx
.LEHB26:
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEEaSEOS2_
.LEHE26:
	movq	48(%rsp), %rcx
	addq	$64, %rsi
	movaps	%xmm6, 64(%rsp)
	movq	%rsi, 280(%rsp)
.LEHB27:
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv
.LEHE27:
.L110:
	leaq	144(%rsp), %rcx
	call	_ZNSt12__basic_fileIcED1Ev
	movq	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE(%rip), %rax
	leaq	128(%rsp), %rcx
	addq	$16, %rax
	movq	%rax, 72(%rsp)
	call	_ZNSt6localeD1Ev
	movq	-24(%rdi), %rax
	movq	%rdi, 64(%rsp)
	movq	56(%rsp), %rcx
	movq	%r13, 64(%rsp,%rax)
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	addq	$16, %rax
	movq	%rax, 280(%rsp)
	call	_ZNSt8ios_baseD2Ev
	movq	664(%rsp), %r8
	movq	%r12, %rcx
	movq	656(%rsp), %rdx
.LEHB28:
	call	_ZNSo5writeEPKcx
	movq	40(%rsp), %rcx
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv
.LEHE28:
	testq	%rax, %rax
	je	.L130
.L91:
	movaps	544(%rsp), %xmm6
	addq	$568, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L129:
	movl	32(%rcx), %edx
	orl	$4, %edx
.LEHB29:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE29:
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L130:
	movq	488(%rbx), %rax
	movq	-24(%rax), %rcx
	addq	%r12, %rcx
	movl	32(%rcx), %edx
	orl	$4, %edx
.LEHB30:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE30:
	jmp	.L91
.L118:
	movq	%rax, %rsi
.L95:
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	%rdi, %rcx
	addq	$16, %rax
	movq	%rax, 224(%rbx)
	call	_ZNSt8ios_baseD2Ev
	movq	%rsi, %rcx
.LEHB31:
	call	_Unwind_Resume
.L122:
	movq	%rax, %rsi
.L105:
	movq	-24(%rdi), %rax
	movq	%rdi, 64(%rsp)
	movq	%r13, 64(%rsp,%rax)
.L106:
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	56(%rsp), %rcx
	addq	$16, %rax
	movq	%rax, 280(%rsp)
	call	_ZNSt8ios_baseD2Ev
.L107:
	movq	%r12, %rcx
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev
.L100:
	movq	%rbx, %rcx
	call	_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev
	movq	%rsi, %rcx
	call	_Unwind_Resume
.LEHE31:
.L121:
	movq	%rax, %rsi
	jmp	.L106
.L117:
	movq	40(%rsp), %rcx
	movq	%rax, %rsi
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev
.L98:
	movq	-24(%rdi), %rax
	movq	%rdi, 488(%rbx)
	movq	%r13, 488(%rbx,%rax)
.L99:
	movq	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE(%rip), %rax
	movq	%rbp, %rcx
	addq	$16, %rax
	movq	%rax, 704(%rbx)
	call	_ZNSt8ios_baseD2Ev
	jmp	.L100
.L116:
	movq	%rax, %rsi
	jmp	.L98
.L123:
	movq	48(%rsp), %rcx
	movq	%rax, %rsi
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev
	jmp	.L105
.L114:
	movq	%rax, %rsi
	jmp	.L107
.L124:
	movq	%rax, %rcx
	call	__cxa_begin_catch
	call	__cxa_end_catch
	jmp	.L110
.L113:
	movq	%r14, %rcx
	movq	%rax, %rsi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev
	jmp	.L107
.L115:
	movq	%rax, %rsi
	jmp	.L99
.L120:
	movq	%rax, %r13
	movq	%rbp, %rcx
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev
	movq	%r13, %rax
.L94:
	movq	-24(%rsi), %rdx
	xorl	%ecx, %ecx
	movq	%rsi, (%rbx)
	movq	%rax, %rsi
	movq	%r12, (%rbx,%rdx)
	movq	%rcx, 8(%rbx)
	jmp	.L95
.L119:
	jmp	.L94
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
	.align 4
.LLSDA2220:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT2220-.LLSDATTD2220
.LLSDATTD2220:
	.byte	0x1
	.uleb128 .LLSDACSE2220-.LLSDACSB2220
.LLSDACSB2220:
	.uleb128 .LEHB17-.LFB2220
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L118-.LFB2220
	.uleb128 0
	.uleb128 .LEHB18-.LFB2220
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L119-.LFB2220
	.uleb128 0
	.uleb128 .LEHB19-.LFB2220
	.uleb128 .LEHE19-.LEHB19
	.uleb128 .L120-.LFB2220
	.uleb128 0
	.uleb128 .LEHB20-.LFB2220
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L115-.LFB2220
	.uleb128 0
	.uleb128 .LEHB21-.LFB2220
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L116-.LFB2220
	.uleb128 0
	.uleb128 .LEHB22-.LFB2220
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L117-.LFB2220
	.uleb128 0
	.uleb128 .LEHB23-.LFB2220
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L121-.LFB2220
	.uleb128 0
	.uleb128 .LEHB24-.LFB2220
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L122-.LFB2220
	.uleb128 0
	.uleb128 .LEHB25-.LFB2220
	.uleb128 .LEHE25-.LEHB25
	.uleb128 .L123-.LFB2220
	.uleb128 0
	.uleb128 .LEHB26-.LFB2220
	.uleb128 .LEHE26-.LEHB26
	.uleb128 .L113-.LFB2220
	.uleb128 0
	.uleb128 .LEHB27-.LFB2220
	.uleb128 .LEHE27-.LEHB27
	.uleb128 .L124-.LFB2220
	.uleb128 0x1
	.uleb128 .LEHB28-.LFB2220
	.uleb128 .LEHE28-.LEHB28
	.uleb128 .L114-.LFB2220
	.uleb128 0
	.uleb128 .LEHB29-.LFB2220
	.uleb128 .LEHE29-.LEHB29
	.uleb128 .L123-.LFB2220
	.uleb128 0
	.uleb128 .LEHB30-.LFB2220
	.uleb128 .LEHE30-.LEHB30
	.uleb128 .L114-.LFB2220
	.uleb128 0
	.uleb128 .LEHB31-.LFB2220
	.uleb128 .LEHE31-.LEHB31
	.uleb128 0
	.uleb128 0
.LLSDACSE2220:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT2220:
	.section	.text$_ZN4zapi2io4FileC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy,"x"
	.seh_endproc
	.globl	_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy
	.def	_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy;	.scl	2;	.type	32;	.endef
	.set	_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy,_ZN4zapi2io4FileC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy
	.ident	"GCC: (x86_64-posix-seh-rev1, Built by MinGW-Builds project) 13.1.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv;	.scl	2;	.type	32;	.endef
	.def	_ZNSt12__basic_fileIcED1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSt6localeD1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_baseD2Ev;	.scl	2;	.type	32;	.endef
	.def	__cxa_begin_catch;	.scl	2;	.type	32;	.endef
	.def	__cxa_end_catch;	.scl	2;	.type	32;	.endef
	.def	_ZNSt6chrono3_V212system_clock3nowEv;	.scl	2;	.type	32;	.endef
	.def	_ZNSo9_M_insertIdEERSoT_;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x;	.scl	2;	.type	32;	.endef
	.def	_ZNSo3putEc;	.scl	2;	.type	32;	.endef
	.def	_ZNSo5flushEv;	.scl	2;	.type	32;	.endef
	.def	_ZNKSt5ctypeIcE13_M_widen_initEv;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__throw_bad_castv;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_baseC2Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E;	.scl	2;	.type	32;	.endef
	.def	_ZNSt13basic_filebufIcSt11char_traitsIcEEC1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode;	.scl	2;	.type	32;	.endef
	.def	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_base7_M_swapERS_;	.scl	2;	.type	32;	.endef
	.def	_ZNSt9basic_iosIcSt11char_traitsIcEE15_M_cache_localeERKSt6locale;	.scl	2;	.type	32;	.endef
	.def	_ZNSt13basic_filebufIcSt11char_traitsIcEEaSEOS2_;	.scl	2;	.type	32;	.endef
	.def	_ZNSi5seekgExSt12_Ios_Seekdir;	.scl	2;	.type	32;	.endef
	.def	_ZNSi5tellgEv;	.scl	2;	.type	32;	.endef
	.def	_ZNSi4readEPcx;	.scl	2;	.type	32;	.endef
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
	.def	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSo5writeEPKcx;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout
	.section	.rdata$.refptr._ZTTSt14basic_ifstreamIcSt11char_traitsIcEE, "dr"
	.globl	.refptr._ZTTSt14basic_ifstreamIcSt11char_traitsIcEE
	.linkonce	discard
.refptr._ZTTSt14basic_ifstreamIcSt11char_traitsIcEE:
	.quad	_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE
	.section	.rdata$.refptr._ZTVSt14basic_ifstreamIcSt11char_traitsIcEE, "dr"
	.globl	.refptr._ZTVSt14basic_ifstreamIcSt11char_traitsIcEE
	.linkonce	discard
.refptr._ZTVSt14basic_ifstreamIcSt11char_traitsIcEE:
	.quad	_ZTVSt14basic_ifstreamIcSt11char_traitsIcEE
	.section	.rdata$.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE, "dr"
	.globl	.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE
	.linkonce	discard
.refptr._ZTVSt9basic_iosIcSt11char_traitsIcEE:
	.quad	_ZTVSt9basic_iosIcSt11char_traitsIcEE
	.section	.rdata$.refptr._ZTTSt14basic_ofstreamIcSt11char_traitsIcEE, "dr"
	.globl	.refptr._ZTTSt14basic_ofstreamIcSt11char_traitsIcEE
	.linkonce	discard
.refptr._ZTTSt14basic_ofstreamIcSt11char_traitsIcEE:
	.quad	_ZTTSt14basic_ofstreamIcSt11char_traitsIcEE
	.section	.rdata$.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE, "dr"
	.globl	.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE
	.linkonce	discard
.refptr._ZTVSt15basic_streambufIcSt11char_traitsIcEE:
	.quad	_ZTVSt15basic_streambufIcSt11char_traitsIcEE
	.section	.rdata$.refptr._ZTVSt14basic_ofstreamIcSt11char_traitsIcEE, "dr"
	.globl	.refptr._ZTVSt14basic_ofstreamIcSt11char_traitsIcEE
	.linkonce	discard
.refptr._ZTVSt14basic_ofstreamIcSt11char_traitsIcEE:
	.quad	_ZTVSt14basic_ofstreamIcSt11char_traitsIcEE
	.section	.rdata$.refptr._ZTVSt13basic_filebufIcSt11char_traitsIcEE, "dr"
	.globl	.refptr._ZTVSt13basic_filebufIcSt11char_traitsIcEE
	.linkonce	discard
.refptr._ZTVSt13basic_filebufIcSt11char_traitsIcEE:
	.quad	_ZTVSt13basic_filebufIcSt11char_traitsIcEE
