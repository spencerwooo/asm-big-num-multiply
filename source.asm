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
; Convert each digit to int and push to stack (Reversed)
convert_to_int proc far C, num_char :ptr byte, num_int :ptr dword, len :dword
  mov ecx, len
  mov esi, num_char

L1:
  movzx eax, byte ptr [esi]
  sub eax, 30h
  push eax
  inc esi

  loop L1

  mov ecx, len
  mov esi, num_int 

L2:
  pop eax
  mov dword ptr [esi], eax
  add esi, 4

  loop L2

  ret
convert_to_int endp

; Get each digit out of stack to get ready for printing (Reversed)
convert_to_char proc far C uses eax ecx esi
  mov ecx, length_res
  mov esi, 0

L1:
  mov eax, dword ptr result_char[4 * esi]
  add eax, 30h
  push eax
  inc esi

  loop L1
  
  mov ecx, length_res
  mov esi, 0

L2:
  pop eax
  mov byte ptr result_char[esi], al
  inc esi
  
  loop L2

  ret
convert_to_char endp

; Get number 1 length
get_num1_len proc far C uses eax
  invoke strlen, offset num_char_1
  mov length_1, eax
  invoke convert_to_int, offset num_char_1, offset num_int_1, length_1
  ret
get_num1_len endp

; Get number 2 length
get_num2_len proc far C uses eax
  invoke strlen, offset num_char_2
  mov length_2, eax
  invoke convert_to_int, offset num_char_2, offset num_int_2, length_2
  ret
get_num2_len endp

; Big integer multiply
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