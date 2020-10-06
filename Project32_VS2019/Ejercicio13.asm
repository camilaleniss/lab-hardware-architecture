; Ejercicio111213.asm -
; Chapter 3.4 examples

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
repTest BYTE 500 DUP("TEST")

.code
main proc
	mov	al, repTest			

	invoke ExitProcess,0
main endp
end main