;===================================;
; exe 3 - python to assembly: while
; nadav zimmerman 318591997			
;===================================;

; py code to assembly:
;num1 = int(input())
;num2 = int(input())

;adder = 0
;counter = 0
;while True:
;    adder += num2
;    counter += 1
;    if adder >= num1:
;        break
;print(counter)


include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
    adder    	dd 0
    counter		dd 0

section '.text' code readable writeable executable
; ======================================
start:
    call    read_hex    
    mov     ebx, eax     
    call    read_hex    
    xchg    eax, ebx	;eax = num1, ebx = num2

    
while_true:	
	mov		ecx, -1 		; infinate loop - (ecx =-1 will never be 0)
	add		[adder], ebx		; adder += num2
	
	add		[counter], 1		; counter ++
	
	cmp		[adder], eax
    JGE     break_loop	; if b >= a -> end the break the loop 
    loop 	while_true	; stay at the loop
    
break_loop:
    mov     eax, [counter]
    call    print_eax
	
; ====================================

	push	0
	call	[ExitProcess]
include 'training.inc'







