In archive libzapi.a:

zapi.cpp.obj:     file format pe-x86-64


Disassembly of section .text:

0000000000000000 <_ZN4zapi7storage8AllocateEyj>:
   0:	48 85 c9             	test   %rcx,%rcx
   3:	74 0b                	je     10 <_ZN4zapi7storage8AllocateEyj+0x10>
   5:	e9 00 00 00 00       	jmp    a <_ZN4zapi7storage8AllocateEyj+0xa>
   a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  10:	31 c0                	xor    %eax,%eax
  12:	c3                   	ret
  13:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  1a:	00 00 00 00 
  1e:	66 90                	xchg   %ax,%ax

0000000000000020 <_ZN4zapi7storage10DeallocateEPv>:
  20:	48 85 c9             	test   %rcx,%rcx
  23:	74 0b                	je     30 <_ZN4zapi7storage10DeallocateEPv+0x10>
  25:	e9 00 00 00 00       	jmp    2a <_ZN4zapi7storage10DeallocateEPv+0xa>
  2a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  30:	c3                   	ret
  31:	90                   	nop
  32:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  39:	00 00 00 00 
  3d:	0f 1f 00             	nopl   (%rax)

0000000000000040 <_ZN4zapi2io4FileD1Ev>:
  40:	55                   	push   %rbp
  41:	57                   	push   %rdi
  42:	56                   	push   %rsi
  43:	53                   	push   %rbx
  44:	48 83 ec 38          	sub    $0x38,%rsp
  48:	0f 29 74 24 20       	movaps %xmm6,0x20(%rsp)
  4d:	48 8b 2d 00 00 00 00 	mov    0x0(%rip),%rbp        # 54 <_ZN4zapi2io4FileD1Ev+0x14>
  54:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 5b <_ZN4zapi2io4FileD1Ev+0x1b>
  5b:	48 8d 45 10          	lea    0x10(%rbp),%rax
  5f:	48 8d 7e 18          	lea    0x18(%rsi),%rdi
  63:	66 48 0f 6e c0       	movq   %rax,%xmm0
  68:	48 89 cb             	mov    %rcx,%rbx
  6b:	48 8b 89 d0 03 00 00 	mov    0x3d0(%rcx),%rcx
  72:	66 48 0f 6e f7       	movq   %rdi,%xmm6
  77:	66 0f 6c f0          	punpcklqdq %xmm0,%xmm6
  7b:	48 85 c9             	test   %rcx,%rcx
  7e:	74 05                	je     85 <_ZN4zapi2io4FileD1Ev+0x45>
  80:	e8 00 00 00 00       	call   85 <_ZN4zapi2io4FileD1Ev+0x45>
  85:	48 83 c6 40          	add    $0x40,%rsi
  89:	0f 11 b3 e8 01 00 00 	movups %xmm6,0x1e8(%rbx)
  90:	48 89 b3 c0 02 00 00 	mov    %rsi,0x2c0(%rbx)
  97:	48 8d 8b f0 01 00 00 	lea    0x1f0(%rbx),%rcx
  9e:	e8 00 00 00 00       	call   a3 <_ZN4zapi2io4FileD1Ev+0x63>
  a3:	48 8d 8b 38 02 00 00 	lea    0x238(%rbx),%rcx
  aa:	48 83 c5 10          	add    $0x10,%rbp
  ae:	e8 00 00 00 00       	call   b3 <_ZN4zapi2io4FileD1Ev+0x73>
  b3:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # ba <_ZN4zapi2io4FileD1Ev+0x7a>
  ba:	48 8d 8b 28 02 00 00 	lea    0x228(%rbx),%rcx
  c1:	48 8d 46 10          	lea    0x10(%rsi),%rax
  c5:	48 89 83 f0 01 00 00 	mov    %rax,0x1f0(%rbx)
  cc:	e8 00 00 00 00       	call   d1 <_ZN4zapi2io4FileD1Ev+0x91>
  d1:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # d8 <_ZN4zapi2io4FileD1Ev+0x98>
  d8:	48 8d 8b c0 02 00 00 	lea    0x2c0(%rbx),%rcx
  df:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # e6 <_ZN4zapi2io4FileD1Ev+0xa6>
  e6:	48 8b 50 08          	mov    0x8(%rax),%rdx
  ea:	48 8b 40 10          	mov    0x10(%rax),%rax
  ee:	48 89 93 e8 01 00 00 	mov    %rdx,0x1e8(%rbx)
  f5:	48 8b 52 e8          	mov    -0x18(%rdx),%rdx
  f9:	48 89 84 13 e8 01 00 	mov    %rax,0x1e8(%rbx,%rdx,1)
 100:	00 
 101:	48 8d 47 10          	lea    0x10(%rdi),%rax
 105:	48 89 83 c0 02 00 00 	mov    %rax,0x2c0(%rbx)
 10c:	e8 00 00 00 00       	call   111 <_ZN4zapi2io4FileD1Ev+0xd1>
 111:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 118 <_ZN4zapi2io4FileD1Ev+0xd8>
 118:	48 89 6b 10          	mov    %rbp,0x10(%rbx)
 11c:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
 120:	48 8d 50 18          	lea    0x18(%rax),%rdx
 124:	48 83 c0 40          	add    $0x40,%rax
 128:	48 89 13             	mov    %rdx,(%rbx)
 12b:	48 89 83 e0 00 00 00 	mov    %rax,0xe0(%rbx)
 132:	e8 00 00 00 00       	call   137 <_ZN4zapi2io4FileD1Ev+0xf7>
 137:	48 8d 4b 58          	lea    0x58(%rbx),%rcx
 13b:	48 83 c6 10          	add    $0x10,%rsi
 13f:	48 83 c7 10          	add    $0x10,%rdi
 143:	e8 00 00 00 00       	call   148 <_ZN4zapi2io4FileD1Ev+0x108>
 148:	48 8d 4b 48          	lea    0x48(%rbx),%rcx
 14c:	48 89 73 10          	mov    %rsi,0x10(%rbx)
 150:	e8 00 00 00 00       	call   155 <_ZN4zapi2io4FileD1Ev+0x115>
 155:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 15c <_ZN4zapi2io4FileD1Ev+0x11c>
 15c:	48 8d 8b e0 00 00 00 	lea    0xe0(%rbx),%rcx
 163:	48 8b 50 08          	mov    0x8(%rax),%rdx
 167:	48 8b 40 10          	mov    0x10(%rax),%rax
 16b:	48 89 13             	mov    %rdx,(%rbx)
 16e:	48 8b 52 e8          	mov    -0x18(%rdx),%rdx
 172:	48 89 04 13          	mov    %rax,(%rbx,%rdx,1)
 176:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
 17d:	00 
 17e:	48 89 bb e0 00 00 00 	mov    %rdi,0xe0(%rbx)
 185:	0f 28 74 24 20       	movaps 0x20(%rsp),%xmm6
 18a:	48 83 c4 38          	add    $0x38,%rsp
 18e:	5b                   	pop    %rbx
 18f:	5e                   	pop    %rsi
 190:	5f                   	pop    %rdi
 191:	5d                   	pop    %rbp
 192:	e9 00 00 00 00       	jmp    197 <_ZN4zapi2io4FileD1Ev+0x157>
 197:	48 89 c1             	mov    %rax,%rcx
 19a:	e8 00 00 00 00       	call   19f <_ZN4zapi2io4FileD1Ev+0x15f>
 19f:	e8 00 00 00 00       	call   1a4 <_ZN4zapi2io4FileD1Ev+0x164>
 1a4:	e9 fa fe ff ff       	jmp    a3 <_ZN4zapi2io4FileD1Ev+0x63>
 1a9:	48 89 c1             	mov    %rax,%rcx
 1ac:	e8 00 00 00 00       	call   1b1 <_ZN4zapi2io4FileD1Ev+0x171>
 1b1:	e8 00 00 00 00       	call   1b6 <_ZN4zapi2io4FileD1Ev+0x176>
 1b6:	e9 7c ff ff ff       	jmp    137 <_ZN4zapi2io4FileD1Ev+0xf7>
 1bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000001c0 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE>:
 1c0:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
 1c7:	0f 29 34 24          	movaps %xmm6,(%rsp)
 1cb:	0f 29 7c 24 10       	movaps %xmm7,0x10(%rsp)
 1d0:	44 0f 29 44 24 20    	movaps %xmm8,0x20(%rsp)
 1d6:	44 0f 29 4c 24 30    	movaps %xmm9,0x30(%rsp)
 1dc:	44 0f 29 54 24 40    	movaps %xmm10,0x40(%rsp)
 1e2:	44 0f 29 5c 24 50    	movaps %xmm11,0x50(%rsp)
 1e8:	44 0f 29 64 24 60    	movaps %xmm12,0x60(%rsp)
 1ee:	44 0f 29 6c 24 70    	movaps %xmm13,0x70(%rsp)
 1f4:	4d 85 c0             	test   %r8,%r8
 1f7:	49 89 d2             	mov    %rdx,%r10
 1fa:	0f 84 05 02 00 00    	je     405 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x245>
 200:	49 8d 40 ff          	lea    -0x1(%r8),%rax
 204:	48 83 f8 0e          	cmp    $0xe,%rax
 208:	0f 86 2f 02 00 00    	jbe    43d <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x27d>
 20e:	48 89 d0             	mov    %rdx,%rax
 211:	4c 89 c2             	mov    %r8,%rdx
 214:	66 0f 6f 15 00 00 00 	movdqa 0x0(%rip),%xmm2        # 21c <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x5c>
 21b:	00 
 21c:	48 83 e2 f0          	and    $0xfffffffffffffff0,%rdx
 220:	66 44 0f 6f 1d 10 00 	movdqa 0x10(%rip),%xmm11        # 239 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x79>
 227:	00 00 
 229:	66 44 0f 6f 15 20 00 	movdqa 0x20(%rip),%xmm10        # 252 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x92>
 230:	00 00 
 232:	49 8d 0c 12          	lea    (%r10,%rdx,1),%rcx
 236:	66 44 0f 6f 0d 30 00 	movdqa 0x30(%rip),%xmm9        # 26f <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0xaf>
 23d:	00 00 
 23f:	66 44 0f 6f 05 40 00 	movdqa 0x40(%rip),%xmm8        # 288 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0xc8>
 246:	00 00 
 248:	66 0f 6f 3d 50 00 00 	movdqa 0x50(%rip),%xmm7        # 2a0 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0xe0>
 24f:	00 
 250:	66 0f 6f 35 60 00 00 	movdqa 0x60(%rip),%xmm6        # 2b8 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0xf8>
 257:	00 
 258:	66 0f 6f 2d 70 00 00 	movdqa 0x70(%rip),%xmm5        # 2d0 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x110>
 25f:	00 
 260:	66 0f 6f 25 80 00 00 	movdqa 0x80(%rip),%xmm4        # 2e8 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x128>
 267:	00 
 268:	66 0f 6f 1d 90 00 00 	movdqa 0x90(%rip),%xmm3        # 300 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x140>
 26f:	00 
 270:	66 44 0f 6f e2       	movdqa %xmm2,%xmm12
 275:	48 83 c0 10          	add    $0x10,%rax
 279:	66 41 0f d4 d3       	paddq  %xmm11,%xmm2
 27e:	66 41 0f 6f cc       	movdqa %xmm12,%xmm1
 283:	66 41 0f 6f c4       	movdqa %xmm12,%xmm0
 288:	66 45 0f 6f ec       	movdqa %xmm12,%xmm13
 28d:	66 41 0f d4 ca       	paddq  %xmm10,%xmm1
 292:	66 45 0f d4 e8       	paddq  %xmm8,%xmm13
 297:	0f c6 c1 88          	shufps $0x88,%xmm1,%xmm0
 29b:	66 41 0f 6f cc       	movdqa %xmm12,%xmm1
 2a0:	66 41 0f d4 c9       	paddq  %xmm9,%xmm1
 2a5:	41 0f c6 cd 88       	shufps $0x88,%xmm13,%xmm1
 2aa:	66 44 0f 6f e8       	movdqa %xmm0,%xmm13
 2af:	66 0f 61 c1          	punpcklwd %xmm1,%xmm0
 2b3:	66 44 0f 69 e9       	punpckhwd %xmm1,%xmm13
 2b8:	66 0f 6f c8          	movdqa %xmm0,%xmm1
 2bc:	66 41 0f 61 c5       	punpcklwd %xmm13,%xmm0
 2c1:	66 41 0f 69 cd       	punpckhwd %xmm13,%xmm1
 2c6:	66 45 0f 6f ec       	movdqa %xmm12,%xmm13
 2cb:	66 0f 61 c1          	punpcklwd %xmm1,%xmm0
 2cf:	66 41 0f 6f cc       	movdqa %xmm12,%xmm1
 2d4:	66 44 0f d4 ee       	paddq  %xmm6,%xmm13
 2d9:	66 0f d4 cf          	paddq  %xmm7,%xmm1
 2dd:	66 0f db c3          	pand   %xmm3,%xmm0
 2e1:	41 0f c6 cd 88       	shufps $0x88,%xmm13,%xmm1
 2e6:	66 45 0f 6f ec       	movdqa %xmm12,%xmm13
 2eb:	66 44 0f d4 e4       	paddq  %xmm4,%xmm12
 2f0:	66 44 0f d4 ed       	paddq  %xmm5,%xmm13
 2f5:	45 0f c6 ec 88       	shufps $0x88,%xmm12,%xmm13
 2fa:	66 44 0f 6f e1       	movdqa %xmm1,%xmm12
 2ff:	66 41 0f 61 cd       	punpcklwd %xmm13,%xmm1
 304:	66 45 0f 69 e5       	punpckhwd %xmm13,%xmm12
 309:	66 44 0f 6f e9       	movdqa %xmm1,%xmm13
 30e:	66 41 0f 61 cc       	punpcklwd %xmm12,%xmm1
 313:	66 45 0f 69 ec       	punpckhwd %xmm12,%xmm13
 318:	66 41 0f 61 cd       	punpcklwd %xmm13,%xmm1
 31d:	66 0f db cb          	pand   %xmm3,%xmm1
 321:	66 0f 67 c1          	packuswb %xmm1,%xmm0
 325:	0f 11 40 f0          	movups %xmm0,-0x10(%rax)
 329:	48 39 c8             	cmp    %rcx,%rax
 32c:	0f 85 3e ff ff ff    	jne    270 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0xb0>
 332:	49 39 d0             	cmp    %rdx,%r8
 335:	0f 84 ca 00 00 00    	je     405 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x245>
 33b:	48 8d 42 01          	lea    0x1(%rdx),%rax
 33f:	41 88 14 12          	mov    %dl,(%r10,%rdx,1)
 343:	4c 39 c0             	cmp    %r8,%rax
 346:	0f 83 b9 00 00 00    	jae    405 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x245>
 34c:	41 88 04 02          	mov    %al,(%r10,%rax,1)
 350:	48 8d 42 02          	lea    0x2(%rdx),%rax
 354:	4c 39 c0             	cmp    %r8,%rax
 357:	0f 83 a8 00 00 00    	jae    405 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x245>
 35d:	41 88 04 02          	mov    %al,(%r10,%rax,1)
 361:	48 8d 42 03          	lea    0x3(%rdx),%rax
 365:	4c 39 c0             	cmp    %r8,%rax
 368:	0f 83 97 00 00 00    	jae    405 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x245>
 36e:	41 88 04 02          	mov    %al,(%r10,%rax,1)
 372:	48 8d 42 04          	lea    0x4(%rdx),%rax
 376:	4c 39 c0             	cmp    %r8,%rax
 379:	0f 83 86 00 00 00    	jae    405 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x245>
 37f:	41 88 04 02          	mov    %al,(%r10,%rax,1)
 383:	48 8d 42 05          	lea    0x5(%rdx),%rax
 387:	4c 39 c0             	cmp    %r8,%rax
 38a:	73 79                	jae    405 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x245>
 38c:	41 88 04 02          	mov    %al,(%r10,%rax,1)
 390:	48 8d 42 06          	lea    0x6(%rdx),%rax
 394:	4c 39 c0             	cmp    %r8,%rax
 397:	73 6c                	jae    405 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x245>
 399:	41 88 04 02          	mov    %al,(%r10,%rax,1)
 39d:	48 8d 42 07          	lea    0x7(%rdx),%rax
 3a1:	4c 39 c0             	cmp    %r8,%rax
 3a4:	73 5f                	jae    405 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x245>
 3a6:	41 88 04 02          	mov    %al,(%r10,%rax,1)
 3aa:	48 8d 42 08          	lea    0x8(%rdx),%rax
 3ae:	4c 39 c0             	cmp    %r8,%rax
 3b1:	73 52                	jae    405 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x245>
 3b3:	41 88 04 02          	mov    %al,(%r10,%rax,1)
 3b7:	48 8d 42 09          	lea    0x9(%rdx),%rax
 3bb:	4c 39 c0             	cmp    %r8,%rax
 3be:	73 45                	jae    405 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x245>
 3c0:	41 88 04 02          	mov    %al,(%r10,%rax,1)
 3c4:	48 8d 42 0a          	lea    0xa(%rdx),%rax
 3c8:	4c 39 c0             	cmp    %r8,%rax
 3cb:	73 38                	jae    405 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x245>
 3cd:	41 88 04 02          	mov    %al,(%r10,%rax,1)
 3d1:	48 8d 42 0b          	lea    0xb(%rdx),%rax
 3d5:	4c 39 c0             	cmp    %r8,%rax
 3d8:	73 2b                	jae    405 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x245>
 3da:	41 88 04 02          	mov    %al,(%r10,%rax,1)
 3de:	48 8d 42 0c          	lea    0xc(%rdx),%rax
 3e2:	4c 39 c0             	cmp    %r8,%rax
 3e5:	73 1e                	jae    405 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x245>
 3e7:	41 88 04 02          	mov    %al,(%r10,%rax,1)
 3eb:	48 8d 42 0d          	lea    0xd(%rdx),%rax
 3ef:	4c 39 c0             	cmp    %r8,%rax
 3f2:	73 11                	jae    405 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x245>
 3f4:	48 83 c2 0e          	add    $0xe,%rdx
 3f8:	41 88 04 02          	mov    %al,(%r10,%rax,1)
 3fc:	4c 39 c2             	cmp    %r8,%rdx
 3ff:	73 04                	jae    405 <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x245>
 401:	41 88 14 12          	mov    %dl,(%r10,%rdx,1)
 405:	0f 28 34 24          	movaps (%rsp),%xmm6
 409:	4d 89 01             	mov    %r8,(%r9)
 40c:	0f 28 7c 24 10       	movaps 0x10(%rsp),%xmm7
 411:	44 0f 28 44 24 20    	movaps 0x20(%rsp),%xmm8
 417:	44 0f 28 4c 24 30    	movaps 0x30(%rsp),%xmm9
 41d:	44 0f 28 54 24 40    	movaps 0x40(%rsp),%xmm10
 423:	44 0f 28 5c 24 50    	movaps 0x50(%rsp),%xmm11
 429:	44 0f 28 64 24 60    	movaps 0x60(%rsp),%xmm12
 42f:	44 0f 28 6c 24 70    	movaps 0x70(%rsp),%xmm13
 435:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
 43c:	c3                   	ret
 43d:	31 d2                	xor    %edx,%edx
 43f:	e9 f7 fe ff ff       	jmp    33b <_ZN4zapi5codec3zap6EncodeEPKvPvyRyyNS1_4TypeE+0x17b>
 444:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
 44b:	00 00 00 00 
 44f:	90                   	nop

