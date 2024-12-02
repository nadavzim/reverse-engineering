;==========================================================;
; exe 4 - my_mul function riddle, nadav zimmerman 318591997;
;==========================================================;

include 'win32a.inc'

format PE console
entry start

;section '.data' data readable writeable
;=======================================
	a		dd		0
	b		dd		0
	result	dd		0

section '.text' code readable executable
; ======================================
start:
	call	read_hex
	mov		ebx, eax
	call	read_hex		;eax = a, ebx = b
	
	mov		[a],eax
	mov		[b],ebx
	
	push	[a]
	push	[b]
	push	result			; push a, b and *result in the stack
	xor		eax,eax
	
	call	my_mul
	
	mov		eax,[result]
	call	print_eax
; ====================================

	push	0
	call	[ExitProcess]

my_mul:
	push	ebp
	mov		ebp, esp
	
	mov		eax, [ebp+16]		
	mov		ebx, [ebp+12]	; eax = a, ebx = b
	
	imul	eax, ebx
	mov		ecx,[ebp+8]		; ecx = *result
	mov		[ecx],eax		; result = ecx = a*b
	pop		ebp
	ret		12

include 'training.inc'
