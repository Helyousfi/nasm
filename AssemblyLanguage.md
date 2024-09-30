# The CPU
- The Central Processing Unit (CPU) is the physical device that performs
instructions. The instructions that CPUs perform are generally very simple.
Instructions may require the data they act on to be in special storage locations in the CPU itself called registers. The CPU can access data in registers
much faster than data in memory. However, the number of registers in a
CPU is limited, so the programmer must take care to keep only currently
used data in registers. 
- The instructions a type of CPU executes make up the CPU’s machine
language. Machine programs have a much more basic structure than higherlevel languages. Machine language instructions are encoded as raw numbers,
not in friendly text formats. A CPU must be able to decode an instruction’s
purpose very quickly to run efficiently. Machine language is designed with
this goal in mind, not to be easily deciphered by humans. Programs written
in other languages must be converted to the native machine language of
the CPU to run on the computer. A compiler is a program that translates
programs written in a programming language into the machine language of
a particular computer architecture. In general, every type of CPU has its
own unique machine language.

# Real Mode
- In real mode, memory is limited to only one megabyte (220 So where did the infa- bytes). Valid address range from (in hex) 00000 to FFFFF. These addresses require a 20-
bit number. Obviously, a 20-bit number will not fit into any of the 8086’s
16-bit registers. Intel solved this problem, by using two 16-bit values to
determine an address. The first 16-bit value is called the selector. Selector
values must be stored in segment registers. The second 16-bit value is called
the offset. The physical address referenced by a 32-bit selector:offset pair is
computed by the formula : 16 ∗ selector + offset

# 16-bit Protected Mode
- In the 80286’s 16-bit protected mode, selector values are interpreted
completely differently than in real mode. In real mode, a selector value
is a paragraph number of physical memory. In protected mode, a selector
value is an index into a descriptor table. In both modes, programs are
divided into segments. In real mode, these segments are at fixed positions
in physical memory and the selector value denotes the paragraph number
of the beginning of the segment. In protected mode, the segments are not
at fixed positions in physical memory. In fact, they do not have to be in
memory at all!
- Protected mode uses a technique called virtual memory . The basic idea
of a virtual memory system is to only keep the data and code in memory that
programs are currently using. Other data and code are stored temporarily
on disk until they are needed again. In 16-bit protected mode, segments are
moved between memory and disk as needed. When a segment is returned
to memory from disk, it is very likely that it will be put into a different area
of memory that it was in before being moved to disk. All of this is done
transparently by the operating system. The program does not have to be
written differently for virtual memory to work.
