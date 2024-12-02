; nadav zimmerman reversing exe1.a
include 'win32a.inc'

format PE console
entry start
section '.data' data readable writeable
    x 	db	 8
	y 	db	 9
	
section '.text' code readable executable
; ======================================
	
start:
	mov		al,[x] 
	mov		ah,[0x00401000]
    mov     ebx,x
	mov		cl,[ebx]
	mov		ch,[ebx+1]
	
	;mov		ax,[x]
	;line 19 didn't worked because we try to move data of 8-bit (x) into 16-bit register 
	mov		dl,[0x00402000]
	;line 21 did run but didn't do what it should - its ment to copy the value in address 0x00402000, but instead it copy the start "cc" which probbly because of the breakpoint without breakpoint it enterd "a0" to dl 


	
; ====================================

	push	0
	call	[ExitProcess]

include 'training.inc'

