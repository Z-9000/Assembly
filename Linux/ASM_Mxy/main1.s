.intel_syntax noprefix
.global _start
.text
_start:

mov rax, 1
mov rdi, 1
lea rsi, [str]
lea rdx, [str_len]
syscall

mov rax, 60
xor rdi, rdi
syscall

.data
str: .ascii "Hello, World!"
str_len = . - str