; Ejercicio111213.asm -
; Chapter 3.4 examples

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
dArray SDWORD 50 DUP(?)

.code
main proc
	mov	eax, dArray			

	invoke ExitProcess,0
main endp
end main