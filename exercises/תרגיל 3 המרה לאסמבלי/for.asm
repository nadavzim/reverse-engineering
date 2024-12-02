;======================================;
; exe 3 - python to assembly: for loop
; nadav zimmerman 318591997
;======================================;

;x = int(input())
;c = 1
;for i in range(1, x+1):
;    c = c*i
;print(c)


include 'win32a.inc'
format PE console
entry start

section '.data' data readable writeable
    adder    	dd 0
    counter		dd 0

section '.text' code readable writeable executable
; ======================================
start:
    call    read_hex	;eax = x
	
	mov		ecx, eax	; index for the loop: ecx = x
	mov		eax, 1		
    
for_num1:
	mul		ecx			; calc the x!: x*(x-1)*...*1
    loop 	for_num1	; stay at the loop until ecx == 1
    
    call    print_eax
; ====================================

	push	0
	call	[ExitProcess]
include 'training.inc'

