section .bss
    input_flag resb 100

section .text
    global _start

_start:
    ; Read input from stdin
    mov eax, 3
    mov ebx, 0
    mov ecx, input_flag
    mov edx, 100
    int 0x80

    ; Handle newline
    mov al, byte [input_flag]
    cmp al, 10
    je .null_terminate
    jmp .done_reading

.null_terminate:
    mov byte [input_flag], 0

.done_reading:
    mov ecx, 0

compare_letters:
    mov al, byte [input_flag + ecx]
    cmp al, 0x66 ; f
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x6c ; l
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x61 ; a
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x67 ; g
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x7b ; {
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x6a ; j
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x69 ; i
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x63 ; c
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x61 ; a
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x5f ; _ 
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x61 ; a
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x73 ; s
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x6d ; m
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x6c ; l
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x61 ; a
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x6e ; n
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x67 ; g
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x5f ; _
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x73 ; s
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x74 ; t
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x72 ; r
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x69 ; i
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x6e ; n
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x67 ; g
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x73 ; s
    jne incorrect_flag

    inc ecx
    mov al, byte [input_flag + ecx]
    cmp al, 0x7d ; }
    jne incorrect_flag

    jmp correct_flag_found

incorrect_flag:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_fail
    mov edx, msg_fail_len
    int 0x80
    jmp _exit

correct_flag_found:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_success
    mov edx, msg_success_len
    int 0x80
    jmp _exit

_exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data
msg_fail db 'Incorrect flag', 0x0A, 0
msg_fail_len equ $ - msg_fail

msg_success db 'Correct flag', 0x0A, 0
msg_success_len equ $ - msg_success
