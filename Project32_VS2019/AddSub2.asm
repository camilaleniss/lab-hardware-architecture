TITLE Add and Subtract, Version 2         (AddSub2.asm)

; This program adds and subtracts 32-bit integers
; and stores the sum in a variable.

INCLUDE Irvine32.inc

.data
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode : dword

.code
main proc
add eax, 5
nop
main endp
End main