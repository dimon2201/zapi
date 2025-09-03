section .text

global SomeFunction

SomeFunction:
	xor r8, r8
	xor r9, r9
	xor r10, r10
	push rbx
	push rdx
	
	lea rdi, [rcx]			; ptr = &data[0]
	lea rsi, [rcx + 8]
	lea r8, [rcx + 16]
	
	mov r10, qword[rdi]		; rdi = ptr[0]
	mov rdi, r10
	mov r10, qword[rsi]
	mov rsi, r10
	mov r10, qword[r8]
	mov r8, r10
	
	CopyLoop:
		mov r10, qword[rdi]
		mov qword[rsi], r10
		add rdi, 8
		add rsi, 8
		sub r8, 8
		jnz CopyLoop
	
	pop rdx
	pop rbx
	
	ret