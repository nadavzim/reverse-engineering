;======================================;
; exe 3 - python to assembly:  if-else
; nadav zimmerman 318591997
;======================================;

; py code to assembly:
;num1 = int(input())

;if num1 % 2 == 0:
;    print(num1)
;else:
;    print(num1+1)


include 'win32a.inc'

format PE console
entry start
	
section '.text' code readable executable
; ======================================
start:
    call    read_hex    
    
    test     eax, 1			; aritmetic op to evaluate if lsb is 1 or 0 - don't change anything
    Jz      print_numbers	; if b is even -> print the numbers without swap 
    
    add     eax,1
    
print_numbers:
    call    print_eax
	
; ====================================

	push	0
	call	[ExitProcess]
include 'training.inc'







