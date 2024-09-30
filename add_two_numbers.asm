section .bss
    num1 resb 10      ; Buffer for first number
    num2 resb 10      ; Buffer for second number
    result resb 10    ; Buffer for result

section .text
    global _start

_start:
    ; Prompt user for first number
    mov edx, len_prompt1
    mov ecx, prompt1
    call print_string

    ; Read first number
    mov edx, 10       ; max number of bytes to read
    mov ecx, num1     ; buffer to store the number
    call read_string

    ; Prompt user for second number
    mov edx, len_prompt2
    mov ecx, prompt2
    call print_string

    ; Read second number
    mov edx, 10       ; max number of bytes to read
    mov ecx, num2     ; buffer to store the number
    call read_string

    ; Convert ASCII to integer and add the numbers
    call string_to_int
    mov ebx, eax      ; Store first number in ebx
    call string_to_int
    add eax, ebx      ; Add second number to first number

    ; Convert result back to string
    call int_to_string
    mov edx, len_result
    mov ecx, result
    call print_string

    ; Exit the program
    mov eax, 1        ; syscall: exit
    xor ebx, ebx      ; status: 0
    int 0x80          ; call kernel

; Function to print a string
print_string:
    mov eax, 4        ; syscall: write
    mov ebx, 1        ; file descriptor: stdout
    int 0x80
    ret

; Function to read a string
read_string:
    mov eax, 3        ; syscall: read
    mov ebx, 0        ; file descriptor: stdin
    int 0x80
    ret

; Function to convert string to integer
string_to_int:
    ; Convert the string in num1 or num2 to an integer
    mov ecx, 0        ; Clear ECX (to store the result)
    mov ebx, 10       ; Base 10
    mov esi, num1     ; Pointer to the string (can be changed to num2)
.next_digit:
    movzx eax, byte [esi] ; Load byte and zero-extend
    cmp eax, 10       ; Check for newline
    je .done          ; If newline, we're done
    sub eax, '0'      ; Convert ASCII to integer
    imul ecx, ebx     ; Multiply current result by 10
    add ecx, eax      ; Add the new digit
    inc esi           ; Move to the next character
    jmp .next_digit
.done:
    mov eax, ecx      ; Move the result to EAX
    ret

; Function to convert integer to string
int_to_string:
    ; Simple integer to string conversion for result
    mov ecx, 10       ; Base 10
    mov ebx, result   ; Pointer to the result buffer
    mov edi, 0        ; Counter for digits
.convert_loop:
    xor edx, edx      ; Clear EDX
    div ecx            ; EAX / 10
    add dl, '0'       ; Convert digit to ASCII
    push dx           ; Save the digit
    inc edi           ; Increment digit counter
    test eax, eax     ; Check if EAX is zero
    jnz .convert_loop  ; Repeat until EAX is zero
.write_digits:
    pop dx            ; Get the digit
    mov [ebx], dl     ; Store in result
    inc ebx           ; Move to next position
    dec edi           ; Decrement digit counter
    jnz .write_digits  ; Repeat for all digits
    mov byte [ebx], 0 ; Null-terminate the string
    ret

section .data
prompt1 db "Enter first number: ", 0
len_prompt1 equ $ - prompt1
prompt2 db "Enter second number: ", 0
len_prompt2 equ $ - prompt2
len_result equ 10
