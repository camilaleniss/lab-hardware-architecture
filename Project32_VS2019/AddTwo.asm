; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
BigDec1 Byte "2187.39", 0
BigDec2 Byte "1893.06", 0
BigDec3 Byte "1111.01", 0

.code
main proc
Xor eax, eax ; eax=0
Xor ebx, ebx
lea esi, BigDec1
mov ecx, 6
Lini: mov al, byte ptr[BigDec1+ecx] ;
	cmp al, '-'
	je LStore
	mov bl, byte prt[BigDec2+ecx] ;
	add al, bl
AAA ;
LStore: mov Byte ptr[BigDec3+ecx], al ;
	dec ecx
	cmp ecx, -1
LLoop: jnz Lini
	invoke ExitProcess,0
main endp
end main