;==============================================;
; exe 4 - fib riddle, nadav zimmerman 318591997;
;==============================================;

; The point of this riddle was to save the value of ebx that hold fib(n-1) in the stack,
; and get it back only after we calc fib(n-2).
; I add the 'push' in line 36, and the 'pop' in line 39

include 'win32a.inc'

format PE console
entry start

section '.text' code readable executable
; ======================================
start:
	call	read_hex
	call	fib
	call	print_eax
; ====================================

	push	0
	call	[ExitProcess]

fib:
	cmp		eax, 1
	jg		recurse
	mov		eax, 1
	ret
recurse:
	dec		eax			
	push	eax
	call	fib
	mov		ebx, eax
	pop		eax
	push	ebx			; save the value of ebx in the stack before the call of 'fib' that calc fib(n-2)
	dec		eax	
	call	fib
	pop		ebx			;after we get eax = fib(n-2), get the value of fib(n-1) at ebx from the stack 
	add		eax, ebx
	ret

include 'training.inc'
