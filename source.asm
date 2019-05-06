.386
.model flat, stdcall
option casemap:none

includelib msvcrt.lib
printf PROTO C :ptr sbyte, :VARARG	
scanf PROTO C :ptr sbyte, :VARARG

strlen PROTO C :ptr sbyte, :VARARG

.data
; Process input numbers in char
input byte "%s", 0
input_question_1 byte "Input the 1st number: ", 0
input_question_2 byte "Input the 2nd number: ", 0

; Output final result in char
output byte "%s * %s = %s", 0ah, 0

; Big integers to calculate (Read in char)
num_char_1 byte 100 dup (0)
num_char_2 byte 100 dup (0)
result_char byte 200 dup (0)

; Each digit: "char to int"
num_int_1 dword 100 dup(0)
num_int_2 dword 100 dup(0)
result_int dword 200 dup(0)

; Length of numbers to multiply
length_1 dword 0
length_2 dword 0
length_res dword 0

.code
get_num1_len proc far C uses eax
  invoke strlen, offset num_char_1
  mov length_1, eax
  ret
get_num1_len endp

get_num2_len proc far C uses eax
  invoke strlen, offset num_char_2
  mov length_2, eax
  ret
get_num2_len endp

convert_to_int proc

  ret
convert_to_int endp

convert_to_char proc

  ret
convert_to_char endp

big_int_multiply proc

  ret
big_int_multiply endp

main proc
	invoke printf, offset input_question_1
	invoke scanf, offset input, offset num_char_1
	invoke printf, offset input_question_2
	invoke scanf, offset input, offset num_char_2
	
  invoke get_num1_len
  invoke get_num2_len

	invoke printf, offset output, offset num_char_1, offset num_char_2, offset num_char_2
	ret
main endp
end main