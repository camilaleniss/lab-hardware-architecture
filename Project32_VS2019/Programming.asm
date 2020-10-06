; Ejercicio11.asm - Declare a string variable containing the name of your favorite color. Initialize it as a nullterminated string.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
var1 BYTE 0
var2 SBYTE -200
var3 WORD 10000
var4 SWORD -32764
var5 DWORD 12345678h
var6 QWORD 1234567812345678h
var7 TBYTE 80000000000000001234h
var8 REAL4 -1.2
var9 REAL8 3.2E-260
var10 REAL10 4.6E+4096

.code
main proc
	mov	al, var1

	invoke ExitProcess,0
main endp
end main