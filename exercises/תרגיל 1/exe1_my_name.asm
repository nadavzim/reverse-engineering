; nadav zimmerman reversing exe1.b - my name

include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
    name_str  db  8  
	
section '.text' code readable executable
; ======================================
	
start:
	mov		[name_str], 'N'
	mov		[name_str+1], 'a'
	mov		[name_str+2], 'd'
	mov		[name_str+3], 'a'
	mov		[name_str+4], 'v'
	mov		[name_str+5], 13
	mov		[name_str+6], 10
	mov		[name_str+7], 0


	; Show a message to the user:
    mov     esi, name_str
    call    print_str
	
; ====================================

	push	0
	call	[ExitProcess]

include 'training.inc'

