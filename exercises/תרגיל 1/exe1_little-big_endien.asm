; nadav zimmerman reversing exe1.d - little endien <-> big endien


; Barak Gonen
; Convert little endien to big endien and vice versa
; Example: 0x1234ABCD -> 0xCDAB3412
; Make it work properly

include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
    msg    db 'Enter a hex number', 13, 10, 0
	
section '.text' code readable executable
; ======================================

start:
	mov		esi, msg
	call	print_str
	call	read_hex
; msw - most significant word, lsw - little/last significant word
; line 23-25: save and swap the msw of eax and save it at lsb of ebx
	mov 	bl,ah
	mov		bh,al
	shl  	ebx,16
;27-29: swap the lsb of eax at msb of ebx
	shr		eax,16
	mov 	bl,ah
	mov		bh,al
	
	mov		eax,ebx

	call	print_eax
	
; ====================================

	push	0
	call	[ExitProcess]

include 'training.inc'

