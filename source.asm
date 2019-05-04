.386
.model flat, stdcall
option casemap:none

includelib msvcrt.lib
printf PROTO C :ptr sbyte, :VARARG	
scanf PROTO C :ptr sbyte, :VARARG

.data
input_question_1 byte "Input the 1st number: ", 0
input_question_2 byte "Input the 2nd number: ", 0
input byte "%s", 0
output byte "%s * %s = %s", 0ah, 0
num_1 byte 100 dup (0)
num_2 byte 100 dup (0)

.code
main proc
	invoke printf, offset input_question_1
	invoke scanf, offset input, offset num_1
	invoke printf, offset input_question_2
	invoke scanf, offset input, offset num_2
	invoke printf, offset output, offset num_1, offset num_2, offset num_2
	ret
main endp
end main