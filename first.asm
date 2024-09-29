section .data
    hello_msg db 'Hello, World!', 0  ; Define a string ending with null byte

section .text
    global _start  ; Entry point for the linker

_start:
    ; sys_write syscall: write(1, hello_msg, 13)
    mov eax, 4        ; syscall number for sys_write (4)
    mov ebx, 1        ; file descriptor for stdout (1)
    mov ecx, hello_msg ; pointer to the message
    mov edx, 13       ; length of the message
    int 0x80          ; call the kernel

    ; sys_exit syscall: exit(0)
    mov eax, 1        ; syscall number for sys_exit (1)
    xor ebx, ebx      ; return 0 (exit code)
    int 0x80          ; call the kernel
