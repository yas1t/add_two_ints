section .data
	prompt1 db "enter first num: ", 0ah
	len_prompt1 equ $ - prompt1

	prompt2 db "enter second num: ", 0ah
	len_prompt2 equ $ - prompt2

	answer1 db "answer: ", 0ah
	len_answer1 equ $ - answer1

section .bss

	num1 resb 16
	num2 resb 16


section .text
	global _start:

_start:
	push prompt1
	push len_prompt1
	call print

	push 16
	push num1
	call get_input

	push prompt2
	push len_prompt2
	call print

	push 16
	push num2
	call get_input

	push num2
	push num1


	call quit


print:
	mov edx, [esp+4]
	mov ecx, [esp+8]

	mov eax, 4
	mov ebx, 1
	int 0x80

	ret

str_to_int:
	;bruh	

get_input:
	mov ecx, [esp+4]
	mov edx, [esp+8]

	mov eax, 3
	mov ebx, 0
	int 0x80

	ret


quit:
	mov eax, 1
	mov ebx, 0
	int 0x80


