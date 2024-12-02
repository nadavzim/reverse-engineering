;===================================================;
; exe 2 - code re-writing, nadav zimmerman 318591997;
;===================================================;
include 'win32a.inc'

format PE console
entry start
	
section '.text' code readable writeable 
; ======================================
start:
	; read 3 numbers - a, b, c
	call	read_hex
	mov		ecx, eax	 
	call	read_hex
	mov		ebx, eax	 
	call	read_hex	 
	xchg	eax, ecx	; a is in eax, b is in ebx, c is in ecx

	
	; print (2a+b)*(a+c)
	; for example 3,4,5 -> 10*8 = 80, or 0x50	
	; use only mov instructions to modify the NOP's into code
	
	; main comment - I entered this four 'mov' ops to the lable that hold the 0x90 NOP'S
	mov		word[lable],0xc101 ; the hexa word of the line: add ecx,eax  , so ecx = (a+c) 
	mov		word[lable+2],0xe0d1 ; the hexa word of the line: shl eax,1	, so eax = 2a	
	mov		word[lable+4],0xd801 ; the hexa word of the line: add eax,ebx, so eax = 2a+b
	mov		word[lable+6],0xe1f7 ; the hexa word of the line: mul ecx    , so eax = (2a+b)*(a+c)

lable:
	db 		0x30 dup(0x90) ; some spare memory to be modified
	call	print_eax
	
	
	
; ====================================

	push	0
	call	[ExitProcess]

include 'training.inc'