0000000000000450 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>:
 450:	41 57                	push   %r15
 452:	41 56                	push   %r14
 454:	41 55                	push   %r13
 456:	41 54                	push   %r12
 458:	55                   	push   %rbp
 459:	57                   	push   %rdi
 45a:	56                   	push   %rsi
 45b:	53                   	push   %rbx
 45c:	48 81 ec 48 02 00 00 	sub    $0x248,%rsp
 463:	48 8d a9 e0 00 00 00 	lea    0xe0(%rcx),%rbp
 46a:	48 89 cb             	mov    %rcx,%rbx
 46d:	48 89 94 24 98 02 00 	mov    %rdx,0x298(%rsp)
 474:	00 
 475:	48 89 e9             	mov    %rbp,%rcx
 478:	e8 00 00 00 00       	call   47d <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x2d>
 47d:	45 31 d2             	xor    %r10d,%r10d
 480:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 487 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x37>
 487:	31 d2                	xor    %edx,%edx
 489:	66 44 89 93 c0 01 00 	mov    %r10w,0x1c0(%rbx)
 490:	00 
 491:	66 0f ef c0          	pxor   %xmm0,%xmm0
 495:	0f 11 83 c8 01 00 00 	movups %xmm0,0x1c8(%rbx)
 49c:	0f 11 83 d8 01 00 00 	movups %xmm0,0x1d8(%rbx)
 4a3:	48 c7 83 b8 01 00 00 	movq   $0x0,0x1b8(%rbx)
 4aa:	00 00 00 00 
 4ae:	48 83 c0 10          	add    $0x10,%rax
 4b2:	48 89 83 e0 00 00 00 	mov    %rax,0xe0(%rbx)
 4b9:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 4c0 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x70>
 4c0:	48 8b 70 08          	mov    0x8(%rax),%rsi
 4c4:	4c 8b 68 10          	mov    0x10(%rax),%r13
 4c8:	48 8b 46 e8          	mov    -0x18(%rsi),%rax
 4cc:	48 89 33             	mov    %rsi,(%rbx)
 4cf:	4c 89 2c 03          	mov    %r13,(%rbx,%rax,1)
 4d3:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
 4da:	00 
 4db:	48 8b 4e e8          	mov    -0x18(%rsi),%rcx
 4df:	48 01 d9             	add    %rbx,%rcx
 4e2:	e8 00 00 00 00       	call   4e7 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x97>
 4e7:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 4ee <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x9e>
 4ee:	48 8d 47 18          	lea    0x18(%rdi),%rax
 4f2:	48 89 03             	mov    %rax,(%rbx)
 4f5:	48 8d 47 40          	lea    0x40(%rdi),%rax
 4f9:	48 89 83 e0 00 00 00 	mov    %rax,0xe0(%rbx)
 500:	48 8d 43 10          	lea    0x10(%rbx),%rax
 504:	48 89 c1             	mov    %rax,%rcx
 507:	49 89 c6             	mov    %rax,%r14
 50a:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
 50f:	e8 00 00 00 00       	call   514 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xc4>
 514:	4c 89 f2             	mov    %r14,%rdx
 517:	48 89 e9             	mov    %rbp,%rcx
 51a:	e8 00 00 00 00       	call   51f <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xcf>
 51f:	4c 8d a3 c0 02 00 00 	lea    0x2c0(%rbx),%r12
 526:	4c 8d b3 e8 01 00 00 	lea    0x1e8(%rbx),%r14
 52d:	4c 89 e1             	mov    %r12,%rcx
 530:	4c 89 74 24 38       	mov    %r14,0x38(%rsp)
 535:	e8 00 00 00 00       	call   53a <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xea>
 53a:	45 31 c0             	xor    %r8d,%r8d
 53d:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 544 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xf4>
 544:	31 d2                	xor    %edx,%edx
 546:	66 44 89 83 a0 03 00 	mov    %r8w,0x3a0(%rbx)
 54d:	00 
 54e:	66 0f ef c0          	pxor   %xmm0,%xmm0
 552:	0f 11 83 a8 03 00 00 	movups %xmm0,0x3a8(%rbx)
 559:	0f 11 83 b8 03 00 00 	movups %xmm0,0x3b8(%rbx)
 560:	48 c7 83 98 03 00 00 	movq   $0x0,0x398(%rbx)
 567:	00 00 00 00 
 56b:	48 83 c0 10          	add    $0x10,%rax
 56f:	48 89 83 c0 02 00 00 	mov    %rax,0x2c0(%rbx)
 576:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 57d <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x12d>
 57d:	48 8b 68 08          	mov    0x8(%rax),%rbp
 581:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
 585:	48 89 ab e8 01 00 00 	mov    %rbp,0x1e8(%rbx)
 58c:	4c 01 f1             	add    %r14,%rcx
 58f:	4c 8b 70 10          	mov    0x10(%rax),%r14
 593:	4c 89 31             	mov    %r14,(%rcx)
 596:	e8 00 00 00 00       	call   59b <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x14b>
 59b:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 5a2 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x152>
 5a2:	4c 8d bb f0 01 00 00 	lea    0x1f0(%rbx),%r15
 5a9:	4c 89 f9             	mov    %r15,%rcx
 5ac:	48 8d 50 18          	lea    0x18(%rax),%rdx
 5b0:	48 83 c0 40          	add    $0x40,%rax
 5b4:	48 89 93 e8 01 00 00 	mov    %rdx,0x1e8(%rbx)
 5bb:	48 89 83 c0 02 00 00 	mov    %rax,0x2c0(%rbx)
 5c2:	e8 00 00 00 00       	call   5c7 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x177>
 5c7:	4c 89 fa             	mov    %r15,%rdx
 5ca:	4c 89 e1             	mov    %r12,%rcx
 5cd:	e8 00 00 00 00       	call   5d2 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x182>
 5d2:	48 c7 83 c8 03 00 00 	movq   $0x0,0x3c8(%rbx)
 5d9:	00 00 00 00 
 5dd:	4c 8d bc 24 30 01 00 	lea    0x130(%rsp),%r15
 5e4:	00 
 5e5:	4c 89 7c 24 30       	mov    %r15,0x30(%rsp)
 5ea:	4c 8d 74 24 50       	lea    0x50(%rsp),%r14
 5ef:	4c 89 f9             	mov    %r15,%rcx
 5f2:	48 c7 83 d0 03 00 00 	movq   $0x0,0x3d0(%rbx)
 5f9:	00 00 00 00 
 5fd:	e8 00 00 00 00       	call   602 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x1b2>
 602:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 609 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x1b9>
 609:	31 c9                	xor    %ecx,%ecx
 60b:	31 d2                	xor    %edx,%edx
 60d:	66 89 8c 24 10 02 00 	mov    %cx,0x210(%rsp)
 614:	00 
 615:	66 0f ef c0          	pxor   %xmm0,%xmm0
 619:	0f 11 84 24 18 02 00 	movups %xmm0,0x218(%rsp)
 620:	00 
 621:	0f 11 84 24 28 02 00 	movups %xmm0,0x228(%rsp)
 628:	00 
 629:	48 83 c0 10          	add    $0x10,%rax
 62d:	48 89 74 24 50       	mov    %rsi,0x50(%rsp)
 632:	48 89 84 24 30 01 00 	mov    %rax,0x130(%rsp)
 639:	00 
 63a:	48 8b 46 e8          	mov    -0x18(%rsi),%rax
 63e:	48 c7 84 24 08 02 00 	movq   $0x0,0x208(%rsp)
 645:	00 00 00 00 00 
 64a:	4c 89 6c 04 50       	mov    %r13,0x50(%rsp,%rax,1)
 64f:	48 c7 44 24 58 00 00 	movq   $0x0,0x58(%rsp)
 656:	00 00 
 658:	48 8b 4e e8          	mov    -0x18(%rsi),%rcx
 65c:	4c 01 f1             	add    %r14,%rcx
 65f:	e8 00 00 00 00       	call   664 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x214>
 664:	48 8d 47 18          	lea    0x18(%rdi),%rax
 668:	48 8d 6c 24 60       	lea    0x60(%rsp),%rbp
 66d:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
 672:	48 8d 47 40          	lea    0x40(%rdi),%rax
 676:	48 89 e9             	mov    %rbp,%rcx
 679:	48 89 84 24 30 01 00 	mov    %rax,0x130(%rsp)
 680:	00 
 681:	e8 00 00 00 00       	call   686 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x236>
 686:	48 89 ea             	mov    %rbp,%rdx
 689:	4c 89 f9             	mov    %r15,%rcx
 68c:	e8 00 00 00 00       	call   691 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x241>
 691:	48 8b 84 24 98 02 00 	mov    0x298(%rsp),%rax
 698:	00 
 699:	41 b8 0c 00 00 00    	mov    $0xc,%r8d
 69f:	48 89 e9             	mov    %rbp,%rcx
 6a2:	48 8b 10             	mov    (%rax),%rdx
 6a5:	e8 00 00 00 00       	call   6aa <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x25a>
 6aa:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
 6af:	48 8b 4a e8          	mov    -0x18(%rdx),%rcx
 6b3:	4c 01 f1             	add    %r14,%rcx
 6b6:	48 85 c0             	test   %rax,%rax
 6b9:	0f 84 d9 01 00 00    	je     898 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x448>
 6bf:	31 d2                	xor    %edx,%edx
 6c1:	e8 00 00 00 00       	call   6c6 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x276>
 6c6:	48 8b 03             	mov    (%rbx),%rax
 6c9:	4c 8b 60 e8          	mov    -0x18(%rax),%r12
 6cd:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
 6d2:	49 01 dc             	add    %rbx,%r12
 6d5:	4c 8b 78 e8          	mov    -0x18(%rax),%r15
 6d9:	4c 89 e1             	mov    %r12,%rcx
 6dc:	4d 01 f7             	add    %r14,%r15
 6df:	4c 89 fa             	mov    %r15,%rdx
 6e2:	e8 00 00 00 00       	call   6e7 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x297>
 6e7:	49 8d 94 24 d0 00 00 	lea    0xd0(%r12),%rdx
 6ee:	00 
 6ef:	4c 89 e1             	mov    %r12,%rcx
 6f2:	e8 00 00 00 00       	call   6f7 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x2a7>
 6f7:	49 8d 97 d0 00 00 00 	lea    0xd0(%r15),%rdx
 6fe:	4c 89 f9             	mov    %r15,%rcx
 701:	e8 00 00 00 00       	call   706 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x2b6>
 706:	49 8b 94 24 d8 00 00 	mov    0xd8(%r12),%rdx
 70d:	00 
 70e:	49 8b 8f d8 00 00 00 	mov    0xd8(%r15),%rcx
 715:	49 89 97 d8 00 00 00 	mov    %rdx,0xd8(%r15)
 71c:	41 0f b6 94 24 e0 00 	movzbl 0xe0(%r12),%edx
 723:	00 00 
 725:	49 89 8c 24 d8 00 00 	mov    %rcx,0xd8(%r12)
 72c:	00 
 72d:	41 0f b6 8f e0 00 00 	movzbl 0xe0(%r15),%ecx
 734:	00 
 735:	41 88 97 e0 00 00 00 	mov    %dl,0xe0(%r15)
 73c:	41 0f b6 94 24 e1 00 	movzbl 0xe1(%r12),%edx
 743:	00 00 
 745:	41 88 8c 24 e0 00 00 	mov    %cl,0xe0(%r12)
 74c:	00 
 74d:	41 0f b6 8f e1 00 00 	movzbl 0xe1(%r15),%ecx
 754:	00 
 755:	48 8b 43 08          	mov    0x8(%rbx),%rax
 759:	41 88 97 e1 00 00 00 	mov    %dl,0xe1(%r15)
 760:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
 765:	41 88 8c 24 e1 00 00 	mov    %cl,0xe1(%r12)
 76c:	00 
 76d:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
 772:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
 777:	48 89 53 08          	mov    %rdx,0x8(%rbx)
 77b:	48 89 ea             	mov    %rbp,%rdx
 77e:	e8 00 00 00 00       	call   783 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x333>
 783:	48 8d 47 18          	lea    0x18(%rdi),%rax
 787:	48 89 e9             	mov    %rbp,%rcx
 78a:	48 83 c7 40          	add    $0x40,%rdi
 78e:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
 793:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 79a <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x34a>
 79a:	48 89 bc 24 30 01 00 	mov    %rdi,0x130(%rsp)
 7a1:	00 
 7a2:	48 83 c0 10          	add    $0x10,%rax
 7a6:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
 7ab:	e8 00 00 00 00       	call   7b0 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x360>
 7b0:	48 8d 8c 24 a8 00 00 	lea    0xa8(%rsp),%rcx
 7b7:	00 
 7b8:	e8 00 00 00 00       	call   7bd <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x36d>
 7bd:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 7c4 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x374>
 7c4:	48 8d 8c 24 98 00 00 	lea    0x98(%rsp),%rcx
 7cb:	00 
 7cc:	48 83 c0 10          	add    $0x10,%rax
 7d0:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
 7d5:	e8 00 00 00 00       	call   7da <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x38a>
 7da:	48 8b 46 e8          	mov    -0x18(%rsi),%rax
 7de:	48 89 74 24 50       	mov    %rsi,0x50(%rsp)
 7e3:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
 7e8:	4c 89 6c 04 50       	mov    %r13,0x50(%rsp,%rax,1)
 7ed:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 7f4 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3a4>
 7f4:	48 c7 44 24 58 00 00 	movq   $0x0,0x58(%rsp)
 7fb:	00 00 
 7fd:	48 83 c0 10          	add    $0x10,%rax
 801:	48 89 84 24 30 01 00 	mov    %rax,0x130(%rsp)
 808:	00 
 809:	e8 00 00 00 00       	call   80e <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3be>
 80e:	41 b8 02 00 00 00    	mov    $0x2,%r8d
 814:	31 d2                	xor    %edx,%edx
 816:	48 89 d9             	mov    %rbx,%rcx
 819:	e8 00 00 00 00       	call   81e <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3ce>
 81e:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
 823:	48 89 da             	mov    %rbx,%rdx
 826:	e8 00 00 00 00       	call   82b <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3db>
 82b:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
 830:	45 31 c0             	xor    %r8d,%r8d
 833:	31 d2                	xor    %edx,%edx
 835:	48 89 d9             	mov    %rbx,%rcx
 838:	48 89 83 c8 03 00 00 	mov    %rax,0x3c8(%rbx)
 83f:	e8 00 00 00 00       	call   844 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3f4>
 844:	48 8b b3 c8 03 00 00 	mov    0x3c8(%rbx),%rsi
 84b:	31 d2                	xor    %edx,%edx
 84d:	48 85 f6             	test   %rsi,%rsi
 850:	74 0b                	je     85d <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x40d>
 852:	48 89 f1             	mov    %rsi,%rcx
 855:	e8 00 00 00 00       	call   85a <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x40a>
 85a:	48 89 c2             	mov    %rax,%rdx
 85d:	48 89 93 d0 03 00 00 	mov    %rdx,0x3d0(%rbx)
 864:	49 89 f0             	mov    %rsi,%r8
 867:	48 89 d9             	mov    %rbx,%rcx
 86a:	e8 00 00 00 00       	call   86f <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x41f>
 86f:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
 874:	e8 00 00 00 00       	call   879 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x429>
 879:	48 85 c0             	test   %rax,%rax
 87c:	74 32                	je     8b0 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x460>
 87e:	48 81 c4 48 02 00 00 	add    $0x248,%rsp
 885:	5b                   	pop    %rbx
 886:	5e                   	pop    %rsi
 887:	5f                   	pop    %rdi
 888:	5d                   	pop    %rbp
 889:	41 5c                	pop    %r12
 88b:	41 5d                	pop    %r13
 88d:	41 5e                	pop    %r14
 88f:	41 5f                	pop    %r15
 891:	c3                   	ret
 892:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
 898:	8b 51 20             	mov    0x20(%rcx),%edx
 89b:	83 ca 04             	or     $0x4,%edx
 89e:	e8 00 00 00 00       	call   8a3 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x453>
 8a3:	e9 1e fe ff ff       	jmp    6c6 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x276>
 8a8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 8af:	00 
 8b0:	48 8b 03             	mov    (%rbx),%rax
 8b3:	48 8b 48 e8          	mov    -0x18(%rax),%rcx
 8b7:	48 01 d9             	add    %rbx,%rcx
 8ba:	8b 51 20             	mov    0x20(%rcx),%edx
 8bd:	83 ca 04             	or     $0x4,%edx
 8c0:	e8 00 00 00 00       	call   8c5 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x475>
 8c5:	eb b7                	jmp    87e <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x42e>
 8c7:	48 89 c6             	mov    %rax,%rsi
 8ca:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 8d1 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x481>
 8d1:	48 89 e9             	mov    %rbp,%rcx
 8d4:	48 83 c0 10          	add    $0x10,%rax
 8d8:	48 89 83 e0 00 00 00 	mov    %rax,0xe0(%rbx)
 8df:	e8 00 00 00 00       	call   8e4 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x494>
 8e4:	48 89 f1             	mov    %rsi,%rcx
 8e7:	e8 00 00 00 00       	call   8ec <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x49c>
 8ec:	48 8b 56 e8          	mov    -0x18(%rsi),%rdx
 8f0:	48 89 74 24 50       	mov    %rsi,0x50(%rsp)
 8f5:	48 89 c6             	mov    %rax,%rsi
 8f8:	4c 89 6c 14 50       	mov    %r13,0x50(%rsp,%rdx,1)
 8fd:	31 d2                	xor    %edx,%edx
 8ff:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
 904:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 90b <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x4bb>
 90b:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
 910:	48 83 c0 10          	add    $0x10,%rax
 914:	48 89 84 24 30 01 00 	mov    %rax,0x130(%rsp)
 91b:	00 
 91c:	e8 00 00 00 00       	call   921 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x4d1>
 921:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
 926:	e8 00 00 00 00       	call   92b <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x4db>
 92b:	48 89 d9             	mov    %rbx,%rcx
 92e:	e8 00 00 00 00       	call   933 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x4e3>
 933:	48 89 f1             	mov    %rsi,%rcx
 936:	e8 00 00 00 00       	call   93b <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x4eb>
 93b:	48 89 c6             	mov    %rax,%rsi
 93e:	eb c4                	jmp    904 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x4b4>
 940:	4c 89 f9             	mov    %r15,%rcx
 943:	48 89 c6             	mov    %rax,%rsi
 946:	e8 00 00 00 00       	call   94b <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x4fb>
 94b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 94f:	48 89 ab e8 01 00 00 	mov    %rbp,0x1e8(%rbx)
 956:	4c 89 b4 03 e8 01 00 	mov    %r14,0x1e8(%rbx,%rax,1)
 95d:	00 
 95e:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 965 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x515>
 965:	4c 89 e1             	mov    %r12,%rcx
 968:	48 83 c0 10          	add    $0x10,%rax
 96c:	48 89 83 c0 02 00 00 	mov    %rax,0x2c0(%rbx)
 973:	e8 00 00 00 00       	call   978 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x528>
 978:	eb b1                	jmp    92b <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x4db>
 97a:	48 89 c6             	mov    %rax,%rsi
 97d:	eb cc                	jmp    94b <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x4fb>
 97f:	48 89 c7             	mov    %rax,%rdi
 982:	48 89 e9             	mov    %rbp,%rcx
 985:	e8 00 00 00 00       	call   98a <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x53a>
 98a:	48 89 f8             	mov    %rdi,%rax
 98d:	e9 5a ff ff ff       	jmp    8ec <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x49c>
 992:	48 89 c6             	mov    %rax,%rsi
 995:	eb 8a                	jmp    921 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x4d1>
 997:	48 89 c1             	mov    %rax,%rcx
 99a:	e8 00 00 00 00       	call   99f <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x54f>
 99f:	e8 00 00 00 00       	call   9a4 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x554>
 9a4:	e9 07 fe ff ff       	jmp    7b0 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x360>
 9a9:	4c 89 f1             	mov    %r14,%rcx
 9ac:	48 89 c6             	mov    %rax,%rsi
 9af:	e8 00 00 00 00       	call   9b4 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x564>
 9b4:	e9 68 ff ff ff       	jmp    921 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x4d1>
 9b9:	48 89 c6             	mov    %rax,%rsi
 9bc:	eb a0                	jmp    95e <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x50e>
 9be:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
 9c3:	48 89 c7             	mov    %rax,%rdi
 9c6:	e8 00 00 00 00       	call   9cb <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x57b>
 9cb:	48 89 f8             	mov    %rdi,%rax
 9ce:	48 8b 56 e8          	mov    -0x18(%rsi),%rdx
 9d2:	45 31 c9             	xor    %r9d,%r9d
 9d5:	48 89 33             	mov    %rsi,(%rbx)
 9d8:	48 89 c6             	mov    %rax,%rsi
 9db:	4c 89 2c 13          	mov    %r13,(%rbx,%rdx,1)
 9df:	4c 89 4b 08          	mov    %r9,0x8(%rbx)
 9e3:	e9 e2 fe ff ff       	jmp    8ca <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x47a>
 9e8:	eb e4                	jmp    9ce <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x57e>
 9ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000009f0 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy>:
 9f0:	41 57                	push   %r15
 9f2:	41 56                	push   %r14
 9f4:	41 55                	push   %r13
 9f6:	41 54                	push   %r12
 9f8:	55                   	push   %rbp
 9f9:	57                   	push   %rdi
 9fa:	56                   	push   %rsi
 9fb:	53                   	push   %rbx
 9fc:	48 81 ec 38 02 00 00 	sub    $0x238,%rsp
 a03:	0f 29 b4 24 20 02 00 	movaps %xmm6,0x220(%rsp)
 a0a:	00 
 a0b:	48 8d b9 e0 00 00 00 	lea    0xe0(%rcx),%rdi
 a12:	48 89 cb             	mov    %rcx,%rbx
 a15:	49 89 d7             	mov    %rdx,%r15
 a18:	4c 89 84 24 90 02 00 	mov    %r8,0x290(%rsp)
 a1f:	00 
 a20:	48 89 f9             	mov    %rdi,%rcx
 a23:	4c 89 8c 24 98 02 00 	mov    %r9,0x298(%rsp)
 a2a:	00 
 a2b:	e8 00 00 00 00       	call   a30 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x40>
 a30:	45 31 c0             	xor    %r8d,%r8d
 a33:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # a3a <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x4a>
 a3a:	31 d2                	xor    %edx,%edx
 a3c:	66 44 89 83 c0 01 00 	mov    %r8w,0x1c0(%rbx)
 a43:	00 
 a44:	66 0f ef c0          	pxor   %xmm0,%xmm0
 a48:	0f 11 83 c8 01 00 00 	movups %xmm0,0x1c8(%rbx)
 a4f:	0f 11 83 d8 01 00 00 	movups %xmm0,0x1d8(%rbx)
 a56:	48 c7 83 b8 01 00 00 	movq   $0x0,0x1b8(%rbx)
 a5d:	00 00 00 00 
 a61:	48 83 c0 10          	add    $0x10,%rax
 a65:	48 89 83 e0 00 00 00 	mov    %rax,0xe0(%rbx)
 a6c:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # a73 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x83>
 a73:	48 8b 70 08          	mov    0x8(%rax),%rsi
 a77:	4c 8b 60 10          	mov    0x10(%rax),%r12
 a7b:	48 8b 46 e8          	mov    -0x18(%rsi),%rax
 a7f:	48 89 33             	mov    %rsi,(%rbx)
 a82:	4c 89 24 03          	mov    %r12,(%rbx,%rax,1)
 a86:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
 a8d:	00 
 a8e:	48 8b 4e e8          	mov    -0x18(%rsi),%rcx
 a92:	48 01 d9             	add    %rbx,%rcx
 a95:	e8 00 00 00 00       	call   a9a <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0xaa>
 a9a:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # aa1 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0xb1>
 aa1:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
 aa5:	48 89 e9             	mov    %rbp,%rcx
 aa8:	48 8d 50 18          	lea    0x18(%rax),%rdx
 aac:	48 83 c0 40          	add    $0x40,%rax
 ab0:	48 89 13             	mov    %rdx,(%rbx)
 ab3:	48 89 83 e0 00 00 00 	mov    %rax,0xe0(%rbx)
 aba:	e8 00 00 00 00       	call   abf <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0xcf>
 abf:	48 89 ea             	mov    %rbp,%rdx
 ac2:	48 89 f9             	mov    %rdi,%rcx
 ac5:	e8 00 00 00 00       	call   aca <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0xda>
 aca:	48 8d ab c0 02 00 00 	lea    0x2c0(%rbx),%rbp
 ad1:	4c 8d a3 e8 01 00 00 	lea    0x1e8(%rbx),%r12
 ad8:	48 89 e9             	mov    %rbp,%rcx
 adb:	e8 00 00 00 00       	call   ae0 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0xf0>
 ae0:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # ae7 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0xf7>
 ae7:	31 d2                	xor    %edx,%edx
 ae9:	66 0f ef c0          	pxor   %xmm0,%xmm0
 aed:	66 89 93 a0 03 00 00 	mov    %dx,0x3a0(%rbx)
 af4:	31 d2                	xor    %edx,%edx
 af6:	0f 11 83 a8 03 00 00 	movups %xmm0,0x3a8(%rbx)
 afd:	0f 11 83 b8 03 00 00 	movups %xmm0,0x3b8(%rbx)
 b04:	48 c7 83 98 03 00 00 	movq   $0x0,0x398(%rbx)
 b0b:	00 00 00 00 
 b0f:	48 83 c0 10          	add    $0x10,%rax
 b13:	48 89 83 c0 02 00 00 	mov    %rax,0x2c0(%rbx)
 b1a:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # b21 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x131>
 b21:	48 8b 78 08          	mov    0x8(%rax),%rdi
 b25:	4c 8b 68 10          	mov    0x10(%rax),%r13
 b29:	48 8b 4f e8          	mov    -0x18(%rdi),%rcx
 b2d:	48 89 bb e8 01 00 00 	mov    %rdi,0x1e8(%rbx)
 b34:	4c 01 e1             	add    %r12,%rcx
 b37:	4c 89 29             	mov    %r13,(%rcx)
 b3a:	e8 00 00 00 00       	call   b3f <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x14f>
 b3f:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # b46 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x156>
 b46:	48 8d 46 18          	lea    0x18(%rsi),%rax
 b4a:	48 89 83 e8 01 00 00 	mov    %rax,0x1e8(%rbx)
 b51:	48 8d 46 40          	lea    0x40(%rsi),%rax
 b55:	48 89 83 c0 02 00 00 	mov    %rax,0x2c0(%rbx)
 b5c:	48 8d 83 f0 01 00 00 	lea    0x1f0(%rbx),%rax
 b63:	48 89 c1             	mov    %rax,%rcx
 b66:	49 89 c6             	mov    %rax,%r14
 b69:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
 b6e:	e8 00 00 00 00       	call   b73 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x183>
 b73:	4c 89 f2             	mov    %r14,%rdx
 b76:	48 89 e9             	mov    %rbp,%rcx
 b79:	e8 00 00 00 00       	call   b7e <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x18e>
 b7e:	48 c7 83 c8 03 00 00 	movq   $0x0,0x3c8(%rbx)
 b85:	00 00 00 00 
 b89:	48 8d 84 24 18 01 00 	lea    0x118(%rsp),%rax
 b90:	00 
 b91:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
 b96:	4c 8d 74 24 40       	lea    0x40(%rsp),%r14
 b9b:	48 89 c1             	mov    %rax,%rcx
 b9e:	48 c7 83 d0 03 00 00 	movq   $0x0,0x3d0(%rbx)
 ba5:	00 00 00 00 
 ba9:	e8 00 00 00 00       	call   bae <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x1be>
 bae:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # bb5 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x1c5>
 bb5:	66 0f ef c0          	pxor   %xmm0,%xmm0
 bb9:	0f 29 84 24 00 02 00 	movaps %xmm0,0x200(%rsp)
 bc0:	00 
 bc1:	0f 29 84 24 10 02 00 	movaps %xmm0,0x210(%rsp)
 bc8:	00 
 bc9:	48 c7 84 24 f0 01 00 	movq   $0x0,0x1f0(%rsp)
 bd0:	00 00 00 00 00 
 bd5:	48 89 7c 24 40       	mov    %rdi,0x40(%rsp)
 bda:	48 8d 42 10          	lea    0x10(%rdx),%rax
 bde:	48 89 84 24 18 01 00 	mov    %rax,0x118(%rsp)
 be5:	00 
 be6:	31 c0                	xor    %eax,%eax
 be8:	66 89 84 24 f8 01 00 	mov    %ax,0x1f8(%rsp)
 bef:	00 
 bf0:	48 8b 57 e8          	mov    -0x18(%rdi),%rdx
 bf4:	4c 01 f2             	add    %r14,%rdx
 bf7:	48 89 d1             	mov    %rdx,%rcx
 bfa:	4c 89 2a             	mov    %r13,(%rdx)
 bfd:	31 d2                	xor    %edx,%edx
 bff:	e8 00 00 00 00       	call   c04 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x214>
 c04:	48 8d 46 18          	lea    0x18(%rsi),%rax
 c08:	48 8d 6c 24 48       	lea    0x48(%rsp),%rbp
 c0d:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
 c12:	48 8d 46 40          	lea    0x40(%rsi),%rax
 c16:	48 89 e9             	mov    %rbp,%rcx
 c19:	48 89 6c 24 30       	mov    %rbp,0x30(%rsp)
 c1e:	48 89 84 24 18 01 00 	mov    %rax,0x118(%rsp)
 c25:	00 
 c26:	e8 00 00 00 00       	call   c2b <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x23b>
 c2b:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
 c30:	48 89 ea             	mov    %rbp,%rdx
 c33:	e8 00 00 00 00       	call   c38 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x248>
 c38:	49 8b 17             	mov    (%r15),%rdx
 c3b:	41 b8 14 00 00 00    	mov    $0x14,%r8d
 c41:	48 89 e9             	mov    %rbp,%rcx
 c44:	e8 00 00 00 00       	call   c49 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x259>
 c49:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
 c4e:	48 8b 4a e8          	mov    -0x18(%rdx),%rcx
 c52:	4c 01 f1             	add    %r14,%rcx
 c55:	48 85 c0             	test   %rax,%rax
 c58:	0f 84 82 01 00 00    	je     de0 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x3f0>
 c5e:	31 d2                	xor    %edx,%edx
 c60:	e8 00 00 00 00       	call   c65 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x275>
 c65:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # c6c <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x27c>
 c6c:	48 8d 56 18          	lea    0x18(%rsi),%rdx
 c70:	66 48 0f 6e f2       	movq   %rdx,%xmm6
 c75:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
 c7a:	48 83 c0 10          	add    $0x10,%rax
 c7e:	66 48 0f 6e c8       	movq   %rax,%xmm1
 c83:	48 8b 83 e8 01 00 00 	mov    0x1e8(%rbx),%rax
 c8a:	4c 8b 7a e8          	mov    -0x18(%rdx),%r15
 c8e:	66 0f 6c f1          	punpcklqdq %xmm1,%xmm6
 c92:	48 8b 68 e8          	mov    -0x18(%rax),%rbp
 c96:	4d 01 f7             	add    %r14,%r15
 c99:	4c 89 fa             	mov    %r15,%rdx
 c9c:	4c 01 e5             	add    %r12,%rbp
 c9f:	48 89 e9             	mov    %rbp,%rcx
 ca2:	e8 00 00 00 00       	call   ca7 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x2b7>
 ca7:	48 8d 95 d0 00 00 00 	lea    0xd0(%rbp),%rdx
 cae:	48 89 e9             	mov    %rbp,%rcx
 cb1:	e8 00 00 00 00       	call   cb6 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x2c6>
 cb6:	49 8d 97 d0 00 00 00 	lea    0xd0(%r15),%rdx
 cbd:	4c 89 f9             	mov    %r15,%rcx
 cc0:	e8 00 00 00 00       	call   cc5 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x2d5>
 cc5:	48 8b 95 d8 00 00 00 	mov    0xd8(%rbp),%rdx
 ccc:	49 8b 8f d8 00 00 00 	mov    0xd8(%r15),%rcx
 cd3:	49 89 97 d8 00 00 00 	mov    %rdx,0xd8(%r15)
 cda:	0f b6 95 e0 00 00 00 	movzbl 0xe0(%rbp),%edx
 ce1:	48 89 8d d8 00 00 00 	mov    %rcx,0xd8(%rbp)
 ce8:	41 0f b6 8f e0 00 00 	movzbl 0xe0(%r15),%ecx
 cef:	00 
 cf0:	41 88 97 e0 00 00 00 	mov    %dl,0xe0(%r15)
 cf7:	0f b6 95 e1 00 00 00 	movzbl 0xe1(%rbp),%edx
 cfe:	88 8d e0 00 00 00    	mov    %cl,0xe0(%rbp)
 d04:	41 0f b6 8f e1 00 00 	movzbl 0xe1(%r15),%ecx
 d0b:	00 
 d0c:	41 88 97 e1 00 00 00 	mov    %dl,0xe1(%r15)
 d13:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
 d18:	88 8d e1 00 00 00    	mov    %cl,0xe1(%rbp)
 d1e:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
 d23:	e8 00 00 00 00       	call   d28 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x338>
 d28:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
 d2d:	48 83 c6 40          	add    $0x40,%rsi
 d31:	0f 29 74 24 40       	movaps %xmm6,0x40(%rsp)
 d36:	48 89 b4 24 18 01 00 	mov    %rsi,0x118(%rsp)
 d3d:	00 
 d3e:	e8 00 00 00 00       	call   d43 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x353>
 d43:	48 8d 8c 24 90 00 00 	lea    0x90(%rsp),%rcx
 d4a:	00 
 d4b:	e8 00 00 00 00       	call   d50 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x360>
 d50:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # d57 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x367>
 d57:	48 8d 8c 24 80 00 00 	lea    0x80(%rsp),%rcx
 d5e:	00 
 d5f:	48 83 c0 10          	add    $0x10,%rax
 d63:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
 d68:	e8 00 00 00 00       	call   d6d <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x37d>
 d6d:	48 8b 47 e8          	mov    -0x18(%rdi),%rax
 d71:	48 89 7c 24 40       	mov    %rdi,0x40(%rsp)
 d76:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
 d7b:	4c 89 6c 04 40       	mov    %r13,0x40(%rsp,%rax,1)
 d80:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # d87 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x397>
 d87:	48 83 c0 10          	add    $0x10,%rax
 d8b:	48 89 84 24 18 01 00 	mov    %rax,0x118(%rsp)
 d92:	00 
 d93:	e8 00 00 00 00       	call   d98 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x3a8>
 d98:	4c 8b 84 24 98 02 00 	mov    0x298(%rsp),%r8
 d9f:	00 
 da0:	4c 89 e1             	mov    %r12,%rcx
 da3:	48 8b 94 24 90 02 00 	mov    0x290(%rsp),%rdx
 daa:	00 
 dab:	e8 00 00 00 00       	call   db0 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x3c0>
 db0:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
 db5:	e8 00 00 00 00       	call   dba <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x3ca>
 dba:	48 85 c0             	test   %rax,%rax
 dbd:	74 31                	je     df0 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x400>
 dbf:	0f 28 b4 24 20 02 00 	movaps 0x220(%rsp),%xmm6
 dc6:	00 
 dc7:	48 81 c4 38 02 00 00 	add    $0x238,%rsp
 dce:	5b                   	pop    %rbx
 dcf:	5e                   	pop    %rsi
 dd0:	5f                   	pop    %rdi
 dd1:	5d                   	pop    %rbp
 dd2:	41 5c                	pop    %r12
 dd4:	41 5d                	pop    %r13
 dd6:	41 5e                	pop    %r14
 dd8:	41 5f                	pop    %r15
 dda:	c3                   	ret
 ddb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 de0:	8b 51 20             	mov    0x20(%rcx),%edx
 de3:	83 ca 04             	or     $0x4,%edx
 de6:	e8 00 00 00 00       	call   deb <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x3fb>
 deb:	e9 75 fe ff ff       	jmp    c65 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x275>
 df0:	48 8b 83 e8 01 00 00 	mov    0x1e8(%rbx),%rax
 df7:	48 8b 48 e8          	mov    -0x18(%rax),%rcx
 dfb:	4c 01 e1             	add    %r12,%rcx
 dfe:	8b 51 20             	mov    0x20(%rcx),%edx
 e01:	83 ca 04             	or     $0x4,%edx
 e04:	e8 00 00 00 00       	call   e09 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x419>
 e09:	eb b4                	jmp    dbf <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x3cf>
 e0b:	48 89 c6             	mov    %rax,%rsi
 e0e:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # e15 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x425>
 e15:	48 89 f9             	mov    %rdi,%rcx
 e18:	48 83 c0 10          	add    $0x10,%rax
 e1c:	48 89 83 e0 00 00 00 	mov    %rax,0xe0(%rbx)
 e23:	e8 00 00 00 00       	call   e28 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x438>
 e28:	48 89 f1             	mov    %rsi,%rcx
 e2b:	e8 00 00 00 00       	call   e30 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x440>
 e30:	48 89 c6             	mov    %rax,%rsi
 e33:	48 8b 47 e8          	mov    -0x18(%rdi),%rax
 e37:	48 89 7c 24 40       	mov    %rdi,0x40(%rsp)
 e3c:	4c 89 6c 04 40       	mov    %r13,0x40(%rsp,%rax,1)
 e41:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # e48 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x458>
 e48:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
 e4d:	48 83 c0 10          	add    $0x10,%rax
 e51:	48 89 84 24 18 01 00 	mov    %rax,0x118(%rsp)
 e58:	00 
 e59:	e8 00 00 00 00       	call   e5e <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x46e>
 e5e:	4c 89 e1             	mov    %r12,%rcx
 e61:	e8 00 00 00 00       	call   e66 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x476>
 e66:	48 89 d9             	mov    %rbx,%rcx
 e69:	e8 00 00 00 00       	call   e6e <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x47e>
 e6e:	48 89 f1             	mov    %rsi,%rcx
 e71:	e8 00 00 00 00       	call   e76 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x486>
 e76:	48 89 c6             	mov    %rax,%rsi
 e79:	eb c6                	jmp    e41 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x451>
 e7b:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
 e80:	48 89 c6             	mov    %rax,%rsi
 e83:	e8 00 00 00 00       	call   e88 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x498>
 e88:	48 8b 47 e8          	mov    -0x18(%rdi),%rax
 e8c:	48 89 bb e8 01 00 00 	mov    %rdi,0x1e8(%rbx)
 e93:	4c 89 ac 03 e8 01 00 	mov    %r13,0x1e8(%rbx,%rax,1)
 e9a:	00 
 e9b:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # ea2 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x4b2>
 ea2:	48 89 e9             	mov    %rbp,%rcx
 ea5:	48 83 c0 10          	add    $0x10,%rax
 ea9:	48 89 83 c0 02 00 00 	mov    %rax,0x2c0(%rbx)
 eb0:	e8 00 00 00 00       	call   eb5 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x4c5>
 eb5:	eb af                	jmp    e66 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x476>
 eb7:	48 89 c6             	mov    %rax,%rsi
 eba:	eb cc                	jmp    e88 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x498>
 ebc:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
 ec1:	48 89 c6             	mov    %rax,%rsi
 ec4:	e8 00 00 00 00       	call   ec9 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x4d9>
 ec9:	e9 65 ff ff ff       	jmp    e33 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x443>
 ece:	48 89 c6             	mov    %rax,%rsi
 ed1:	eb 8b                	jmp    e5e <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x46e>
 ed3:	48 89 c1             	mov    %rax,%rcx
 ed6:	e8 00 00 00 00       	call   edb <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x4eb>
 edb:	e8 00 00 00 00       	call   ee0 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x4f0>
 ee0:	e9 5e fe ff ff       	jmp    d43 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x353>
 ee5:	4c 89 f1             	mov    %r14,%rcx
 ee8:	48 89 c6             	mov    %rax,%rsi
 eeb:	e8 00 00 00 00       	call   ef0 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x500>
 ef0:	e9 69 ff ff ff       	jmp    e5e <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x46e>
 ef5:	48 89 c6             	mov    %rax,%rsi
 ef8:	eb a1                	jmp    e9b <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x4ab>
 efa:	49 89 c5             	mov    %rax,%r13
 efd:	48 89 e9             	mov    %rbp,%rcx
 f00:	e8 00 00 00 00       	call   f05 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x515>
 f05:	4c 89 e8             	mov    %r13,%rax
 f08:	48 8b 56 e8          	mov    -0x18(%rsi),%rdx
 f0c:	31 c9                	xor    %ecx,%ecx
 f0e:	48 89 33             	mov    %rsi,(%rbx)
 f11:	48 89 c6             	mov    %rax,%rsi
 f14:	4c 89 24 13          	mov    %r12,(%rbx,%rdx,1)
 f18:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
 f1c:	e9 ed fe ff ff       	jmp    e0e <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x41e>
 f21:	eb e5                	jmp    f08 <_ZN4zapi2io4FileC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEPKvy+0x518>
 f23:	90                   	nop
 f24:	90                   	nop
 f25:	90                   	nop
 f26:	90                   	nop
 f27:	90                   	nop
 f28:	90                   	nop
 f29:	90                   	nop
 f2a:	90                   	nop
 f2b:	90                   	nop
 f2c:	90                   	nop
 f2d:	90                   	nop
 f2e:	90                   	nop
 f2f:	90                   	nop
