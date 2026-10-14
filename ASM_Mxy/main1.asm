extern ExitProcess
extern MessageBoxA

section .data
    title_text db "NASM Test", 0
    body_text  db "Hello World! This is safe native Windows assembly.", 0

section .text
global main
main:
    sub rsp, 40                 

    xor rcx, rcx                
    lea rdx, [body_text]        
    lea r8, [title_text]        
    xor r9, r9                  
    call MessageBoxA          

    xor rcx, rcx                
    call ExitProcess            
