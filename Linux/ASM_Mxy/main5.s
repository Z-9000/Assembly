.intel_syntax noprefix
.global _start
.text
_start:

mov r12, 5

if_else:
  cmp r12, 5
  je loop1
  jmp exit

mov r12, 3; # when i used r11 then it kept printing hello again and again instead of stopping - this was beacuse sys_write system call clobbers (overwrites) r11, in 64-bit linux, the kernel uses specific registers for system calls so when i ran the syscall tehn cpu automatically overwrtoe rcx and r11 with internal values

loop1:
  cmp r12, 9
  je loop2
  call print
  inc r12
  jmp loop1 

loop2: ; # compound conditional
  cmp r12, 6 
  jle exit
  cmp r12, 13
  jge exit
  inc r12
  jmp loop2

print:
  mov rax, 1
  mov rdi, 1
  lea rsi, [s1]
  lea rdx, [s1len]
  syscall
  ret

exit: 
  mov rax, 60
  xor rdi, rdi
  syscall
  
.data
s1: .ascii "Hello\n" 
s1len = . - s1