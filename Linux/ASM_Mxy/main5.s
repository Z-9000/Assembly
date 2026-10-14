.intel_syntax noprefix
.global _start
.text
_start:

lea r15, [callstack]
lea rsp, [callstack]
lea rax, [return]
mov [r15], rax
add r15, 8

jmp print_hello

return:
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
  
  lea rax, [return_hello]
  mov [r15], rax
  add r15, 8
  jmp print_world
  return_hello:
    sub r15, 8
    mov rax, [r15]
    jmp rax
  

print_world:
  mov rax, 1
  mov rdi, 1
  lea rsi, s2
  lea rdx, s2_len
  syscall
  sub r15, 8
  mov rax, [r15]
  jmp rax


.data

callstack: .skip 4096

s1: .ascii "hello "
s1_len = . - s1
s2: .ascii "world!\n"
s2_len = . - s2
