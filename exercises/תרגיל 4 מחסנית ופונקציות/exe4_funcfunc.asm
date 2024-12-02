;=======================================================;
; exe 4 - print func1 address, nadav zimmerman 318591997;
;=======================================================;

include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
	x		db	5
	
section '.text' code readable executable
; ======================================
	
start:
	mov		eax, func1
	call	print_eax
	xor		eax, eax
	
	call	func1
	; make eax be equal to func1 address, 
	; without using mov eax, func1
	call	print_eax
; ====================================

	push	0
	call	[ExitProcess]

func1:
	push 	ebp
	mov		ebp, esp
	call	func2
	pop		ebp
	ret

func2:
	push 	ebp
	mov		ebp, esp
	call	func3
	pop		ebp
	ret
	
func3:
	push 	ebp
	mov		ebp, esp
	mov		eax, [ebp-16] 	;-16 the only line I add to the code: address of func1 is 4 values before ebc of func3
	pop		ebp
	ret
	
		
	
include 'training.inc'

