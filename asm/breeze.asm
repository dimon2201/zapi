section .text

global LZCompress
global CompressorEncode
global SomeFunction

LZCompress:
	push rax
	push rbx
	push rdx
	push rsi
	push rdi
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15

	xor rax, rax
	xor rbx, rbx
	xor rdx, rdx
	xor rsi, rsi
	xor rdi, rdi
	xor r8, r8
	xor r9, r9
	xor r10, r10
	xor r11, r11
	xor r12, r12
	xor r13, r13
	xor r14, r14
	xor r15, r15

	; RCX is arguments pointer
	
	LZCompress_InitializeRegisters:
		mov rsi, qword[rcx]						; RSI is srcData pointer
		mov rdi, qword[rcx + 8]					; RDI is dstData pointer
		mov r8,  qword[rcx + 16]				; srcDataByteSize value
		add r8, rsi								; R8 is srcDataBoundary
		mov r9,  qword[rcx + 24]				; dstMaxByteSize value
		add r9, rdi								; R9 is dstDataBoundary
		mov r10, qword[rcx + 32]				; R10 is workMemory pointer
		mov rdx, rdi							; RDX is control pointer
	
	LZCompress_MainLoop:
		
	
	LZCompress_Exit:
		pop r15
		pop r14
		pop r13
		pop r12
		pop r11
		pop r10
		pop r9
		pop r8
		pop rdi
		pop rsi
		pop rdx
		pop rbx
		pop rax
	
	ret

CompressorEncode:
	push rax
	push rbx
	push rdx
	push rsi
	push rdi
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15

	xor rax, rax
	xor rbx, rbx
	xor rdx, rdx
	xor rsi, rsi
	xor rdi, rdi
	xor r8, r8
	xor r9, r9
	xor r10, r10
	xor r11, r11
	xor r12, r12
	xor r13, r13
	xor r14, r14
	xor r15, r15

	; RCX is arguments pointer
	
	CompressorEncode_InitializeRegisters:
		mov rsi, qword[rcx]						; RSI is srcData pointer
		mov rdi, qword[rcx + 8]					; RDI is dstData pointer
		mov r8,  qword[rcx + 16]				; srcDataByteSize value
		add r8, rsi								; R8 is srcDataBoundary
		mov r9,  qword[rcx + 24]				; dstMaxByteSize value
		add r9, rdi								; R9 is dstDataBoundary
		mov r10, qword[rcx + 32]				; R10 is workMemory pointer
		mov rdx, rdi							; RDX is control pointer
	
	CompressorEncode_ControlSetup:
		add rdi, 4								; Move dstData pointer by 8 bytes
												; (32 bits for control)
		mov rax, 0								; RAX is control bit counter
	
	CompressorEncode_MainLoop:
		; Overflow check
		mov r11, r8								; R11 is bytesLeft, R8 is srcDataBoundary
		sub r11, rsi							; Find bytesLeft
		cmp r11, 4								; R11 < blockSize (4)
		jl CompressorEncode_Exit
		
		; Get current bytes
		mov r12d, dword[rsi]					; R12 is current bytes
		
		; Hashing
		mov r13, r12
		imul r13, r13, -1640531527
		shr r13, 32
		and r13, 65535
		
		; Read hash table bytes
		mov r14, r13							; R14 is index in hash table
		shl r14, 2								; R14 *= 4
		add r14, r10
		mov r15d, dword[r14]					; R15 is hash table bytes
		
		; Write current bytes to hash table
		mov dword[r14], r12d
		
		; Output
		cmp r12, r15							; Check if current bytes == hash table bytes
		je CompressorEncode_Match
			
			; Literal
			CompressorEncode_Literal:
				inc rax							; Increment control bit counter (RAX)
				
				; Output to dstData
				mov dword[rdi], r12d
				add rdi, 4						; Increment dstData pointer
				
				jmp CompressorEncode_MainLoopEnd
			
			; Match
			CompressorEncode_Match:
				; Calculate control
				push rcx
				xor rcx, rcx
				mov r11, 1						; R11 is needed for calculation of control
				mov r12, rax					; R12 is control bit counter
				mov cl, r12b					; CL needed for shift operation
				shl r11, cl						; 1 << control bit counter
				or dword[rdx], r11d				; Store R11 to control pointer
				inc rax							; Increment control bit counter (RAX)
				pop rcx
				
				; Output to dstData
				mov word[rdi], r13w
				add rdi, 2						; Increment dstData pointer
				
	CompressorEncode_MainLoopEnd:
		; Reset control bit counter
		xor r11, r11
		cmp rax, 8
		cmove rax, r11
		
		; Increase srcData pointer
		add rsi, 4
		
		jmp CompressorEncode_MainLoop
		
	CompressorEncode_Exit:
		pop r15
		pop r14
		pop r13
		pop r12
		pop r11
		pop r10
		pop r9
		pop r8
		pop rdi
		pop rsi
		pop rdx
		pop rbx
		pop rax
	
	ret

