; nadav zimmerman reversing exe1.c - bealey code


; Program prints a message to the user
; The message is encrypted using a simple key and XOR function
; Barak Gonen

include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
	my_str	db	0x4, 0x11, 0x52, 0x9, 0x18, 0xE, 0x1, 0x52, \ 
				0x6, 0x11, 0x45, 0x15, 0xC, 0x4C, 0x11, 0x16, \
				0x6, 0x54, 0xE, 0x1C, 0x52, 0x11, 0x19, 0x45, 0x10, \
				0xD, 0xA, 0
	key 	db	"We hold these truths to be self evident", 13, 10, 0
	
section '.text' code readable executable
start:
	xor		ecx, ecx
decrypt:
	; Edit code and add new code only to this part
	
	; explanation: I undderstand from the loop and the increasing value of ecx that it is the index of the loop and the string.
	; so we read charecter from the key and from the loop, we xor them and stor the, in the "my_str".
	; the code is: "Strawberry fileds forever"
	mov     al, [my_str + ecx]
	mov     bl, [key + ecx]
	xor		al, bl
	mov 	[my_str + ecx], al
	
	; Do not change from here on
	inc		ecx
	cmp		ecx, key - my_str - 3 
	jne 	decrypt
	mov		esi, my_str
	call	print_str
	push	0
	call	[ExitProcess]

include 'training.inc'

