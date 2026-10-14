.intel_syntax noprefix
.global _start
.text
_start:

call print_hello ;# automatically puts the address of the next line of code into the stack and moves to next

jmp exit

exit:
  mov rax, 60 ;# system call code for exit
  xor rdi, rdi ;# zero out rdi
  syscall ;# execute system call

print_hello:
  mov rax, 1 ;# write
  mov rdi, 1 ;# to terminal
  lea rsi, s1 ;# start of the string
  lea rdx, s1_len ;# length of string
  syscall ;# execute / call kernel
  
  call print_world  
  ret
  

print_world:
  mov rax, 1
  mov rdi, 1
  lea rsi, s2
  lea rdx, s2_len
  syscall
  
  ret


.data

s1: .ascii "hello "
s1_len = . - s1
s2: .ascii "world!\n"
s2_len = . - s2