SomeFunction:
	xor r8, r8
	xor r9, r9
	xor r10, r10
	xor r11, r11
	push rbx
	push rdx
	
	; RCX is arguments pointer
	
	Initialize:
		mov rsi, qword[rcx]						; RSI is srcData pointer
		mov rdi, qword[rcx + 8]					; RDI is dstData pointer
		mov r8,  qword[rcx + 16]				; srcDataByteSize value
		add r8, rdi								; R8 is srcData boundary
		mov r9,  qword[rcx + 24]				; dstMaxByteSize value
		add r9, rdi								; R9 is dstData boundary
		mov r10, qword[rcx + 32]				; R10 is workMemory pointer
		mov r11, 32								; R11 is blockByteSize
		mov al, r11b							; AL is wordCountPerBlock
		shr rdx, 2
		
	HashTableZeroMemory:
		push rcx
		push r8
		push r9
		mov rcx, r10							; RCX is workMemory pointer
		mov r8, 0								; R8 is zero value for buffer filling
		mov r9, 8192							; R9 is counter
		
		HashTableZeroMemoryLoop:				; Filling zeros
			mov qword[rcx], r8
			add rcx, 8
			dec r9
			jnz HashTableZeroMemoryLoop
			
		pop r9
		pop r8
		pop rcx
	
	ControlSetup:
		add rdi, 4								; Leave memory for control count value
		add rdi, 1								; Leave memory for control last value
		mov r12, rdi							; R12 is control pointer
	
	MainLoop:
		; Check for loop exit
		mov r14, r8								; R14 is srcBytesLeft, R8 is srcDataBoundary
		sub r14, rsi							; Find srcBytesLeft
		cmp r14, r11							; R14 < blockByteSize
		jl Exit
		
		; Control bit counter
		mov r13, 0								; R13 is control bit counter
		
		; Words loop
		EncodingLoop:
			; Counter
			mov ah, 0							; AH is loop j
			
			; Get bytes
			mov ebx, dword[rsi]					; EBX is bytes
			
			; Hashing
			mov rax, rbx						; R14 is hash
			mov rbx, 2654435769
			mul rbx
			shr rax, 32
			and rax, 0FFFFh
			mov r14, rax
			
			; Get bytes from hash table
			push rcx
			mov rcx, r10						; RCX is workMemory address, R10 is workMemory pointer
			shl r14, 2							; Multiply hash by word size (4)
			add rcx, r14						; RCX + hash
			mov r15d, dword[rcx]				; R15 is bytes from hash table
			pop rcx
			
			; Output
			cmp rbx, r15						; If bytes == bytes from hash table
			je Match
				
				; Literal
				Literal:
					inc r13						; Increment control bit counter
					mov dword[rdi], ebx
					add rdi, 4
					jmp EncodingLoopEnd
				
				; Match
				Match:
					; Set control value
					push rcx
					xor rbx, rbx
					mov bh, 1
					mov cl, r13b
					shl bh, cl
					pop rcx
					inc r13						; Increment control bit counter
					mov dl, byte[r12]			; DH is control value
					or dl, bh
					mov byte[r12], dl			; Put temp control value to real one
					
					; Set dstData value
					mov word[rdi], r14w
					add rdi, 2
			
			EncodingLoopEnd:
				inc ah							; Increment j (AH)
				cmp ah, al						; Compare j (AH) and wordCountPerBlock (AL)
				jne EncodingLoop				; j != wordCountPerBlock
		
		MainLoopEnd:
			mov r12, rdi						; Reset control pointer
			add rdi, 1							; Increment dstData pointer
			jmp MainLoop
	
	Exit:
		xor r15, r15
		mov r15, qword[rcx + 8]					; R15 is control last value, copy dstData address to R15
		add r15, 4								; Move to control last value address
		mov byte[r15], r14b						; Set control last value to srcBytesLeft (R14)
		push rsi								; Copy srcBytesLeft (R14) from srcData to dstData
		push rdi
		push rcx
		mov rcx, r14
		cld
		rep movsb
		pop rcx
		pop rdi
		pop rsi
	
	;CopyLoop:
    ;    vmovdqu   	ymm0, 		[rdi]
    ;    vmovntdq   	[rsi],   	ymm0
    ;    add      	rdi, 		32
    ;    add     	rsi, 		32
    ;    cmp			r8,			rdi
    ;    jne     	CopyLoop
	
	sfence
	
	pop rdx
	pop rbx
	
	ret