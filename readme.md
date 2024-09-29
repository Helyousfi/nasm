
# 86 Architecture
## BIOS
- BIOS is firmware embedded on a motherboard that initializes hardware components and prepares the system for booting an operating system.
- A bootloader is a small program that loads the operating system into memory when the computer starts up.
![32architecture](https://github.com/user-attachments/assets/a6da0e28-ee22-4ddf-9c94-540c463a7580)
# Registers
![image](https://github.com/user-attachments/assets/8066da44-ef01-4a39-9a0c-19a2f9271db3)
## EIP
EIP (Extended Instruction Pointer) is a 32-bit register in the x86 architecture.
It holds the memory address of the next instruction that the CPU will execute.
## FSM
The FSM (Flag Status Register) in x86 architecture is a special register that contains flags indicating the status of the CPU after an arithmetic or logical operation.
## The main internal bus
The main internal bus in a computer system refers to the set of pathways (wires) used to transfer data, addresses, and control signals between the CPU, memory, and other peripherals. 
# Special Purpose Registers
![2](https://github.com/user-attachments/assets/c5ea8319-c35d-477b-a23a-527d989f0db6)

# Assemble the program
nasm -f elf32 hello.asm -o hello.o
# Link the object files
ld -m elf_i386 -s -o hello hello.o

## 1. nasm -f elf32 hello.asm -o hello.o
    - nasm: Assembler for x86 assembly language.
    - -f elf32: Specifies the output format. elf32 indicates a 32-bit ELF (Executable and Linkable Format) object file. Since hello.asm is likely a 32-bit assembly program, the elf32 format is appropriate.
    
In short, this command assembles the hello.asm file into an object file hello.o using the 32-bit ELF format.
## 2. ld -m elf_i386 -o hello hello.o

    ld: The linker command. It links the object files produced by the assembler into an executable file.
    -m elf_i386: Specifies the target format for the linker. elf_i386 tells ld to create a 32-bit ELF executable for the i386 architecture.
    -o hello: Specifies the name of the final output executable file. In this case, the executable will be named hello.
    hello.o: The input object file that was produced in the previous step (hello.o). This file contains the machine code generated from hello.asm.
    
# Syscalls
![system calls-Programming Ethical Hacker Way by sandeep saini](https://github.com/user-attachments/assets/9d81ec4a-45ed-454b-80e6-75b088a8bb3b)
# Standard File Descriptors:
![image](https://github.com/user-attachments/assets/be5adc43-5250-4560-ad72-09d503d989b2)


