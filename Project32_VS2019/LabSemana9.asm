.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode : dword
.data
BigDec1 Byte "2817.32", 0
BigDec2 Byte "1893.96", 0
BigDec3 Byte "0020_80", 0
.code
main proc
Xor eax, eax ; eax = 0
XOR ebx, ebx
lea esi, BigDec1
mov ecx , 6
Lini:  mov al, byte ptr[BigDec1+ecx];
    cmp al, '.'
    je LStore
    mov bl, byte ptr[BigDec2+ecx];
    add al, bl
AAA    ;6FH --> 15 --> 6F --> inc ah 01 al = 05
    add al, 30h;05--> 35 --> '5'

LStore: mov Byte ptr[BigDec3+ecx], al;
    dec ecx
    cmp ecx, -1
LLoop:  jnz Lini

main endp
End main