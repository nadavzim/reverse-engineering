;==========================================;
; exe 3 - python to assembly:  nested loop
; nadav zimmerman 318591997
;==========================================;
;a = int(input())
;b = int(input())
;if a < b:
;    a ^= b
;    b ^= a
;    a ^= b
;result = 0
;for i in range(1, a + b + 1):
;    for j in range(1, a - b + 1):
;        result += i * j
;print(result)


include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
    i	dd	 0		;index of the external loop
    j	dd	 0		;index of the inner loop

section '.text' code readable writeable executable
; ======================================
start:
    call    read_hex 
	mov		esi, eax
    call    read_hex    
    mov     ebx, eax	;esi=a, ebx=b	

	
	
	cmp		esi, ebx
	jge		indexs_set	;if a >= b don't swap
	xor     esi,ebx
    xor     ebx,esi
    xor     esi,ebx		;swap esi and ebx: esi=b, ebx=a

indexs_set:
	xor		edi, edi	;edi=0 (edi will contain the 'result' variable)
	add		[i], esi
	add		[i], ebx	; i= a+b (index of the external loop)
	add		[j], esi
	sub		[j], ebx	; j= a-b (index of the inner loop)

extenal_loop:
	mov		ecx, [j] 	

inner_loop:
	mov		eax, [i]
	mul		ecx			;calc i*j
	add		edi, eax	;save the result - edi += i*j
    loop 	inner_loop	; stay at the inner loop until ecx == 1
	
	mov		ecx,[i]		;ecx=i - load the external index to ecx
    sub		[i], 1		; i--
    loop 	extenal_loop; stay at the extenal loop until ecx == 1

	mov		eax, edi
    call    print_eax	; print the result
; ====================================

	push	0
	call	[ExitProcess]
include 'training.inc'



