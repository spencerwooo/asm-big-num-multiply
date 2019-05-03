.386
.model flat, stdcall
option casemap:none

includelib msvcrt.lib
printf PROTO C :ptr sbyte, :VARARG	
scanf PROTO C :ptr sbyte, :VARARG

.data
input byte "%s", 0
output byte "The number is: %s", 0ah, 0
num byte 65536 dup (?)

.code
main:
	invoke scanf, offset input, offset num
	invoke printf, offset output, offset num
	ret
end main