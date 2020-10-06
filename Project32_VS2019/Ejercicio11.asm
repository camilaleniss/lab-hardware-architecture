; Ejercicio111213.asm -
; Chapter 3.4 examples

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
favcolor BYTE "Pink", 0

.code
main proc
	mov al, favcolor		

	invoke ExitProcess,0
main endp
end main