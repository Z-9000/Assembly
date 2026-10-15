.intel_syntax noprefix
.global _start
.text
_start:

mov rax, 3

cmp rax, 3
jne exit

print:
  mov rax, 1
  mov rdi, 1
  lea rsi, [s1]
  lea rdx, [s1_len]
  syscall
  

exit:
  mov rax, 60 ;# system call code for exit
  xor rdi, rdi ;# zero out rdi
  syscall ;# execute system call


.data
s1: .ascii "rax is 3!"
s1_len = . - s1