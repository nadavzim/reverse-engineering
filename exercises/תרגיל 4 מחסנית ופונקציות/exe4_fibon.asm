;================================================;
; exe 4 - fibon riddle, nadav zimmerman 318591997;
;================================================;
; the problem was at the 'ret' where the program tryed to return from the func,
; but the stack was fulled with ebp and set to the new pushed data.
; so the answer was to set the esp to the right place (+4) and  pop ebp.

include 'win32a.inc'

format PE console
entry start

section '.text' code readable executable
; ======================================
start:
	call	read_hex
	push	eax
	call	fib
	add		esp, 4
	call	print_eax
; ====================================

	push	0
	call	[ExitProcess]

fib:
	n = 8			; define const. n
	fib1 = -4		; define const. fib1
	push	ebp
	mov		ebp, esp
	sub		esp, 4

	mov		eax, [ebp + n]
	cmp		eax, 1
	jg		recurse
	mov		eax, 1
	jmp		done
recurse:
	dec		eax
	push	eax
	dec		eax
	push	eax
	call	fib
	add		esp, 4
	mov		[ebp + fib1], eax
	call	fib
	add		esp, 4
	add		eax, [ebp + fib1]
done:
	add		esp,4	; in order to get back to the adress stored in esp (the return adress)need to cancel the sub 4 that heppend at line 24.
	pop		ebp		; we need also to clear the ebp from the stack. 
	
	ret		

include 'training.inc'
