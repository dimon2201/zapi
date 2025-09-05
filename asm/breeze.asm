section .text

global LZCompressBranchless
global LZCompress
global CompressorEncode
global SomeFunction

LZCompressBranchless:
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
	
	LZCompressBranchless_InitializeRegisters:
		; Initialize registers
		mov 					rsi, qword[rcx]								; RSI = srcData pointer
		mov 					rdi, qword[rcx + 8]							; RDI = dstData pointer
		mov						rdx, qword[rcx + 16]					 	; RDX = srcDataByteSize
		add 					r8, rsi										; R8 = srcData fixed pointer
		add 					r9, rdi										; R9 = dstData fixed pointer
		mov 					r10, qword[rcx + 40]						; R10 = workMemory pointer
		mov						rax, 0										; RAX = literal counter
		mov						rbx, rsi									; RBX = sliding window start

	LZCompressBranchless_InitializeHashTable:
		mov 					r11, r10									; R11 = workMemory pointer
		mov 					r12, 65536									; R12 = counter
		
		LZCompressBranchless_InitializeHashTable_Loop:						; Filling srcData pointer in each cell
			mov 				qword[r11], rsi
			add 				r11, 8
			dec 				r12
			jnz 				LZCompressBranchless_InitializeHashTable_Loop
	
	LZCompressBranchless_CopyFirstBytes:
		xor						r11, r11
		mov						r11d, dword[rsi]
		mov						dword[rdi], r11d
		add						rsi, 4
		add						rdi, 4
	
	LZCompressBranchless_MainLoop:
		; Overflow check
		lea 					r11, [r8 + rdx]								; R11 = bytes left
		sub						r11, rsi
		cmp 					r11, 4
		jl 						LZCompressBranchless_OutputLastLiterals
		
		; Get min match bytes
		mov 					r11, qword[rsi]								; R11 = srcData bytes
		
		; Hashing
		mov						r12, r11
		mov						r13d, 2654435769
		imul    				r12d, r13d
		shr     				r12d, 16									; R12 = hash
		
		; Sliding window start
		mov						r13, rsi
		mov						r14, rsi
		sub						r13, r8
		sub						r14, 65535
		cmp						r13, 65535
		cmovg					rbx, r14									; RBX = sliding window start
		
		; Read hash table offset pointer
		lea 					r13, [r10 + r12 * 2]						; R13 = hash table index
		mov 					r14w, word [r13]							; R14 = hash table offset
		mov						r15, rsi									; R15 = current offset
		sub						r15, rbx
		mov 					word[r13], r15w								; Write current offset to hash table
		
		add						rsi, 1
		
		jmp LZCompressBranchless_MainLoop
	
	LZCompressBranchless_OutputLastLiterals:
	
	LZCompressBranchless_Exit:
		; Set dstDataByteSize value
		mov						r11, rdi
		sub 					r11, r9
		mov qword[rcx + 24], 	r11
		
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
		; Initialize registers
		mov 					rsi, qword[rcx]								; RSI = srcData pointer
		mov 					rdi, qword[rcx + 8]							; RDI = dstData pointer
		add 					r8, rsi										; R8 = srcData fixed pointer
		add 					r9, rdi										; R9 = dstData fixed pointer
		mov 					r10, qword[rcx + 40]						; R10 = workMemory pointer
		mov						rax, 0										; RAX = literal counter
		mov						rbx, rsi									; RBX = literal pointer

	LZCompress_InitializeHashTable:
		mov 					r11, r10									; R11 = workMemory pointer
		mov 					r12, 65536									; R12 = counter
		
		LZCompress_InitializeHashTable_Loop:								; Filling srcData pointer in each cell
			mov 				qword[r11], rsi
			add 				r11, 8
			dec 				r12
			jnz 				LZCompress_InitializeHashTable_Loop
	
	LZCompress_CopyFirstBytes:
		xor						r11, r11
		mov						r11d, dword[rsi]
		mov						dword[rdi], r11d
		add						rsi, 4
		add						rdi, 4
		add						rbx, 4
	
	LZCompress_MainLoop:
		; Overflow check
		mov						r11, r8										; R11 = bytes left
		add						r11, qword[rcx + 16]
		sub						r11, rsi
		cmp 					r11, 4										; R11 < minMatch (4)
		jl 						LZCompress_OutputLastLiterals
		
		; Get min match bytes
		mov 					r11, qword[rsi]								; R11 = srcData bytes
		
		; Hashing
		mov 					rdx, 2654435769
		movq 					xmm0, r11
		movq 					xmm1, rdx
		pmuludq 				xmm0, xmm1
		psrldq 					xmm0, 4
		movq 					r12, xmm0
		and     				r12, 65535									; R12 = hash
		
		; Read hash table offset pointer
		mov 					r13, r12									; R13 = index in hash table
		shl 					r13, 3										; R13 *= 8
		add 					r13, r10									; R13 += workMemory
		mov 					r14, qword[r13]								; R14 = hash table offset pointer
		mov 					r12, qword[r14]								; R12 = hash table bytes
		
		; Write current offset pointer to hash table
		mov 					qword[r13], rsi
		
		; Calculate offset
		mov						r15, rsi									; R15 = hash table offset
		sub						r15, r14
		
		; Check if offset < 65536
		cmp						r15, 65536
		jae						LZCompress_Literal
		
		; Check if bytes == hash table bytes
		cmp 					r11d, r12d
		je 						LZCompress_Match
		
		; Literal
		LZCompress_Literal:
			; Increment literal counter
			inc					rax											; Increment literal counter
			inc					rsi
			jmp 				LZCompress_MainLoop
		
		; Match
		LZCompress_Match:
			
			; Literals loop check
			LZCompress_Match_OutputLiterals_Check:
				; Check if literal counter == 0
				cmp				rax, 0
				je				LZCompress_Match_Encoding
				
				; Check if literal counter > 14
				cmp				rax, 14										; If literal counter > 14
				jg				LZCompress_Match_OutputLiterals_Emit14
			
			; Emit left literal bytes
			LZCompress_Match_OutputLiterals_EmitLeft:
				; Output token
				mov				byte[rdi], al
				inc				rdi
				
				; Copy left literals
				movdqu			xmm0, [rbx]
				movdqu			[rdi], xmm0
				add				rdi, rax
				add				rbx, rax
				mov				rax, 0
				jmp				LZCompress_Match_Encoding
			
			; Emit exactly 14 literal bytes
			LZCompress_Match_OutputLiterals_Emit14:
				; Output token
				mov				byte[rdi], 14
				inc 			rdi
				
				; Copy 14 literals
				movdqu			xmm0, [rbx]
				movdqu			[rdi], xmm0
				add				rdi, 14
				sub				rax, 14
				add				rbx, 14
				jmp				LZCompress_Match_OutputLiterals_Check
			
			; Encode match
			LZCompress_Match_Encoding:
				; Search for longer match
				add				rsi, 4										; Add srcData pointer by 4
				add				r14, 4										; Add hash table offset pointer by 4
				mov				r11, rsi									; R11 = match pointer
				mov				rdx, 0										; RDX = match length
				
				LZCompress_Match_Encoding_SearchLongerMatch:
					mov			r12b, byte[r11]
					mov			r13b, byte[r14]
					cmp 		r12b, r13b
					jne			LZCompress_Match_Encoding_OutputToken
					cmp			rdx, 15
					je			LZCompress_Match_Encoding_OutputToken
					add			r11, 1
					add			r14, 1
					add			rdx, 1
					jmp 		LZCompress_Match_Encoding_SearchLongerMatch
			
			; Output match token
			LZCompress_Match_Encoding_OutputToken:
				; Get match length
				add				rsi, rdx									; Add srcData pointer by match length
				
				; Output token
				mov 			r11, rdx									; R11 = token
				shl				r15, 8
				or				r11, r15
				mov				dword[rdi], r11d
				add				rdi, 3
				
				mov				rbx, rsi									; Update literal pointer
				jmp 			LZCompress_MainLoop
	
	LZCompress_OutputLastLiterals:
		; Output last literals
		add 					rax, r11									; Add bytesLeft to literal counter
		mov						byte[rdi], 17								; 17 = escape code [0001 0001]
		mov						qword[rdi + 1], rax							; Output last literal count (max 64 bits)
		add						rdi, 9
		
		LZCompress_OutputLastLiterals_Loop:
			cmp 				rax, 0
			je					LZCompress_Exit
			mov					r11b, byte[rbx]
			mov					byte[rdi], r11b
			inc					rbx
			inc 				rdi
			dec					rax
			jmp 				LZCompress_OutputLastLiterals_Loop
	
	LZCompress_Exit:
		; Set dstDataByteSize value
		mov						r11, rdi
		sub 					r11, r9
		mov qword[rcx + 24], 	r11
		
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
	push 						rax
	push 						rbx
	push 						rdx
	push				 		rsi
	push 						rdi
	push 						r8
	push 						r9
	push 						r10
	push 						r11
	push 						r12
	push 						r13
	push 						r14
	push 						r15

	xor 						rax, rax
	xor 						rbx, rbx
	xor 						rdx, rdx
	xor 						rsi, rsi
	xor 						rdi, rdi
	xor 						r8, r8
	xor 						r9, r9
	xor 						r10, r10
	xor 						r11, r11
	xor 						r12, r12
	xor 						r13, r13
	xor 						r14, r14
	xor 						r15, r15

	; RCX = arguments pointer
	
	CompressorEncode_InitializeRegisters:
		; Initialize registers
		mov 					rsi, qword[rcx]						; RSI = srcData pointer
		mov 					rdi, qword[rcx + 8]					; RDI = dstData pointer
		add 					r8, rsi								; R8 = srcData fixed pointer
		add 					r9, rdi								; R9 = dstData fixed pointer
		mov 					r10, qword[rcx + 40]				; R10 = workMemory pointer
		mov 					rdx, rdi							; RDX = control pointer
	
	CompressorEncode_ControlSetup:
		add 					rdi, 4								; Move dstData pointer by 8 bytes
																	; for (32 bits for control)
		mov 					rax, 0								; RAX = control bit counter
	
	CompressorEncode_SetupLookup:
		mov 					r11, r10
		add						r11, 524288
		mov						qword[rcx + 56], r11				; [rcx + 56] = lookup table pointer
		mov						byte[r11], 1						; Values for control counter
		mov						byte[r11 + 1], 2
		mov						byte[r11 + 2], 4
		mov						byte[r11 + 3], 8
		mov						byte[r11 + 4], 16
		mov						byte[r11 + 5], 32
		mov						byte[r11 + 6], 64
		mov						byte[r11 + 7], 128
		mov						qword[r11 + 8], 4					; Values for dstData pointer offset
		mov						qword[r11 + 16], 2
	
	CompressorEncode_MainLoop:
		; Overflow check
		mov 					r11, r8								; R11 = bytesLeft, R8 = srcDataBoundary
		add 					r11, qword[rcx + 16]				; Find bytesLeft
		sub						r11, rsi
		cmp 					r11, 4								; R11 < blockSize (4)
		jl 						CompressorEncode_Exit
		
		; Get current bytes
		mov 					r12d, dword[rsi]					; R12 = current bytes
		add						rsi, 4								; Increase srcData pointer
		
		; Hashing
		mov     				ebx, 2654435769
		mov						r13, r12
		imul    				r13d, ebx
		shr     				r13d, 16							; R13 = hash
		
		; Read hash table bytes
		mov 					r14, r13							; R14 = index in hash table
		shl 					r14, 2								; R14 *= 4
		add 					r14, r10
		mov 					r15d, dword[r14]					; R15 = hash table bytes
		
		; Write current bytes to hash table
		mov 					dword[r14], r12d
		
		; Get branch bit
		xor						rbx, rbx
		mov						r11, 1
		cmp						r12d, r15d
		cmove					rbx, r11							; RBX = branch bit
		
		; 32 bit masks
		mov						r11d, ebx
		neg						r11d								; R11 = match mask
		mov						r14d, r11d
		not						r14d								; R14 = literal mask
		
		; Token
		and						r11d, r13d							; Match mask & hash
		and						r14d, r12d							; Literal mask & current bytes
		or						r11d, r14d							; R11 = Match mask | literal mask
		mov						dword[rdi], r11d					; Write R11 to dstData
		mov						r11, qword[rcx + 56]
		add						r11, 8
		shl						rbx, 3
		add						r11, rbx
		mov						r12, qword[r11]						; R12 = dstData pointer offset
		add						rdi, r12							; Add dstData pointer by offset
		
		; Control
		mov						r11, qword[rcx + 56]				; R11 = lookup table index
		add						r11, rax
		inc						rax
		mov						r12, rax
		mov						r13b, byte[r11]
		shr						r12, 3
		or						byte[rdx], r13b
		and						rax, 7
		cmp						r12, 1								; R11 == 1
		cmove					rdx, rdi							; Update control pointer if control counter == 8
		add						rdi, r12							; Increment dstData pointer
		
		jmp						CompressorEncode_MainLoop
		
		; Output
		;cmp 					r12d, r15d							; Check if current bytes == hash table bytes
		;je 						CompressorEncode_Match
			
		; Literal
		;CompressorEncode_Literal:
			; Output to dstData
		;	mov 				dword[rdi], r12d
		;	add 				rdi, 4								; Increment dstData pointer
			
		;	jmp 				CompressorEncode_MainLoopEnd
			
		; Match
		;CompressorEncode_Match:
			; Calculate control value from lookup table
		;	mov					r12, rcx
		;	add					r12, 56
		;	add					r12, rax
		;	mov					r14b, byte[r12]						; R14 = control value
		;	or					byte[rdx], r14b
			
			; Output to dstData
		;	mov 				word[rdi], r13w						; Store hash value to dstData
		;	add 				rdi, 2								; Increment dstData pointer
			
		;CompressorEncode_MainLoopEnd:
			; Update control
		;	mov 				r11, rax							; R11 = control bit counter
		;	shr					r11, 3								; R11 >>= 3
		;	and					rax, 7								; R11 &= 7
		;	cmp					r11, 1								; If R11 == 1
		;	cmove				rdx, rdi							; If so update control pointer
		;	add					rdi, r11							; Increment dstData pointer if needed
			
			; Increase srcData pointer
		;	add 				rsi, 4
			
			; Increment control bit counter (RAX)
		;	inc 				rax
			
		;	jmp 				CompressorEncode_MainLoop
		
	CompressorEncode_Exit:
		; Set dstDataByteSize value
		mov						r11, rdi
		sub 					r11, r9
		mov qword[rcx + 24], 	r11
	
		pop 					r15
		pop 					r14
		pop	 					r13
		pop 					r12
		pop 					r11
		pop 					r10
		pop 					r9
		pop 					r8
		pop 					rdi
		pop 					rsi
		pop 					rdx
		pop 					rbx
		pop 					rax
	
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
		mov r9,  qword[rcx + 32]				; dstMaxByteSize value
		add r9, rdi								; R9 is dstData boundary
		mov r10, qword[rcx + 40]				; R10 is workMemory pointer
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